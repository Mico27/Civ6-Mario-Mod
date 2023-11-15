/*
	Localisation
	Authors: MC
*/

-----------------------------------------------
-- General notes on 'localization' (or 'in-game text')

-- The entries in this file, as well as those in Civilization_Localisation.sql, are where we define the text that will actually display, in-game. Fundamentally, certain unique code strings have associated 'localisation' strings. In this file, we specify the exact string of characters that will display in place of the unique code string.

-- In all cases, localisation strings always start with LOC_ - such that we can easily tell them apart from game code.
-----------------------------------------------

INSERT OR IGNORE INTO LocalizedText
			(Language, Tag, Text)
VALUES

-----------------------------------------------
-- Leader Name
-----------------------------------------------	
	
	('en_US',	'LOC_LEADER_MICO_BOWSER_NAME',			'Bowser'			),
	('en_US',	'LOC_LEADER_MICO_PEACH_NAME',			'Peach'				),
	('en_US',	'LOC_LEADER_MICO_DAISY_NAME',			'Daisy'				),
	
-----------------------------------------------
-- Leader Unique Ability
-----------------------------------------------	

	('en_US',	'LOC_TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER_NAME',			'Political kidnapper and Nepotist'						),
	('en_US',	'LOC_TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER_DESCRIPTION',	'Start the game with a free [ICON_Governor] Governor Title. Grant 1 [ICON_Governor] Governor Title after completing a Neutralize Governor spy mission. The Governors are replaced by the Koopalings. Cities with an established Governor cannot have their improvements, buildings, and districts damaged by Volcanoes and other Environmental Effects.'	),
	
	('en_US',	'LOC_TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS_NAME',			'Strange paintings'						),
	('en_US',	'LOC_TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS_DESCRIPTION',		'For each recruited Great artists who can create [ICON_GreatWork_Landscape] Landscape paintings, a copycat artist who can create those same paintings is also recruited. Each duplicate paintings act as a portal from one to another.'	),
	('en_US',	'LOC_BUTTON_MICO_PAINTING_WARP',							'Jump into painting'	),
	('en_US',	'LOC_BUTTON_MICO_DISABLED_NO_MOVES',						'[COLOR:Civ6Red]Requires at least one movement.[ENDCOLOR]'	),


	('en_US',	'LOC_TRAIT_LEADER_MICO_FUN_LOVING_NAME',			'Fun loving'						),
	('en_US',	'LOC_TRAIT_LEADER_MICO_FUN_LOVING_DESCRIPTION',		'+1 [ICON_Amenities] Amenity for each Entertainment Complex, Theater Square, Preserve and Water Park District in a city during a [ICON_Glory_Golden_Age] Golden Age. Happy cities provide +1 Appeal and Ecstatic cities provide +2 Appeal to each of their tiles.'	),


-----------------------------------------------
-- Leader Unique Building
-----------------------------------------------	

	('en_US',	'LOC_BUILDING_MICO_PEACH_CASTLE_NAME',			'Peach''s castle'),
	('en_US',	'LOC_BUILDING_MICO_PEACH_CASTLE_DESCRIPTION',	'A wonder unique to Princess Peach. Contains 6 slots for [ICON_GreatWork_Landscape] Great works of art. Patronage of Great People costs 25% less [ICON_GOLD] Gold. All [ICON_Tourism] Tourism yields from [ICON_GreatWork_Landscape] Landscape paintings are doubled. Must be built on hills next to a river.'),
	('en_US',	'LOC_BUILDING_MICO_PEACH_CASTLE_QUOTE',			'Dear Mario: Please come to the castle. I''ve baked a cake for you. Yours truly-- Princess Toadstool, Peach.'),

-----------------------------------------------
-- Leader Unique Improvements
-----------------------------------------------

	('en_US', 'LOC_IMPROVEMENT_MICO_FIRE_STARTER_NAME',			'Arson'),
	('en_US', 'LOC_IMPROVEMENT_MICO_FIRE_STARTER_DESCRIPTION',	'Creates a forest or jungle fire.'),
