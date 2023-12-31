INSERT OR IGNORE INTO  IconTextureAtlases	
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,		Filename					)
VALUES	('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					22,			1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_22.dds'),
		('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					32,			1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_32.dds'),
		('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					38,			1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_38.dds'),
		('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					50,			1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_50.dds'),
		('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					80,			1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_80.dds'),
		('ICON_ATLAS_UNIT_MICO_MARIO_BROS',					256,		1,				1,				'ICON_ATLAS_UNIT_MICO_MARIO_BROS_256.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				38,			1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_38.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				50,			1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_50.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				70,			1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_70.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				95,			1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_95.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				200,		1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_200.dds'),
		('PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				256,		1,				1,				'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS_256.dds'),
		('ICON_ATLAS_HEROCLASS_MICO_MARIO_BROS',				105,		1,				1,				'ICON_ATLAS_HEROCLASS_MICO_MARIO_BROS_105.dds'),
		('ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS',		45,			1,				1,				'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_45.dds'),
		('ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS',		64,			1,				1,				'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_64.dds'),
		('ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS',		256,		1,				1,				'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_256.dds'),
		('ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_FOW',	256,		1,				1,				'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_FOW_256.dds');



INSERT OR IGNORE INTO IconDefinitions
		(Name,										Atlas,										'Index'				)
VALUES	('ICON_UNIT_HERO_MICO_MARIO_BROS',					'ICON_ATLAS_UNIT_MICO_MARIO_BROS',						0),
		('ICON_UNIT_HERO_MICO_MARIO_BROS_WHITE',			'ICON_ATLAS_UNIT_MICO_MARIO_BROS',						0),
		('ICON_UNIT_HERO_MICO_MARIO_BROS_BLACK',			'ICON_ATLAS_UNIT_MICO_MARIO_BROS',						0),
		('ICON_UNIT_HERO_MICO_MARIO_BROS_PORTRAIT',			'PORTRAITS_ATLAS_UNITS_MICO_MARIO_BROS',				0),
		('ICON_HEROCLASS_MICO_MARIO_BROS_PORTRAIT',			'ICON_ATLAS_HEROCLASS_MICO_MARIO_BROS',					0),
		('ICON_GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS',		'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS',			0),
		('ICON_GREATWORK_HERO_SYMBOL_MICO_MARIO_BROS_FOW',	'ICON_ATLAS_GREATWORK_SYMBOL_MICO_MARIO_BROS_FOW',		0),
		('ICON_GREATWORK_HERO_EPIC_MICO_MARIO_BROS',			'ICON_ATLAS_HEROES_GREATWORKS',							12),
		('ICON_GREATWORK_HERO_EPIC_MICO_MARIO_BROS_FOW',		'ICON_ATLAS_HEROES_GREATWORKS_FOW',						12),
		('ICON_PROJECT_CREATE_HERO_MICO_MARIO_BROS',			'ICON_ATLAS_BABYLON_PROJECTS',							0);

	