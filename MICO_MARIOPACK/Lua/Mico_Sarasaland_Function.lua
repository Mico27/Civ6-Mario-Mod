-- Mico_Sarasaland_Functions
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


local giantBeanstalkBuildingIndex = GameInfo.Buildings['BUILDING_MICO_GIANT_BEANSTALK'].Index;

--============================================================
-- Functions =================================================
--============================================================

-------------------------------------------------------------------------
-- Daisy Fun Loving Trait
----------------------------------------------------------------------------------------------------------------------------

function UpdateFunLovingTrait(PlayerID)
	if not HasTrait("TRAIT_LEADER_MICO_FUN_LOVING", PlayerID) then
		return;
	end
	local pPlayer = Players[PlayerID];	
	local playerCities = pPlayer:GetCities();
	for j, city in playerCities:Members() do
		local cityGrowth = city:GetGrowth();
		-- get total amenities of city
		local happiness = cityGrowth:GetHappiness();
		local appealBonus = 0;
		if (happiness == 5) then
			appealBonus = 1;
		end
		if (happiness == 6) then
			appealBonus = 2;
		end
		local iCityPlot = Map.GetPlot(city:GetX(), city:GetY());
		iCityPlot:SetProperty('PROPERTY_MICO_HAPPINESS_APPEAL_BONUS', appealBonus);		
	end		
end

Events.PlayerTurnDeactivated.Add(UpdateFunLovingTrait);

function UpdateFourKingdomTrait(PlayerID, CityID, X, Y)
	if not HasTrait("TRAIT_CIVILIZATION_MICO_LAND_OF_FOUR_KINGDOMS", PlayerID) then
		return;
	end
	local pPlayer = Players[PlayerID];	
	local pPlot = Map.GetPlot(X, Y);
	local pPlotIndex = pPlot:GetIndex();
	local pCity = pPlayer:GetCities():FindID(CityID);
	local building = GameInfo.Buildings['BUILDING_PALACE'].Index;
	local hasPalace = pCity:GetBuildings():HasBuilding(building);
	if not (hasPalace) then
		local wonderCityId = pPlayer:GetProperty('PROPERTY_MICO_WONDER_CITY_ID');
		if (wonderCityId == nil) then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), direction)
				if (pAdjacentPlot ~= nil) then 					
					if (pAdjacentPlot:IsNaturalWonder()) then
						pCity:GetBuildQueue():CreateIncompleteBuilding(building, pCity:GetPlot():GetIndex(), 100);
						pCity:SetName('LOC_CITY_NAME_MICO_SARASALAND_WONDER');
						pPlayer:SetProperty('PROPERTY_MICO_WONDER_CITY_ID', CityID);
						return;
					end	
				end
			end				
		end	
		local desertCityId = pPlayer:GetProperty('PROPERTY_MICO_DESERT_CITY_ID');		
		if (desertCityId == nil) then
			local terrainType = pPlot:GetTerrainType();
			if (terrainType == g_TERRAIN_TYPE_DESERT or terrainType == g_TERRAIN_TYPE_DESERT_HILLS) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(building, pCity:GetPlot():GetIndex(), 100);
				pCity:SetName('LOC_CITY_NAME_MICO_SARASALAND_DESERT');
				pPlayer:SetProperty('PROPERTY_MICO_DESERT_CITY_ID', CityID);
				return;
			end			
		end		
		local mountainCityId = pPlayer:GetProperty('PROPERTY_MICO_MOUNTAIN_CITY_ID');
		if (mountainCityId == nil) then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), direction)
				if (pAdjacentPlot ~= nil) then 					
					if (pAdjacentPlot:IsMountain()) then
						pCity:GetBuildQueue():CreateIncompleteBuilding(building, pCity:GetPlot():GetIndex(), 100);
						pCity:SetName('LOC_CITY_NAME_MICO_SARASALAND_MOUNTAIN');
						pPlayer:SetProperty('PROPERTY_MICO_MOUNTAIN_CITY_ID', CityID);
						return;
					end	
				end
			end					
		end		
		local coastCityId = pPlayer:GetProperty('PROPERTY_MICO_COAST_CITY_ID');
		if (coastCityId == nil) then
			if (pPlot:IsCoastalLand()) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(building, pCity:GetPlot():GetIndex(), 100);
				pCity:SetName('LOC_CITY_NAME_MICO_SARASALAND_COAST');
				pPlayer:SetProperty('PROPERTY_MICO_COAST_CITY_ID', CityID);
				return;
			end			
		end			
	end	
