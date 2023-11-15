/*
	Civilization Text Entries
	Authors: MC
*/

-----------------------------------------------
-- General notes on 'localization' (or 'in-game text')

-- The entries in this file, as well as those in Leader_Localisation.sql, are where we define the text that will actually display, in-game. Fundamentally, certain unique code strings have associated 'localisation' strings. In this file, we specify the exact string of characters that will display in place of the unique code string.

-- In all cases, localisation strings always start with LOC_ - such that we can easily tell them apart from game code.
-----------------------------------------------

INSERT OR IGNORE  INTO LocalizedText
			(Language, Tag, Text)
VALUES

-----------------------------------------------
-- Civilization

-- Defines the text strings that identify your custom civilization by name.
-----------------------------------------------

	('en_US',	'LOC_CIVILIZATION_MICO_KOOPA_NAME',				'Koopa Kingdom'				),
	('en_US',	'LOC_CIVILIZATION_MICO_KOOPA_DESCRIPTION',		'Koopa Kingdom'		),
	('en_US',	'LOC_CIVILIZATION_MICO_KOOPA_ADJECTIVE',  		'Koopa Kingdom'				),
	('en_US',	'LOC_CIVILIZATION_MICO_MUSHROOM_NAME',			'Mushroom Kingdom'			),
	('en_US',	'LOC_CIVILIZATION_MICO_MUSHROOM_DESCRIPTION',	'Mushroom Kingdom'	),
	('en_US',	'LOC_CIVILIZATION_MICO_MUSHROOM_ADJECTIVE',  	'Mushroom Kingdom'			),
	('en_US',	'LOC_CIVILIZATION_MICO_SARASALAND_NAME',		'Sarasaland'		),
	('en_US',	'LOC_CIVILIZATION_MICO_SARASALAND_DESCRIPTION',	'Sarasaland'		),
	('en_US',	'LOC_CIVILIZATION_MICO_SARASALAND_ADJECTIVE',  	'Sarasaland'		),
	
-----------------------------------------------
-- Civilization Unique Ability

-- Defines the text strings that name and describe your custom civilization's Unique Ability.

-- Please note: The display of in-game icons in text is achieved by using [ICON_Type].
-----------------------------------------------

	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FIRE_NAME',				'Land of fire'				),
	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FIRE_DESCRIPTION',	
	'All specialty districts receive a major adjacency bonus from Volcanoes and Geothermal fissures. Units do not receive damage from Volcanoes and Fires. Civilizations that are at war with the Koopa Kingdom receive +100% unit damage from Volcanoes and Fires in Koopa Kingdom territory.'	),
	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_SUPERSTARS_NAME',				'Land of mushrooms, bricks and coins'				),
	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_SUPERSTARS_DESCRIPTION',	
	'[ICON_RESOURCE_TRUFFLES] Truffles and [ICON_RESOURCE_STONE] Stones yield an additional +2 [ICON_Culture] Culture. Every tile yield an additional +1 [ICON_Gold] Gold.'	),
	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FOUR_KINGDOMS_NAME',				'Land of the four kingdoms'				),
	('en_US',	'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FOUR_KINGDOMS_DESCRIPTION',	
	'Every first city founded on Desert, next to a Mountain, next to the Coast or next to a Natural wonder have their own Palace.'	),

	('en_US',	'LOC_MICO_DISTRICT_VOLCANO_2_GOLD', '+{1_num} [ICON_Gold] Gold from the adjacent Volcano {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_VOLCANO_2_FAITH', '+{1_num} [ICON_Faith] Faith from the adjacent Volcano {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_VOLCANO_2_CULTURE', '+{1_num} [ICON_Culture] Culture from the adjacent Volcano {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_VOLCANO_2_SCIENCE', '+{1_num} [ICON_Science] Science from the adjacent Volcano {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_VOLCANO_2_PRODUCTION', '+{1_num} [ICON_Production] Production from the adjacent Volcano {1_Num : plural 1?tile; other?tiles;}.'),

	('en_US',	'LOC_MICO_DISTRICT_GEOTHERMAL_FISSURE_2_GOLD', '+{1_num} [ICON_Gold] Gold from the adjacent Geothermal Fissure {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_GEOTHERMAL_FISSURE_2_FAITH', '+{1_num} [ICON_Faith] Faith from the adjacent Geothermal Fissure {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_GEOTHERMAL_FISSURE_2_CULTURE', '+{1_num} [ICON_Culture] Culture from the adjacent Geothermal Fissure {1_Num : plural 1?tile; other?tiles;}.'),
	('en_US',	'LOC_MICO_DISTRICT_GEOTHERMAL_FISSURE_2_PRODUCTION', '+{1_num} [ICON_Production] Production from the adjacent Geothermal Fissure {1_Num : plural 1?tile; other?tiles;}.'),

