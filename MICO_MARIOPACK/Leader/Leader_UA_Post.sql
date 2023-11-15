
----------------------------------------------------
-- DOUBLE LANDSCAPES PAINTINGS ABILITY
----------------------------------------------------

--KIND_GREAT_PERSON_INDIVIDUAL
INSERT OR REPLACE INTO	Types
		(Type,										Kind)
SELECT	GreatPersonIndividualType || '_MICO_COPY',	'KIND_GREAT_PERSON_INDIVIDUAL' 
FROM GreatPersonIndividuals 
WHERE EXISTS( SELECT 1 FROM GreatWorks WHERE GreatWorks.GreatPersonIndividualType = GreatPersonIndividuals.GreatPersonIndividualType AND GreatWorks.GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE')  AND
GreatPersonIndividualType NOT LIKE '%_MICO_COPY';

INSERT OR REPLACE INTO GreatPersonIndividuals (GreatPersonIndividualType, Name, EraType, ActionCharges, GreatPersonClassType, ActionRequiresUnownedTile, ActionEffectTileHighlighting, Gender)
SELECT GreatPersonIndividualType || '_MICO_COPY', Name || '_MICO_COPY', 'ERA_ANCIENT', ActionCharges, 'GREAT_PERSON_CLASS_ARTIST_MICO_COPY', ActionRequiresUnownedTile, ActionEffectTileHighlighting, Gender  
FROM GreatPersonIndividuals 
WHERE EXISTS( SELECT 1 FROM GreatWorks WHERE GreatWorks.GreatPersonIndividualType = GreatPersonIndividuals.GreatPersonIndividualType AND GreatWorks.GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE')  AND
GreatPersonIndividualType NOT LIKE '%_MICO_COPY';

INSERT OR REPLACE INTO Mico_Duplicate_GreatPersonIndividuals (GreatPersonIndividualType, GreatPersonDuplicateType)
SELECT GreatPersonIndividualType, GreatPersonIndividualType || '_MICO_COPY' 
FROM GreatPersonIndividuals 
WHERE EXISTS( SELECT 1 FROM GreatWorks WHERE GreatWorks.GreatPersonIndividualType = GreatPersonIndividuals.GreatPersonIndividualType AND GreatWorks.GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE')  AND
GreatPersonIndividualType NOT LIKE '%_MICO_COPY';


--KIND_GREATWORK
INSERT OR REPLACE INTO	Types
		(Type,							Kind)
SELECT	GreatWorkType || '_MICO_COPY',	'KIND_GREATWORK' 
FROM GreatWorks WHERE GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE' AND 
GreatWorkType NOT LIKE '%_MICO_COPY';

INSERT OR REPLACE INTO GreatWorks (GreatWorkType, GreatWorkObjectType, GreatPersonIndividualType, Name, Audio, Image, Quote, Tourism, EraType)
SELECT GreatWorkType || '_MICO_COPY', GreatWorkObjectType, GreatPersonIndividualType || '_MICO_COPY',  Name, Audio, [Image] || '_MICO_COPY', Quote, Tourism, EraType 
FROM GreatWorks WHERE GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE' AND 
GreatWorkType NOT LIKE '%_MICO_COPY';

INSERT OR REPLACE INTO GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
SELECT GreatWorkType || '_MICO_COPY', YieldType, YieldChange 
FROM GreatWork_YieldChanges 
WHERE EXISTS( SELECT 1 FROM GreatWorks WHERE GreatWorks.GreatWorkType = GreatWork_YieldChanges.GreatWorkType AND GreatWorks.GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE')  AND 
GreatWorkType NOT LIKE '%_MICO_COPY';

INSERT OR REPLACE INTO Mico_Duplicate_GreatWorks (GreatWorkType, GreatWorkDuplicateType)
SELECT GreatWorkType, GreatWorkType || '_MICO_COPY' 
FROM GreatWorks WHERE GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE' AND 
GreatWorkType NOT LIKE '%_MICO_COPY';


-- Remove any enabling traits from the leader you want the governor disabled (Note: this also include secret societies)
DELETE FROM LeaderTraits 
WHERE	(LeaderType = 'LEADER_MICO_BOWSER') AND (
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_DEFENDER' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_AMBASSADOR' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_CARDINAL' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_RESOURCE_MANAGER' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_BUILDER' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_EDUCATOR' OR 
		TraitType = 'TRAIT_LEADER_ENABLE_GOVERNOR_GOVERNOR_THE_MERCHANT');