-- Mico_Koopa_Functions
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

local builderIndex = GameInfo.Units["UNIT_BUILDER"].Index;
local lavaFortressIndex = GameInfo.Improvements['IMPROVEMENT_MICO_LAVA_FORTRESS'].Index;
local lavaFortressBuildingIndex = GameInfo.Buildings['BUILDING_MICO_LAVA_FORTRESS'].Index;
local lavaFortressRuinsIndex = GameInfo.Improvements['IMPROVEMENT_MICO_LAVA_FORTRESS_RUINS'].Index;
local fireStarterIndex = GameInfo.Improvements['IMPROVEMENT_MICO_FIRE_STARTER'].Index;
local forcedEruptionProjectId = GameInfo.Projects['PROJECT_MICO_FORCED_ERUPTION'].Index;
local forcedEruptionCataProjectId = GameInfo.Projects['PROJECT_MICO_FORCED_ERUPTION_CATA'].Index;
local forcedEruptionMegaProjectId = GameInfo.Projects['PROJECT_MICO_FORCED_ERUPTION_MEGA'].Index;


--============================================================
-- Functions =================================================
--============================================================

-------------------------------------------------------------------------
-- Lava Fortress Volcano spawner
----------------------------------------------------------------------------------------------------------------------------

function RefeshVolcano(PlayerID, PlotX, PlotY)
	local pVis = PlayersVisibility[PlayerID];
	local pPlot = Map.GetPlot(PlotX, PlotY);
	local iPlotIndex = pPlot:GetIndex();
	if (MapFeatureManager.IsVolcano(pPlot) and pVis:IsRevealed(iPlotIndex) and MapFeatureManager.GetVolcanoName(pPlot) == "") then								
		local visCount = pVis:GetVisibilityCount(iPlotIndex);
		if (visCount > 0) then
			pVis:ChangeVisibilityCount(iPlotIndex, -1 * visCount);	
			local pPlayerUnits = Players[PlayerID]:GetUnits();
			local pBuilder = pPlayerUnits:Create(builderIndex, pPlot:GetX(), pPlot:GetY());
			if (pBuilder ~= nil) then
				pPlayerUnits:Destroy(pBuilder);
			else 
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), direction)
					if (pAdjacentPlot ~= nil) then 
						pBuilder = pPlayerUnits:Create(builderIndex, pAdjacentPlot:GetX(), pAdjacentPlot:GetY());
						if (pBuilder ~= nil) then
							pPlayerUnits:Destroy(pBuilder);
							break;
						end
					end
				end
			end
			pVis:ChangeVisibilityCount(iPlotIndex, visCount);	
		end			
	end			
end

function OnLavaFortressBuilt(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)
	if (ImprovementID == lavaFortressIndex) then			
		local pPlot = Map.GetPlot(PlotX, PlotY);
		local featureType = pPlot:GetFeatureType();
		local hadNoFeature = (featureType == g_FEATURE_NONE or featureType == g_FEATURE_VOLCANO);
		TerrainBuilder.SetFeatureType(pPlot, g_FEATURE_VOLCANO);
		RefeshVolcano(PlayerID, PlotX, PlotY);
		if (hadNoFeature) then 
			--Tag the city that the fortress has been built	
			pPlot:SetProperty('PROPERTY_MICO_LAVA_FORTRESS', 1);
			local pCity = Cities.GetPlotPurchaseCity(pPlot);
			if pCity ~= nil then 
				pCity:GetBuildQueue():CreateIncompleteBuilding(lavaFortressBuildingIndex, pCity:GetPlot():GetIndex(), 100);
			end
		else 
			ImprovementBuilder.SetImprovementType(pPlot, ImprovementID, PlayerID);
		end
	end
end

Events.ImprovementAddedToMap.Add(OnLavaFortressBuilt);

function OnLavaFortressRemoved(PlotX, PlotY, PlayerID)
	local pPlot = Map.GetPlot(PlotX, PlotY);
	if (pPlot:GetProperty('PROPERTY_MICO_LAVA_FORTRESS') == 1) then 
		local pCity = Cities.GetPlotPurchaseCity(pPlot:GetIndex());
		if(pCity ~= nil and HasTrait("TRAIT_CIVILIZATION_IMPROVEMENT_MICO_LAVA_FORTRESS", pCity:GetOwner())) then
			ImprovementBuilder.SetImprovementType(pPlot, lavaFortressIndex, PlayerID);
			ImprovementBuilder.SetImprovementPillaged(pPlot, true);
		else 
			ImprovementBuilder.SetImprovementType(pPlot, lavaFortressRuinsIndex, PlayerID);
		end				
	end