-----------------------------------------------
-- Civilization Unique Infrastructure (Improvement)

-- Defines the text strings that name and describe your custom civilization's Unique Infrastructure (in this case, Improvement) and its capability.

-- Please note: The display of in-game icons in text is achieved by using [ICON_Type].
-----------------------------------------------

	('en_US',	'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_NAME',				'Lava Fortress'								),
	('en_US',	'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_DESCRIPTION',
	'Unlocks the Builder ability to construct a Lava Fortress, unique to the Koopas. [NEWLINE][NEWLINE]Occupying unit receives +4 [ICON_Strength] Defense Strength, and automatically gains 2 turns of fortification. +1 [ICON_Production] Production, +1 [ICON_SCIENCE] Science once built. +1 [ICON_Production] Production, +1 [ICON_SCIENCE] Science for every 2 adjacent Volcanic Soil, upgraded to  +1 [ICON_Production] Production, +1 [ICON_SCIENCE] Science for each adjacent Volcanic Soil once Castle is discovered. Provides +2 [ICON_HOUSING] Housing. Provides [ICON_TOURISM] Tourism from [ICON_SCIENCE] Science after researching Flight. One per city. Act as a Volcano. Cannot be removed.[NEWLINE][NEWLINE]Cities with a Lava Fortress built have access to the Terraforming Projects which provides [ICON_Science] Science every turn, [ICON_GreatEngineer] Great Engineer points and erupts all volcanoes in the city once finished.'	),

	('en_US',	'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_RUINS_NAME',				'Lava Fortress Ruins'								),
	('en_US',	'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_RUINS_DESCRIPTION',
	'Ruins of the Lava Fortress. Cannot be removed and can only be repaired by the Koopas.'	),

	('en_US',	'LOC_BUILDING_MICO_LAVA_FORTRESS_NAME',		'Lava Fortress'),

	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_NAME',	'Terraforming (Gentle)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_SHORT_NAME',	'Terraforming (Gentle)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_DESCRIPTION',	'Project which provides [ICON_Science] Science every turn, [ICON_GreatEngineer] Great Engineer points and creates [COLOR_FLOAT_SCIENCE]Gentle[ENDCOLOR] eruptions to all volcanoes in the city once finished.[NEWLINE][NEWLINE]Requires a Lava Fortress improvement in the city.'),

	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_NAME',	'Terraforming (Catastrophic)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_SHORT_NAME',	'Terraforming (Catastrophic)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_CATA_DESCRIPTION',	'Project which provides [ICON_Science] Science every turn, [ICON_GreatEngineer] Great Engineer points and creates [COLOR_FLOAT_GOLD]Catastrophic[ENDCOLOR] eruptions to all volcanoes in the city once finished.[NEWLINE][NEWLINE]Requires a Lava Fortress improvement in the city.'),

	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_NAME',	'Terraforming (Megacolossal)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_SHORT_NAME',	'Terraforming (Megacolossal)'),
	('en_US',	'LOC_PROJECT_MICO_FORCED_ERUPTION_MEGA_DESCRIPTION',	'Project which provides [ICON_Science] Science every turn, [ICON_GreatEngineer] Great Engineer points and creates [COLOR_FLOAT_MILITARY]Megacolossal[ENDCOLOR] eruptions to all volcanoes in the city once finished.[NEWLINE][NEWLINE]Requires a Lava Fortress improvement in the city.'),

	('en_US',	'LOC_IMPROVEMENT_MICO_FLOWER_SANCTUARY_NAME',				'Flower Sanctuary'								),
	('en_US',	'LOC_IMPROVEMENT_MICO_FLOWER_SANCTUARY_DESCRIPTION',
	'Unlocks the Royal Gardener ability to construct a Flower Sanctuary, unique to Sarasaland. [NEWLINE][NEWLINE] Provides [ICON_Tourism] Tourism equal to the tile''s Appeal. +1 Appeal to adjacent tiles. Provides [ICON_GOLD] Gold equal to half the Appeal of the tile. +1 Era Score if built in a city with a palace.'	),

	('en_US',	'LOC_IMPROVEMENT_MICO_TOAD_HOUSE_NAME',				'Toad House'								),
	('en_US',	'LOC_IMPROVEMENT_MICO_TOAD_HOUSE_DESCRIPTION',
	'Unlocks the Builder ability to construct a Toad House.[NEWLINE][NEWLINE]+1 [ICON_GOLD] Gold. +30 HP healing for units on this tile. +1 [ICON_GOLD] Gold for every adjacent District. +2 [ICON_FOOD] Food for every adjacent Camps. +2 [ICON_PRODUCTION] Production for every adjacent Quarries. Provides +1 [ICON_HOUSING] Housing. Receive an additional [ICON_GOLD] Gold once Banking and Economics is discovered. Cannot be built next to another Toad House.'	),

