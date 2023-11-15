/*
	Leader Screen Configuration
	Authors: MC
*/

-----------------------------------------------
-- LoadingInfo

-- A simple section of code that ties together the elements that appear on the Loading Screen - which is used both during new game creation and loading of existing save games.

-- The LeaderType is the locally-defined LeaderType for your custom civililaztion, whilst the ForegroundImage and BackgroundImage are self-explanatory.

-- The entry for the BackroundImage should match the filename (without the extension), but should also, specifically, be in the format: LEADER_PREFIX_LEADERNAME_BACKGROUND.

-- PlayDawnOfManAudio is a boolean value - with 0 disabling the audio speech and 1 enabling it.
-----------------------------------------------

INSERT INTO LoadingInfo
			(LeaderType,					ForegroundImage,						BackgroundImage,					PlayDawnOfManAudio	)
VALUES		('LEADER_MICO_BOWSER',			'LEADER_MICO_BOWSER_NEUTRAL',			'LEADER_GORGO_BACKGROUND',			0					),
			('LEADER_MICO_PEACH',			'LEADER_MICO_PEACH_NEUTRAL',			'LEADER_VICTORIA_BACKGROUND',		0					),
			('LEADER_MICO_DAISY',			'LEADER_MICO_DAISY_NEUTRAL',			'LEADER_QIN_BACKGROUND',			0					);

