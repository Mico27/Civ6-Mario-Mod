-- Copyright 2020, Firaxis Games

include( "HeroesSupport" );
include( "InstanceManager" );

-- ===========================================================================
--	MEMBERS
-- ===========================================================================

local m_pAbilityIM:table		= InstanceManager:new( "AbilityInstance", "Top", Controls.AbilityStack );
local m_pCommandIM:table		= InstanceManager:new( "CommandInstance", "Top", Controls.CommandStack );

-- ===========================================================================
function OnContinueButton()
	Close();
end

-- ===========================================================================
function OnLookAtHeroButton( heroX:number, heroY:number )
	UI.LookAtPlot( heroX, heroY );
	Close();
end

-- ===========================================================================
function ShowHeroInGreatPeoplePopup( kHeroDef:table )
	LuaEvents.HeroesPopup_ShowNewHero(kHeroDef);
	Close();
end

-- ===========================================================================
function Open()
	UIManager:QueuePopup(ContextPtr, PopupPriority.Low);
end

-- ===========================================================================
function Close()
	UIManager:DequeuePopup(ContextPtr);
end

-- ===========================================================================
function OnInputHandler( pInputStruct:table )
	local uiMsg :number = pInputStruct:GetMessageType();
	if uiMsg == KeyEvents.KeyUp and pInputStruct:GetKey() == Keys.VK_ESCAPE then
		Close();
		return true;
	end
	return false;
end

-- ===========================================================================
function OnInit(isReload:boolean)
	LateInitialize();
end

-- ===========================================================================
function OnPlayerDiscoveredHero( ePlayer:number, eClass:number, eSourceType:number, eSourceID:number )
	if ePlayer ~= Game.GetLocalPlayer() then
		return;
	end

	local pGameHeroes:object = Game.GetHeroesManager();
	local eOriginBuildingType:number = pGameHeroes:GetPlayerHeroOriginBuildingType(ePlayer);
	local pOriginBuildingInfo = GameInfo.Buildings[eOriginBuildingType];	

	Controls.EventTitle:SetText(Locale.Lookup("LOC_NOTIFICATION_HERO_DISCOVERED_MESSAGE"));

	local kHeroDef:table = GameInfo.HeroClasses[eClass];
	if kHeroDef then

		local sEventDescription:string = "";
		if (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_PROJECT) then
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_PROJECT", kHeroDef.Name);

		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_GOODY_HUT) then
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_GOODY_HUT", kHeroDef.Name);

		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_CITY_STATE_INFLUENCE) then
			local pPlayerConfig:table = PlayerConfigurations[eSourceID];
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_CITY_STATE", kHeroDef.Name, pPlayerConfig:GetCivilizationShortDescription());

		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_CITY_STATE_SUZERAIN) then
			local pPlayerConfig:table = PlayerConfigurations[eSourceID];
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_CITY_STATE_SUZERAIN", kHeroDef.Name, pPlayerConfig:GetCivilizationShortDescription());

		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_NEW_CONTINENT) then
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_NEW_CONTINENT", kHeroDef.Name, GameInfo.Continents[eSourceID].Description);
		
		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_NATURAL_WONDER) then
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_NATURAL_WONDER", kHeroDef.Name, GameInfo.Features[eSourceID].Name);

		elseif (eSourceType == HeroDiscoverySources.DISCOVERY_SOURCE_ENCOUNTER) then
			sEventDescription = Locale.Lookup("LOC_HERO_DISCOVERED_DESC_ENCOUNTER", kHeroDef.Name);
		end

		-- Default
		if (sEventDescription == nil or sEventDescription == "") then
			sEventDescription = Locale.Lookup("LOC_NOTIFICATION_HERO_DISCOVERED_SUMMARY", kHeroDef.Name);
		end

		-- How to Claim Text
		local eClaimedByPlayer:number = pGameHeroes:GetHeroClaimPlayer(kHeroDef.Index);
		local kUnit:table = GameInfo.Units[kHeroDef.UnitType];
		if (kUnit ~= nil) then
			-- Help text for unclaimed heroes on how to claim them
			if (eClaimedByPlayer == -1) then
				if (kUnit.Domain == "DOMAIN_SEA") then
					sEventDescription = sEventDescription .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DISCOVER_HERO_NAVAL_HELP", pOriginBuildingInfo.Name);
				else
					sEventDescription = sEventDescription .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DISCOVER_HERO_HELP", pOriginBuildingInfo.Name);
				end
			else
				-- Help text for claimed heroes
				local pPlayerDiplomacy:object = Players[ePlayer]:GetDiplomacy();
				if pPlayerDiplomacy and pPlayerDiplomacy:HasMet(eClaimedByPlayer) then
					local pPlayerConfig:table = PlayerConfigurations[eClaimedByPlayer];
					sEventDescription = sEventDescription .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DISCOVER_CLAIMED_HERO_HELP", pPlayerConfig:GetPlayerName());
				else
					sEventDescription = sEventDescription .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DISCOVER_CLAIMED_HERO_HELP", Locale.Lookup("LOC_PLAYERNAME_UNKNOWN"));
				end
			end
		end

		Controls.EventDescription:SetText(sEventDescription);

		-- Hero Description
		local sHeroDescription:string = Locale.Lookup(kHeroDef.Description);
		Controls.HeroDescription:SetText(sHeroDescription);

		-- Abilities
		m_pAbilityIM:ResetInstances();
		local kAbilities:table = GetHeroClassUnitAbilities(kHeroDef.Index);
		for _, kAbility in pairs(kAbilities) do
			local pAbilityInst:table = m_pAbilityIM:GetInstance();
			
			pAbilityInst.AbilityName:SetText(Locale.ToUpper(kAbility.Name));
			pAbilityInst.AbilityText:SetText(Locale.Lookup(kAbility.Description));
		end

		-- Commands
		m_pCommandIM:ResetInstances();
		local kCommands:table = GetHeroClassUnitCommands(kHeroDef.Index);
		for _, kCommand in pairs(kCommands) do
			local pCommandInst:table = m_pCommandIM:GetInstance();
			
			pCommandInst.CommandName:SetText( Locale.ToUpper(kCommand.Name) );
			pCommandInst.CommandText:SetText( Locale.Lookup(kCommand.Description) );
			pCommandInst.CommandIcon:SetIcon( kCommand.Icon );
		end

		-- Hero Image
		local heroPortrait = GameInfo.HeroClassPortraits[kHeroDef.HeroClassType];
		if heroPortrait ~= nil then
			local heroTexture:string = heroPortrait.Normal;
			if heroTexture ~= nil then
				Controls.HeroImage:SetTexture(heroTexture);
			end
		end
		-- When player discovers a hero use this button to show it in the great people heroes tab
		Controls.LookAtHeroButton:RegisterCallback(Mouse.eLClick, function() 
			ShowHeroInGreatPeoplePopup(kHeroDef);
		end);
	end

	UpdateEffectsContainerSize();

	Open();