-----------------------------------------------
-- Civilization Unique Unit

-- Defines the text strings that name and describe your custom civilization's Unique Unit and its capability. Where this replaces an existing unit, it's customary to mention this.

-- The LOC_ABILITY_UNITNAME is a brief description that appears in a separate Civilopedia entry, as well as part of a hover 'tooltip' in-game (I think).

-- Please note: The display of in-game icons in text is achieved by using [ICON_Type].
-----------------------------------------------

	('en_US',	'LOC_UNIT_MICO_FLYING_FORTRESS_NAME',	'Airship'	),
	('en_US',	'LOC_UNIT_MICO_FLYING_FORTRESS_DESCRIPTION',	 
	'The Airship of the Koopa Army. Receive a +5 [ICON_Strength] Combat Strength bonus in a [ICON_Glory_Golden_Age] Golden Age. Is a siege unit but does not suffer Combat Strength Penalty vs Land Units. Can settle cities. No movement penalty. Can fight on water.'	),

	('en_US',	'LOC_ABILITY_MICO_GOLDENAGE_STRENGTH',							'+5 [ICON_Strength] Combat Strength when in a [ICON_Glory_Golden_Age] Golden Age.'	),
	('en_US',	'LOC_ABILITY_MICO_IGNORE_SHORES',								'Ignores additional movement cost from embarking and disembarking.'	),
	('en_US',	'LOC_ABILITY_MICO_IGNORE_CLIFF_WALLS',							'Ignores cliff walls.'	),
	('en_US',	'LOC_ABILITY_MICO_CANCEL_SIEGE_DEBUFF',							'+17 [ICON_Bombard] Bombard Strength vs. units.'	),
	
	('en_US',	'LOC_UNIT_MICO_ROYAL_GARDENER_NAME',	'Royal Gardener'	),
	('en_US',	'LOC_UNIT_MICO_ROYAL_GARDENER_DESCRIPTION',	 
	'The Royal Gardener of Sarasaland. Replace the Naturalist. Cannot build National Parks but can build Flower Sanctuaries, has 4 Build charges and can be [ICON_Production] Built or purchased with [ICON_Gold] Gold.'),

-----------------------------------------------
-- Civilization Unique Building
-----------------------------------------------

	('en_US',	'LOC_BUILDING_MICO_GIANT_BEANSTALK_NAME',				'Giant Beanstalk Garden'),
	('en_US',	'LOC_BUILDING_MICO_GIANT_BEANSTALK_DESCRIPTION',		'A building unique to Sarasaland. Grants +1 [ICON_FOOD] Food, +1 [ICON_FAITH] Faith and +1 [ICON_CULTURE] Culture to adjacent unimproved Charming tiles.  Increased to +2 [ICON_FOOD] Food, +2 [ICON_FAITH] Faith, +2 [ICON_CULTURE] Culture for adjacent unimproved Breathtaking tiles. Bonus yields are expanded to further tiles every new era to a maximum of 3 tiles. Effect does not stack with other Giant Beanstalk Gardens. Every era, trees will grow from its previous bonus yield range.'),

-----------------------------------------------
-- Mountains

-- Defines the text strings to be used for the custom mountain range names that were defined in Civilization_Config.sql.

-- These entries need only be here if custom mountain range names were defined.

-- Please note: Special characters are able to be used as this file has been saved using the "Unicode (UTF-8 without signature)" encoding in ModBuddy's Save As feature.
-----------------------------------------------
/*
	('en_US',	'LOC_NAMED_MOUNTAIN_CORDILLERA_NEOVOLCANICA',		'Cordillera Neovolcanica'	),
	('en_US',	'LOC_NAMED_MOUNTAIN_MEXICAN_PLATEAU',				'Mexican Plateau'			),
	('en_US',	'LOC_NAMED_MOUNTAIN_SIERRA_MADRE_OCCIDENTAL',		'Sierra Madre Occidental'	),
	('en_US',	'LOC_NAMED_MOUNTAIN_SIERRA_MADRE_DEL_SUR',			'Sierra Madre del Sur'		),
	('en_US',	'LOC_NAMED_MOUNTAIN_SIERRA_MADRE_ORIENTAL',			'Sierra Madre Oriental'		),
	('en_US',	'LOC_NAMED_MOUNTAIN_CHIAPAS',						'Chiapas'					),
	('en_US',	'LOC_NAMED_MOUNTAIN_MONTANAS_GUATEMALA',			'Montañas Guatemala'		),
	*/
