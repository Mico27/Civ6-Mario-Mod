-- Civilization_UP
-- Author: Mico
-- DateCreated: 03/31/2023 21:08:00 PM

--------------------------------------------------------------
-- Types
--------------------------------------------------------------
INSERT INTO Types
		(Type,														Kind			)
VALUES	('PROJECT_MICO_FORCED_ERUPTION',							'KIND_PROJECT'	),
		('PROJECT_MICO_FORCED_ERUPTION_CATA',						'KIND_PROJECT'	),
		('PROJECT_MICO_FORCED_ERUPTION_MEGA',						'KIND_PROJECT'	),
		('MODIFIER_MICO_OWNER_MAKE_PROJECT_AVAILABLE',				'KIND_MODIFIER' ),
		('BUILDING_MICO_LAVA_FORTRESS',								'KIND_BUILDING' );


--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT INTO TraitModifiers
		(TraitType,												ModifierId)
VALUES	('TRAIT_CIVILIZATION_IMPROVEMENT_MICO_LAVA_FORTRESS',	'UNLOCK_PROJECT_MICO_FORCED_ERUPTION'),
		('TRAIT_CIVILIZATION_IMPROVEMENT_MICO_LAVA_FORTRESS',	'UNLOCK_PROJECT_MICO_FORCED_ERUPTION_CATA'),
		('TRAIT_CIVILIZATION_IMPROVEMENT_MICO_LAVA_FORTRESS',	'UNLOCK_PROJECT_MICO_FORCED_ERUPTION_MEGA');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,											ModifierType)
VALUES	('UNLOCK_PROJECT_MICO_FORCED_ERUPTION',					'MODIFIER_MICO_OWNER_MAKE_PROJECT_AVAILABLE'),
		('UNLOCK_PROJECT_MICO_FORCED_ERUPTION_CATA',			'MODIFIER_MICO_OWNER_MAKE_PROJECT_AVAILABLE'),
		('UNLOCK_PROJECT_MICO_FORCED_ERUPTION_MEGA',			'MODIFIER_MICO_OWNER_MAKE_PROJECT_AVAILABLE');
--------------------------------------------------------------		
-- DynamicModifiers
--------------------------------------------------------------
INSERT INTO DynamicModifiers
		(ModifierType,											CollectionType,					EffectType)
VALUES	('MODIFIER_MICO_OWNER_MAKE_PROJECT_AVAILABLE',			'COLLECTION_OWNER',				'EFFECT_ADD_PLAYER_PROJECT_AVAILABILITY');
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
VALUES	('UNLOCK_PROJECT_MICO_FORCED_ERUPTION',							'ProjectType',		'PROJECT_MICO_FORCED_ERUPTION'),
		('UNLOCK_PROJECT_MICO_FORCED_ERUPTION_CATA',					'ProjectType',		'PROJECT_MICO_FORCED_ERUPTION_CATA'),
		('UNLOCK_PROJECT_MICO_FORCED_ERUPTION_MEGA',					'ProjectType',		'PROJECT_MICO_FORCED_ERUPTION_MEGA');


INSERT INTO Buildings
		(BuildingType,					Name,									PrereqDistrict,			Cost, InternalOnly)
VALUES	('BUILDING_MICO_LAVA_FORTRESS',	'LOC_BUILDING_MICO_LAVA_FORTRESS_NAME',	'DISTRICT_CITY_CENTER',	1, 1);

--------------------------------------------------------------
-- Projects
--------------------------------------------------------------
INSERT INTO Projects
		(ProjectType,								Cost,	CostProgressionModel,				CostProgressionParam1,		RequiredBuilding,				AdvisorType,		Name,												ShortName,												Description,												UnlocksFromEffect)
VALUES	('PROJECT_MICO_FORCED_ERUPTION',			12,		'COST_PROGRESSION_GAME_PROGRESS',	1500,						'BUILDING_MICO_LAVA_FORTRESS',	'ADVISOR_GENERIC',	'LOC_PROJECT_MICO_FORCED_ERUPTION_NAME',			'LOC_PROJECT_MICO_FORCED_ERUPTION_SHORT_NAME',			'LOC_PROJECT_MICO_FORCED_ERUPTION_DESCRIPTION',				1),
		('PROJECT_MICO_FORCED_ERUPTION_CATA',		25,		'COST_PROGRESSION_GAME_PROGRESS',	1500,						'BUILDING_MICO_LAVA_FORTRESS',	'ADVISOR_GENERIC',	'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_NAME',		'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_SHORT_NAME',		'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_DESCRIPTION',		1),
		('PROJECT_MICO_FORCED_ERUPTION_MEGA',		37,		'COST_PROGRESSION_GAME_PROGRESS',	1500,						'BUILDING_MICO_LAVA_FORTRESS',	'ADVISOR_GENERIC',	'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_NAME',		'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_SHORT_NAME',		'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_DESCRIPTION',		1);


--------------------------------------------------------------
-- Project_YieldConversions
--------------------------------------------------------------
INSERT INTO Project_YieldConversions
		(ProjectType,							YieldType,			PercentOfProductionRate	)
VALUES	('PROJECT_MICO_FORCED_ERUPTION',		'YIELD_SCIENCE',	15					),
		('PROJECT_MICO_FORCED_ERUPTION_CATA',	'YIELD_SCIENCE',	15					),
		('PROJECT_MICO_FORCED_ERUPTION_MEGA',	'YIELD_SCIENCE',	15					);
--------------------------------------------------------------
-- Project_GreatPersonPoints
--------------------------------------------------------------
INSERT INTO Project_GreatPersonPoints
		(ProjectType,							GreatPersonClassType,			Points,	PointProgressionModel,				PointProgressionParam1)
VALUES	('PROJECT_MICO_FORCED_ERUPTION',		'GREAT_PERSON_CLASS_ENGINEER',	5,		'COST_PROGRESSION_GAME_PROGRESS',	800),
		('PROJECT_MICO_FORCED_ERUPTION_CATA',	'GREAT_PERSON_CLASS_ENGINEER',	10,		'COST_PROGRESSION_GAME_PROGRESS',	800),
		('PROJECT_MICO_FORCED_ERUPTION_MEGA',	'GREAT_PERSON_CLASS_ENGINEER',	15,		'COST_PROGRESSION_GAME_PROGRESS',	800);


