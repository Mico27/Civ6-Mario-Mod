/*
	Civilization Icons
	Authors: Mico
*/

-----------------------------------------------
-- IconTextureAtlases

-- We use a single document to define all of our new ICON elements. This keeps things in one place and acts as a nice 'checklist' for every icon file we'll need to ensure exists.

-- Briefly, we'll explain what the IconTextureAtlases are. An 'atlas', in this context, is a series of graphics that all contain icons of a certain type, albeit in different sizes. In our example template, we have four different atlases: the CIVILIZATION, the LEADER, the UNIQUE UNIT and the UNIQUE INFRASTRUCTURE.

-- The definitions below illustrate how each is defined.

-- Name: This defines the name of the atlas. This is the element that is referenced in other parts of this document.
-- IconSize: Fairly self-explanatory, but this is the width (or height) of one icon (within the atlas) in pixels. All icons (game-wide) have square dimensions (1:1).
-- IconsPerRow: This defines the number of icons there are across the entire width of the atlas file. The total width of the DDS file should be equal to IconSize x IconsPerRow. If you are creating every icon as a separate file, the value here will always be 1.
-- IconsPerColumn: This defines the number of icons there are along the entire height of the atlas file. The total height of the DDS file should be equal to IconSize x IconsPerColumn. If you are creating every icon as a separate file, the value here will always be 1.
-- Filename: Again, fairly self-explanatory. This should be the complete, case-sensitive name of the DDS file that pertains to the graphic for that entry. All files referenced here must be located in the root of the Textures folder.

-- A quick note on the ICON_ATLAS_MICO_FLYING_FORTRESS atlas. I've left this in here, configured in this way, to illustrate how to use multi-icon atlases. In this example, each FlyingFortressAtlasXXX.dds file has two icons - the Unique Unit icon and Unique Unit portrait. We'll describe further down how we differentiate to the game which should be used for which function through the IconDefinitions section.

-- Please note: I have included a sample configuration for the ICON_ATLAS_COLOSSAL_HEAD but you may note that this is not referenced in the IconDefinitions. The ICON_COLOSSAL_HEAD exists in the base-game and therefore this is just to illustrate which icon-sizes are required for an Improvement.
-----------------------------------------------