-----------------------------------------------
-- Rivers

-- Defines the text strings to be used for the custom river names that were defined in Civilization_Config.sql.

-- These entries need only be here if custom river names were defined.

-- Please note: Special characters are able to be used as this file has been saved using the "Unicode (UTF-8 without signature)" encoding in ModBuddy's Save As feature.
-----------------------------------------------
/*
	('en_US',	'LOC_NAMED_RIVER_GRANDE',				'Río Grande'				),
	('en_US',	'LOC_NAMED_RIVER_USUMACINTA',			'Río Usumacinta'			),
	('en_US',	'LOC_NAMED_RIVER_NAZAS',				'Río Nazas'					),
	('en_US',	'LOC_NAMED_RIVER_AGUANAVAL',			'Río Aguanaval'				),
	('en_US',	'LOC_NAMED_RIVER_BALSAS',				'Río Balsas'				),
	('en_US',	'LOC_NAMED_RIVER_CULIACAN',				'Río Culiacan'				),
	('en_US',	'LOC_NAMED_RIVER_LERMA',				'Río Lerma'					),
	('en_US',	'LOC_NAMED_RIVER_GRANDE_DE_SANTIAGO',	'Río Grande de Santiago'	),
	('en_US',	'LOC_NAMED_RIVER_FUERTE',				'Río Fuerte'				),
	('en_US',	'LOC_NAMED_RIVER_CONCHOS',				'Río Conchos'				),
	*/
-----------------------------------------------
-- Lakes

-- Defines the text strings to be used for the custom lake names that were defined in Civilization_Config.sql.

-- These entries need only be here if custom lake names were defined.

-- Please note: Special characters are able to be used as this file has been saved using the "Unicode (UTF-8 without signature)" encoding in ModBuddy's Save As feature.
-----------------------------------------------
/*
	('en_US',	'LOC_NAMED_LAKE_CHAPALA',				'Chapala'			),
	('en_US',	'LOC_NAMED_LAKE_PATZCUARO',				'Pátzcuaro'			),
	('en_US',	'LOC_NAMED_LAKE_BACALAR',				'Bacalar'			),
	('en_US',	'LOC_NAMED_LAKE_LAGUNA_CATEMACO',		'Laguna Catemaco'	),
	('en_US',	'LOC_NAMED_LAKE_EL_CARACOL',			'El Caracol'		),
	*/
-----------------------------------------------
-- Deserts

-- Defines the text strings to be used for the custom desert names that were defined in Civilization_Config.sql.

-- These entries need only be here if custom desert names were defined.

-- Please note: Special characters are able to be used as this file has been saved using the "Unicode (UTF-8 without signature)" encoding in ModBuddy's Save As feature.
-----------------------------------------------
/*
	('en_US',	'LOC_NAMED_DESERT_SONORA',		'Desierto de Soñora'		),
	('en_US',	'LOC_NAMED_DESERT_LA_GUAJIRA',	'Desierto La Guajira'		),
	('en_US',	'LOC_NAMED_DESERT_SECHURA',		'Desierto de Sechura'		),
	*/
-----------------------------------------------
-- Volcanoes

-- Defines the text strings to be used for the custom volcano names that were defined in Civilization_Config.sql. As per the note in that file, these should only be present if you are developing a mod that will leverage/require Gathering Storm (Expansion2) functionality.

-- These entries need only be here if custom volcano names were defined.

-- Please note: Special characters are able to be used as this file has been saved using the "Unicode (UTF-8 without signature)" encoding in ModBuddy's Save As feature.
-----------------------------------------------
/*
	('en_US',	'LOC_NAMED_VOLCANO_PICO_DE_ORIZABA',	'Pico de Orizaba'			),
	('en_US',	'LOC_NAMED_VOLCANO_TAJUMULCO',			'Tajumulco'					),
	('en_US',	'LOC_NAMED_VOLCANO_TACANA',				'Volcan Tacana'				),
	('en_US',	'LOC_NAMED_VOLCANO_SANTIAGUITO',		'Santiaguito'				),
	('en_US',	'LOC_NAMED_VOLCANO_CHAPARRASTIQUE',		'Chaparrastique'			),
	*/
