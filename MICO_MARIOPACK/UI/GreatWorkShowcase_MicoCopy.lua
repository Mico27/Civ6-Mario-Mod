-- ===========================================================================
-- CACHE BASE FUNCTIONS
-- ===========================================================================
local BASE_HandleCustomGreatWorkTypes = HandleCustomGreatWorkTypes;

local PADDING_BANNER:number = 120;
local SIZE_BANNER_MIN:number = 506;
local SIZE_MAX_IMAGE_HEIGHT:number = 467;

-- ===========================================================================
function HandleCustomGreatWorkTypes( greatWorkType:string, greatWorkIndex:number )
	local originalGreatWorkType = nil;
	for row in GameInfo.Mico_Duplicate_GreatWorks() do
		if (greatWorkType == row.GreatWorkDuplicateType) then
			originalGreatWorkType = row.GreatWorkType;
			break;
		end  
	end 
	if (originalGreatWorkType == nil) then
		return BASE_HandleCustomGreatWorkTypes(greatWorkType, greatWorkIndex);
	end
	local greatWorkInfo = GameInfo.GreatWorks[greatWorkType];
	local greatWorkTexture:string = originalGreatWorkType:gsub("GREATWORK_", "");
	Controls.GreatWorkImage:SetOffsetY(-40);
	Controls.GreatWorkImage:SetTexture(greatWorkTexture);
	Controls.GreatWorkName:SetText(Locale.ToUpper(Locale.Lookup(greatWorkInfo.Name)));
	local nameSize:number = Controls.GreatWorkName:GetSizeX() + PADDING_BANNER;
	local bannerSize:number = math.max(nameSize, SIZE_BANNER_MIN);
	Controls.GreatWorkBanner:SetSizeX(bannerSize);
	Controls.GreatWorkBanner:SetHide(false);

	local imageHeight:number = Controls.GreatWorkImage:GetSizeY();
	if imageHeight > SIZE_MAX_IMAGE_HEIGHT then
		heightAdjustment = SIZE_MAX_IMAGE_HEIGHT - imageHeight;
	end

	local greatPerson = GameInfo.GreatPersonIndividuals[greatWorkInfo.GreatPersonIndividualType];
	local creatorName  = Locale.Lookup(greatPerson.Name);
	Controls.CreatedBy:SetText(Locale.Lookup("LOC_GREAT_WORKS_CREATED_BY", creatorName));

	return true;
end