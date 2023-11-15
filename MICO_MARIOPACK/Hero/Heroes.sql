-- Custom hero table fix

CREATE TABLE IF NOT EXISTS HeroClassAbilities (
	HeroClassType		TEXT   NOT NULL,
    UnitAbilityTypes	TEXT,
	PRIMARY KEY (HeroClassType)
);

CREATE TABLE IF NOT EXISTS HeroClassPortraits (
	HeroClassType   TEXT   NOT NULL,
    Normal			TEXT,
	Expired			TEXT,
	Killed			TEXT,
	PRIMARY KEY (HeroClassType)
);

--Add default heroes to the tables

INSERT OR IGNORE INTO HeroClassAbilities
		(HeroClassType,			UnitAbilityTypes)
VALUES	('HEROCLASS_ANANSI',	'ABILITY_HERO_IGNORE_FOREST_TERRAIN_COST'),
		('HEROCLASS_BEOWULF',	'ABILITY_HERO_IGNORE_HILLS_TERRAIN_COST'),
		('HEROCLASS_HERCULES',	'ABILITY_HERO_IGNORE_HILLS_TERRAIN_COST'),
		('HEROCLASS_HIMIKO',	'ABILITY_HERO_COMBAT_STRENGTH_AOE,ABILITY_HERO_ENTER_FOREIGN_LANDS,ABILITY_HERO_IGNORE_ALL_TERRAIN_COST'),
		('HEROCLASS_HIPPOLYTA',	'ABILITY_HIPPOLYTA_HEAL_PER_TURN,ABILITY_HERO_IGNORE_HILLS_TERRAIN_COST'),
		('HEROCLASS_HUNAHPU',	'ABILITY_HUNAHPU_RESURRECT_KILL,ABILITY_HERO_IGNORE_FOREST_TERRAIN_COST'),
		('HEROCLASS_OYA',		'ABILITY_HERO_IGNORE_ALL_TERRAIN_COST'),
		('HEROCLASS_MAUI',		'ABILITY_HERO_IGNORE_FOREST_TERRAIN_COST'),
		('HEROCLASS_MULAN',		'ABILITY_MULAN_STRENGTH_PER_TURN,ABILITY_MULAN_FORTIFY'),
		('HEROCLASS_SINBAD',	'ABILITY_SINBAD_GOLD_FOR_DISCOVERY,ABILITY_SINBAD_OCEAN_VALID_TERRAIN'),
		('HEROCLASS_WUKONG',	'ABILITY_WUKONG_STEALTH,ABILITY_WUKONG_LIFESPAN,ABILITY_HERO_IGNORE_ALL_TERRAIN_COST');

INSERT OR IGNORE INTO HeroClassPortraits
		(HeroClassType,			Normal,				Expired,					Killed)
VALUES	('HEROCLASS_ANANSI',	'Heroes_Anansi',	'Heroes_Anansi_Expired',	'Heroes_Anansi_Expired'),
		('HEROCLASS_ARTHUR',	'Heroes_Arthur',	'Heroes_Arthur_Expired',	'Heroes_Arthur_Expired'),
		('HEROCLASS_BEOWULF',	'Heroes_Beowulf',	'Heroes_Beowulf_Expired',	'Heroes_Beowulf_Expired'),
		('HEROCLASS_HERCULES',	'Heroes_Hercules',	'Heroes_Hercules_Expired',	'Heroes_Hercules_Expired'),
		('HEROCLASS_HIMIKO',	'Heroes_Himiko',	'Heroes_Himiko_Expired',	'Heroes_Himiko_Expired'),
		('HEROCLASS_HIPPOLYTA',	'Heroes_Hippolyta',	'Heroes_Hippolyta_Expired',	'Heroes_Hippolyta_Expired'),
		('HEROCLASS_HUNAHPU',	'Heroes_Hunahpu',	'Heroes_Hunahpu_Expired',	'Heroes_Hunahpu_Expired'),
		('HEROCLASS_OYA',		'Heroes_Oya',		'Heroes_Oya_Expired',		'Heroes_Oya_Expired'),
		('HEROCLASS_MAUI',		'Heroes_Maui',		'Heroes_Maui_Expired',		'Heroes_Maui_Expired'),
		('HEROCLASS_MULAN',		'Heroes_Mulan',		'Heroes_Mulan_Expired',		'Heroes_Mulan_Expired'),
		('HEROCLASS_SINBAD',	'Heroes_Sinbad',	'Heroes_Sinbad_Expired',	'Heroes_Sinbad_Expired'),
		('HEROCLASS_WUKONG',	'Heroes_SunWukong',	'Heroes_SunWukong_Expired',	'Heroes_SunWukong_Expired');

		
