
INSERT INTO Types
		(Type,										Kind			)
VALUES	('TRAIT_LEADER_MICO_FLYING_FORTRESS',		'KIND_TRAIT'	),
		('UNIT_MICO_FLYING_FORTRESS',				'KIND_UNIT'		),
		('ABILITY_MICO_GOLDENAGE_STRENGTH',			'KIND_ABILITY'	),
		('ABILITY_MICO_IGNORE_SHORES',				'KIND_ABILITY'	),
		('ABILITY_MICO_IGNORE_CLIFF_WALLS',			'KIND_ABILITY'	),
		('ABILITY_MICO_CANCEL_SIEGE_DEBUFF',		'KIND_ABILITY'	),
		('TRAIT_LEADER_MICO_ROYAL_GARDENER',		'KIND_TRAIT'	),
		('UNIT_MICO_ROYAL_GARDENER',				'KIND_UNIT'		);

-----------------------------------------------
-- Tags

-- Certain game functions are aligned to groups of units (known as classes), rather than the individual unit-types themselves. For this reason, here we define the class (CLASS_MICO_FLYING_FORTRESS) - we will later associate the unit to this class (as the only unit of that class) but also the UnitAbility to that same class. The below table INSERT paves the way for the special ability to be applied to our custom unit.
-----------------------------------------------	
	
INSERT INTO Tags
		(Tag,							Vocabulary		)
VALUES	('CLASS_MICO_FLYING_FORTRESS',	'ABILITY_CLASS'	);

-----------------------------------------------
-- TypeTags

-- As mentioned above, we now link the Unit itself (UNIT_MICO_FLYING_FORTRESS) to our newly-defined class (CLASS_MICO_FLYING_FORTRESS). The second set of values associate the newly-defined Unit Ability (ABILITY_MICO_FLYING_FORTRESS) to all objects within that same class (CLASS_MICO_FLYING_FORTRESS).

-- The second INSERT function ensures our new Unit (UNIT_MICO_FLYING_FORTRESS) inherits the classes that the UNIT_SPEARMAN already has configured. This ensures that groups to which the UNIT_SPEARMAN belongs, the UNIT_MICO_FLYING_FORTRESS also belongs. This ensures integration with other Unit Abilities and identifications and allows for a cohesive replacement.
-----------------------------------------------		

INSERT INTO TypeTags
		(Type,									Tag								)
VALUES	('UNIT_MICO_FLYING_FORTRESS',			'CLASS_SIEGE'					),
		('UNIT_MICO_FLYING_FORTRESS',			'CLASS_SIEGE_SETUP'				),
		('UNIT_MICO_FLYING_FORTRESS',			'CLASS_FORWARD_OBSERVER'		),
		('UNIT_MICO_FLYING_FORTRESS',			'CLASS_SETTLER'					),
		('UNIT_MICO_FLYING_FORTRESS',			'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_MICO_GOLDENAGE_STRENGTH',		'CLASS_MICO_FLYING_FORTRESS'	),		
		('UNIT_MICO_ROYAL_GARDENER',			'CLASS_LANDCIVILIAN'			),
		('UNIT_MICO_ROYAL_GARDENER',			'CLASS_BUILDER'					),
		('ABILITY_UNIT_FIGHT_WHILE_EMBARKED',	'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_IGNORE_TERRAIN_COST',			'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_IGNORE_CROSSING_RIVERS_COST',	'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_MICO_IGNORE_CLIFF_WALLS',		'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_MICO_IGNORE_SHORES',			'CLASS_MICO_FLYING_FORTRESS'	),
		('ABILITY_MICO_CANCEL_SIEGE_DEBUFF',	'CLASS_MICO_FLYING_FORTRESS'	);

-----------------------------------------------
-- Traits

-- With the TraitType defined (above), the below then inserts it into the overall Traits table. This allows it to exist in its own right, alongside other TraitType elements and ties it to the locally-referenced Name and Description text strings that name and describe the trait, respectively.
-----------------------------------------------
		
INSERT INTO Traits
		(TraitType,								Name,								Description								)
VALUES	('TRAIT_LEADER_MICO_FLYING_FORTRESS',	'LOC_UNIT_MICO_FLYING_FORTRESS_NAME',		'LOC_UNIT_MICO_FLYING_FORTRESS_DESCRIPTION'	),
		('TRAIT_LEADER_MICO_ROYAL_GARDENER',	'LOC_UNIT_MICO_ROYAL_GARDENER_NAME',		'LOC_UNIT_MICO_ROYAL_GARDENER_DESCRIPTION'	);


-----------------------------------------------
-- LeaderTraits
-----------------------------------------------
		
INSERT INTO	LeaderTraits
		(LeaderType,					TraitType								)