-----------------------------------------------
-- Cities

-- Defines the text strings to be used for city names by the custom civilization, that were defined in Civilization_Config.sql.

-- The order in which city names for a civilization appear is partly affected by the value set for the RandomCityNameDepth within the Civilizations table (again, in Civilization_Config.sql).
-----------------------------------------------

	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_1',  'Bowser City'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_2',  'Dark Land'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_3',  'Valley of Bowser'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_4',  'Lava Town'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_5',  'Bowser World'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_6',  'Bowser Land'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_7',  'Koopa Fields'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_8',  'Piranha Flame Fort'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_9',  'Scorched Hill'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_10',  'Bob-omb Battlefield'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_11',  'Goomba City'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_12',  'Magma Village'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_13',  'Magmaworks City'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_14',  'Paratroopa Peaks'),
	('en_US',	'LOC_CITY_NAME_MICO_KOOPA_15',  'Neo Bowser City'),

	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_1',  'Toad Town'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_2',  'Mushroom Hills'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_3',  'Acorn City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_4',  'Little Fungitown'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_5',  'Star Hill'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_6',  'Dimble Woods'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_7',  'Windy Mill'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_8',  'Bumpsy Plains'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_9',  'Toadwood Village'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_10',  'Hollijolli Village'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_11',  'Shiver City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_12',  'Mush Valley'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_13',  'Brick City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_14',  'Pipeway City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_15',  'FireFlower Fields'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_16',  'Poshley Heights'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_17',  'Donut Plains'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_18',  'Shroom City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_19',  'Mushroom Gorge'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_20',  'All-Star Summit'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_21',  'Cheese Land'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_22',  'Yoshi Park'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_23',  'Mushroom City'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_1',  'Isle Delfino'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_2',  'Rogueport'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_3',  'Yoshi''s Island'),	
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_4',  'Peach Beach'),	
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_5',  'Toad Harbor'),	
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_COAST_6',  'Dire Dire Docks'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_DESERT_1',  'Dry Dry Outpost'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_DESERT_2',  'Shifting Sand Land'),
	('en_US',	'LOC_CITY_NAME_MICO_MUSHROOM_SNOW_1',  'Sherbet Land'),

	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_1',  'Sarasa Palace'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_2',  'Gao'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_3',  'Honen'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_4',  'Torion'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_5',  'Tokotoko'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_6',  'ShyGuy Town'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_7',  'Phanto City'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_8',  'Snifit Valley'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_9',  'Ninji Village'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_10',  'Flower Town'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_11',  'Pidgit City'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_12',  'Birdo Town'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_13',  'New Wart City'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_14',  'North Pokey Hills'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_15',  'South Pokey Hills'),

	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_DESERT',  'Birabuto Kingdom'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_COAST',  'Muda Kingdom'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_WONDER',  'Easton Kingdom'),
	('en_US',	'LOC_CITY_NAME_MICO_SARASALAND_MOUNTAIN',  'Chai Kingdom'),
	
-----------------------------------------------
-- Citizens

-- Defines the text strings to be used for the names of citizens by the custom civilization, that were defined in Civilization_Config.sql.
-----------------------------------------------
	
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_1',		'Goomba #1'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_2',		'Goomba #2'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_3',		'Goomba #3'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_4',		'Goomba #4'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_5',		'Goomba #5'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_6',		'Goomba #6'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_7',		'Goomba #7'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_8',		'Goomba #8'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_MALE_9',		'Goomba #9'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_1',		'Koopa #1'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_2',		'Koopa #2'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_3',		'Koopa #3'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_4',		'Koopa #4'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_5',		'Koopa #5'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_6',		'Koopa #6'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_7',		'Koopa #7'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_8',		'Koopa #8'			),
	('en_US',	'LOC_CITIZEN_MICO_KOOPA_FEMALE_9',		'Koopa #9'			),
	('en_US',	'LOC_CITIZEN_MICO_MUSHROOM_MALE_1',		'Toad'				),
	('en_US',	'LOC_CITIZEN_MICO_MUSHROOM_FEMALE_1',	'Toadette'			),
	('en_US',	'LOC_CITIZEN_MICO_SARASALAND_MALE_1',	'Shyguy'			),
	('en_US',	'LOC_CITIZEN_MICO_SARASALAND_MALE_2',	'Snifit'			),
	('en_US',	'LOC_CITIZEN_MICO_SARASALAND_FEMALE_1',	'Birdo'				);
	