end

Events.CityAddedToMap.Add(UpdateFourKingdomTrait);

function SetBeanstalkEffectProperties(oldRadius, newRadius, iPlotX, iPlotY, spawnTrees)
	if (oldRadius > 0) then
		for dx = (oldRadius * -1), oldRadius do
			for dy = (oldRadius * -1), oldRadius do
				local pAdjPlot = Map.GetPlotXYWithRangeCheck(iPlotX, iPlotY, dx, dy, oldRadius);
				if pAdjPlot then	
					local existingEffect = pAdjPlot:GetProperty('PROPERTY_MICO_BEANSTALK_EFFECT');
					if (existingEffect ~= nil and existingEffect > 0) then
						pAdjPlot:SetProperty('PROPERTY_MICO_BEANSTALK_EFFECT', existingEffect - 1);
						if (spawnTrees and TerrainBuilder.CanHaveFeature(pAdjPlot, g_FEATURE_FOREST)) then 
							TerrainBuilder.SetFeatureType(pAdjPlot, g_FEATURE_FOREST);
						end
					end
				end
			end
		end
	end
	if (newRadius > 0) then 
		for dx = (newRadius * -1), newRadius do
			for dy = (newRadius * -1), newRadius do
				local pAdjPlot = Map.GetPlotXYWithRangeCheck(iPlotX, iPlotY, dx, dy, newRadius);
				if pAdjPlot then	
					local existingEffect = pAdjPlot:GetProperty('PROPERTY_MICO_BEANSTALK_EFFECT');
					if (existingEffect == nil) then
						existingEffect = 0;
					end
					local newEffect = existingEffect + 1;
					pAdjPlot:SetProperty('PROPERTY_MICO_BEANSTALK_EFFECT', newEffect);
				end
			end
		end
	end
end

function PillageChangeGiantBeanstalkBuilding(PlayerID, CityID, BuildingID, IsPillaged)		
	if (giantBeanstalkBuildingIndex ~= BuildingID) then
		return;
	end
	local pPlayer = Players[PlayerID];	
	local pCity = pPlayer:GetCities():FindID(CityID);
	local district = GameInfo.Districts['DISTRICT_PRESERVE'].Index;
	local preserve = pCity:GetDistricts():GetDistrict(district);
	if (preserve ~= nil) then 		
		local pPlot = Map.GetPlot(preserve:GetX(), preserve:GetY());
		local beanstalkActive = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE');
		local beanstalkAge = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_AGE');
		if (beanstalkAge == nil) then
			beanstalkAge = 0;
		end
		if (IsPillaged) then 
			if (beanstalkActive == 1) then 
				print("PillageChangeGiantBeanstalkBuilding", PlayerID, CityID, BuildingID, IsPillaged, beanstalkAge);
				pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE', 0);
				SetBeanstalkEffectProperties(beanstalkAge, 0, pPlot:GetX(), pPlot:GetY(), false);
			end
			return;
		end
		if (beanstalkActive == nil or beanstalkActive == 0) then 
			print("PillageChangeGiantBeanstalkBuilding", PlayerID, CityID, BuildingID, IsPillaged, beanstalkAge);
			pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE', 1);
			SetBeanstalkEffectProperties(0, beanstalkAge, pPlot:GetX(), pPlot:GetY(), false);
		end
	end
end

GameEvents.BuildingPillageStateChanged.Add(PillageChangeGiantBeanstalkBuilding);

function OnGiantBeanstalkBuildingConstructed( PlayerID, CityID, BuildingID, PlotIndex, OriginalConstruction )	
	if (giantBeanstalkBuildingIndex ~= BuildingID) then
		return;
	end		
	local pPlayer = Players[PlayerID];	
	local pCity = pPlayer:GetCities():FindID(CityID);
	local buildings = pCity:GetBuildings();
	if (buildings:HasBuilding(BuildingID) and not buildings:IsPillaged(BuildingID)) then 		
		local pPlot = Map.GetPlotByIndex(PlotIndex);
		local beanstalkActive = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE');
		if (beanstalkActive == nil or beanstalkActive == 0) then 
			local beanstalkAge = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_AGE');
			if (beanstalkAge == nil or beanstalkAge == 0) then
				beanstalkAge = 1;
			end
			print("OnGiantBeanstalkBuildingConstructed", PlayerID, CityID, BuildingID, PlotIndex, OriginalConstruction, beanstalkAge);
			pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE', 1);
			pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_AGE', beanstalkAge);
			pCity:SetProperty('PROPERTY_MICO_BEANSTALK_AGE', beanstalkAge);		
			SetBeanstalkEffectProperties(0, beanstalkAge, pPlot:GetX(), pPlot:GetY(), false);
		end
	end    