end

Events.ImprovementRemovedFromMap.Add(OnLavaFortressRemoved);

function OnLavaFortressStatusChanged(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, IsPillaged, IsWorked)
	if (ImprovementID == lavaFortressIndex) then 		
		local pPlot = Map.GetPlot(PlotX, PlotY);
		local pCity = Cities.GetPlotPurchaseCity(pPlot:GetIndex());
		if(pCity == nil) then
			return;
		end	
		local pCityBuildings = pCity:GetBuildings();
		if (IsPillaged == 1) then
			if not pCityBuildings:IsPillaged(lavaFortressBuildingIndex) then
				pCityBuildings:SetPillaged(lavaFortressBuildingIndex, true);
			end
		else
			if pCityBuildings:IsPillaged(lavaFortressBuildingIndex) then
				pCityBuildings:SetPillaged(lavaFortressBuildingIndex, false);
			end
		end
	end
end

Events.ImprovementChanged.Add(OnLavaFortressStatusChanged);

-------------------------------------------------------------------------
-- Terraforming project completion effect
----------------------------------------------------------------------------------------------------------------------------

function OnForcedEruptionCompleted(PlayerID, CityID, ProjectID)	
	if (ProjectID == forcedEruptionProjectId or ProjectID == forcedEruptionCataProjectId or ProjectID == forcedEruptionMegaProjectId) then				
		local pPlayer = Players[PlayerID];	
		local pCity = pPlayer:GetCities():FindID(CityID);
		if pCity ~= nil then
			local iCityRadius = 5
			local iCityOwner = pCity:GetOwner()
			local iCityX, iCityY = pCity:GetX(), pCity:GetY()
			for dx = (iCityRadius * -1), iCityRadius do
				for dy = (iCityRadius * -1), iCityRadius do
					local pPlot = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
					if pPlot and (pPlot:GetOwner() == iCityOwner) and (pCity == Cities.GetPlotPurchaseCity(pPlot:GetIndex())) then	
						if (MapFeatureManager.IsVolcano(pPlot)) then
							local volcanoType = MapFeatureManager.GetVolcanoType(pPlot);
							local kEvent = {};
							if (ProjectID == forcedEruptionProjectId) then 
								kEvent.EventType = GameInfo.RandomEvents['RANDOM_EVENT_VOLCANO_GENTLE'].Index;
							elseif (ProjectID == forcedEruptionCataProjectId) then 
								kEvent.EventType = GameInfo.RandomEvents['RANDOM_EVENT_VOLCANO_CATASTROPHIC'].Index;
							else
								kEvent.EventType = GameInfo.RandomEvents['RANDOM_EVENT_VOLCANO_MEGACOLOSSAL'].Index;
							end 
							--ChangeVolcanoStatus
							kEvent.NamedVolcano = GameInfo.NamedVolcanoes[volcanoType].Index;	
							kEvent.Location = pPlot:GetIndex();
							GameRandomEvents.ApplyEvent(kEvent);
						end
					end
				end
			end
		end	
	end
end

Events.CityProjectCompleted.Add(OnForcedEruptionCompleted);

-------------------------------------------------------------------------
-- Bowser Political kidnapper ability
----------------------------------------------------------------------------------------------------------------------------

function OnGovernorKidnapped(PlayerID, MissionID)
	if not HasTrait("TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER", PlayerID) then
		return;
	end
	local mission = ExposedMembers.GetMission(PlayerID, MissionID);
	local pPlayer = Players[PlayerID];
	local operation = GameInfo.UnitOperations[mission.Operation];
	if (operation == nil or operation.OperationType ~= "UNITOPERATION_SPY_NEUTRALIZE_GOVERNOR") then
		return;
	end
	if not (mission.InitialResult == EspionageResultTypes.SUCCESS_UNDETECTED or (mission.InitialResult == EspionageResultTypes.SUCCESS_MUST_ESCAPE and mission.EscapeResult == EspionageResultTypes.FAIL_MUST_ESCAPE)) then
		return
	end
	local pPlayerGovernors = pPlayer:GetGovernors();
	pPlayerGovernors:ChangeGovernorPoints(1);
end

Events.SpyMissionCompleted.Add(OnGovernorKidnapped);

-----------------------------------------------
-- Koopa governor unit effects
-----------------------------------------------
local ms_DesertTerrainClass	= GameInfo.TerrainClasses["TERRAIN_CLASS_DESERT"].Index;
local ms_TundraTerrainClass	= GameInfo.TerrainClasses["TERRAIN_CLASS_TUNDRA"].Index;
local ms_SnowTerrainClass	= GameInfo.TerrainClasses["TERRAIN_CLASS_SNOW"].Index;


