-----------------------------------------------
-- Types
-----------------------------------------------		

INSERT INTO Types	
		(Type,														Kind						)
VALUES	('TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK',		'KIND_TRAIT'				),
		('BUILDING_MICO_GIANT_BEANSTALK',							'KIND_BUILDING'				);

-----------------------------------------------
-- CivilizationTraits
-----------------------------------------------
		
INSERT INTO CivilizationTraits
		(TraitType,												CivilizationType					)
VALUES	('TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK',	'CIVILIZATION_MICO_SARASALAND'		);

-----------------------------------------------
-- Traits
-----------------------------------------------

INSERT INTO Traits
		(TraitType,												Name,											Description												)
VALUES	('TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK',	'LOC_BUILDING_MICO_GIANT_BEANSTALK_NAME',		'LOC_BUILDING_MICO_GIANT_BEANSTALK_DESCRIPTION'			);

--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings	
		( BuildingType, Name, PrereqCivic, Cost, PrereqDistrict, Description, PurchaseYield, TraitType, AdvisorType )
VALUES	
		(	'BUILDING_MICO_GIANT_BEANSTALK', --BuildingType
			'LOC_BUILDING_MICO_GIANT_BEANSTALK_NAME', --Name
			'CIVIC_MYSTICISM', -- PrereqCivic
			150, -- Cost
			'DISTRICT_PRESERVE', --PrereqDistrict
			'LOC_BUILDING_MICO_GIANT_BEANSTALK_DESCRIPTION', --Description
			'YIELD_GOLD', --PurchaseYield
			'TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK', --TraitType
			'ADVISOR_CULTURE' --AdvisorType
		);

-----------------------------------------------
-- BuildingReplaces
-----------------------------------------------
		
INSERT INTO BuildingReplaces
		(CivUniqueBuildingType,					ReplacesBuildingType	)
VALUES	('BUILDING_MICO_GIANT_BEANSTALK',		'BUILDING_GROVE'		);

-----------------------------------------------
-- TraitModifiers - The way this ability works with tile props its more efficient to attach the modifier to the trait instead of the building
-----------------------------------------------
INSERT INTO TraitModifiers 
		(TraitType,														ModifierId													)
VALUES	('TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK',			'MODIFIER_MICO_GIANT_BEANSTALK_ADD_MINOR_YIELD'				),
		('TRAIT_CIVILIZATION_BUILDING_MICO_GIANT_BEANSTALK',			'MODIFIER_MICO_GIANT_BEANSTALK_ADD_MAJOR_YIELD'				);

-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT INTO Modifiers
		(ModifierId,													ModifierType,										OwnerRequirementSetId,			SubjectRequirementSetId,								SubjectStackLimit	)
VALUES	('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MINOR_YIELD',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				null,							'REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MINOR_YIELDS',	1					),
		('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MAJOR_YIELD',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				null,							'REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MAJOR_YIELDS',	1					);


-----------------------------------------------
-- ModifierArguments
-----------------------------------------------

INSERT INTO ModifierArguments 
		(ModifierId,													Name,				Value												)
VALUES	('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MINOR_YIELD',				'YieldType',		'YIELD_FOOD, YIELD_FAITH, YIELD_CULTURE'			),
		('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MINOR_YIELD',				'Amount',			'1, 1, 1'											),
		('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MAJOR_YIELD',				'YieldType',		'YIELD_FOOD, YIELD_FAITH, YIELD_CULTURE'			),
		('MODIFIER_MICO_GIANT_BEANSTALK_ADD_MAJOR_YIELD',				'Amount',			'1, 1, 1'											);


-- REQUIREMENTS

INSERT INTO RequirementSets
		(RequirementSetId,														RequirementSetType								)
VALUES	('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MINOR_YIELDS',					'REQUIREMENTSET_TEST_ALL'						),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MAJOR_YIELDS',					'REQUIREMENTSET_TEST_ALL'						),
		('REQUIREMENTSET_MICO_PLOT_HAS_NO_IMPROVEMENT',							'REQUIREMENTSET_TEST_ANY'						);


INSERT INTO RequirementSetRequirements
		(RequirementSetId,														RequirementId										)
VALUES	('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MINOR_YIELDS',					'REQUIRES_MICO_HAS_BEANSTALK_PROPERTY'				),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MINOR_YIELDS',					'REQUIRES_PLOT_CHARMING_APPEAL'						),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MINOR_YIELDS',					'REQUIRES_MICO_PLOT_HAS_NO_IMPROVEMENT_IS_MET'		),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MAJOR_YIELDS',					'REQUIRES_MICO_HAS_BEANSTALK_PROPERTY'				),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MAJOR_YIELDS',					'REQUIRES_PLOT_BREATHTAKING_APPEAL'					),
		('REQUIREMENTSET_MICO_PLOT_HAS_BEANSTALK_MAJOR_YIELDS',					'REQUIRES_MICO_PLOT_HAS_NO_IMPROVEMENT_IS_MET'		),
		('REQUIREMENTSET_MICO_PLOT_HAS_NO_IMPROVEMENT',							'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'					),
		('REQUIREMENTSET_MICO_PLOT_HAS_NO_IMPROVEMENT',							'REQUIRES_MICO_HAS_FLOWER_SANCTUARY'				);

		
INSERT INTO Requirements
		(RequirementId, 														RequirementType									)
VALUES	('REQUIRES_MICO_HAS_BEANSTALK_PROPERTY',								'REQUIREMENT_PLOT_PROPERTY_MATCHES'				),
		('REQUIRES_MICO_PLOT_HAS_NO_IMPROVEMENT_IS_MET',						'REQUIREMENT_REQUIREMENTSET_IS_MET'				),
		('REQUIRES_MICO_HAS_FLOWER_SANCTUARY',									'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'		);

INSERT INTO RequirementArguments
		(RequirementId, 									Name,						Value											)
VALUES	('REQUIRES_MICO_HAS_BEANSTALK_PROPERTY', 			'PropertyName',				'PROPERTY_MICO_BEANSTALK_EFFECT'				),
		('REQUIRES_MICO_HAS_BEANSTALK_PROPERTY', 			'PropertyMinimum',			1												),
		('REQUIRES_MICO_PLOT_HAS_NO_IMPROVEMENT_IS_MET', 	'RequirementSetId',			'REQUIREMENTSET_MICO_PLOT_HAS_NO_IMPROVEMENT'	),
		('REQUIRES_MICO_HAS_FLOWER_SANCTUARY', 				'ImprovementType',			'IMPROVEMENT_MICO_FLOWER_SANCTUARY'				);
