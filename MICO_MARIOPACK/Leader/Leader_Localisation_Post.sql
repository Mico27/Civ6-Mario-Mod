/*
	Post Localisation
	Authors: Mico
*/

---------------------------------------------------------
-- DUPLICATE LANDSCAPE PAINTERS
---------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Text)
SELECT Language, Tag || '_MICO_COPY', Text || ' ? ' 
FROM LocalizedText WHERE Tag LIKE 'LOC_GREAT_PERSON_INDIVIDUAL_%' AND Tag LIKE '%_NAME';


----------------------------------------------------------
-- Generalize this tooltip
----------------------------------------------------------

UPDATE LocalizedText 
SET Text = '{Value : number +#;-#}% ({ActualValue : number +#.#;-#.#}) from [ICON_Governor] Governor with {1} {1 : plural 1?Promotion; other?Promotions;}' 
WHERE Language = 'en_US' AND Tag = 'LOC_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE_TOOLTIP';