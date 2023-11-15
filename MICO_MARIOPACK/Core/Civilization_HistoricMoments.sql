/*
	Civilization Historic Moments
	Authors: MC
*/

-----------------------------------------------
-- Moment Illustrations

-- This adds new Historic Moments to the custom civilization's timeline, triggered by the training of the Unique Unit and building of the Unique Improvement respectively.

-- MomentIllustrationType: these are game-referenced values that exist within the Rise & Fall (Expansion1) files.
-- MomentDataType: similarly, these classes are defined within the Rise & Fall (Expansion1) files.
-- GameDataType: these values will be defined locally (within this mod), unless you are using a Unique Unit or Unique Improvement that exists elsewhere (base game, or some other mod).
-- Texture: this references the 2D image that will appear when this Historic Moment is triggered. The DDS files should exist within this mod, included under the Textures folder.

-- Please note: For the below code to be used, Rise & Fall (Expansion1) is required.
-----------------------------------------------

INSERT INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,					GameDataType,							Texture										)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',				'UNIT_MICO_FLYING_FORTRESS',			'Moment_Infrastructure_AirShip.dds'			),
		('MOMENT_ILLUSTRATION_UNIQUE_IMPROVEMENT',	'MOMENT_DATA_IMPROVEMENT',		'IMPROVEMENT_MICO_LAVA_FORTRESS',		'Moment_Infrastructure_LavaFortress.dds'	),
		('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',				'UNIT_MICO_ROYAL_GARDENER',				'Moment_Infrastructure_RoyalGardener.dds'	),
		('MOMENT_ILLUSTRATION_UNIQUE_IMPROVEMENT',	'MOMENT_DATA_IMPROVEMENT',		'IMPROVEMENT_MICO_FLOWER_SANCTUARY',	'Moment_Infrastructure_FlowerSanctuary.dds'	),
		('MOMENT_ILLUSTRATION_UNIQUE_BUILDING',		'MOMENT_DATA_BUILDING',			'BUILDING_MICO_GIANT_BEANSTALK',		'Moment_Infrastructure_GiantBeanstalk.dds'	),
		('MOMENT_ILLUSTRATION_UNIQUE_BUILDING',		'MOMENT_DATA_BUILDING',			'BUILDING_MICO_PEACH_CASTLE',			'HistoricMomentPeachCastle.dds'	),
		('MOMENT_ILLUSTRATION_UNIQUE_IMPROVEMENT',	'MOMENT_DATA_IMPROVEMENT',		'IMPROVEMENT_MICO_TOAD_HOUSE',			'HistoricMomentToadHouse.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_LARRY',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_MORTON',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_WENDY',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_IGGY',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_ROY',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_LEMMY',					'HistoricMomentKoopalings.dds'	),
		('MOMENT_ILLUSTRATION_GOVERNOR',			'MOMENT_DATA_GOVERNOR',			'GOVERNOR_MICO_LUDWIG',					'HistoricMomentKoopalings.dds'	);
