-----------------------------------------------
-- Types
-----------------------------------------------		

INSERT INTO Types	
		(Type,														Kind						)
VALUES	('TRAIT_LEADER_BUILDING_MICO_PEACH_CASTLE',					'KIND_TRAIT'				),
		('BUILDING_MICO_PEACH_CASTLE',								'KIND_BUILDING'				);

-----------------------------------------------
-- LeaderTraits
-----------------------------------------------
		
INSERT INTO	LeaderTraits
		(LeaderType,			TraitType								)
VALUES	('LEADER_MICO_PEACH',	'TRAIT_LEADER_BUILDING_MICO_PEACH_CASTLE'	);

-----------------------------------------------
-- Traits
-----------------------------------------------

INSERT INTO Traits
		(TraitType,									Name,										Description												)
VALUES	('TRAIT_LEADER_BUILDING_MICO_PEACH_CASTLE',	'LOC_BUILDING_MICO_PEACH_CASTLE_NAME',		'LOC_BUILDING_MICO_PEACH_CASTLE_DESCRIPTION'			);

--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings	
		( BuildingType, Name, Description, PrereqTech, ObsoleteEra, Cost, MaxWorldInstances, IsWonder, RequiresPlacement, RequiresRiver, TraitType, AdvisorType, Quote, PrereqDistrict )
VALUES	
		(	'BUILDING_MICO_PEACH_CASTLE', --BuildingType
			'LOC_BUILDING_MICO_PEACH_CASTLE_NAME', --Name
			'LOC_BUILDING_MICO_PEACH_CASTLE_DESCRIPTION', --Description
			'TECH_CASTLES', -- PrereqTech
			'ERA_ATOMIC', -- ObsoleteEra
			710, -- Cost
			1, --MaxWorldInstances			
			1, --IsWonder
			1, --RequiresPlacement
			1, --RequiresRiver
			'TRAIT_LEADER_BUILDING_MICO_PEACH_CASTLE', --TraitType
			'ADVISOR_CULTURE', --AdvisorType
			'LOC_BUILDING_MICO_PEACH_CASTLE_QUOTE', --Quote
			'DISTRICT_CITY_CENTER' --PrereqDistrict
		);

INSERT INTO Building_ValidTerrains
		(BuildingType,					TerrainType)
VALUES	('BUILDING_MICO_PEACH_CASTLE',	'TERRAIN_DESERT_HILLS'),
		('BUILDING_MICO_PEACH_CASTLE',	'TERRAIN_TUNDRA_HILLS'),
		('BUILDING_MICO_PEACH_CASTLE',	'TERRAIN_PLAINS_HILLS'),
		('BUILDING_MICO_PEACH_CASTLE',	'TERRAIN_GRASS_HILLS'),
		('BUILDING_MICO_PEACH_CASTLE',	'TERRAIN_SNOW_HILLS');

----------------------------------------------
-- Building_GreatWorks
----------------------------------------------
INSERT INTO Building_GreatWorks
		(BuildingType,					GreatWorkSlotType,		NumSlots,	ThemingUniquePerson,	ThemingSameObjectType,	ThemingYieldMultiplier, ThemingTourismMultiplier,	NonUniquePersonYield,	NonUniquePersonTourism, ThemingBonusDescription	)
VALUES	('BUILDING_MICO_PEACH_CASTLE',	'GREATWORKSLOT_ART',	6,			1,						1,						100,					100,						1,						1,						'LOC_BUILDING_THEMINGBONUS_ART');


-----------------------------------------------
-- BuildingModifiers
-----------------------------------------------
INSERT INTO BuildingModifiers 
		(BuildingType,														ModifierId													)
VALUES	('BUILDING_MICO_PEACH_CASTLE',										'MODIFIER_MICO_PEACH_CASTLE_PATRONAGE_GOLD_DISCOUNT'		),
		('BUILDING_MICO_PEACH_CASTLE',										'MODIFIER_MICO_PEACH_CASTLE_DOUBLE_LANDSCAPE_TOURISM'		);

-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT INTO Modifiers
		(ModifierId,													ModifierType														)
VALUES	('MODIFIER_MICO_PEACH_CASTLE_PATRONAGE_GOLD_DISCOUNT',			'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT'	),
		('MODIFIER_MICO_PEACH_CASTLE_DOUBLE_LANDSCAPE_TOURISM',			'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'								);


-----------------------------------------------
-- ModifierArguments
-----------------------------------------------

INSERT INTO ModifierArguments 
		(ModifierId,														Name,					Value												)
VALUES	('MODIFIER_MICO_PEACH_CASTLE_PATRONAGE_GOLD_DISCOUNT',				'YieldType',			'YIELD_GOLD'										),
		('MODIFIER_MICO_PEACH_CASTLE_PATRONAGE_GOLD_DISCOUNT',				'Amount',				25													),
		('MODIFIER_MICO_PEACH_CASTLE_DOUBLE_LANDSCAPE_TOURISM',				'GreatWorkObjectType',	'GREATWORKOBJECT_LANDSCAPE'							),
		('MODIFIER_MICO_PEACH_CASTLE_DOUBLE_LANDSCAPE_TOURISM',				'ScalingFactor',		200													);

