USE [TERC-Stations]
GO


--BP_mmHg_Avg,
--       BP_mmHgAVG

--SELECT TmStamp FROM [CR1000_Tahoe_RBR(Homewood_IP)_LakeData]
--ORDER BY TmStamp desc

--SELECT TmStamp FROM [CR1000_Tahoe_RBR(Homewood)_LakeData]
--ORDER BY TmStamp desc

SELECT terccmd FROM TERCExport

--TRUNCATE TABLE TERCExport