INSERT INTO  IconTextureAtlases	
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,		Filename					)
VALUES	('ICON_CIVILIZATION_MICO_KOOPA',					22,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_22.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					30,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_30.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					32,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_32.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					36,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_36.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					44,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_44.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					45,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_45.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					48,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_48.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					50,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_50.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					64,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_64.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					80,	 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_80.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					128, 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_128.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					200, 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_200.dds'			),
		('ICON_CIVILIZATION_MICO_KOOPA',					256, 		1,				1,					'ICON_CIVILIZATION_MICO_KOOPA_256.dds'			),

		('ICON_LEADER_MICO_BOWSER',				32,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_32.dds'			),
		('ICON_LEADER_MICO_BOWSER',				45,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_45.dds'			),
		('ICON_LEADER_MICO_BOWSER',				48,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_48.dds'			),
		('ICON_LEADER_MICO_BOWSER',				50,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_50.dds'			),
		('ICON_LEADER_MICO_BOWSER',				55,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_55.dds'			),
		('ICON_LEADER_MICO_BOWSER',				64,			1,				1,					'ICON_LEADER_MICO_BOWSER_64.dds'			),
		('ICON_LEADER_MICO_BOWSER',				80,	 		1,				1,					'ICON_LEADER_MICO_BOWSER_80.dds'			),
		('ICON_LEADER_MICO_BOWSER',				256,	 	1,				1,					'ICON_LEADER_MICO_BOWSER_256.dds'			),
		
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			22,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_22.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			32,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_32.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			38,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_38.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			50,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_50.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			70,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_70.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			80,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_80.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			95,			2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_95.dds'		),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			200,		2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_200.dds'	),
		('ICON_ATLAS_MICO_FLYING_FORTRESS',			256,		2,				1,					'ICON_ATLAS_MICO_FLYING_FORTRESS_256.dds'	),
		
		('ICON_ATLAS_MICO_PROJECT',			30,			1,				1,					'ICON_ATLAS_MICO_PROJECT_30.dds'		),
		('ICON_ATLAS_MICO_PROJECT',			32,			1,				1,					'ICON_ATLAS_MICO_PROJECT_32.dds'		),
		('ICON_ATLAS_MICO_PROJECT',			38,			1,				1,					'ICON_ATLAS_MICO_PROJECT_38.dds'		),
		('ICON_ATLAS_MICO_PROJECT',			50,			1,				1,					'ICON_ATLAS_MICO_PROJECT_50.dds'		),
		('ICON_ATLAS_MICO_PROJECT',			80,			1,				1,					'ICON_ATLAS_MICO_PROJECT_80.dds'		),
		('ICON_ATLAS_MICO_PROJECT',			256,		1,				1,					'ICON_ATLAS_MICO_PROJECT_256.dds'		),
		
		('ICON_ATLAS_MICO_LAVA_FORTRESS',			38,			1,				1,					'ICON_ATLAS_MICO_LAVA_FORTRESS_38.dds'		),
		('ICON_ATLAS_MICO_LAVA_FORTRESS',			50,			1,				1,					'ICON_ATLAS_MICO_LAVA_FORTRESS_50.dds'		),
		('ICON_ATLAS_MICO_LAVA_FORTRESS',			80,			1,				1,					'ICON_ATLAS_MICO_LAVA_FORTRESS_80.dds'		),
		('ICON_ATLAS_MICO_LAVA_FORTRESS',			256,		1,				1,					'ICON_ATLAS_MICO_LAVA_FORTRESS_256.dds'		),
		
		
		('ICON_CIVILIZATION_MICO_MUSHROOM',					22,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_22.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					30,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_30.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',				32,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_32.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					36,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_36.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					44,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_44.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',				45,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_45.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					48,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_48.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					50,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_50.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					64,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_64.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					80,	 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_80.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',				128, 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_128.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					200, 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_200.dds'			),
		('ICON_CIVILIZATION_MICO_MUSHROOM',					256, 		1,				1,					'ICON_CIVILIZATION_MICO_MUSHROOM_256.dds'			),

		('ICON_LEADER_MICO_PEACH',				32,	 		1,				1,					'ICON_LEADER_MICO_PEACH_32.dds'			),
		('ICON_LEADER_MICO_PEACH',				45,	 		1,				1,					'ICON_LEADER_MICO_PEACH_45.dds'			),
		('ICON_LEADER_MICO_PEACH',				48,	 		1,				1,					'ICON_LEADER_MICO_PEACH_48.dds'			),
		('ICON_LEADER_MICO_PEACH',				50,	 		1,				1,					'ICON_LEADER_MICO_PEACH_50.dds'			),
		('ICON_LEADER_MICO_PEACH',				55,	 		1,				1,					'ICON_LEADER_MICO_PEACH_55.dds'			),
		('ICON_LEADER_MICO_PEACH',				64,			1,				1,					'ICON_LEADER_MICO_PEACH_64.dds'			),
		('ICON_LEADER_MICO_PEACH',				80,	 		1,				1,					'ICON_LEADER_MICO_PEACH_80.dds'			),
		('ICON_LEADER_MICO_PEACH',				256,	 	1,				1,					'ICON_LEADER_MICO_PEACH_256.dds'			),

		('ICON_ATLAS_MICO_PEACH_CASTLE',			32,			1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_32.dds'		),
		('ICON_ATLAS_MICO_PEACH_CASTLE',			38,			1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_38.dds'		),
		('ICON_ATLAS_MICO_PEACH_CASTLE',			50,			1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_50.dds'		),
		('ICON_ATLAS_MICO_PEACH_CASTLE',			80,			1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_80.dds'		),
		('ICON_ATLAS_MICO_PEACH_CASTLE',			128,		1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_128.dds'		),
		('ICON_ATLAS_MICO_PEACH_CASTLE',			256,		1,				1,					'ICON_ATLAS_MICO_PEACH_CASTLE_256.dds'		),

		('ICON_ATLAS_MICO_TOAD_HOUSE',			38,			1,				1,					'ICON_ATLAS_MICO_TOAD_HOUSE_38.dds'		),
		('ICON_ATLAS_MICO_TOAD_HOUSE',			50,			1,				1,					'ICON_ATLAS_MICO_TOAD_HOUSE_50.dds'		),
		('ICON_ATLAS_MICO_TOAD_HOUSE',			80,			1,				1,					'ICON_ATLAS_MICO_TOAD_HOUSE_80.dds'		),
		('ICON_ATLAS_MICO_TOAD_HOUSE',			256,		1,				1,					'ICON_ATLAS_MICO_TOAD_HOUSE_256.dds'	),
		
		('ICON_CIVILIZATION_MICO_SARASALAND',					22,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_22.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					30,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_30.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					32,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_32.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					36,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_36.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					44,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_44.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					45,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_45.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					48,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_48.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					50,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_50.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					64,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_64.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					80,	 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_80.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					128, 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_128.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					200, 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_200.dds'			),
		('ICON_CIVILIZATION_MICO_SARASALAND',					256, 		1,				1,					'ICON_CIVILIZATION_MICO_SARASALAND_256.dds'			),


		('ICON_LEADER_MICO_DAISY',				32,	 		1,				1,					'ICON_LEADER_MICO_DAISY_32.dds'			),
		('ICON_LEADER_MICO_DAISY',				45,	 		1,				1,					'ICON_LEADER_MICO_DAISY_45.dds'			),
		('ICON_LEADER_MICO_DAISY',				48,	 		1,				1,					'ICON_LEADER_MICO_DAISY_48.dds'			),
		('ICON_LEADER_MICO_DAISY',				50,	 		1,				1,					'ICON_LEADER_MICO_DAISY_50.dds'			),
		('ICON_LEADER_MICO_DAISY',				55,	 		1,				1,					'ICON_LEADER_MICO_DAISY_55.dds'			),
		('ICON_LEADER_MICO_DAISY',				64,			1,				1,					'ICON_LEADER_MICO_DAISY_64.dds'			),
		('ICON_LEADER_MICO_DAISY',				80,	 		1,				1,					'ICON_LEADER_MICO_DAISY_80.dds'			),
		('ICON_LEADER_MICO_DAISY',				256,	 	1,				1,					'ICON_LEADER_MICO_DAISY_256.dds'		),

		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			32,			1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_32.dds'		),
		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			38,			1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_38.dds'		),
		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			50,			1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_50.dds'		),
		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			80,			1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_80.dds'		),
		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			128,		1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_128.dds'		),
		('ICON_ATLAS_MICO_GIANT_BEANSTALK',			256,		1,				1,					'ICON_ATLAS_MICO_GIANT_BEANSTALK_256.dds'		),
		
		('ICON_ATLAS_MICO_FLOWER_SANCTUARY',			38,			1,				1,					'ICON_ATLAS_MICO_FLOWER_SANCTUARY_38.dds'		),
		('ICON_ATLAS_MICO_FLOWER_SANCTUARY',			50,			1,				1,					'ICON_ATLAS_MICO_FLOWER_SANCTUARY_50.dds'		),
		('ICON_ATLAS_MICO_FLOWER_SANCTUARY',			80,			1,				1,					'ICON_ATLAS_MICO_FLOWER_SANCTUARY_80.dds'		),
		('ICON_ATLAS_MICO_FLOWER_SANCTUARY',			256,		1,				1,					'ICON_ATLAS_MICO_FLOWER_SANCTUARY_256.dds'		),

		('ICON_UNITOPERATION_MICO_WARP_PAINTING',			38,			1,				1,					'ICON_UNITOPERATION_MICO_WARP_PAINTING_38.dds'		),
		('ICON_UNITOPERATION_MICO_WARP_PAINTING',			50,			1,				1,					'ICON_UNITOPERATION_MICO_WARP_PAINTING_50.dds'		),
		('ICON_UNITOPERATION_MICO_WARP_PAINTING',			80,			1,				1,					'ICON_UNITOPERATION_MICO_WARP_PAINTING_80.dds'		),
		('ICON_UNITOPERATION_MICO_WARP_PAINTING',			256,		1,				1,					'ICON_UNITOPERATION_MICO_WARP_PAINTING_256.dds'		),

		('ICON_MICO_GOVERNORS_PROMOTIONS',			24,			7,				1,					'Mico_GovernorPromotions24.dds'		),
		('ICON_MICO_GOVERNORS',						32,			7,				1,					'Mico_Governors32.dds'		),
		('ICON_MICO_GOVERNORS',						64,			7,				1,					'Mico_Governors64.dds'		),
		('ICON_MICO_GOVERNORS_FILL',				22,			7,				1,					'Mico_GovernorsCityBannerFill22.dds'		),
		('ICON_MICO_GOVERNORS_FILL',				32,			7,				1,					'Mico_GovernorsCityBannerFill32.dds'		),
		('ICON_MICO_GOVERNORS_SLOT',				22,			7,				1,					'Mico_GovernorsCityBannerSlot22.dds'		),
		('ICON_MICO_GOVERNORS_SLOT',				32,			7,				1,					'Mico_GovernorsCityBannerSlot32.dds'		);
		



		
-----------------------------------------------
-- IconDefinitions

-- With the IconTextureAtlases defined, we now tie each Atlas to a specific icon-type.

-- The icon Name is defined in the table below and the Atlas tells the game where to pull the graphic from. The Index field directs the game to the right portion of the file, should there be more than one icon. The Index is an integer value in the form of an array - starting from 0, with icons numbered from left-to-right, row-by-row. In this way, we use the ICON_ATLAS_MICO_FLYING_FORTRESS Atlas, which has two icons in a single file, to drive the display of two distinct in-game icons.
-----------------------------------------------

INSERT INTO IconDefinitions
		(Name,										Atlas,										'Index'				)
VALUES	('ICON_CIVILIZATION_MICO_KOOPA',			'ICON_CIVILIZATION_MICO_KOOPA',				0					),
		('ICON_LEADER_MICO_BOWSER',					'ICON_LEADER_MICO_BOWSER',					0					),
		('ICON_UNIT_MICO_FLYING_FORTRESS_PORTRAIT',	'ICON_ATLAS_MICO_FLYING_FORTRESS',			0					),
		('ICON_UNIT_MICO_FLYING_FORTRESS',			'ICON_ATLAS_MICO_FLYING_FORTRESS',			1					),
		('ICON_IMPROVEMENT_MICO_LAVA_FORTRESS',		'ICON_ATLAS_MICO_LAVA_FORTRESS',			0					),
		('ICON_IMPROVEMENT_MICO_LAVA_FORTRESS_RUINS', 'ICON_ATLAS_MICO_LAVA_FORTRESS',			0					),
		('ICON_BUILDING_MICO_LAVA_FORTRESS',		'ICON_ATLAS_MICO_LAVA_FORTRESS',			0					),
		('ICON_IMPROVEMENT_MICO_FIRE_STARTER',		'ICON_ATLAS_UNIT_ACTIONS',					63					),
		('ICON_PROJECT_MICO_FORCED_ERUPTION',		'ICON_ATLAS_MICO_PROJECT',					0					),
		('ICON_PROJECT_MICO_FORCED_ERUPTION_CATA',	'ICON_ATLAS_MICO_PROJECT',					0					),
		('ICON_PROJECT_MICO_FORCED_ERUPTION_MEGA',	'ICON_ATLAS_MICO_PROJECT',					0					),
		('ICON_CIVILIZATION_MICO_MUSHROOM',			'ICON_CIVILIZATION_MICO_MUSHROOM',			0					),
		('ICON_LEADER_MICO_PEACH',					'ICON_LEADER_MICO_PEACH',					0					),
		('ICON_BUILDING_MICO_PEACH_CASTLE',			'ICON_ATLAS_MICO_PEACH_CASTLE',				0					),
		('ICON_IMPROVEMENT_MICO_TOAD_HOUSE',		'ICON_ATLAS_MICO_TOAD_HOUSE',				0					),
		('ICON_CIVILIZATION_MICO_SARASALAND',		'ICON_CIVILIZATION_MICO_SARASALAND',		0					),
		('ICON_LEADER_MICO_DAISY',					'ICON_LEADER_MICO_DAISY',					0					),
		('ICON_BUILDING_MICO_GIANT_BEANSTALK',		'ICON_ATLAS_MICO_GIANT_BEANSTALK',			0					),
		('ICON_IMPROVEMENT_MICO_FLOWER_SANCTUARY',	'ICON_ATLAS_MICO_FLOWER_SANCTUARY',			0					),
		('ICON_UNIT_MICO_ROYAL_GARDENER_PORTRAIT',	'ICON_ATLAS_UNIT_PORTRAITS',				16					),
		('ICON_UNIT_MICO_ROYAL_GARDENER_FOW',		'ICON_ATLAS_UNITS_FOW',						18					),
		('ICON_UNIT_MICO_ROYAL_GARDENER_WHITE',		'ICON_ATLAS_UNIT_FLAG_SYMBOLS_WHITE',		18					),
		('ICON_UNIT_MICO_ROYAL_GARDENER_BLACK',		'ICON_ATLAS_UNIT_FLAG_SYMBOLS_BLACK',		18					),
		('ICON_UNIT_MICO_ROYAL_GARDENER',			'ICON_ATLAS_UNITS',							18					),
		('ICON_UNITOPERATION_MICO_WARP_PAINTING',	'ICON_UNITOPERATION_MICO_WARP_PAINTING',	0					),
		('ICON_UNITOPERATION_MICO_REPAIR_CITY',		'ICON_ATLAS_UNIT_ACTIONS',					69					),	
		('ICON_GOVERNOR_MICO_LARRY_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			0					),
		('ICON_GOVERNOR_MICO_WENDY_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			1					),
		('ICON_GOVERNOR_MICO_IGGY_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			2					),
		('ICON_GOVERNOR_MICO_ROY_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			3					),
		('ICON_GOVERNOR_MICO_LEMMY_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			4					),
		('ICON_GOVERNOR_MICO_LUDWIG_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			5					),
		('ICON_GOVERNOR_MICO_MORTON_PROMOTION',		'ICON_MICO_GOVERNORS_PROMOTIONS',			6					),
		('ICON_GOVERNOR_MICO_LARRY',				'ICON_MICO_GOVERNORS',						0					),
		('ICON_GOVERNOR_MICO_WENDY',				'ICON_MICO_GOVERNORS',						1					),
		('ICON_GOVERNOR_MICO_IGGY',					'ICON_MICO_GOVERNORS',						2					),
		('ICON_GOVERNOR_MICO_ROY',					'ICON_MICO_GOVERNORS',						3					),
		('ICON_GOVERNOR_MICO_LEMMY',				'ICON_MICO_GOVERNORS',						4					),
		('ICON_GOVERNOR_MICO_LUDWIG',				'ICON_MICO_GOVERNORS',						5					),
		('ICON_GOVERNOR_MICO_MORTON',				'ICON_MICO_GOVERNORS',						6					),
		('ICON_GOVERNOR_MICO_LARRY_FILL',			'ICON_MICO_GOVERNORS_FILL',					0					),
		('ICON_GOVERNOR_MICO_WENDY_FILL',			'ICON_MICO_GOVERNORS_FILL',					1					),
		('ICON_GOVERNOR_MICO_IGGY_FILL',			'ICON_MICO_GOVERNORS_FILL',					2					),
		('ICON_GOVERNOR_MICO_ROY_FILL',				'ICON_MICO_GOVERNORS_FILL',					3					),
		('ICON_GOVERNOR_MICO_LEMMY_FILL',			'ICON_MICO_GOVERNORS_FILL',					4					),
		('ICON_GOVERNOR_MICO_LUDWIG_FILL',			'ICON_MICO_GOVERNORS_FILL',					5					),
		('ICON_GOVERNOR_MICO_MORTON_FILL',			'ICON_MICO_GOVERNORS_FILL',					6					),
		('ICON_GOVERNOR_MICO_LARRY_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					0					),
		('ICON_GOVERNOR_MICO_WENDY_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					1					),
		('ICON_GOVERNOR_MICO_IGGY_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					2					),
		('ICON_GOVERNOR_MICO_ROY_SLOT',				'ICON_MICO_GOVERNORS_SLOT',					3					),
		('ICON_GOVERNOR_MICO_LEMMY_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					4					),
		('ICON_GOVERNOR_MICO_LUDWIG_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					5					),
		('ICON_GOVERNOR_MICO_MORTON_SLOT',			'ICON_MICO_GOVERNORS_SLOT',					6					);


INSERT INTO IconAliases 
		(Name,										OtherName) 
VALUES	('GOVERNOR_MICO_LARRY_FILL',				'ICON_GOVERNOR_MICO_LARRY_FILL'),
		('GOVERNOR_MICO_WENDY_FILL',				'ICON_GOVERNOR_MICO_WENDY_FILL'),
		('GOVERNOR_MICO_IGGY_FILL',					'ICON_GOVERNOR_MICO_IGGY_FILL'),
		('GOVERNOR_MICO_ROY_FILL',					'ICON_GOVERNOR_MICO_ROY_FILL'),
		('GOVERNOR_MICO_LEMMY_FILL',				'ICON_GOVERNOR_MICO_LEMMY_FILL'),
		('GOVERNOR_MICO_LUDWIG_FILL',				'ICON_GOVERNOR_MICO_LUDWIG_FILL'),
		('GOVERNOR_MICO_MORTON_FILL',				'ICON_GOVERNOR_MICO_MORTON_FILL'),

		('GOVERNOR_MICO_LARRY_SLOT',				'ICON_GOVERNOR_MICO_LARRY_SLOT'),
		('GOVERNOR_MICO_WENDY_SLOT',				'ICON_GOVERNOR_MICO_WENDY_SLOT'),
		('GOVERNOR_MICO_IGGY_SLOT',					'ICON_GOVERNOR_MICO_IGGY_SLOT'),
		('GOVERNOR_MICO_ROY_SLOT',					'ICON_GOVERNOR_MICO_ROY_SLOT'),
		('GOVERNOR_MICO_LEMMY_SLOT',				'ICON_GOVERNOR_MICO_LEMMY_SLOT'),
		('GOVERNOR_MICO_LUDWIG_SLOT',				'ICON_GOVERNOR_MICO_LUDWIG_SLOT'),
		('GOVERNOR_MICO_MORTON_SLOT',				'ICON_GOVERNOR_MICO_MORTON_SLOT');
		
		