function UpdateUnitAttritionEffect(PlayerID, UnitID)
	local pPlayer = Players[PlayerID];
	if (pPlayer == nil) then
		return;
	end
	local pUnit = UnitManager.GetUnit(PlayerID, UnitID);
	if (pUnit == nil) then
		return;
	end
	local pUnitAbility = pUnit:GetAbility();
	if (pUnitAbility:CanHaveAbility('ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY') == false) then 
		return;
	end
	local pUnitPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY());
	if(pUnitPlot ~= nil) then 		
		local terrainClass = pUnitPlot:GetTerrainClassType();
		local isOnScorchingDesert = false;
		if(terrainClass == ms_DesertTerrainClass) then
			local pCity = Cities.GetPlotPurchaseCity(pUnitPlot:GetIndex());
			if(pCity ~= nil) then
				local iCityOwner = pCity:GetOwner();
				if (PlayerID ~= iCityOwner and pCity:GetProperty('PROPERTY_MICO_SCORCHING_DESERT_CITY') == 1) then 
					local pOwnerDiplo = pPlayer:GetDiplomacy();
					if (pOwnerDiplo:IsAtWarWith(iCityOwner)) then 
						isOnScorchingDesert = true;
					end									
				end
			end		
		end				
		local iCurrentScorchingDesertCount = pUnitAbility:GetAbilityCount('ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY');
		if (isOnScorchingDesert == false and iCurrentScorchingDesertCount > 0) then  
			pUnitAbility:ChangeAbilityCount('ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY', -iCurrentScorchingDesertCount);
		end
		if (isOnScorchingDesert == true and iCurrentScorchingDesertCount == 0) then 
			pUnitAbility:ChangeAbilityCount('ABILITY_MICO_SCORCHING_DESERT_DAMAGE_PENALTY', 1);
		end
		local isOnFreezingTundra = false;
		if(terrainClass == ms_TundraTerrainClass or terrainClass == ms_SnowTerrainClass) then
			local pCity = Cities.GetPlotPurchaseCity(pUnitPlot:GetIndex());
			if(pCity ~= nil) then
				local iCityOwner = pCity:GetOwner();
				if (PlayerID ~= iCityOwner and pCity:GetProperty('PROPERTY_MICO_FREEZING_TUNDRA_CITY') == 1) then 
					local pOwnerDiplo = pPlayer:GetDiplomacy();
					if (pOwnerDiplo:IsAtWarWith(iCityOwner)) then 
						isOnFreezingTundra = true;

					end								
				end					
			end
		end			
		local iCurrentFreezingTundraCount = pUnitAbility:GetAbilityCount('ABILITY_MICO_FREEZING_TUNDRA_MOVE_PENALTY');
		if (isOnFreezingTundra == false and iCurrentFreezingTundraCount > 0) then  
			pUnitAbility:ChangeAbilityCount('ABILITY_MICO_FREEZING_TUNDRA_MOVE_PENALTY', -iCurrentFreezingTundraCount);
		end
		if (isOnFreezingTundra == true and iCurrentFreezingTundraCount == 0) then 
			pUnitAbility:ChangeAbilityCount('ABILITY_MICO_FREEZING_TUNDRA_MOVE_PENALTY', 1);
		end			
	end		
end

Events.UnitMoveComplete.Add(UpdateUnitAttritionEffect);
Events.UnitTeleported.Add(UpdateUnitAttritionEffect);

function UpdatePlayerUnitsAttritionEffect(PlayerID)
	local pPlayer = Players[PlayerID];
	if (pPlayer == nil) then
		return;
	end
	local playerUnits = pPlayer:GetUnits();
	for i, pUnit in playerUnits:Members() do 	
		UpdateUnitAttritionEffect(PlayerID, pUnit:GetID());
		if (pUnit:GetProperty('PROPERTY_MICO_SCORCHING_DESERT_UNIT') == 1) then 
			local iDamageInflicted = 20;
			local iCurrentDamage = pUnit:GetDamage();
			local iMaxDamage = pUnit:GetMaxDamage();
			if ((iCurrentDamage + iDamageInflicted) >= iMaxDamage) then 
				UnitManager.Kill(pUnit);
			else
				pUnit:ChangeDamage(iDamageInflicted);
			end
		end		
	end
end

Events.PlayerTurnDeactivated.Add(UpdatePlayerUnitsAttritionEffect);

