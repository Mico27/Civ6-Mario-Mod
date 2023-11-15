-- Mico_Mario_Bros_Functions
-- Author: Mico27
-- DateCreated: 03/05/2023 12:59:54
--------------------------------------------------------------
--============================================================
-- INCLUDES
--============================================================
include "MapEnums"
include("InstanceManager.lua");
include("GameCapabilities");
include("SupportFunctions.lua");
include("Mico_Exposed_Functions.lua");

--============================================================
-- Functions =================================================
--============================================================

-------------------------------------------------------------------------
-- Mario & Luigi Repair City Command
----------------------------------------------------------------------------------------------------------------------------

function OnRepairCity(PlayerID, UnitID)
	local pPlayer = Players[PlayerID];
	if (pPlayer == nil) then
		return false;
	end

	local pUnit = pPlayer:GetUnits():FindID(UnitID);
	if (pUnit == nil) then
		return false;
	end

	local pUnitPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY());
	if(pUnitPlot == nil) then
		return false;
	end	

	local pCity = Cities.GetPlotPurchaseCity(pUnitPlot:GetIndex());
	if(pCity == nil) then
		return false;
	end	

	-- Report to the application side that we did something.  This helps with visualization
	UnitManager.ReportActivation(pUnit, "FIX_CITY");
				
	-- Looping Improvements, districts and buildings repairs
	local pCityDistricts = pCity:GetDistricts();
	local pCityBuildings = pCity:GetBuildings();
	local iCityX, iCityY = pCity:GetX(), pCity:GetY()
	local iCityRadius = 5
	local iCityOwner = pCity:GetOwner()	
	for dx = (iCityRadius * -1), iCityRadius do
		for dy = (iCityRadius * -1), iCityRadius do
			local pPlot = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
			if pPlot and (pPlot:GetOwner() == iCityOwner) and (pCity == Cities.GetPlotPurchaseCity(pPlot:GetIndex())) then	
				local plotX = pPlot:GetX();
				local plotY = pPlot:GetY();
				if (pPlot:IsImprovementPillaged()) then
					ImprovementBuilder.SetImprovementPillaged(pPlot, false);
					ExposedMembers.PlayEffectAtXY("IMPROVEMENT_CREATED", plotX, plotY);
				end
				local district = pCityDistricts:GetDistrictAtLocation(plotX, plotY);
				if (district ~= nil and district:IsPillaged()) then 
					district:SetPillaged(false);
					ExposedMembers.PlayEffectAtXY("DISTRICT_CREATED", plotX, plotY);
				end
				local kBuildingTypes = ExposedMembers.GetBuildingsAtLocation(PlayerID, pCity:GetID(), pPlot:GetIndex());
				for _, buildingType in ipairs(kBuildingTypes) do
					if pCityBuildings:IsPillaged(buildingType) then
						pCityBuildings:SetPillaged(buildingType, false);
						ExposedMembers.PlayEffectAtXY("BUILDING_CREATED", plotX, plotY);
					end
				end
			end
		end
	end	
	pUnit:ChangeActionCharges(-1);
	local remainingMovement = pUnit:GetMovesRemaining();
	UnitManager.ChangeMovesRemaining(pUnit, -remainingMovement);
end

GameEvents.OnMicoRepairCity.Add(OnRepairCity);