-----------------------------------------------
-- Leader Agenda
-----------------------------------------------	

	('en_US',	'LOC_AGENDA_MICO_BOWSER_NAME',	'Iron fist ruler'	),
	('en_US',	'LOC_AGENDA_MICO_BOWSER_DESCRIPTION',	'Wants to rule with an iron fist. Respects those that commit efforts to industrialisation and standing armies, but dislikes those that are too happy.'	),
	
	('en_US',	'LOC_DIPLO_KUDO_LEADER_MICO_BOWSER_REASON_ANY',	'(You have a high production output and have a strong army.)'	),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_BOWSER_HAPPY',	'Respects a strong industry and a strong army.'	),
	
	('en_US',	'LOC_DIPLO_WARNING_LEADER_MICO_BOWSER_REASON_ANY',	'(You have a high level of amenities.)'	),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_BOWSER_UNHAPPY',	'Hates happy cities.'	),

	('en_US',	'LOC_AGENDA_MICO_PEACH_NAME',	'Peaceful and cultured neighbors'	),
	('en_US',	'LOC_AGENDA_MICO_PEACH_DESCRIPTION',	'Prefer peaceful and cultured neighbors. Like neighbors that commit efforts to peace, but dislikes those with low culture.'	),
	
	('en_US',	'LOC_DIPLO_KUDO_LEADER_MICO_PEACH_REASON_ANY',	'(You have upholded peace while being neighbors.)'	),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_PEACH_HAPPY',	'Likes cultured neighbors upholding the peace.'	),
	
	('en_US',	'LOC_DIPLO_WARNING_LEADER_MICO_PEACH_REASON_ANY',	'(You have a low level of culture.)'	),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_PEACH_UNHAPPY',	'Doesnt like uncultured civilizations'	),

	('en_US',	'LOC_AGENDA_MICO_DAISY_NAME',	'The more the merrier'	),
	('en_US',	'LOC_AGENDA_MICO_DAISY_DESCRIPTION',	'Likes civilisations with high happiness and high populations, but dislikes those that are not happy.'	),
	
	('en_US',	'LOC_DIPLO_KUDO_LEADER_MICO_DAISY_REASON_ANY',	'(You have a high level of amenities and have a high populations.)'	),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_DAISY_HAPPY',	'Loves happy cities with lots of populations.'	),
	
	('en_US',	'LOC_DIPLO_WARNING_LEADER_MICO_DAISY_REASON_ANY',	'(You have a low level of amenities.)'			),
	('en_US',	'LOC_DIPLO_MODIFIER_MICO_DAISY_UNHAPPY',	'Does not like unhappy cities.'	),

		
-----------------------------------------------
-- Dawn of Man (Loading Screen) Text
-----------------------------------------------	

	('en_US',	'LOC_LOADING_INFO_LEADER_MICO_BOWSER',
	'Draped in a mantle of fire and dark ambition, King Bowser''s rise to power has been marked by a relentless pursuit of dominance. His insatiable hunger for power drives him to exploit the resources of the world, unleashing the full might of his army to conquer neighboring lands and expand his dominion. As the clash of civilizations unfolds, history holds its breath, for the legacy of King Bowser is etched in fire and blood, and the world shall forever bear the mark of his dominion.'  	),

	('en_US',	'LOC_LOADING_INFO_LEADER_MICO_PEACH',
	'Princess Peach, the beloved monarch of Mushroom Kingdom and a symbol of hope, grace, and resilience, assumes her place as a leader in the epic tapestry of human civilization. Raised into a world teeming with anthropomorphic mushrooms, Princess Peach''s reign has been marked by trials and triumphs. Let the Mushroom Kingdom''s voice be heard, for a new era has dawned, and the world shall bear witness to the extraordinary legacy of Princess Peach!'),

	('en_US',	'LOC_LOADING_INFO_LEADER_MICO_DAISY',
	'Princess Daisy, a regal and tenacious ruler, steps onto the stage of human civilization, her undeniable charisma and unwavering determination poised to leave an indelible mark on history. Brimming with energy and a deep love for the natural world, Princess Daisy champions environmental stewardship and the preservation of Sarasaland''s lush landscapes. The world beyond now rests in the hands of Princess Daisy, a ruler whose unwavering spirit and unwavering ideals promise a future imbued with hope, prosperity, and endless possibilities.'),
-----------------------------------------------
-- Diplomacy Text: First Meet
-----------------------------------------------	

	-- First AI Line (ANY)
	('en_US',	'LOC_DIPLO_FIRST_MEET_LEADER_MICO_BOWSER_ANY',
	'I am king Bowser, Ruler of the koopas. Know that we are looking to take as much lands we please and will not hesitate to walk over the weak to do so.' ),

	('en_US',	'LOC_DIPLO_FIRST_MEET_LEADER_MICO_PEACH_ANY',
	'Greetings, esteemed leader! I am Princess Peach of the Mushroom Kingdom. I hope our relations will be one of diplomacy and prosperity.' ),

	('en_US',	'LOC_DIPLO_FIRST_MEET_LEADER_MICO_DAISY_ANY',
	'Hi I''m Daisy! I am the princess of Sarasaland, nice meeting ya!' ),
	
	-- AI invitation to visit nearby City (ANY)
	('en_US',	'LOC_DIPLO_FIRST_MEET_VISIT_RECIPIENT_LEADER_MICO_BOWSER_ANY',
	'We have a city nearby. Would you like to visit and see for yourself the greatness of our kingdom?'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_VISIT_RECIPIENT_LEADER_MICO_PEACH_ANY',
	'We have a city nearby. Would you like to visit us for some cake?'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_VISIT_RECIPIENT_LEADER_MICO_DAISY_ANY',
	'We have a city nearby. Would you like to visit and see the many smiles of our kingdom?'	),
	
	-- AI accepts human invitation (ANY)
	('en_US',	'LOC_DIPLO_FIRST_MEET_NEAR_INITIATOR_POSITIVE_LEADER_MICO_BOWSER_ANY',
	'Bwahaha! Excellent!'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_NEAR_INITIATOR_POSITIVE_LEADER_MICO_PEACH_ANY',
	'Thank you very kindly!'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_NEAR_INITIATOR_POSITIVE_LEADER_MICO_DAISY_ANY',
	'Thanks!'	),
	
	-- AI invitation to exchange Capital Information (ANY)
	('en_US',	'LOC_DIPLO_FIRST_MEET_NO_MANS_INFO_EXCHANGE_LEADER_MICO_BOWSER_ANY',
	'Would you like to share information about our respective capital locations? Why? Oh, no big reason. Simply curious.'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_NO_MANS_INFO_EXCHANGE_LEADER_MICO_PEACH_ANY',
	'I would be very grateful if we could exchange information about our respective kingdoms.'	),

	('en_US',	'LOC_DIPLO_FIRST_MEET_NO_MANS_INFO_EXCHANGE_LEADER_MICO_DAISY_ANY',
	'You want to know where I live? Teehee! Only if you tell me first. *wink*'	),

