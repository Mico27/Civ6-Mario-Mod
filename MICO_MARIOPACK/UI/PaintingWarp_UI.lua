include("GameCapabilities");
include("InstanceManager");

local isSelectingWarp = false
local currentWarpingPlots= {}
local paintingPlotMapping = {}
g_HexColoringMovement	= UILens.CreateLensLayerHash("Hex_Coloring_Movement");

function InitializeUI()
    local path = '/InGame/UnitPanel/StandardActionsStack'
    local ctrl = ContextPtr:LookUpControl(path)
    if ctrl then
        Controls.PaintingWarpGrid:ChangeParent(ctrl)
        Controls.PaintingWarpGrid:SetHide(true)
    end
    Controls.PaintingWarpButton:RegisterCallback(Mouse.eLClick, OnPaintingWarpButtonClicked)
end

function OnUnitSelectionChanged(PlayerID, UnitID, X, Y, Z, Selected, Editable)
    if Selected ~= true then 
        return
    end
    UpdatePaintingWarpButtonState(PlayerID, UnitID);
end

function OnUnitPositionChanged(PlayerID, UnitID, X, Y)
    UpdatePaintingWarpButtonState(PlayerID, UnitID);
end

function UpdatePaintingWarpButtonState(PlayerID, UnitID)
	local buttonState = GetPaintingWarpButtonState(PlayerID, UnitID);
    if buttonState.hidden then
        Controls.PaintingWarpGrid:SetHide(true)
    else
        Controls.PaintingWarpGrid:SetHide(false)
    end
	if buttonState.disabled then
        Controls.PaintingWarpButton:SetDisabled(true);
		Controls.PaintingWarpIcon:SetAlpha(0.4);		
    else
        Controls.PaintingWarpButton:SetDisabled(false);
		if (isSelectingWarp) then
			Controls.PaintingWarpIcon:SetAlpha(0.4);
		else 
			Controls.PaintingWarpIcon:SetAlpha(1);
		end		
    end
	if buttonState.tooltip then 
		Controls.PaintingWarpButton:SetToolTipString(buttonState.tooltip);
	end
end

function GetPaintingWarpButtonState(PlayerID, UnitID)
	local buttonState = {};
	buttonState.tooltip = Locale.Lookup("LOC_BUTTON_MICO_PAINTING_WARP");
	if PlayerID ~= Game.GetLocalPlayer() then
		buttonState.hidden = true;
        return buttonState;
    end	
	if not HasTrait("TRAIT_LEADER_MICO_MYSTICAL_PAINTINGS", PlayerID) then
		buttonState.hidden = true;
        return buttonState;
	end
    local pUnit = UnitManager.GetUnit(PlayerID, UnitID)    
	if (pUnit == nil) then
		buttonState.hidden = true;
		return buttonState;
	end		
	local unitInfo = GameInfo.Units[pUnit:GetType()];
	if unitInfo.Domain ~= "DOMAIN_LAND" then
		buttonState.hidden = true;
		return buttonState;
    end
	if pUnit:GetType() == GameInfo.Units['UNIT_SPY'].Index then
		buttonState.hidden = true;
		return buttonState;
    end	
	if pUnit:GetType() == GameInfo.Units['UNIT_TRADER'].Index then
		buttonState.hidden = true;
		return buttonState;
    end	
	local warpingPlots = GetWarpableGreatWorksAtPlot(pUnit:GetPlotId());
	if (table.count(warpingPlots) == 0) then
		buttonState.hidden = true;
		return buttonState;
	end
    if pUnit:GetMovesRemaining() <= 0 then
        buttonState.disabled = true;
		buttonState.tooltip = buttonState.tooltip .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_BUTTON_MICO_DISABLED_NO_MOVES");
        return buttonState;
    end
    return buttonState;
end