-- Custom hero mario
INSERT INTO Types	
		(Type,													Kind)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',							'KIND_UNIT'),
		('HEROCLASS_MICO_MARIO_BROS',							'KIND_HEROCLASS'),
		('PROJECT_CREATE_HERO_MICO_MARIO_BROS',					'KIND_PROJECT'),
		('GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',				'KIND_GREATWORK'),
		('GREATWORK_HERO_EPIC_MICO_MARIO_BROS',					'KIND_GREATWORK'),
		('ABILITY_MICO_MARIO_BROS_REPAIR',						'KIND_ABILITY'),
		('ABILITY_MICO_MARIO_BROS_JUMP',						'KIND_ABILITY'),
		('ABILITY_MICO_MARIO_BROS_SAVIOR',						'KIND_ABILITY');

INSERT INTO HeroClasses	
		(HeroClassType,					UnitType,						Name,									Description,									
		CreationProjectType,					ArtifactGreatWorkType,						EpicGreatWorkType)
VALUES	('HEROCLASS_MICO_MARIO_BROS',	'UNIT_HERO_MICO_MARIO_BROS',	'LOC_UNIT_HERO_MICO_MARIO_BROS_NAME',	'LOC_UNIT_HERO_MICO_MARIO_BROS_DESCRIPTION',	
		'PROJECT_CREATE_HERO_MICO_MARIO_BROS',	'GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',	'GREATWORK_HERO_EPIC_MICO_MARIO_BROS');

INSERT INTO TypeProperties	
		(Type,										Name,								Value)
VALUES	('PROJECT_CREATE_HERO_MICO_MARIO_BROS',		'COST_PROGRESSION_GROUP',			'COST_GROUP_HERO_CLAIM_PROJECTS'),
		('GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',	'GREATWORKOBJECT_IS_RELIGIOUS',		1),
		('GREATWORK_HERO_EPIC_MICO_MARIO_BROS',		'GREATWORKOBJECT_IS_RELIGIOUS',		1);

INSERT INTO Projects	
		(ProjectType,							Name,											ShortName,												
		Description,											Cost,	CostProgressionModel,						CostProgressionParam1,	RequiredBuilding,		
		UnlocksFromEffect,	MaxPlayerInstances,	AdvisorType)
VALUES	('PROJECT_CREATE_HERO_MICO_MARIO_BROS',	'LOC_PROJECT_CREATE_HERO_MICO_MARIO_BROS_NAME',	'LOC_PROJECT_CREATE_HERO_MICO_MARIO_BROS_SHORTNAME',	
		'LOC_PROJECT_CREATE_HERO_MICO_MARIO_BROS_DESCRIPTION',	20,		'COST_PROGRESSION_PREVIOUS_GROUP_COPIES',	120,					'BUILDING_MONUMENT',	
		1,					1,					'ADVISOR_GENERIC');

INSERT INTO ProjectCompletionModifiers	
		(ProjectType,							ModifierId)
VALUES	('PROJECT_CREATE_HERO_MICO_MARIO_BROS',	'MODIFIER_CREATE_HERO_MICO_MARIO_BROS_SLOTS'),
		('PROJECT_CREATE_HERO_MICO_MARIO_BROS',	'MODIFIER_CREATE_HERO_MICO_MARIO_BROS');

INSERT INTO BuildingModifiers	
		(BuildingType,		ModifierId)
VALUES	('BUILDING_ORACLE',	'MODIFIER_ORACLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS'),
		('BUILDING_TEMPLE',	'MODIFIER_TEMPLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS');

INSERT INTO Modifiers	
		(ModifierId,													ModifierType,											RunOnce,	Permanent)
VALUES	('MODIFIER_CREATE_HERO_MICO_MARIO_BROS',						'MODIFIER_CITY_GRANT_HERO',								1,			1),
		('MODIFIER_CREATE_HERO_MICO_MARIO_BROS_SLOTS',					'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS',	1,			1),
		('MODIFIER_ORACLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',		0,			0),
		('MODIFIER_TEMPLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',		0,			0);

INSERT INTO ModifierArguments	
		(ModifierId,													Name,					Value)