-----------------------------------------------
-- Diplomacy Text: Greetings
-----------------------------------------------	

	-- (HAPPY)
	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_BOWSER_HAPPY',
	'Come in, come in! Kamek! Bring us our guest something to feast on. It is great to see you again! What bring you here today?'	),

	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_PEACH_HAPPY',
	'Welcome! Glad to see you again! What can we do for you?'	),

	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_DAISY_HAPPY',
	'Hey it''s you again! Whats up?'),

	-- (UNHAPPY)
	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_BOWSER_UNHAPPY',
	'You again! You better have a good reason to be here!'	),

	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_PEACH_UNHAPPY',
	'Please make it quick, I have more important things to attend to!'	),

	('en_US',	'LOC_DIPLO_GREETING_LEADER_MICO_DAISY_UNHAPPY',
	'*pouts* Ho its you. What do YOU want now?'	),
	
-----------------------------------------------
-- Diplomacy Text: Delegation
-----------------------------------------------	

	-- AI Accepts (ANY)
	('en_US',	'LOC_DIPLO_ACCEPT_DELEGATION_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'The sacrifi- err I mean delegation has reached our kingdom. We apreciate the tribute.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DELEGATION_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'Your delegation has made it safely to our kingdom. The mushroom kindoms thanks you for your tribute.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DELEGATION_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Yo! Thanks for the delegation!'	),
	
	-- AI Rejects (ANY)
	('en_US',	'LOC_DIPLO_REJECT_DELEGATION_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'We are not interested.'	),

	('en_US',	'LOC_DIPLO_REJECT_DELEGATION_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'Sorry, we are not interested.'	),

	('en_US',	'LOC_DIPLO_REJECT_DELEGATION_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Nope, not interested.'	),
	
	-- AI Requests (ANY)
	('en_US',	'LOC_DIPLO_DELEGATION_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'We have prepared a delegation to visit your lands carrying some fine rare stones from our lava lands. Consider these a gift.'	),

	('en_US',	'LOC_DIPLO_DELEGATION_FROM_AI_LEADER_MICO_PEACH_ANY',
	'We have prepared a delegation to visit your lands carrying some of our prized mushrooms.'	),

	('en_US',	'LOC_DIPLO_DELEGATION_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Sup! We sent you a bunch of stuff, hope you like it!'	),
	
-----------------------------------------------
-- Diplomacy Text: Open Borders
-----------------------------------------------	

	-- AI accepts from human (ANY)	
	('en_US',	'LOC_DIPLO_ACCEPT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'Very well, it is not like there is any underlying intention going on here am I right?'	),

	('en_US',	'LOC_DIPLO_ACCEPT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'Of course! Let''s hope that this will help our kingdoms grow closer.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Yeah sure why not!'	),
	
	-- AI rejects from human (ANY)	
	('en_US',	'LOC_DIPLO_REJECT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'Nice try but no.'	),

	('en_US',	'LOC_DIPLO_REJECT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'Sorry but we have no interest in openning our borders for the moment.'	),

	('en_US',	'LOC_DIPLO_REJECT_OPEN_BORDERS_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Yeaaah no.'	),
	
	-- AI requests from human (ANY)	
	('en_US',	'LOC_DIPLO_OPEN_BORDERS_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Hey uh... so I wanted to ask if ya could open up the borders so that my troops pass by without any other intention.'	),

	('en_US',	'LOC_DIPLO_OPEN_BORDERS_FROM_AI_LEADER_MICO_PEACH_ANY',
	'Would you be interested in opening your borders?'	),

	('en_US',	'LOC_DIPLO_OPEN_BORDERS_FROM_AI_LEADER_MICO_DAISY_ANY',
	'You should really open up a bit more to others you know. If I wasnt clear, I was talking about your borders.'	),
	
-----------------------------------------------
-- Diplomacy Text: Declare Friendship
-----------------------------------------------	

	-- AI accepts from human (ANY)
	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'The koopas stand ready to protect our own people and those of our trusted allies, such that you have proven yourself to be... for now.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'We are glad to accept this kind declaration of friendship! May our kingdoms prosper togheter!'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Yahoo! More friends! The more the merrier I say!'	),
	
	-- AI rejects from human (ANY)	
	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'No.'	),

	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'We are sorry but we do not trust you enough to warrant friendship between our kingdoms.'	),

	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Sorry, no can do.'	),
	
	-- AI Requests friendship from human (ANY)	
	('en_US',	'LOC_DIPLO_DECLARE_FRIEND_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'I am past silly things such as friendship. However I wouldnt mind an ally to support my quest for world domination.'	),

	('en_US',	'LOC_DIPLO_DECLARE_FRIEND_FROM_AI_LEADER_MICO_PEACH_ANY',
	'We would like to extend a hand in sharing a friendship between our kingdoms.'	),

	('en_US',	'LOC_DIPLO_DECLARE_FRIEND_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Heya! Wanna be friends?'	),
	
	-- Human accepts AI requests, AI responds (ANY)	
	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Let use take over the world together!'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_PEACH_ANY',
	'Thank you kindly!'	),

	('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Yippee!'	),
	
	-- Human rejects AI requests, AI responds (ANY)	
	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'How dare you refuse!'	),

	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Hopefuly we can still find common grounds going forwards.'	),

	('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Aw, maybe some other time!'	),

-----------------------------------------------
-- Diplomacy Text: Alliance
-----------------------------------------------	

	-- AI Requests an alliance from human (ANY)
	('en_US',	'LOC_DIPLO_MAKE_ALLIANCE_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'How about taking the next step in our alliance?'	),

	('en_US',	'LOC_DIPLO_MAKE_ALLIANCE_FROM_AI_LEADER_MICO_PEACH_ANY',
	'Would you like to establish an alliance between our kingdoms?'	),

	('en_US',	'LOC_DIPLO_MAKE_ALLIANCE_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Hey how about we make an alliance?'	),

-----------------------------------------------
-- Diplomacy Text: Kudos & Warnings
-----------------------------------------------	
	
	-- AI Kudos (ANY)
	('en_US',	'LOC_DIPLO_KUDO_EXIT_LEADER_MICO_BOWSER_ANY',
	'A strong industry and a strong army, what a beautiful sight!'	),

	('en_US',	'LOC_DIPLO_KUDO_EXIT_LEADER_MICO_PEACH_ANY',
	'We are glad to have such cultured neighbors upholding the peace between our kingdoms.'	),

	('en_US',	'LOC_DIPLO_KUDO_EXIT_LEADER_MICO_DAISY_ANY',
	'Your kingdom looks like a fun place to live! Look at all those smiles!'	),
	
	-- AI Warnings (ANY)
	('en_US',	'LOC_DIPLO_WARNING_EXIT_LEADER_MICO_BOWSER_ANY',
	'I despise nothing more than seeing worms like you being happy!'	),

	('en_US',	'LOC_DIPLO_WARNING_EXIT_LEADER_MICO_PEACH_ANY',
	'Your nation is falling behind in culture, you should look into that.'	),

	('en_US',	'LOC_DIPLO_WARNING_EXIT_LEADER_MICO_DAISY_ANY',
	'I feel really bad about how you treat your subjects.'	),

-----------------------------------------------
-- Diplomacy Text: Troops Near Border
-----------------------------------------------	
	
	-- AI warns player for border troops (HAPPY)
	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_BOWSER_HAPPY',
	'Hehehe I see what you''re doing.'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_PEACH_HAPPY',
	'Not that we are worried but we''ve noticed some of your troops stationed near our borders.'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_DAISY_HAPPY',
	'Hey I think some of your troops got lost and ended up near our borders.'	),

	-- AI warns player for border troops (UNHAPPY)
	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_BOWSER_UNHAPPY',
	'So, are we doing it or not?'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_PEACH_UNHAPPY',
	'We would like to request for your troops to be removed immediately from our borders.'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_MICO_DAISY_UNHAPPY',
	'Hey I see those troops! Get them out of here!'	),
	
	-- AI accepts player's warning for border troops warning (HAPPY)
	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_BOWSER_HAPPY',
	'Just passing by. No need to worry! *snirk*'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_PEACH_ANY',
	'Sorry for the intrusion, we were simply passing by.'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_DAISY_ANY',
	'Oops my bad!'	),
	
	-- AI accepts player's warning for border troops warning (UNHAPPY)
	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_BOWSER_UNHAPPY',
	'Do I smell FEAR? Hehehe.'	),
	
	-- AI rejects player's warning for border troops warning (ANY) ~ DECLARES WAR
	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_BOWSER_ANY',
	'Did you really expect any less?'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_PEACH_ANY',
	'...'	),

	('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_DAISY_ANY',
	'Surprise!'	),

