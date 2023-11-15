-- Mico_Exposed_Functions
-- Author: Mico27
-- DateCreated: 17/03/2023 01:09:54
--------------------------------------------------------------
--============================================================
-- INCLUDES
--============================================================
include("InstanceManager.lua");
include("EspionageSupport.lua");
include("GovernorSupport");
--============================================================
-- Functions =================================================
--============================================================

ExposedMembers.GetMission = function (playerId, missionId)
  return Players[playerId]:GetDiplomacy():GetMission(playerId, missionId);
end

ExposedMembers.PlayEffectAtXY = function (Effect, X, Y) 
	WorldView.PlayEffectAtXY(Effect, X, Y);
end

ExposedMembers.GetBuildingsAtLocation = function (playerID, cityID, plotID) 
	local pPlayer = Players[playerID];	
	local pCity = pPlayer:GetCities():FindID(cityID);
	local pCityBuildings = pCity:GetBuildings();
	return pCityBuildings:GetBuildingsAtLocation(plotID);
end

---------------------------------------------------------------
-- Custom rockbands
---------------------------------------------------------------

function OnToadRockBandMoviePopupClosed() 
	UI.PlaySound('Stop_Rockband_Music_MICO_MUSHROOM');
	UI.PlaySound('Stop_Rockband_Music_MICO_BOWSER');
end

LuaEvents.RockBandMoviePopup_Closed.Add( OnToadRockBandMoviePopupClosed );


function OnPeachCastleMoviePopupClosed() 
	UI.PlaySound('Stop_Music_MICO_PEACH_CASTLE');
end

LuaEvents.WonderBuiltPopup_Closed.Add( OnPeachCastleMoviePopupClosed );