VALUES	('MODIFIER_CREATE_HERO_MICO_MARIO_BROS',						'HeroClassType',		'HEROCLASS_MICO_MARIO_BROS'),
		('MODIFIER_CREATE_HERO_MICO_MARIO_BROS_SLOTS',					'BuildingType',			'BUILDING_MONUMENT'),
		('MODIFIER_CREATE_HERO_MICO_MARIO_BROS_SLOTS',					'GreatWorkSlotType',	'GREATWORKSLOT_HERO'),
		('MODIFIER_CREATE_HERO_MICO_MARIO_BROS_SLOTS',					'Amount',				2),
		('MODIFIER_ORACLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'UnitType',				'UNIT_HERO_MICO_MARIO_BROS'),
		('MODIFIER_ORACLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'Amount',				15),
		('MODIFIER_TEMPLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'UnitType',				'UNIT_HERO_MICO_MARIO_BROS'),
		('MODIFIER_TEMPLE_RECALL_FAITH_COST_DISCOUNT_MICO_MARIO_BROS',	'Amount',				15);

INSERT INTO GreatWorks	
		(GreatWorkType,								GreatWorkObjectType,	
		Name,												Tourism)
VALUES	('GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',	'GREATWORKOBJECT_HERO',	
		'LOC_GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS_NAME',	6),
		('GREATWORK_HERO_EPIC_MICO_MARIO_BROS',		'GREATWORKOBJECT_HERO',	
		'LOC_GREATWORK_HERO_EPIC_MICO_MARIO_BROS_NAME',		6);

INSERT INTO GreatWork_YieldChanges	
		(GreatWorkType,								YieldType,			YieldChange)
VALUES	('GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',	'YIELD_FAITH',		2),
		('GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',	'YIELD_CULTURE',	2),
		('GREATWORK_HERO_EPIC_MICO_MARIO_BROS',		'YIELD_FAITH',		2),
		('GREATWORK_HERO_EPIC_MICO_MARIO_BROS',		'YIELD_CULTURE',	2);

INSERT INTO Tags
		(Tag,								Vocabulary)
VALUES	('CLASS_HERO_MICO_MARIO_BROS',		'ABILITY_CLASS');

INSERT INTO TypeTags
		(Type,								Tag)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',		'CLASS_ALL_ERAS'),
		('UNIT_HERO_MICO_MARIO_BROS',		'CLASS_MELEE'),
		('UNIT_HERO_MICO_MARIO_BROS',		'CLASS_HERO_MICO_MARIO_BROS'),
		('ABILITY_MICO_MARIO_BROS_JUMP',	'CLASS_HERO_MICO_MARIO_BROS'),
		('ABILITY_MICO_MARIO_BROS_REPAIR',	'CLASS_HERO_MICO_MARIO_BROS'),
		('ABILITY_MICO_MARIO_BROS_SAVIOR',	'CLASS_HERO_MICO_MARIO_BROS');


INSERT INTO Units	
		(UnitType,						Name,									Description,									Combat,				
		BaseMoves,	BaseSightRange,	ZoneOfControl,	Domain,			CanEarnExperience,	FormationClass,					PromotionClass,						Cost,	
		MustPurchase,	InitialLevel,	PurchaseYield,	CostProgressionModel,				CostProgressionParam1)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',	'LOC_UNIT_HERO_MICO_MARIO_BROS_NAME',	'LOC_UNIT_HERO_MICO_MARIO_BROS_DESCRIPTION',	35,									
		3,			4,				1,				'DOMAIN_LAND',	0,					'FORMATION_CLASS_LAND_COMBAT',	'PROMOTION_CLASS_MELEE',	200,	
		1,				1,				'YIELD_FAITH',	'COST_PROGRESSION_PREVIOUS_COPIES',	300);

INSERT INTO Units_XP2	( UnitType, CanEarnExperience, CanFormMilitaryFormation, MajorCivOnly)
VALUES ('UNIT_HERO_MICO_MARIO_BROS', 0, 0, 1);

INSERT INTO HeroClassProgressions	
		(HeroClassType,					EraType,			CombatStrength)
VALUES	('HEROCLASS_MICO_MARIO_BROS',	'ERA_CLASSICAL',	45),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_MEDIEVAL',		60),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_RENAISSANCE',	70),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_INDUSTRIAL',	80),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_MODERN',		95),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_ATOMIC',		110),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_INFORMATION',	120),
		('HEROCLASS_MICO_MARIO_BROS',	'ERA_FUTURE',		130);