-----------------------------------------------
-- Diplomacy Text: Settling Too Close
-----------------------------------------------	
	
	-- AI warns player for settling too close (HAPPY)
	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_BOWSER_HAPPY',
	'The land you have claimed is that of the Koopa. Please be mindful of where you locate your settlements in future.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_PEACH_HAPPY',
	'We would appreciate if you could settle a bit further from us in the future. Land is a finite ressource you know.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_DAISY_HAPPY',
	'Hey buddy, mind giving us some space a bit?'	),
	
	-- AI warns player for settling too close (UNHAPPY)
	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_BOWSER_UNHAPPY',
	'Your settlement is within lands that are the right of the Koopa. I cannot promise that we will tolerate this encroachment.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_PEACH_UNHAPPY',
	'This is mushroom kingdom territory, we will not tolerate further encroachment.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_MICO_DAISY_UNHAPPY',
	'Hey bozo! Stop settling so close to my cities!'	),
	
	-- Positive AI response to human request (HAPPY)
	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_BOWSER_HAPPY',
	'I was unaware that you laid claim to such lands. Rest assured, I shall find other, better lands to build upon elsewhere.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_PEACH_HAPPY',
	'Sorry for the inconveniance, we shall look elsewhere to settle in the future.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_DAISY_HAPPY',
	'Oops my bad! I''ll look up elsewhere to settle next time.'	),
	
	-- Positive AI response to human request (UNHAPPY)
	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_BOWSER_UNHAPPY',
	'Oh? This land is yours? Well its mine now I guess Gwahaha! But if you insist, then I shall settle elsewhere next time.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_PEACH_UNHAPPY',
	'Oh so soooorry, I mistook it for barbarian territory. But if you insist, then I shall settle elsewhere next time.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_MICO_DAISY_UNHAPPY',
	'Yoink! Hehe, sorry I''ll settle somewhere else next time.'	),
	
	-- Negative AI response to human request (ANY)
	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_BOWSER_ANY',
	'We will take any land we please.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_PEACH_ANY',
	'There is no need for hostility, we are able to peacefully share these lands.'	),

	('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_MICO_DAISY_ANY',
	'Buzz off! This land was unclaimed, we will claim as much as we need to.'	),
	
	