function GetWarpableGreatWorksAtPlot( PlotID )
	local warpablePlots = {};
	for _, paintingPlot in pairs(paintingPlotMapping) do 
		if (paintingPlot.PlotIndex == PlotID) then 
			local otherGreatWork = nil;
			for row in GameInfo.Mico_Duplicate_GreatWorks() do 
				if (paintingPlot.GreatWorkType == row.GreatWorkType) then 
					otherGreatWork = row.GreatWorkDuplicateType;
					break;
				end
				if (paintingPlot.GreatWorkType == row.GreatWorkDuplicateType) then 
					otherGreatWork = row.GreatWorkType;
					break;
				end      
			end 
			if (otherGreatWork ~= nil) then 
				for other_, otherPaintingPlot in pairs(paintingPlotMapping) do 
					if (otherPaintingPlot.GreatWorkType == otherGreatWork and otherPaintingPlot.PlotIndex ~= PlotID) then 
						table.insert(warpablePlots, otherPaintingPlot.PlotIndex);
						break;
					end  
				end
			end
		end
	end
	return warpablePlots;
end

function GreatworkSupportsWarp(greatWorkType) 
	for row in GameInfo.Mico_Duplicate_GreatWorks() do
		if (greatWorkType == row.GreatWorkType) then
			return true;
		end
		if (greatWorkType == row.GreatWorkDuplicateType) then
			return true;
		end      
	end 
	return false;
end

function OnGreatWorkChange(city, buildingID, greatWorkIndex)
	if city ~= nil then
		cityBuildings = city:GetBuildings();
		local greatWorkTypeID = cityBuildings:GetGreatWorkTypeFromIndex(greatWorkIndex); 
		local greatWork = GameInfo.GreatWorks[greatWorkTypeID];
		if not (GreatworkSupportsWarp(greatWork.GreatWorkType)) then 
			return;
		end
		local kCityPlots = Map.GetCityPlots():GetPurchasedPlots( city );
		if (kCityPlots ~= nil) then
			for _,plotID in pairs(kCityPlots) do
				local kBuildingTypes = cityBuildings:GetBuildingsAtLocation(plotID);			
				for _, type in ipairs(kBuildingTypes) do
					local building = GameInfo.Buildings[type];
					if (buildingID == building.Index) then
						paintingPlotMapping[greatWorkTypeID] = {PlotIndex = plotID, GreatWorkType = greatWork.GreatWorkType}
						return;
					end
				end
			end
		end	
	end
end

function OnGreatWorkCreated(playerID, unitID, cityPlotX, cityPlotY, buildingID, greatWorkIndex)
	local cityPlotIndex = Map.GetPlotIndex(cityPlotX, cityPlotY);
	local city = Cities.GetCityInPlot(cityPlotIndex);
	OnGreatWorkChange(city, buildingID, greatWorkIndex);
end

function OnGreatWorkMoved(fromCityPlayerID, fromCityID, toCityPlayerID, toCityID, buildingID, greatWorkIndex) 
	local player = Players[toCityPlayerID];	
	local city = player:GetCities():FindID(toCityID);
	OnGreatWorkChange(city, buildingID, greatWorkIndex);
end

function InitializePaintingPlotMapping() 	
	CloseWarpSelection()
	paintingPlotMapping = {};
	local allPlayers = PlayerManager.GetAliveMajors();	
	for _, player in ipairs(allPlayers) do
		local cities = player:GetCities();
		for _, city in cities:Members() do
			local cityBuildings = city:GetBuildings();
			local kCityPlots = Map.GetCityPlots():GetPurchasedPlots( city );
			if (kCityPlots ~= nil) then
				for _,plotID in pairs(kCityPlots) do
					local kBuildingTypes = cityBuildings:GetBuildingsAtLocation(plotID);			
					for _, type in ipairs(kBuildingTypes) do
						local building	= GameInfo.Buildings[type];
						local buildingIndex = building.Index;
						local buildingType = building.BuildingType;
						if(cityBuildings:HasBuilding(buildingIndex)) then
							local numSlots = cityBuildings:GetNumGreatWorkSlots(buildingIndex);
							if (numSlots ~= nil and numSlots > 0) then
								for index = 0, numSlots - 1 do
									local greatWorkIndex = cityBuildings:GetGreatWorkInSlot(buildingIndex, index);
									if greatWorkIndex ~= -1 then
										local greatWorkTypeID = cityBuildings:GetGreatWorkTypeFromIndex(greatWorkIndex); 
										local greatWorkType = GameInfo.GreatWorks[greatWorkTypeID].GreatWorkType;
										if (GreatworkSupportsWarp(greatWorkType)) then
											paintingPlotMapping[greatWorkTypeID] = {PlotIndex = plotID, GreatWorkType = greatWorkType}
										end
									end
								end
							end
						end
					end
				end
			end	
		end
	end
