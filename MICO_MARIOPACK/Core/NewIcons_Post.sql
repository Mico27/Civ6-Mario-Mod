/*
	Civilization Icons
	Authors: Mico
*/
---------------------------------------------------------
-- DUPLICATE LANDSCAPE PAINTERS
---------------------------------------------------------

INSERT INTO IconDefinitions (Name, Atlas, 'Index') 
SELECT Name || '_MICO_COPY',  Atlas, [Index] 
FROM IconDefinitions WHERE Name LIKE 'ICON_GREATWORK_%' AND Name NOT LIKE '%_MICO_COPY';