end

-- ===========================================================================
function NotificationHeroLifespanExpired(pNotification:table)
	if (pNotification == nil) then
		return;
	end

	local ePlayer:number = pNotification:GetPlayerID();
	local x = pNotification:GetValue("PARAM_X0");
	local y = pNotification:GetValue("PARAM_Y0");
	local eHeroClass:number = pNotification:GetValue("PARAM_TARGET0");

	OnUnitKilledLifespanExpired(ePlayer, eHeroClass, x, y);
end

-- ===========================================================================
function OnUnitKilledLifespanExpired(iPlayerID : number, eHeroClass : number, x : number, y : number)

	if (iPlayerID ~= Game.GetLocalPlayer()) then
		return;
	end
	local pPlayer = Players[iPlayerID];
	if (pPlayer == nil) then
		return;
	end
	
	local pGameHeroes:object = Game.GetHeroesManager();
	local eOriginBuildingType:number = pGameHeroes:GetPlayerHeroOriginBuildingType(iPlayerID);
	local pOriginBuildingInfo = GameInfo.Buildings[eOriginBuildingType];
	
	-- Early out: not a hero
	if (eHeroClass == -1) then
		return;
	end

	m_pAbilityIM:ResetInstances();
	m_pCommandIM:ResetInstances();

	Controls.EventTitle:SetText(Locale.Lookup("LOC_HERO_EXPIRED_MESSAGE"));

	local kHeroDef:table = GameInfo.HeroClasses[eHeroClass];
	if kHeroDef then
		Controls.EventDescription:SetText(Locale.Lookup("LOC_HERO_EXPIRED_DESC", kHeroDef.Name));
		Controls.HeroDescription:SetText(Locale.Lookup("LOC_HEROES_HELP_RECALL_DESC", pOriginBuildingInfo.Name));

		-- Hero Image
		local heroPortrait = GameInfo.HeroClassPortraits[kHeroDef.HeroClassType];
		if heroPortrait ~= nil then
			local heroTexture:string = heroPortrait.Expired;
			if heroTexture ~= nil then
				Controls.HeroImage:SetTexture(heroTexture);
			end
		end
	end

	Controls.LookAtHeroButton:RegisterCallback(Mouse.eLClick, function() 
		OnLookAtHeroButton(x, y); 
	end);

	UpdateEffectsContainerSize();

	Open();