INSERT INTO UnitAiInfos	
		(UnitType,						AiType)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',	'UNITAI_COMBAT'),
		('UNIT_HERO_MICO_MARIO_BROS',	'UNITAI_EXPLORE'),
		('UNIT_HERO_MICO_MARIO_BROS',	'UNITTYPE_MELEE'),
		('UNIT_HERO_MICO_MARIO_BROS',	'UNITTYPE_LAND_COMBAT');

--INSERT INTO HeroClassUnitCommands
--		(HeroClassType,						UnitCommandType)
--VALUES	('HEROCLASS_MICO_MARIO_BROS',		'UNITCOMMAND_MOVE_JUMP');

INSERT INTO TypeProperties	
		(Type,							Name,								Value)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',	'LIFESPAN',							35),
		('UNIT_HERO_MICO_MARIO_BROS',	'CAN_EVER_TRAIN_BARBARIAN',			0),
		('UNIT_HERO_MICO_MARIO_BROS',	'CAN_EVER_TRAIN_CITY_STATE',		0),
		('UNIT_HERO_MICO_MARIO_BROS',	'CAN_EVER_TRAIN_FREE_CITY',			0),
		('UNIT_HERO_MICO_MARIO_BROS',	'IGNORE_PLAYER_STAT_MAX_STRENGTH',	1),
		('UNIT_HERO_MICO_MARIO_BROS',	'CAN_MOVE_AFTER_PURCHASE',			1),
		('UNIT_HERO_MICO_MARIO_BROS',	'CAN_TELEPORT_TO_CITY',				1),
		('UNIT_HERO_MICO_MARIO_BROS',	'HERO_LOYALTY_CHANGE_RANGE',		2),
		('UNIT_HERO_MICO_MARIO_BROS',	'HERO_LOYALTY_CHANGE_PER_TURN',		1);


INSERT INTO Units_MODE
		(UnitType,						ActionCharges)
VALUES	('UNIT_HERO_MICO_MARIO_BROS',	6);

INSERT INTO UnitAbilities	
		(UnitAbilityType,						Name,										Description,										Inactive)
VALUES	('ABILITY_MICO_MARIO_BROS_JUMP',		'LOC_ABILITY_MICO_MARIO_BROS_JUMP_NAME',	'LOC_ABILITY_MICO_MARIO_BROS_JUMP_DESCRIPTION',		0),
		('ABILITY_MICO_MARIO_BROS_REPAIR',		'LOC_ABILITY_MICO_MARIO_BROS_REPAIR_NAME',	'LOC_ABILITY_MICO_MARIO_BROS_REPAIR_DESCRIPTION',	0),
		('ABILITY_MICO_MARIO_BROS_SAVIOR',		'LOC_ABILITY_MICO_MARIO_BROS_SAVIOR_NAME',	'LOC_ABILITY_MICO_MARIO_BROS_SAVIOR_DESCRIPTION',	0);

INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_MICO_MARIO_BROS_JUMP',		'MODIFIER_MICO_MARIO_BROS_JUMP'),
		('ABILITY_MICO_MARIO_BROS_SAVIOR',		'MODIFIER_MICO_MARIO_BROS_SAVIOR');

INSERT INTO Modifiers
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('MODIFIER_MICO_MARIO_BROS_JUMP',				'MODIFIER_SINGLE_UNIT_ADJUST_JUMP_DISTANCE',			null),
		('MODIFIER_MICO_MARIO_BROS_SAVIOR',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					'PLAYER_CITY_OCCUPIED');

INSERT INTO ModifierArguments
		(ModifierId,										Name,							Value)
VALUES	('MODIFIER_MICO_MARIO_BROS_JUMP',					'Range',						3),
		('MODIFIER_MICO_MARIO_BROS_SAVIOR',					'Amount',						20);
		
INSERT OR IGNORE INTO HeroClassAbilities
		(HeroClassType,					UnitAbilityTypes)
VALUES	('HEROCLASS_MICO_MARIO_BROS',	'ABILITY_MICO_MARIO_BROS_JUMP,ABILITY_MICO_MARIO_BROS_REPAIR,ABILITY_MICO_MARIO_BROS_SAVIOR');

INSERT OR IGNORE INTO HeroClassPortraits
		(HeroClassType,					Normal,					Expired,						Killed)
VALUES	('HEROCLASS_MICO_MARIO_BROS',	'Heroes_MicoMarioBros',	'Heroes_MicoMarioBros_Expired',	'Heroes_MicoMarioBros_Expired');