VALUES	('LEADER_MICO_BOWSER',			'TRAIT_LEADER_MICO_FLYING_FORTRESS'	),
		('LEADER_MICO_DAISY',			'TRAIT_LEADER_MICO_ROYAL_GARDENER'	);


-----------------------------------------------
-- Units

-- The below defines the core behaviour/configuration of our custom Unit. This is where we instruct the game to ensure it is unique (by setting the TraitType value), as well as tie together the various locally-defined elements in this mod (UnitType, Name, Description).

-- You will note that the full set of values is populated via a hybrid of methods - some are taken from the UNIT_SPEARMAN that UNIT_MICO_FLYING_FORTRESS replaces, whilst others are brand-new values that we've defined in this mod.

-- For integer values, it is possible to set a relative value by using simple mathematical operators - you'll note that we do this for the unit Cost and the Combat (Strength). What we're saying here is that the UNIT_MICO_FLYING_FORTRESS has a Cost that is 15 higher than the UNIT_SPEARMAN, but it also has a Combat Strength of 5 more.

-- It is, of course, possible to explicitly define every value - in which case, the SELECT command would be replaced by VALUES; whilst the FROM and WHERE commands can be removed. As a syntax note: remember that if you use VALUES, you will need to use open ( and close ) parentheses to achieve valid code. The SELECT command does not require these, hence they are not present here.

-----------------------------------------------	
	
INSERT INTO Units	( UnitType, Cost, Maintenance, BaseMoves, BaseSightRange, ZoneOfControl, Domain, Combat, Bombard, Range, FormationClass, FoundCity, PopulationCost, PrereqPopulation, AdvisorType,
					TraitType, Name, Description, CanCapture, CanTargetAir, CanEarnExperience, 
					CostProgressionModel, CostProgressionParam1, PurchaseYield, PseudoYieldType, PrereqTech, PromotionClass)
VALUES ('UNIT_MICO_FLYING_FORTRESS', 80, 2, 3, 3, 1, 'DOMAIN_LAND', 35, 45, 2, 'FORMATION_CLASS_LAND_COMBAT',  1, 1, 2, 'ADVISOR_GENERIC',
		'TRAIT_LEADER_MICO_FLYING_FORTRESS', 'LOC_UNIT_MICO_FLYING_FORTRESS_NAME', 'LOC_UNIT_MICO_FLYING_FORTRESS_DESCRIPTION', 1, 1, 1, 
		'COST_PROGRESSION_PREVIOUS_COPIES', 30, 'YIELD_GOLD', 'PSEUDOYIELD_UNIT_SETTLER', 'TECH_SHIPBUILDING', 'PROMOTION_CLASS_SIEGE');

INSERT INTO Units_XP2	( UnitType, CanEarnExperience, CanFormMilitaryFormation, MajorCivOnly)
VALUES ('UNIT_MICO_FLYING_FORTRESS', 1, 1, 1);


INSERT INTO Units	( UnitType, Cost, BaseMoves, BaseSightRange, Domain, FormationClass, AdvisorType,
					TraitType, Name, Description, CanCapture, 
					CostProgressionModel, CostProgressionParam1, PurchaseYield, PseudoYieldType, PrereqCivic, CanRetreatWhenCaptured, BuildCharges)
VALUES ('UNIT_MICO_ROYAL_GARDENER', 300, 4, 3, 'DOMAIN_LAND', 'FORMATION_CLASS_CIVILIAN', 'ADVISOR_CULTURE',
		'TRAIT_LEADER_MICO_ROYAL_GARDENER', 'LOC_UNIT_MICO_ROYAL_GARDENER_NAME', 'LOC_UNIT_MICO_ROYAL_GARDENER_DESCRIPTION', 0,
		'COST_PROGRESSION_PREVIOUS_COPIES', 50, 'YIELD_GOLD', 'PSEUDOYIELD_UNIT_RELIGIOUS', 'CIVIC_CIVIL_ENGINEERING', 1, 4);

-----------------------------------------------
-- UnitUpgrades

-- This section defines the position in the UnitUpgrades chain that the custom UNIT_MICO_FLYING_FORTRESS fits into. For this mod, we are simply replacing the UNIT_SPEARMAN, so this ensures the continuity of the UNIT_SPEARMAN chain for the UNIT_MICO_FLYING_FORTRESS.
-----------------------------------------------
		
/*
INSERT INTO UnitUpgrades (Unit,	UpgradeUnit)
SELECT 	'UNIT_MICO_FLYING_FORTRESS',	UpgradeUnit
FROM 	UnitUpgrades
WHERE	Unit = 'UNIT_SPEARMAN';
*/

-----------------------------------------------
-- UnitAiInfos