-----------------------------------------------
-- Diplomacy Text: Trade
-----------------------------------------------	

	-- AI Accepts Deal (HAPPY)
	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_BOWSER_HAPPY',
	'We are in agreement!'	),

	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_PEACH_HAPPY',
	'Yes, thank you for this deal.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_DAISY_HAPPY',
	'Thanks!'	),
	
	-- AI Accepts Deal (Unhappy)
	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_BOWSER_UNHAPPY',
	'*Groan*. Very well.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_PEACH_UNHAPPY',
	'We accept. Though we see that this bargain provides more benefit to your people than ours.'	),

	('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_MICO_DAISY_UNHAPPY',
	'Ok. Sure. Whatever.'	),

	-- AI Rejects Deal (ANY)
	('en_US',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'No. There is no interest for us in that deal.'	),

	('en_US',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_MICO_PEACH_ANY',
	'We must reject. We must find a trade with mutual benefit.'	),

	('en_US',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Sorry! not interested.'	),
	

-----------------------------------------------
-- Diplomacy Text: Denounce
-----------------------------------------------	

	-- Human denounce, AI responds
	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'Thanks for the compliment!'	),

	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'*Gasp* How could you! This behavior will NOT be tolerated!'	),

	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'*humpf* We''ll see about that.'	),
	
	-- From AI
	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Your days are numbered. (Denounces You)'	),

	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_AI_LEADER_MICO_PEACH_ANY',
	'This cannot go on any longer, prepare yourself. (Denounces You)'	),

	('en_US',	'LOC_DIPLO_DENOUNCE_FROM_AI_LEADER_MICO_DAISY_ANY',
	'This cannot continue, you must be dealt with. (Denounces You)'	),
	
-----------------------------------------------
-- Diplomacy Text: Declarations of War
-----------------------------------------------	

	-- Human Declares War, AI responds
	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'How DARE you declare war on me! I''m the one who declares war here!'	),

	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'Sadly it seems this time diplomacy isnt an option.'	),

	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'Bring it on!'	),
	
	-- AI Declares War
	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Bwahaha! I hope you are prepared!'	), 

	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_AI_LEADER_MICO_PEACH_ANY',
	'For the mushroom kingdom!'	), 

	('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Time for a beatdown!'	), 

-----------------------------------------------
-- Diplomacy Text: Make Peace
-----------------------------------------------	
	
	-- AI accepts from human
	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_ACCEPT_DEAL_LEADER_MICO_BOWSER_ANY',
	'Very well, let''s settle on a truce. For now.'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_ACCEPT_DEAL_LEADER_MICO_PEACH_ANY',
	'Good. Let us give our people a return to a peaceful existence.'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_ACCEPT_DEAL_LEADER_MICO_DAISY_ANY',
	'Yes, I agree. I was starting to get tired of it anyway.'	),
	
	-- AI refuses human
	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_REFUSE_DEAL_LEADER_MICO_BOWSER_ANY',
	'Ah! thats a good one!'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_REFUSE_DEAL_LEADER_MICO_PEACH_ANY',
	'We will not concede as long as our nation isnt free of your tirany!'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_REFUSE_DEAL_LEADER_MICO_DAISY_ANY',
	'Not on my watch!'	),
	
	-- AI requests from human
	('en_US',	'LOC_DIPLO_MAKE_PEACE_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'Would you be interested in a truce? No it''s not because I''m losing or anything.'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_FROM_AI_LEADER_MICO_PEACH_ANY',
	'Both sides grow weary of this continued struggle. Let us look for a more peaceful alternative together.'	),

	('en_US',	'LOC_DIPLO_MAKE_PEACE_FROM_AI_LEADER_MICO_DAISY_ANY',
	'Kinda getting tired of this war thing. Truce?'	),

