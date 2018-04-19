USE [TERC-Stations]
GO


--SELECT TmStamp
--FROM [CR1000 - NS Cascade Wifi_LakeData_arch1]
--ORDER BY TmStamp;

DECLARE @D_SQL nvarchar(max);

SELECT @D_SQL = 'SELECT * 
                 FROM OPENQUERY(TERC,''

					SELECT COUNT(*)
					FROM CR1000_NS_Cascade_Wifi_LakeData
					ORDER By TmStamp
					

				 '')';

EXEC sp_executesql @D_SQL;