-- UnitAiInfos are used to help mould the AI behaviour for Units. They essentially link each UnitType to one or more types of AI behaviour - such as exploration, melee combat or ranged combat.

-- In the below example, we are simply inheriting the UNIT_SPEARMAN behaviour for our UNIT_MICO_FLYING_FORTRESS.

-- A full list of UnitAiType entries can be found in Units.xml. A search for the string 'UnitAiType' will find the full list.
-----------------------------------------------
		
INSERT INTO UnitAiInfos 
	(UnitType,	AiType)
VALUES	('UNIT_MICO_FLYING_FORTRESS',	'UNITAI_SETTLE'),
		('UNIT_MICO_FLYING_FORTRESS',	'UNITAI_COMBAT'),
		('UNIT_MICO_FLYING_FORTRESS',	'UNITTYPE_MELEE'),
		('UNIT_MICO_FLYING_FORTRESS',	'UNITTYPE_RANGED'),
		('UNIT_MICO_FLYING_FORTRESS',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_MICO_FLYING_FORTRESS',	'UNITTYPE_MAJOR_CIV_ONLY'),
		('UNIT_MICO_ROYAL_GARDENER',	'UNITAI_EXPLORE'),
		('UNIT_MICO_ROYAL_GARDENER',	'UNITAI_BUILD'),
		('UNIT_MICO_ROYAL_GARDENER',	'UNITTYPE_CIVILIAN');
		
-----------------------------------------------
-- UnitReplaces

-- This command tells the game about the replacement itself - this ensures that for any civilization to whom the UNIT_MICO_FLYING_FORTRESS is available (which is only this custom civilization, thanks to the link to the TraitType), the UNIT_SPEARMAN will not be available; replaced instead by the UNIT_MICO_FLYING_FORTRESS.
-----------------------------------------------
		
INSERT INTO UnitReplaces
		(CivUniqueUnitType,				ReplacesUnitType	)
VALUES	('UNIT_MICO_ROYAL_GARDENER',	'UNIT_NATURALIST'	);

-----------------------------------------------
-- UnitAbilities

-- Whilst we inserted the UnitAbilityType into the core data table earlier in this document, we need the below to allow it to exist in its own right, alongside other UnitAbilityType elements. This also ties it to the locally-referenced Name and Description text strings that name and describe the Unit Ability, respectively.

-- It is worth noting that applying an ability to the unit is optional - it's an extra layer on top of any 'standard' variables that are common to all units. This particular ability enables this template to showcase the way that a Modifier can be used to change the effectiveness of our custom unit in certain situations. These kind of unit abilities are granted to units by class in the base-game on many occasions - for example, granting Anti-Cavalry units a bonus versus Cavalry units. The logic is identical.
-----------------------------------------------

INSERT INTO UnitAbilities
		(UnitAbilityType,					Name,										Description								)
VALUES	('ABILITY_MICO_GOLDENAGE_STRENGTH',	'LOC_UNIT_MICO_FLYING_FORTRESS_NAME',		'LOC_ABILITY_MICO_GOLDENAGE_STRENGTH'	),
		('ABILITY_MICO_IGNORE_SHORES',		'LOC_UNIT_MICO_FLYING_FORTRESS_NAME',		'LOC_ABILITY_MICO_IGNORE_SHORES'		),
		('ABILITY_MICO_IGNORE_CLIFF_WALLS',	'LOC_UNIT_MICO_FLYING_FORTRESS_NAME',		'LOC_ABILITY_MICO_IGNORE_CLIFF_WALLS'	),
		('ABILITY_MICO_CANCEL_SIEGE_DEBUFF','LOC_UNIT_MICO_FLYING_FORTRESS_NAME',		'LOC_ABILITY_MICO_CANCEL_SIEGE_DEBUFF'	);

-----------------------------------------------
-- Modifiers

-- If you've been following this in order, you may be well-versed in Modifiers by this point.

-- This particular Modifier is a little different - as it references an OwnerRequirementSetId. This instructs the game to implement this Modifier only when the requirements are met - but these requirements pertain to an OwnerRequirementSetId.

-- We are using this kind of requirement due to the nature of the ability. We are giving a particular unit a combat boost during a Golden Age. Golden Ages are granted to a civilization and the civilization is the owner of the unit in question. In this case, context is important. The use of OwnerRequirementSetId ensures it is only when the custom civilization, that has the UNIT_MICO_FLYING_FORTRESS, is in a Golden Age will the effect apply. SubjectRequirementSetId would be used in cases where we want to check a variable is true in the context of the unit - for example, that it is in a certain terrain, or that it has a particular type of opponent in combat.

-- Compatibility note: Golden Ages were introduced in Rise & Fall. This particular unit ability requires that expansion to function. Specifically, the requirement creates the dependency on the expansion.
-----------------------------------------------
	
INSERT INTO Modifiers	
		(ModifierId,								ModifierType,										OwnerRequirementSetId,			SubjectRequirementSetId	)
VALUES	('MODIFIER_MICO_GOLDENAGE_STRENGTH',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',				'PLAYER_HAS_GOLDEN_AGE',		null),
		('MODIFIER_MICO_IGNORE_SHORES',				'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_SHORES',		null,							null),
		('MODIFIER_MICO_IGNORE_CLIFF_WALLS',		'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_CLIFF_WALLS',	null,							null),
		('MODIFIER_MICO_CANCEL_SIEGE_DEBUFF',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',				null,							'VOLLEY_REQUIREMENTS');

-----------------------------------------------
-- ModifierArguments

-- This is fairly straightforward - it defines the values that change when the Modifier is applied. As with other Modifiers, these values are used in conjunction with the ModifierType (referenced above). In this case, we're instructing the Amount to increase 5. A negative value would reduce the Combat Strength. The fact that this is targeting the Combat Strength value at all is derived from the ModifierType.

-- The ModifierType governs the actual 'values' that are accepted within the Name column, which in turn governs the values that are accepted within the value column. I expect the below example data will make those connections clear.

-- More specifically, the EffectType that is used by the ModifierType directly dictates the values allowed.

-- This is what makes the ModifierType so important - this is one of the key parts of the game where the entries you configure are not all explicitly listed. In isolation, the below ModifierArgument could mean (or apply to) a number of things. However, the context of the ModifierType dictates that this Amount is, in fact, a Combat Strength increase.
-----------------------------------------------

INSERT INTO ModifierArguments		
		(ModifierId,									Name,						Value	)
VALUES	('MODIFIER_MICO_GOLDENAGE_STRENGTH',			'Amount',					5		),
		('MODIFIER_MICO_IGNORE_SHORES',					'Ignore',					1		),
		('MODIFIER_MICO_IGNORE_CLIFF_WALLS',			'Ignore',					1		),
		('MODIFIER_MICO_CANCEL_SIEGE_DEBUFF',			'Amount',					17		);

-----------------------------------------------
-- UnitAbilityModifiers

-- In order to link the UnitAbility and the Modifier we have set up, we need to use the UnitAbilityModifiers table.

-- This simply ties the two elements together - it ensures that any unit that has the ABILITY_MICO_GOLDENAGE_STRENGTH UnitAbilityType will receive the bonus granted by the MODIFIER_WEREJAGUAR_GOLDEN_AGE_STRENGTH Modifier.

-- We specified the CLASS_MICO_FLYING_FORTRESS as being the only one linked to the ABILITY_MICO_GOLDENAGE_STRENGTH earlier in this document (using the TypeTags table). This way, we ensure that the only unit to get this ability is, in fact, the Werejaguar.
-----------------------------------------------

INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId											)
VALUES	('ABILITY_MICO_GOLDENAGE_STRENGTH',		'MODIFIER_MICO_GOLDENAGE_STRENGTH'	),
		('ABILITY_MICO_IGNORE_SHORES',			'MODIFIER_MICO_IGNORE_SHORES'		),
		('ABILITY_MICO_IGNORE_CLIFF_WALLS',		'MODIFIER_MICO_IGNORE_CLIFF_WALLS'	),
		('ABILITY_MICO_CANCEL_SIEGE_DEBUFF',	'MODIFIER_MICO_CANCEL_SIEGE_DEBUFF'	);
-----------------------------------------------
-- ModifierStrings

-- The final element of the Unique Unit gameplay configuration simply adds the tooltip-style preview that describes this unit's special ability.

-- In this case, this also appears as part of the combat preview when you are deciding to attack an enemy unit.

-- We tie this to the Modifier, as the ability is triggered based on certain criteria being met. This is essentially what makes it an 'ability' rather than a staple part of that unit. Other ModifierStrings can be cross-referenced from UnitAbilities.xml.
-----------------------------------------------

INSERT INTO ModifierStrings
		(ModifierId,							Context,		Text							)
VALUES	('MODIFIER_MICO_GOLDENAGE_STRENGTH',	'Preview',		'LOC_ABILITY_MICO_GOLDENAGE_STRENGTH'			),
		('MODIFIER_MICO_IGNORE_SHORES',			'Preview',		'LOC_ABILITY_MICO_IGNORE_SHORES'			),
		('MODIFIER_MICO_IGNORE_CLIFF_WALLS',	'Preview',		'LOC_ABILITY_MICO_IGNORE_CLIFF_WALLS'			),
		('MODIFIER_MICO_CANCEL_SIEGE_DEBUFF',	'Preview',		'LOC_ABILITY_MICO_CANCEL_SIEGE_DEBUFF'			);