-----------------------------------------------
-- Diplomacy Text: Defeat
-----------------------------------------------	
	
	-- AI is Defeated
	('en_US',	'LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_BOWSER_ANY',
	'... (Leader defeated)'	),

	('en_US',	'LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_PEACH_ANY',
	'... (Leader defeated)'	),

	('en_US',	'LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_DAISY_ANY',
	'... (Leader defeated)'	),

	-- Human is Defeated (will see this in hotseat)
	('en_US',	'LOC_DIPLO_DEFEAT_FROM_HUMAN_LEADER_MICO_BOWSER_ANY',
	'{LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_BOWSER_ANY}'	),

	('en_US',	'LOC_DIPLO_DEFEAT_FROM_HUMAN_LEADER_MICO_PEACH_ANY',
	'{LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_PEACH_ANY}'	),

	('en_US',	'LOC_DIPLO_DEFEAT_FROM_HUMAN_LEADER_MICO_DAISY_ANY',
	'{LOC_DIPLO_DEFEAT_FROM_AI_LEADER_MICO_DAISY_ANY}'	),

--------------------------------------------------------------------
-- Leader Quote and Civilopedia Text
--------------------------------------------------------------------

	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_BOWSER_QUOTE',
	'*ROAR*'  ),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_BOWSER_TITLE',
	'Bowser'),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_BOWSER_SUBTITLE',
	'King of the Koopas'	),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_PEACH_QUOTE',
	'Yeah! Peachy''s got it!!'  ),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_PEACH_TITLE',
	'Peach'),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_PEACH_SUBTITLE',
	'Princess of the Mushroom Kingdom'	),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_DAISY_QUOTE',
	'Hi I''m Daisy!'  ),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_DAISY_TITLE',
	'Daisy'),
	
	('en_US',	'LOC_PEDIA_LEADERS_PAGE_MICO_DAISY_SUBTITLE',
	'Princess of Sarasaland'	),	

	--Bowser custom governors

	('en_US',	'LOC_GOVERNOR_MICO_LARRY_NAME',								'Larry'),
	('en_US',	'LOC_GOVERNOR_MICO_LARRY_TITLE',							'The trickster'),
	('en_US',	'LOC_GOVERNOR_MICO_LARRY_SHORT_TITLE',						'Trickster'),
	('en_US',	'LOC_GOVERNOR_MICO_LARRY_DESCRIPTION',						'An expert in trickery, {LOC_GOVERNOR_MICO_LARRY_NAME} is skilled in varied gimmicks.'),
	('en_US',	'LOC_GOVERNOR_MICO_MORTON_NAME',							'Morton'),
	('en_US',	'LOC_GOVERNOR_MICO_MORTON_TITLE',							'The militarist'),
	('en_US',	'LOC_GOVERNOR_MICO_MORTON_SHORT_TITLE',						'Militarist'),
	('en_US',	'LOC_GOVERNOR_MICO_MORTON_DESCRIPTION',						'Military focused, once established in a city, {LOC_GOVERNOR_MICO_MORTON_NAME} is instrumental in strengthening, preserving, and defending it from foreign threats.'),
	('en_US',	'LOC_GOVERNOR_MICO_WENDY_NAME',								'Wendy'),
	('en_US',	'LOC_GOVERNOR_MICO_WENDY_TITLE',							'The treasurer'),
	('en_US',	'LOC_GOVERNOR_MICO_WENDY_SHORT_TITLE',						'Treasurer'),
	('en_US',	'LOC_GOVERNOR_MICO_WENDY_DESCRIPTION',						'Shrewd and fiscally knowledgeable, {LOC_GOVERNOR_MICO_WENDY_NAME} is able to strengthen the economic power of a city, using finances to provide more than is normally possible.'),
	('en_US',	'LOC_GOVERNOR_MICO_IGGY_NAME',								'Iggy'),
	('en_US',	'LOC_GOVERNOR_MICO_IGGY_TITLE',								'The inventor'),
	('en_US',	'LOC_GOVERNOR_MICO_IGGY_SHORT_TITLE',						'Inventor'),
	('en_US',	'LOC_GOVERNOR_MICO_IGGY_DESCRIPTION',						'An expert in efficiency, {LOC_GOVERNOR_MICO_IGGY_NAME} is skilled in all things related to [ICON_Production] Production.'),
	('en_US',	'LOC_GOVERNOR_MICO_ROY_NAME',								'Roy'),
	('en_US',	'LOC_GOVERNOR_MICO_ROY_TITLE',								'The rockstar'),
	('en_US',	'LOC_GOVERNOR_MICO_ROY_SHORT_TITLE',						'Rockstar'),
	('en_US',	'LOC_GOVERNOR_MICO_ROY_DESCRIPTION',						'{LOC_GOVERNOR_MICO_ROY_NAME} is focused on the cultivation of [ICON_Culture] Cultural endeavors and [ICON_Tourism] Tourism in the city.'),
	('en_US',	'LOC_GOVERNOR_MICO_LEMMY_NAME',								'Lemmy'),
	('en_US',	'LOC_GOVERNOR_MICO_LEMMY_TITLE',							'The jester'),
	('en_US',	'LOC_GOVERNOR_MICO_LEMMY_SHORT_TITLE',						'Jester'),
	('en_US',	'LOC_GOVERNOR_MICO_LEMMY_DESCRIPTION',						'The fun loving {LOC_GOVERNOR_MICO_LEMMY_NAME} specializes in city [ICON_Food] Growth and [ICON_Amenities] Amenities.'),
	('en_US',	'LOC_GOVERNOR_MICO_LUDWIG_NAME',							'Ludwig'),
	('en_US',	'LOC_GOVERNOR_MICO_LUDWIG_TITLE',							'The scientist'),
	('en_US',	'LOC_GOVERNOR_MICO_LUDWIG_SHORT_TITLE',						'Scientist'),
	('en_US',	'LOC_GOVERNOR_MICO_LUDWIG_DESCRIPTION',						'{LOC_GOVERNOR_MICO_LUDWIG_NAME} allows for specialization in [ICON_Science] Science.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY1_NAME',					'Manifest Destiny'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY1_DESCRIPTION',			'This city''s border expension rate is increased by 50%.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY2_NAME',					'Terrain Attrition'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY2_DESCRIPTION',			'All enemy units suffer damage every turn if they are on a desert tile or have reduced movement if they are on a tundra or snow tile in this city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY3_NAME',					'Arsonist'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY3_DESCRIPTION',			'Builders can start forest/jungle fires in this city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY4_NAME',					'Opportunist'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY4_DESCRIPTION',			'+300% [ICON_PRODUCTION] Production in all cities if they have received a declaration of war in the past 3 turns.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY5_NAME',					'The perfect disguise'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY5_DESCRIPTION',			'Spies trained in this city start with the Disguise Promotion.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY6_NAME',					'Air Defense Initiative'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LARRY6_DESCRIPTION',			'+25 [ICON_Strength] Combat Strength to anti-air support units within the city''s territory when defending against aircraft and ICBMs.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON1_NAME',					'Redoubt'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON1_DESCRIPTION',			'Increases city garrison [ICON_Strength] Combat Strength by +5.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON2_NAME',					'Garrison Commander'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON2_DESCRIPTION',			'Units defending within the city''s territory get +5 [ICON_Strength] Combat Strength. Your other cities within 9 tiles gain +4 Loyalty per turn towards your civilization.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON3_NAME',					'Embrasure'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON3_DESCRIPTION',			'City gains an additional [ICON_Ranged] Ranged Strike per turn. Military units trained in this city start with a free promotion that do not already start with a free promotion.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON4_NAME',					'Defense Logistics'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON4_DESCRIPTION',			'City cannot be put under siege. Accumulating Strategic resources in the city gain an additional +1 per turn.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON5_NAME',					'Security Expert'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON5_DESCRIPTION',			'Enemy Spies operate at 2 levels below normal in this city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON6_NAME',					'Arms Race Proponent'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_MORTON6_DESCRIPTION',			'30% [ICON_Production] Production increase to all nuclear armament projects in the city.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY1_NAME',					'Unpaid Overtime'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY1_DESCRIPTION',			'All Builders trained in this city will get +1 build charge.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY2_NAME',					'Inflation'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY2_DESCRIPTION',			'3% increase in [ICON_Gold] Gold generated by the city for each Promotions Wendy has.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY3_NAME',					'Investors'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY3_DESCRIPTION',			'All [ICON_Gold] Gold adjacency bonus also provide [ICON_Production] Production in this city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY4_NAME',					'Tax Collector'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY4_DESCRIPTION',			'+2 [ICON_Gold] Gold per turn for each [ICON_Citizen] Citizen in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY5_NAME',					'Tariffs'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY5_DESCRIPTION',			'+4 [ICON_Gold] Gold per turn from all [ICON_TradeRoute] Trade Routes in and out of the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY6_NAME',					'Contractor'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_WENDY6_DESCRIPTION',			'Allows city to purchase districts with [ICON_Gold] Gold.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY1_NAME',					'Forced Labor'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY1_DESCRIPTION',			'+1 [ICON_PRODUCTION] Production per turn for each [ICON_Citizen] Citizen in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY2_NAME',					'Cheap Material'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY2_DESCRIPTION',			'+40% [ICON_Production] Production to districts and buildings in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY3_NAME',					'Deforestation'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY3_DESCRIPTION',			'+80% yield from removing features.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY4_NAME',					'Mass Excavation'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY4_DESCRIPTION',			'+2 [ICON_Production] Production and -1 [ICON_Food] Food from mines and quarries.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY5_NAME',					'Skip Quality Control'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY5_DESCRIPTION',			'+100% [ICON_Production] Production to combat units in this city but those units have -5 [ICON_Strength] Combat strength.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY6_NAME',					'Hyper Industrialization'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_IGGY6_DESCRIPTION',			'Increases the [ICON_POWER] Power provided by each resource of the Coal Power Plant, Oil Power Plant, and Nuclear Power Plant by 2 and the [ICON_Production] Production by +3.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY1_NAME',					'Tradition'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY1_DESCRIPTION',				'15% increase in [ICON_Culture] Culture and [ICON_Faith] Faith generated by the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY2_NAME',					'Cult of personality'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY2_DESCRIPTION',				'+2 [ICON_FAITH] Faith per turn for each [ICON_Citizen] Citizen in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY3_NAME',					'Popularization'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY3_DESCRIPTION',				'+1 [ICON_CULTURE] Culture per turn for each [ICON_Citizen] Citizen in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY4_NAME',					'False Advertising'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY4_DESCRIPTION',				'+100% [ICON_Tourism] Tourism output to civilizations to which you have a [ICON_TradeRoute] Trade Route.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY5_NAME',					'Showbusiness'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY5_DESCRIPTION',				'All [ICON_Culture] Cultural adjacency bonus also provide [ICON_Gold] Gold in this city. +2 [ICON_Gold] for each building in a Theatre Square District'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY6_NAME',					'Cultural Appropriation'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_ROY6_DESCRIPTION',				'+25% [ICON_Tourism] Tourism per Alliances to this city.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY1_NAME',					'Schadenfreude'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY1_DESCRIPTION',			'+1 [ICON_Amenities] Amenity in the city for each unhappy city within 10 tiles. (Max. 6)'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY2_NAME',					'Provender'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY2_DESCRIPTION',			'Settlers trained in the city do not consume a [ICON_Citizen] Population.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY3_NAME',					'Debauchery'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY3_DESCRIPTION',			'+50% [ICON_Food] Food in the city. Your [ICON_TradeRoute] Trade Routes ending here provide +3 [ICON_Food] Food but -1 [ICON_Production] Production to their starting city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY4_NAME',					'Fishy business'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY4_DESCRIPTION',			'Can construct the Fishery improvement. +1 [ICON_Food] Food, +0.5 [ICON_Housing] Housing, +1 [ICON_Food] Food if adjacent to a sea resource. +1 [ICON_PRODUCTION] Production if Lemmy is in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY5_NAME',					'Circus'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY5_DESCRIPTION',			'+3 [ICON_Amenities] Amenities in the city. +2 extra [ICON_Amenities] if the city has improved [ICON_RESOURCE_HORSES] Horses or [ICON_RESOURCE_IVORY] Ivory.'), 
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY6_NAME',					'Parks and Recreation'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LEMMY6_DESCRIPTION',			'Can construct the City Park improvement in this city. +1 [ICON_Culture] Culture and +2 Appeal. +1 [ICON_Amenities] Amenity if adjacent to water. City Parks provide +3 [ICON_CULTURE] Culture and +3 [ICON_FAITH] Faith if {LOC_GOVERNOR_MICO_LEMMY_NAME} is in the city.'),

	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG1_NAME',					'Practicalism'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG1_DESCRIPTION',			'15% increase in [ICON_Science] Science and [ICON_Production] Production generated by the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG2_NAME',					'Post Mortem'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG2_DESCRIPTION',			'Bonus [ICON_Science] Science equal to the strength of each enemy combat unit killed by your units within 10 tiles of the city. (on Standard Speed)'),	
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG3_NAME',					'Autodidacticism'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG3_DESCRIPTION',			'+1 [ICON_Science] Science per turn for each [ICON_Citizen] Citizen in the city.'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG4_NAME',					'Unethical experiments'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG4_DESCRIPTION',			'Bonus [ICON_Science] Science equal to 50% of the strength of any combat unit killed by any units within 10 tiles of the city. (on Standard Speed)'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG5_NAME',					'Subsidized research'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG5_DESCRIPTION',			'University and Research labs in this city provides +10 [ICON_Science] Science and +5 [ICON_Gold] Gold each'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG6_NAME',					'Space initiative'),
	('en_US',	'LOC_GOVERNOR_PROMOTION_MICO_LUDWIG6_DESCRIPTION',			'30% [ICON_Production] Production increase to all space-program projects in the city.'),
	
	
	('en_US',	'LOC_ABILITY_MICO_NO_QA_STRENGTH_PENALTY_NAME',						'Skipped Quality Control'),
	('en_US',	'LOC_ABILITY_MICO_NO_QA_STRENGTH_PENALTY_DESCRIPTION',				'[COLOR_RED]-5[ENDCOLOR] [ICON_Strength] Combat strength from skipped quality control'),
	('en_US',	'LOC_ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY_NAME',			'Scorching Desert'),
	('en_US',	'LOC_ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY_DESCRIPTION',		'[COLOR_RED]-15[ENDCOLOR] Health if this unit ends the turn on a desert tile in this city'),
	('en_US',	'LOC_ABILITY_MICO_FREEZING_TUNDRA_MOVE_PENALTY_NAME',				'Freezing Thundra'),
	('en_US',	'LOC_ABILITY_MICO_FREEZING_TUNDRA_MOVE_PENALTY_DESCRIPTION',		'[COLOR_RED]-1[ENDCOLOR] [ICON_Movement] Movement on tundra or snow tile in this city');



