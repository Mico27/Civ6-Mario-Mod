
INSERT INTO Players (Domain, CivilizationType, CivilizationName, CivilizationIcon, CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon, LeaderType, LeaderName, LeaderIcon, LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon)
VALUES	(	
		-- Civilization
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_KOOPA', -- CivilizationType
		'LOC_CIVILIZATION_MICO_KOOPA_NAME', -- CivilizationName
		'ICON_CIVILIZATION_MICO_KOOPA', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FIRE_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FIRE_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_MICO_KOOPA', -- CivilizationAbilityIcon
		
		-- Leader
		'LEADER_MICO_BOWSER', -- LeaderType
		'LOC_LEADER_MICO_BOWSER_NAME', -- LeaderName
		'ICON_LEADER_MICO_BOWSER', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_MICO_BOWSER' -- LeaderAbilityIcon
		),	
		(	
		-- Civilization
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_MUSHROOM', -- CivilizationType
		'LOC_CIVILIZATION_MICO_MUSHROOM_NAME', -- CivilizationName
		'ICON_CIVILIZATION_MICO_MUSHROOM', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_SUPERSTARS_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_SUPERSTARS_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_MICO_MUSHROOM', -- CivilizationAbilityIcon
		
		-- Leader
		'LEADER_MICO_PEACH', -- LeaderType
		'LOC_LEADER_MICO_PEACH_NAME', -- LeaderName
		'ICON_LEADER_MICO_PEACH', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_MICO_PEACH' -- LeaderAbilityIcon
		),
		(	
		-- Civilization
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_SARASALAND', -- CivilizationType
		'LOC_CIVILIZATION_MICO_SARASALAND_NAME', -- CivilizationName
		'ICON_CIVILIZATION_MICO_SARASALAND', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FOUR_KINGDOMS_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_MICO_LAND_OF_FOUR_KINGDOMS_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_MICO_SARASALAND', -- CivilizationAbilityIcon
		
		-- Leader
		'LEADER_MICO_DAISY', -- LeaderType
		'LOC_LEADER_MICO_DAISY_NAME', -- LeaderName
		'ICON_LEADER_MICO_DAISY', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_MICO_FUN_LOVING_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_MICO_FUN_LOVING_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_MICO_DAISY' -- LeaderAbilityIcon
		);


INSERT INTO PlayerItems
		(Domain, CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex	)
VALUES	-- CIV: KOOPA, LEADER: BOWSER
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_KOOPA', -- CivilizationType
		'LEADER_MICO_BOWSER', -- LeaderType
		'UNIT_MICO_FLYING_FORTRESS', -- Type
		'ICON_UNIT_MICO_FLYING_FORTRESS', -- Icon
		'LOC_UNIT_MICO_FLYING_FORTRESS_NAME', -- Name
		'LOC_UNIT_MICO_FLYING_FORTRESS_DESCRIPTION', -- Description
		10	-- SortIndex
		),		
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_KOOPA', -- CivilizationType
		'LEADER_MICO_BOWSER', -- LeaderType
		'IMPROVEMENT_MICO_LAVA_FORTRESS', -- Type
		'ICON_IMPROVEMENT_MICO_LAVA_FORTRESS', -- Icon
		'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_NAME', -- Name
		'LOC_IMPROVEMENT_MICO_LAVA_FORTRESS_DESCRIPTION', -- Description
		20 -- SortIndex
		),		
		-- CIV: MUSHROOM, LEADER: PEACH
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_MUSHROOM', -- CivilizationType
		'LEADER_MICO_PEACH', -- LeaderType
		'BUILDING_MICO_PEACH_CASTLE', -- Type
		'ICON_BUILDING_MICO_PEACH_CASTLE', -- Icon
		'LOC_BUILDING_MICO_PEACH_CASTLE_NAME', -- Name
		'LOC_BUILDING_MICO_PEACH_CASTLE_DESCRIPTION', -- Description
		10	-- SortIndex
		),
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_MUSHROOM', -- CivilizationType
		'LEADER_MICO_PEACH', -- LeaderType
		'IMPROVEMENT_MICO_TOAD_HOUSE', -- Type
		'ICON_IMPROVEMENT_MICO_TOAD_HOUSE', -- Icon
		'LOC_IMPROVEMENT_MICO_TOAD_HOUSE_NAME', -- Name
		'LOC_IMPROVEMENT_MICO_TOAD_HOUSE_DESCRIPTION', -- Description
		20 -- SortIndex
		),		
		-- CIV: SARASALAND, LEADER: DAISY
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_SARASALAND', -- CivilizationType
		'LEADER_MICO_DAISY', -- LeaderType
		'UNIT_MICO_ROYAL_GARDENER', -- Type
		'ICON_UNIT_MICO_ROYAL_GARDENER', -- Icon
		'LOC_UNIT_MICO_ROYAL_GARDENER_NAME', -- Name
		'LOC_UNIT_MICO_ROYAL_GARDENER_DESCRIPTION', -- Description
		10	-- SortIndex
		),
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_SARASALAND', -- CivilizationType
		'LEADER_MICO_DAISY', -- LeaderType
		'IMPROVEMENT_MICO_FLOWER_SANCTUARY', -- Type
		'ICON_IMPROVEMENT_MICO_FLOWER_SANCTUARY', -- Icon
		'LOC_IMPROVEMENT_MICO_FLOWER_SANCTUARY_NAME', -- Name
		'LOC_IMPROVEMENT_MICO_FLOWER_SANCTUARY_DESCRIPTION', -- Description
		20 -- SortIndex
		),
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_MICO_SARASALAND', -- CivilizationType
		'LEADER_MICO_DAISY', -- LeaderType
		'BUILDING_MICO_GIANT_BEANSTALK', -- Type
		'ICON_BUILDING_MICO_GIANT_BEANSTALK', -- Icon
		'LOC_BUILDING_MICO_GIANT_BEANSTALK_NAME', -- Name
		'LOC_BUILDING_MICO_GIANT_BEANSTALK_DESCRIPTION', -- Description
		30 -- SortIndex
		);