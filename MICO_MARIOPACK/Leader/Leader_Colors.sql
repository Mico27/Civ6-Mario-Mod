/*
	Leader Colours
	Authors: MC
*/

-----------------------------------------------
-- PlayerColors

-- This assigns the civilization's colours to the leader - when selecting the leader, this will control the order in which the colour-combinations appear (with PrimaryColor and SecondaryColor representing the default values).

-- These eight colour references are locally-defined values, taken straight from the code section above. Again, as we only have one leader, we simply match the order.
-----------------------------------------------

INSERT INTO	PlayerColors (Type, Usage, PrimaryColor, SecondaryColor, Alt1PrimaryColor, Alt1SecondaryColor, Alt2PrimaryColor, Alt2SecondaryColor, Alt3PrimaryColor, Alt3SecondaryColor )
VALUES	(
		'LEADER_MICO_BOWSER', -- Type
		'Unique', -- Usage
		'COLOR_STANDARD_RED_DK', -- PrimaryColor
		'COLOR_STANDARD_GREEN_MD', -- SecondaryColor
		'COLOR_STANDARD_WHITE_DK', -- Alt1PrimaryColor
		'COLOR_STANDARD_WHITE_MD2', -- Alt1SecondaryColor
		'COLOR_STANDARD_GREEN_DK', -- Alt2PrimaryColor
		'COLOR_STANDARD_RED_MD', -- Alt2SecondaryColor
		'COLOR_STANDARD_WHITE_DK', -- Alt3PrimaryColor
		'COLOR_STANDARD_RED_MD' -- Alt3SecondaryColor
		),		
		(
		'LEADER_MICO_PEACH', -- Type
		'Unique', -- Usage
		'COLOR_STANDARD_RED_LT', -- PrimaryColor
		'COLOR_STANDARD_YELLOW_LT', -- SecondaryColor
		'COLOR_STANDARD_YELLOW_LT', -- Alt1PrimaryColor
		'COLOR_STANDARD_MAGENTA_MD', -- Alt1SecondaryColor
		'COLOR_STANDARD_WHITE_LT', -- Alt2PrimaryColor
		'COLOR_STANDARD_RED_MD', -- Alt2SecondaryColor
		'COLOR_STANDARD_WHITE_LT', -- Alt3PrimaryColor
		'COLOR_STANDARD_GREEN_DK' -- Alt3SecondaryColor
		),		
		(
		'LEADER_MICO_DAISY', -- Type
		'Unique', -- Usage
		'COLOR_STANDARD_GREEN_DK', -- PrimaryColor
		'COLOR_STANDARD_ORANGE_LT', -- SecondaryColor
		'COLOR_STANDARD_WHITE_LT', -- Alt1PrimaryColor
		'COLOR_STANDARD_ORANGE_MD', -- Alt1SecondaryColor
		'COLOR_STANDARD_ORANGE_MD', -- Alt2PrimaryColor
		'COLOR_STANDARD_GREEN_DK', -- Alt2SecondaryColor
		'COLOR_STANDARD_ORANGE_DK', -- Alt3PrimaryColor
		'COLOR_STANDARD_YELLOW_LT' -- Alt3SecondaryColor
		);