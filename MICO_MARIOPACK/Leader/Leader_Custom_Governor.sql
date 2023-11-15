-- CUSTOM GOVERNORS

-- Creating enabling trait for every governors
INSERT OR REPLACE INTO	Types
		(Type,												Kind)
SELECT	'TRAIT_LEADER_ENABLE_GOVERNOR_' || GovernorType,	'KIND_TRAIT' 
FROM Governors WHERE Governors.TraitType IS NULL;

INSERT OR REPLACE INTO	Traits
		(TraitType,											Name,	Description,	InternalOnly)
SELECT	'TRAIT_LEADER_ENABLE_GOVERNOR_' || GovernorType,	null,	null,			1 
FROM Governors WHERE Governors.TraitType IS NULL;

-- Update governors to use enabling traits (Only for those without already existing trait)
UPDATE Governors SET TraitType  = 'TRAIT_LEADER_ENABLE_GOVERNOR_' || GovernorType WHERE TraitType IS NULL;

-- Assign the governor enabling traits to all leaders
INSERT OR REPLACE INTO	LeaderTraits
		(LeaderType,							TraitType)
SELECT Leaders.LeaderType, Traits.TraitType
FROM Leaders LEFT JOIN Traits ON TraitType LIKE 'TRAIT_LEADER_ENABLE_GOVERNOR_%' 
WHERE Leaders.InheritFrom IS 'LEADER_DEFAULT';


-- trigger for extra mod and dlc
-- trigger for adding the trait on new leaders
CREATE TRIGGER IF NOT EXISTS AddEnableGovernorTraitOnNewLeader
AFTER INSERT ON Leaders
WHEN NEW.LeaderType NOT NULL
BEGIN
	-- Assign the governor enabling traits to new leader
	INSERT OR REPLACE INTO LeaderTraits  
	(LeaderType,		 TraitType)
	SELECT Leaders.LeaderType, Traits.TraitType
	FROM Leaders LEFT JOIN Traits ON TraitType LIKE 'TRAIT_LEADER_ENABLE_GOVERNOR_%' 
	WHERE Leaders.LeaderType = NEW.LeaderType AND Leaders.InheritFrom IS 'LEADER_DEFAULT';
END;

-- trigger for adding the trait on new governors without already existing traits
CREATE TRIGGER IF NOT EXISTS AddEnableGovernorTraitOnNewGovernor
AFTER INSERT ON Governors
WHEN NEW.GovernorType NOT NULL AND NEW.TraitType IS NULL
BEGIN
	-- Creating enabling trait for new governor
	INSERT OR REPLACE INTO	Types
			(Type,													Kind)
	VALUES	('TRAIT_LEADER_ENABLE_GOVERNOR_' ||  NEW.GovernorType,	'KIND_TRAIT');
	
	INSERT OR REPLACE INTO	Traits
			(TraitType,												Name,	Description,	InternalOnly)
	VALUES	('TRAIT_LEADER_ENABLE_GOVERNOR_' || NEW.GovernorType,	null,	null,			1 );
	
	-- Update new governor to use enabling traits (If it is without already existing trait)
	UPDATE Governors SET TraitType  = 'TRAIT_LEADER_ENABLE_GOVERNOR_' || GovernorType WHERE GovernorType = NEW.GovernorType;
	
	-- Assign the governor enabling traits to all leaders
	INSERT OR REPLACE INTO	LeaderTraits
			(LeaderType,							TraitType)
	SELECT Leaders.LeaderType, 'TRAIT_LEADER_ENABLE_GOVERNOR_' || NEW.GovernorType 
	FROM Leaders WHERE Leaders.InheritFrom IS 'LEADER_DEFAULT';
END;
