-- Copyright 2020, Firaxis Games
-- Helper functions for Heroes Mode UI
include( "UnitSupport" );

-- ===========================================================================
--	Stats
-- ===========================================================================
function GetHeroUnitStats( eHeroClass:number )

	if eHeroClass == -1 then
		return {};
	end
	
	local pHeroInfo:table = GameInfo.HeroClasses[eHeroClass];
	if (pHeroInfo == nil) then
		return {};
	end

	local pUnitInfo:table = GameInfo.Units[pHeroInfo.UnitType];
	if (pUnitInfo == nil) then
		UI.DataError("HeroesSupport could not find UnitType info for HeroClass: '"..tostring(eHeroClass));
		return {};
	end

	local eCurrentEra:number = Support_GetCurrentEra();
	local pEraInfo:table = GameInfo.Eras[eCurrentEra];
	if (pEraInfo == nil) then
		UI.DataError("HeroesSupport could not find current Era info: '"..tostring(eCurrentEra));
		return {};
	end

	-- Base stats
	local tStats:table = {};
	tStats.Combat = pUnitInfo.Combat;
	tStats.RangedCombat = pUnitInfo.RangedCombat;
	tStats.Range = pUnitInfo.Range;
	tStats.BaseMoves = pUnitInfo.BaseMoves;
	tStats.Lifespan = UnitManager.GetUnitTypeBaseLifespan(pUnitInfo.Index);

	-- Progressive stats: select these by era
	local tProgressionResults:table = DB.Query("SELECT * FROM HeroClassProgressions WHERE HeroClassType = '".. pHeroInfo.HeroClassType .. "' and EraType = '" .. pEraInfo.EraType .. "' LIMIT 1");
	if (tProgressionResults ~= nil and #tProgressionResults > 0) then
		tStats.Combat = tProgressionResults[1].CombatStrength;
		tStats.RangedCombat = tProgressionResults[1].RangedCombatStrength;
	end

	local pGameHeroes:object = Game.GetHeroesManager();
	if pGameHeroes then
		tStats.Charges = pGameHeroes:GetHeroClassBaseCharges(eHeroClass);
	end

	return tStats;
end

-- ===========================================================================
--	Abilities and Commands
-- ===========================================================================
function FormatHeroClassAbilitiesAndCommands( eHeroClass:number )

	local pAbilities:table = GetHeroClassUnitAbilities(eHeroClass);
	local pCommands:table = GetHeroClassUnitCommands(eHeroClass);

	if (#pAbilities == 0 and #pCommands == 0) then
		return "";
	end

	local sResultString:string = "";

	for i,row in ipairs(pAbilities) do
		local sRowString:string = Locale.Lookup(row.Name) .. ": " .. Locale.Lookup(row.Description);
		if (sResultString ~= "") then 
			sRowString = "[NEWLINE]" .. sRowString 
		end;
		sResultString = sResultString .. sRowString;
	end

	for i,row in ipairs(pCommands) do
		local sRowString:string = Locale.Lookup(row.Name) .. ": " .. Locale.Lookup(row.Description);
		if (sResultString ~= "") then 
			sRowString = "[NEWLINE]" .. sRowString 
		end;
		sResultString = sResultString .. sRowString;
	end

	return sResultString;
end

-- ===========================================================================
function GetHeroClassUnitAbilities( eHeroClass:number )
	print("eHeroClass is:");
	print(eHeroClass);
	if eHeroClass == -1 then
		return {};
	end
	local pHeroInfo:table = GameInfo.HeroClasses[eHeroClass];
	print("pHeroInfo.HeroClassType is:");
	print(pHeroInfo.HeroClassType);
	if (pHeroInfo == nil) then
		return {};
	end

	local pHeroClassAbilities = GameInfo.HeroClassAbilities[pHeroInfo.HeroClassType];
	if (pHeroClassAbilities == nil or pHeroClassAbilities.UnitAbilityTypes == nil) then
		return {};
	end
	print("pHeroClassAbilities.UnitAbilityTypes is:");
	print(pHeroClassAbilities.UnitAbilityTypes);
	local pResultAbilities:table = {};
	local abilityTypes = string.gmatch(pHeroClassAbilities.UnitAbilityTypes, '([^,]+)')
	if (abilityTypes ~= nil) then
		for abilityType in abilityTypes do
			print("abilityType is:");
			print(abilityType);
			local pAbility = GameInfo.UnitAbilities[abilityType];
			if (pAbility ~= nil) then

				local pAbilityData:table = {};
				pAbilityData.Icon = ""; -- TODO
				pAbilityData.Name = pAbility.Name;

				local sDesc:string = GetUnitAbilityDescription(pAbility.Index);
				if (sDesc ~= nil and sDesc ~= "") then
					pAbilityData.Description = sDesc;
				end

				table.insert(pResultAbilities, pAbilityData);
			end
		end
	end

	return pResultAbilities;
end

-- ===========================================================================
function GetHeroClassUnitCommands( eHeroClass:number )

	if eHeroClass == -1 then
		return {};
	end
	local pHeroInfo:table = GameInfo.HeroClasses[eHeroClass];
	if (pHeroInfo == nil) then
		return {};
	end

	local pResultCommands:table = {};
	for row in GameInfo.HeroClassUnitCommands() do
		if (row.HeroClassType == pHeroInfo.HeroClassType) then

			local pUnitCommand:table = GameInfo.UnitCommands[row.UnitCommandType];
			if (pUnitCommand ~= nil) then

				local pCommandData:table = {};
				pCommandData.Icon = pUnitCommand.Icon;
				pCommandData.Name = pUnitCommand.Description;
				pCommandData.Description = UnitManager.GetCommandHelpText(pUnitCommand.Hash, Game.GetLocalPlayer());
				table.insert(pResultCommands, pCommandData);
			end
		end
	end

	return pResultCommands;
end

-- ===========================================================================
--	Helpers
-- ===========================================================================
function Support_GetCurrentEra()
	-- Era system changed between BASE and XP1
	-- XP1+...
	if (Game.GetEras ~= nil) then
		return Game.GetEras():GetCurrentEra();
	end

	-- BASE
	local pPlayer = Players[Game.GetLocalPlayer()];
	if (pPlayer ~= nil) then
		return pPlayer:GetEra();
	end

	-- FAILSAFE
	return EraTypes.ERA_ANCIENT;
end