function OnFireStarterBuilt(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)	
	if (ImprovementID == fireStarterIndex) then			
		local pPlot = Map.GetPlot(PlotX, PlotY);
		ImprovementBuilder.SetImprovementType(pPlot, -1, 0);
		local featureType = pPlot:GetFeatureType();
		if (featureType == g_FEATURE_FOREST) then 
			local kEvent = {};
			kEvent.EventType = GameInfo.RandomEvents['RANDOM_EVENT_FOREST_FIRE'].Index;
			kEvent.Location = pPlot:GetIndex();
			GameRandomEvents.ApplyEvent(kEvent);
		end
		if (featureType == g_FEATURE_JUNGLE) then 
			local kEvent = {};
			kEvent.EventType = GameInfo.RandomEvents['RANDOM_EVENT_JUNGLE_FIRE'].Index;
			kEvent.Location = pPlot:GetIndex();
			GameRandomEvents.ApplyEvent(kEvent);
		end
	end
end

Events.ImprovementAddedToMap.Add(OnFireStarterBuilt);

function UpdateUnhappyCities(PlayerID) 
	if not HasTrait("TRAIT_LEADER_MICO_POLITICAL_KIDNAPPER", PlayerID) then
		return;
	end
	local pPlayer = Players[PlayerID];	
	local playerCities = pPlayer:GetCities();
	for j, pCity in playerCities:Members() do 
		local iCityPlot = Map.GetPlot(pCity:GetX(), pCity:GetY());
		local unhappyCityCount = 0;
		local iCityRadius = 10;
		local iCityX, iCityY = pCity:GetX(), pCity:GetY()			
		for dx = (iCityRadius * -1), iCityRadius do
			for dy = (iCityRadius * -1), iCityRadius do
				local pPlot = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
				if pPlot and pPlot:IsCity() then							
					local otherCity = CityManager.GetCityAt(pPlot:GetX(), pPlot:GetY());
					if (pCity ~= otherCity) then 
						local cityGrowth = otherCity:GetGrowth();
						-- get total amenities of city
						local happiness = cityGrowth:GetHappiness();	
						if (happiness < 4) then
							unhappyCityCount = unhappyCityCount + 1;
						end	
					end
				end
			end
		end		
		iCityPlot:SetProperty('PROPERTY_MICO_UNHAPPY_CITY', unhappyCityCount);		
	end		
end

Events.PlayerTurnDeactivated.Add(UpdateUnhappyCities);

function OnAllUnitKilledNearLudwig(killedPlayerID, killedUnitID, PlayerID, UnitID) 
	local pKilledUnit = UnitManager.GetUnit(killedPlayerID, killedUnitID);
	if (pKilledUnit == nil) then 
		return;
	end
	local pUnit = UnitManager.GetUnit(PlayerID, UnitID);
	if (pUnit == nil) then 
		return;
	end
	local pUnitPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY());
	if (pUnitPlot == nil) then 
		return;
	end
	local iCityRadius = 10;
	local iUnitX, iUnitY = pUnitPlot:GetX(), pUnitPlot:GetY()			
	for dx = (iCityRadius * -1), iCityRadius do
		for dy = (iCityRadius * -1), iCityRadius do
			local pPlot = Map.GetPlotXYWithRangeCheck(iUnitX, iUnitY, dx, dy, iCityRadius);
			if pPlot and pPlot:IsCity() then							
				local pCity = CityManager.GetCityAt(pPlot:GetX(), pPlot:GetY());
				if (pCity ~= nil and pCity:GetProperty('PROPERTY_MICO_UNETHICAL_EXPERIMENT_CITY') == 1) then 
					local cityOwner = pCity:GetOwner();
					local pPlayer = Players[cityOwner];
					if (pPlayer ~= nil) then 					
						local eGameSpeed = GameConfiguration.GetGameSpeedType();
						local iSpeedCostMultiplier = GameInfo.GameSpeeds[eGameSpeed].CostMultiplier;
						local scienceAmount =  (pKilledUnit:GetCombat() / 2) * (iSpeedCostMultiplier / 100);
						-- Grant yield
						pPlayer:GrantYield(GameInfo.Yields["YIELD_SCIENCE"].Index, scienceAmount);
						-- Flyover text
						local message  = Locale.Lookup("LOC_KILL_SCIENCE", scienceAmount);
						Game.AddWorldViewText(0, message, pPlot:GetX(), pPlot:GetY());
					end					
				end
			end
		end
	end		
end

Events.UnitKilledInCombat.Add(OnAllUnitKilledNearLudwig);