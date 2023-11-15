include("GameCapabilities");
include("InstanceManager");

local m_MarioBrosIndex = GameInfo.Units['UNIT_HERO_MICO_MARIO_BROS'].Index
local g_ActivateReason_FIX_CITY = DB.MakeHash("FIX_CITY");

function InitializeUI()
    local path = '/InGame/UnitPanel/StandardActionsStack'
    local ctrl = ContextPtr:LookUpControl(path)
    if ctrl then
        Controls.RepairCityGrid:ChangeParent(ctrl)
        Controls.RepairCityGrid:SetHide(true)
    end
    Controls.RepairCityButton:RegisterCallback(Mouse.eLClick, OnRepairCityButtonClicked)
end

function OnUnitSelectionChanged(PlayerID, UnitID, X, Y, Z, Selected, Editable)
    if Selected ~= true then 
        return
    end
    UpdateRepairCityButtonState(PlayerID, UnitID);
end

function OnUnitPositionChanged(PlayerID, UnitID, X, Y)
    UpdateRepairCityButtonState(PlayerID, UnitID);
end

function UpdateRepairCityButtonState(PlayerID, UnitID)
	local buttonState = GetRepairCityButtonState(PlayerID, UnitID);
    if buttonState.hidden then
        Controls.RepairCityGrid:SetHide(true)
    else
        Controls.RepairCityGrid:SetHide(false)
    end
	if buttonState.disabled then
        Controls.RepairCityButton:SetDisabled(true);
		Controls.RepairCityIcon:SetAlpha(0.4);		
    else
        Controls.RepairCityButton:SetDisabled(false);
		Controls.RepairCityIcon:SetAlpha(1);
    end
	if buttonState.tooltip then 
		Controls.RepairCityButton:SetToolTipString(buttonState.tooltip);
	end
end

function GetRepairCityButtonState(PlayerID, UnitID)
	local buttonState = {};
	buttonState.tooltip = Locale.Lookup("LOC_BUTTON_MICO_REPAIR_CITY");
	if PlayerID ~= Game.GetLocalPlayer() then
		buttonState.hidden = true;
        return buttonState;
    end	
    local pUnit = UnitManager.GetUnit(PlayerID, UnitID)    
	if (pUnit == nil) then
		buttonState.hidden = true;
		return buttonState;
	end		
	if pUnit:GetType() ~= m_MarioBrosIndex then
		buttonState.hidden = true;
        return buttonState;
    end
	if pUnit:GetActionCharges() <= 0 then
		buttonState.disabled = true;
		buttonState.tooltip = buttonState.tooltip .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_BUTTON_MICO_REPAIR_CITY_DISABLED_NO_CHARGES");
        return buttonState;
	end
    if pUnit:GetMovesRemaining() <= 0 then
        buttonState.disabled = true;
		buttonState.tooltip = buttonState.tooltip .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_BUTTON_MICO_DISABLED_NO_MOVES");
        return buttonState;
    end
	local pUnitPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY());
	if(pUnitPlot == nil) then
		buttonState.disabled = true;
        return buttonState;
	end	
	local pCity = Cities.GetPlotPurchaseCity(pUnitPlot:GetIndex());
	if(pCity == nil) then
		buttonState.disabled = true;
		buttonState.tooltip = buttonState.tooltip .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_BUTTON_MICO_REPAIR_CITY_DISABLED_NO_CITY");
        return buttonState;
	end	
    return buttonState;
end

function OnRepairCityButtonClicked()
    local pUnit = UI.GetHeadSelectedUnit()
	ExecuteRepairCity(pUnit);
end

function ExecuteRepairCity(pUnit)
	-- EventName is the name of the GameCore lua script event that should be triggered to start this unit action.
	local tParameters = {};
	tParameters[UnitCommandTypes.PARAM_NAME] = 'OnMicoRepairCity';
	UnitManager.RequestCommand(pUnit, UnitCommandTypes.EXECUTE_SCRIPT, tParameters);	
    --UI.PlaySound("SFX_Mario_Repair_City");
    return
end

function OnUnitActivate(owner, unitID, x, y, eReason, bVisibleToLocalPlayer)
	if bVisibleToLocalPlayer then
		local pUnit = UnitManager.GetUnit(owner, unitID);
		if pUnit ~= nil then
			-- Trigger custom animations based on the Activate event.
			if eReason == g_ActivateReason_FIX_CITY then
				SimUnitSystem.SetAnimationState(pUnit, "ACTION_1", "IDLE");
			end
		end
	end
end

function LateInit()
    InitializeUI()
    Events.UnitMoveComplete.Add(OnUnitPositionChanged)
    Events.UnitTeleported.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsChanged.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsCleared.Add(OnUnitPositionChanged)
	Events.UnitMovementPointsRestored.Add(OnUnitPositionChanged)
	Events.UnitChargesChanged.Add(OnUnitPositionChanged)
    Events.UnitSelectionChanged.Add(OnUnitSelectionChanged)
	Events.UnitActivate.Add(OnUnitActivate);
end

Events.LoadGameViewStateDone.Add(LateInit)