end

-- ===========================================================================
function OnUnitDamageChanged(iPlayerID:number, iUnitID:number, iDamage:number)
	
	-- Early out: unit isn't dying
	if (iDamage < 100) then
		return;
	end
	if (iPlayerID ~= Game.GetLocalPlayer()) then
		return;
	end
	local pPlayer = Players[iPlayerID];
	if (pPlayer == nil) then
		return;
	end
	
	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end
	
	local eHeroClass:number = pUnit:GetHeroClassType();
	
	-- Early out: not a hero
	if (eHeroClass == -1) then
		return;
	end

	m_pAbilityIM:ResetInstances();
	m_pCommandIM:ResetInstances();

	Controls.EventTitle:SetText(Locale.Lookup("LOC_HERO_KILLED_MESSAGE"));

	local kHeroDef:table = GameInfo.HeroClasses[eHeroClass];
	if kHeroDef then
		local pGameHeroes:object = Game.GetHeroesManager();
		local eOriginBuildingType:number = pGameHeroes:GetPlayerHeroOriginBuildingType(iPlayerID);
		local kOriginBuildingInfo:table = GameInfo.Buildings[eOriginBuildingType];

		Controls.EventDescription:SetText(Locale.Lookup("LOC_HERO_KILLED_DESC", kHeroDef.Name));
		Controls.HeroDescription:SetText(Locale.Lookup("LOC_HEROES_HELP_RECALL_DESC", kOriginBuildingInfo.Name));

		-- Hero Image
		local heroPortrait = GameInfo.HeroClassPortraits[kHeroDef.HeroClassType];
		if heroPortrait ~= nil then
			local heroTexture:string = heroPortrait.Killed;
			if heroTexture ~= nil then
				Controls.HeroImage:SetTexture(heroTexture);
			end
		end
	end

	if pUnit then
		Controls.LookAtHeroButton:RegisterCallback(Mouse.eLClick, function() 
			OnLookAtHeroButton(pUnit:GetX(), pUnit:GetY()); 
		end);
	end

	UpdateEffectsContainerSize();

	Open();
end

-- ===========================================================================
function NotificationPlayerDiscoveredHero(pNotification:table)
	if (pNotification == nil) then
		return;
	end

	local ePlayer:number = pNotification:GetPlayerID();
	local eHeroClass:number = pNotification:GetValue("HERO_CLASS");
	local eSourceType:number = pNotification:GetValue("PARAM_SUB_TYPE");
	local iSourceID:number = pNotification:GetValue("PARAM_TARGET0");

	-- Show the popup as if it was new
	OnPlayerDiscoveredHero(ePlayer, eHeroClass, eSourceType, iSourceID);
end

-- ===========================================================================
function UpdateEffectsContainerSize()
	local newSizeY:number = Controls.ImageDescStack:GetSizeY();
	Controls.EventEffectsContainer:SetSizeY(Controls.MainContainer:GetSizeY() - newSizeY - 10);
end

-- ===========================================================================
function Subscribe()
	Events.UnitDamageChanged.Add(OnUnitDamageChanged);
	LuaEvents.NotificationPanel_HeroExpired.Add(NotificationHeroLifespanExpired);
	LuaEvents.NotificationPanel_HeroDiscovered.Add(NotificationPlayerDiscoveredHero);
end

-- ===========================================================================
function Unsubscribe()
	Events.UnitDamageChanged.Remove(OnUnitDamageChanged);
	LuaEvents.NotificationPanel_HeroExpired.Remove(NotificationHeroLifespanExpired);
	LuaEvents.NotificationPanel_HeroDiscovered.Remove(NotificationPlayerDiscoveredHero);
end

-- ===========================================================================
function OnShutdown()
	Unsubscribe();
end

-- ===========================================================================
function LateInitialize()
	Subscribe();
end

-- ===========================================================================
function Initialize()
	ContextPtr:SetInitHandler( OnInit );
	ContextPtr:SetInputHandler( OnInputHandler, true );
	ContextPtr:SetShutdown( OnShutdown );

	Controls.ContinueButton:RegisterCallback( Mouse.eLClick, OnContinueButton );
	Controls.ScreenConsumer:RegisterCallback( Mouse.eRClick, Close );
	Controls.ImageDescStack:RegisterSizeChanged( UpdateEffectsContainerSize );
end
Initialize();