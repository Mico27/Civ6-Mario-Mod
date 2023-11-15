/*
	Post civilization improvement
*/

INSERT OR IGNORE INTO Improvement_ValidTerrains
		(ImprovementType,						TerrainType)
SELECT	'IMPROVEMENT_MICO_FLOWER_SANCTUARY',	TerrainType
FROM	Terrains
WHERE	Mountain = 0 AND Water = 0;

INSERT OR IGNORE INTO Improvement_ValidFeatures
		(ImprovementType,						FeatureType)
SELECT	'IMPROVEMENT_MICO_FLOWER_SANCTUARY',	FeatureType
FROM	Features
WHERE	NaturalWonder = 0 AND Impassable = 0 AND FeatureType IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType NOT IN ('TERRAIN_COAST', 'TERRAIN_OCEAN'));

INSERT OR IGNORE INTO Improvement_ValidResources
		(ImprovementType,						ResourceType,	MustRemoveFeature)
SELECT	'IMPROVEMENT_MICO_FLOWER_SANCTUARY',	ResourceType,	0
FROM	Resources
WHERE	Frequency != 0 OR ResourceClassType = 'RESOURCECLASS_ARTIFACT';

INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId, RequirementSetType)
SELECT	RequirementSetId||'_MICO_FLOWER_SANCTUARY',	RequirementSetType
FROM	RequirementSets
WHERE	RequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT');

INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId, RequirementId)
SELECT	RequirementSetId||'_MICO_FLOWER_SANCTUARY',	RequirementId
FROM	RequirementSetRequirements
WHERE	RequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT') AND RequirementId !='REQUIRES_PLOT_HAS_NO_IMPROVEMENT';

INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId, RequirementId)
SELECT	RequirementSetId||'_MICO_FLOWER_SANCTUARY',	'REQ_MICO_PLOT_HAS_FLOWER_SANCTUARY'
FROM	RequirementSetRequirements
WHERE	RequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT') AND RequirementId =='REQUIRES_PLOT_HAS_NO_IMPROVEMENT';


-- Attachment Modifiers
INSERT OR IGNORE INTO Modifiers
		(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	ModifierId||'_MICO_FLOWER_SANCTUARY_ATTACH', 'MODIFIER_ALL_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER', RunOnce, Permanent, 'REQSET_MICO_PLOT_HAS_FLOWER_SANCTUARY'
FROM	Modifiers
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));

INSERT OR IGNORE INTO Modifiers
		(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	ModifierId||'_MICO_FLOWER_SANCTUARY_MOD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', RunOnce, Permanent, SubjectRequirementSetId||'_MICO_FLOWER_SANCTUARY'
FROM	Modifiers
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId, Name, Value)
SELECT	ModifierId||'_MICO_FLOWER_SANCTUARY_ATTACH', 'ModifierId', ModifierId||'_MICO_FLOWER_SANCTUARY_MOD'
FROM	Modifiers
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId, Name, Value)
SELECT	ModifierId||'_MICO_FLOWER_SANCTUARY_MOD', Name, Value
FROM	ModifierArguments
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));

INSERT OR IGNORE INTO TraitModifiers
		(TraitType, ModifierId)
SELECT	TraitType, ModifierId||'_MICO_FLOWER_SANCTUARY_ATTACH'
FROM	TraitModifiers
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));

INSERT OR IGNORE INTO GovernorPromotionModifiers
		(GovernorPromotionType, ModifierId)
SELECT	GovernorPromotionType, ModifierId||'_MICO_FLOWER_SANCTUARY_ATTACH'
FROM	GovernorPromotionModifiers
WHERE	ModifierId IN (SELECT ModifierId FROM Modifiers WHERE SubjectRequirementSetId IN (SELECT RequirementSetId FROM RequirementSetRequirements WHERE RequirementId = 'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'));
