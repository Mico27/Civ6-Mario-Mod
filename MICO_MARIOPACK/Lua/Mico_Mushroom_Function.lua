-- Mico_Mushroom_Functions
-- Author: Mico27
-- DateCreated: 17/03/2023 01:09:54
--------------------------------------------------------------
--============================================================
-- INCLUDES
--============================================================
include "MapEnums"
include("InstanceManager.lua");
include("GameCapabilities");
include("SupportFunctions.lua");
include("EspionageSupport.lua");
include("Mico_Exposed_Functions.lua");

--============================================================
-- Functions =================================================
--============================================================

-------------------------------------------------------------------------
-- Peach Caretaker Of Mytical Paintings
----------------------------------------------------------------------------------------------------------------------------

function OnLandscapePainterCreated(PlayerID, UnitID, GreatPersonClassID, GreatPersonIndividualID)
	if not HasTrait("TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS", PlayerID) then
		return;
	end
	for row in GameInfo.Mico_Duplicate_GreatPersonIndividuals() do 
		local gpIndex = GameInfo.GreatPersonIndividuals[row.GreatPersonIndividualType].Index;
		if (gpIndex == GreatPersonIndividualID) then 
			local pUnit = UnitManager.GetUnit(PlayerID, UnitID);
			Game.GetGreatPeople():CreatePerson(PlayerID, row.GreatPersonDuplicateType, pUnit:GetX(), pUnit:GetY());
			return;
		end        
    end	
end

Events.UnitGreatPersonCreated.Add(OnLandscapePainterCreated);

--------------------------------------------------------------
-- Painting Warp
--------------------------------------------------------------

function OnPaintingWarp(eOwner, iUnitID, parameters)	
	local pUnit = Players[eOwner]:GetUnits():FindID(iUnitID)
	local plotX = parameters[UnitCommandTypes.PARAM_X];
	local plotY = parameters[UnitCommandTypes.PARAM_Y];
	local remainingMovement = pUnit:GetMovesRemaining();
	UnitManager.ChangeMovesRemaining(pUnit, -remainingMovement);
	UnitManager.PlaceUnit(pUnit, plotX, plotY);
	return
end

GameEvents.OnMicoPaitingWarp.Add(OnPaintingWarp);

-------------------------------------------------------------
-- City names
-------------------------------------------------------------

function UpdateMushroomCityNames(PlayerID, CityID, X, Y)
	local pPlayerConfig = PlayerConfigurations[PlayerID];
	local civ = pPlayerConfig:GetCivilizationTypeName();
	if (civ ~= "CIVILIZATION_MICO_MUSHROOM") then 
		return;
	end
	local pPlayer = Players[PlayerID];	
	local pPlot = Map.GetPlot(X, Y);
	local pPlotIndex = pPlot:GetIndex();
	local pCity = pPlayer:GetCities():FindID(CityID);
	local building = GameInfo.Buildings['BUILDING_PALACE'].Index;
	local hasPalace = pCity:GetBuildings():HasBuilding(building);
	if not (hasPalace) then		
		local terrainType = pPlot:GetTerrainType();
		if (terrainType == g_TERRAIN_TYPE_DESERT or terrainType == g_TERRAIN_TYPE_DESERT_HILLS) then 
			local desertCount = pPlayer:GetProperty('PROPERTY_MICO_MUSHROOM_DESERT_CITY_NAME');
			if (desertCount == nil) then
				desertCount = 1;
			end
			if (desertCount <= 2) then 
				pCity:SetName('LOC_CITY_NAME_MICO_MUSHROOM_DESERT_' .. desertCount);
				pPlayer:SetProperty('PROPERTY_MICO_MUSHROOM_DESERT_CITY_NAME', desertCount + 1);
				return;
			end
		end	
		if (terrainType == g_TERRAIN_TYPE_TUNDRA or terrainType == g_TERRAIN_TYPE_TUNDRA_HILLS or terrainType == g_TERRAIN_TYPE_SNOW or terrainType == g_TERRAIN_TYPE_SNOW_HILLS) then 
			local snowCount = pPlayer:GetProperty('PROPERTY_MICO_MUSHROOM_SNOW_CITY_NAME');
			if (snowCount == nil) then
				snowCount = 1;
			end
			if (snowCount <= 1) then 
				pCity:SetName('LOC_CITY_NAME_MICO_MUSHROOM_SNOW_' .. snowCount);
				pPlayer:SetProperty('PROPERTY_MICO_MUSHROOM_SNOW_CITY_NAME', snowCount + 1);
				return;
			end
		end	
		if (pPlot:IsCoastalLand()) then 
			local coastCount = pPlayer:GetProperty('PROPERTY_MICO_MUSHROOM_COAST_CITY_NAME');
			if (coastCount == nil) then
				coastCount = 1;
			end
			if (coastCount <= 6) then 
				pCity:SetName('LOC_CITY_NAME_MICO_MUSHROOM_COAST_' .. coastCount);
				pPlayer:SetProperty('PROPERTY_MICO_MUSHROOM_COAST_CITY_NAME', coastCount + 1);
				return;
			end
		end				
	end	
end

Events.CityAddedToMap.Add(UpdateMushroomCityNames);