end

function CloseWarpSelection()
	if isSelectingWarp then
        isSelectingWarp = false
		currentWarpingPlots = {}
        RefreshWarpUI()
    end	
end

function OnPaintingWarpButtonClicked()
    local pUnit = UI.GetHeadSelectedUnit()
    if isSelectingWarp == false then 
        isSelectingWarp = true
		currentWarpingPlots = GetWarpableGreatWorksAtPlot(pUnit:GetPlotId());
        RefreshWarpUI()
    else
        CloseWarpSelection()
    end
end

function RefreshWarpUI()
    local cMode = UI.GetInterfaceMode();
	if not isSelectingWarp then
		Controls.PaintingWarpIcon:SetAlpha(1);
        UI.SetInterfaceMode( InterfaceModeTypes.SELECTION );
        UILens.ToggleLayerOff( g_HexColoringMovement );
	    UILens.ClearLayerHexes( g_HexColoringMovement );
	elseif isSelectingWarp then
		Controls.PaintingWarpIcon:SetAlpha(0.4);
        UI.SetInterfaceMode( InterfaceModeTypes.WB_SELECT_PLOT );
        if (table.count(currentWarpingPlots) ~= 0) then
			local eLocalPlayer:number = Game.GetLocalPlayer();
			UILens.ToggleLayerOn(g_HexColoringMovement);
            UILens.SetLayerHexesArea(g_HexColoringMovement, eLocalPlayer, currentWarpingPlots);        
		end        
 	end
end

function OnSelectPlot(plotId, plotEdge, boolParam)
    if not isSelectingWarp then
		return
    end
    local pUnit = UI.GetHeadSelectedUnit()
    if CheckPlotAvaibility(plotId,pUnit) then
        ExecutePaintWarp(plotId,pUnit)        
    end
    CloseWarpSelection()
end

function CheckPlotAvaibility(plotId,pUnit)
    for _,v in pairs(currentWarpingPlots) do
        if plotId == v then
            return true
        end
    end
    return false
end

function ExecutePaintWarp(plotId, pUnit)    
    local plot = Map.GetPlotByIndex(plotId);
	-- EventName is the name of the GameCore lua script event that should be triggered to start this unit action.
	local tParameters = {};
	tParameters[UnitCommandTypes.PARAM_X] = plot:GetX();
	tParameters[UnitCommandTypes.PARAM_Y] = plot:GetY();
	tParameters[UnitCommandTypes.PARAM_NAME] = 'OnMicoPaitingWarp';
	UnitManager.RequestCommand(pUnit, UnitCommandTypes.EXECUTE_SCRIPT, tParameters);
    UI.PlaySound("Play_Sfx_MICO_EnterPainting");
    return
end

function OnUiModChange( )
	local cMode = UI.GetInterfaceMode();
	if isSelectingWarp and cMode == InterfaceModeTypes.WB_SELECT_PLOT then
        return
    end
    CloseWarpSelection()
end


function LateInit()
    InitializeUI()
	InitializePaintingPlotMapping()
    LuaEvents.WorldInput_WBSelectPlot.Add( OnSelectPlot )
    Events.InterfaceModeChanged.Add( OnUiModChange )
    Events.UnitMoveComplete.Add(OnUnitPositionChanged)
    Events.UnitTeleported.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsChanged.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsCleared.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsRestored.Add(OnUnitPositionChanged)
    Events.UnitSelectionChanged.Add(OnUnitSelectionChanged)
	Events.GreatWorkCreated.Add(OnGreatWorkCreated);
	Events.GreatWorkMoved.Add(OnGreatWorkMoved);
	Events.DiplomacyDealEnacted.Add(InitializePaintingPlotMapping);
	Events.CityOccupationChanged.Add(InitializePaintingPlotMapping);
end

Events.LoadGameViewStateDone.Add(LateInit)