end

GameEvents.BuildingConstructed.Add(OnGiantBeanstalkBuildingConstructed);

function OnGiantBeanstalkBuildingRemovedFromMap( PlotX, PlotY )	
	local pPlot = Map.GetPlot(PlotX, PlotY);
	local beanstalkActive = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE');
	if (beanstalkActive == 1) then 
		local deleteProp = true;
		local pCity = Cities.GetPlotPurchaseCity(pPlot:GetIndex());
		if (pCity ~= nil) then 
			local buildings = pCity:GetBuildings();
			deleteProp = not buildings:HasBuilding(BuildingID);
		end
		if (deleteProp) then 
			pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE', 0);
			local beanstalkAge = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_AGE');
			if (beanstalkAge ~= nil and beanstalkAge > 0) then
				print("OnGiantBeanstalkBuildingRemovedFromMap", PlotX, PlotY, beanstalkAge);
				SetBeanstalkEffectProperties(beanstalkAge, 0, PlotX, PlotY, false);
			end 
		end
	end
end

Events.BuildingRemovedFromMap.Add( OnGiantBeanstalkBuildingRemovedFromMap );

function EraChangedGiantBeanstalkBuilding(PreviousEraIndex, NewEraIndex)
	local district = GameInfo.Districts['DISTRICT_PRESERVE'].Index;
	local players = Game.GetPlayers();
	for i, player in ipairs(players) do
		local cities = players[i]:GetCities();	
		for _, pCity in cities:Members() do
			local buildings = pCity:GetBuildings();
			if (buildings:HasBuilding(giantBeanstalkBuildingIndex) and not buildings:IsPillaged(giantBeanstalkBuildingIndex)) then
				local preserve = pCity:GetDistricts():GetDistrict(district);
				if (preserve ~= nil) then
					local pPlot = Map.GetPlot(preserve:GetX(), preserve:GetY());
					local beanstalkActive = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_ACTIVE');
					if (beanstalkActive == 1) then 
						local beanstalkAge = pPlot:GetProperty('PROPERTY_MICO_BEANSTALK_AGE');
						if (beanstalkAge == nil) then
							beanstalkAge = 0;
						end
						local newAge = beanstalkAge + 1;
						if (newAge > 3) then 
							newAge = 3;
						end					
						pPlot:SetProperty('PROPERTY_MICO_BEANSTALK_AGE', newAge);
						pCity:SetProperty('PROPERTY_MICO_BEANSTALK_AGE', newAge);
						SetBeanstalkEffectProperties(beanstalkAge, newAge, pPlot:GetX(), pPlot:GetY(), true);
					end
				end
			end
		end
	end 
end

Events.GameEraChanged.Add(EraChangedGiantBeanstalkBuilding);

function OnFlowerSanctuaryBuilt(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)
	local flowerSanctuaryIndex = GameInfo.Improvements['IMPROVEMENT_MICO_FLOWER_SANCTUARY'].Index 
	if (ImprovementID == flowerSanctuaryIndex) then		
		local pPlot = Map.GetPlot(PlotX, PlotY);
		if (pPlot:GetProperty('PROPERTY_MICO_FLOWER_SANCTUARY_ERA_SCORE') == 1) then 
			return;
		end
		local pCity = Cities.GetPlotPurchaseCity(pPlot);
		if pCity ~= nil then
			local building = GameInfo.Buildings['BUILDING_PALACE'].Index;
			local hasPalace = pCity:GetBuildings():HasBuilding(building);
			if (hasPalace) then
				Game.GetEras():ChangePlayerEraScore(PlayerID, 1);
				pPlot:SetProperty('PROPERTY_MICO_FLOWER_SANCTUARY_ERA_SCORE', 1);
			end
		end		
	end
end

Events.ImprovementAddedToMap.Add(OnFlowerSanctuaryBuilt);