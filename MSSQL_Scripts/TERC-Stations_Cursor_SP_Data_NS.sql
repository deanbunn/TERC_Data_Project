USE [TERC-Stations]
GO

DECLARE @cr_TmStamp datetime, 
	    @cr_RecNum bigint,
	    @cr_LS_Conductivity_Avg real,
	    @cr_LS_Temp_Avg real,
	    @cr_LS_RawPressure_Avg real,
	    @cr_LS_DO_Avg real,
	    @cr_LS_Chlorophyll_Avg real,
	    @cr_LS_CDOM_Avg real,
	    @cr_LS_Turbidity_Avg real,
	    @cr_LakeSensor_BattV_Min real,
	    @cr_BP_mmHg real,
	    @cr_Depth_m4C_Avg real,
	    @cr_Depth_m4C_Max real,
	    @cr_Depth_m4C_Min real,
	    @cr_WaveHeight real,
	    @cr_Conductivity25C_Avg real

DECLARE @D_SQL nvarchar(max);

DECLARE @nv_LS_Conductivity_Avg nvarchar(200),
	    @nv_LS_Temp_Avg nvarchar(200),
	    @nv_LS_RawPressure_Avg nvarchar(200),
	    @nv_LS_DO_Avg nvarchar(200),
	    @nv_LS_Chlorophyll_Avg nvarchar(200),
	    @nv_LS_CDOM_Avg nvarchar(200),
	    @nv_LS_Turbidity_Avg nvarchar(200),
	    @nv_LakeSensor_BattV_Min nvarchar(200),
	    @nv_BP_mmHg nvarchar(200),
	    @nv_Depth_m4C_Avg nvarchar(200),
	    @nv_Depth_m4C_Max nvarchar(200),
	    @nv_Depth_m4C_Min nvarchar(200),
	    @nv_WaveHeight nvarchar(200),
	    @nv_Conductivity25C_Avg nvarchar(200)

DECLARE ts_cursor CURSOR FOR
SELECT TmStamp,
       RecNum,
	   LS_Conductivity_Avg,
	   LS_Temp_Avg,
	   LS_RawPressure_Avg,
	   LS_DO_Avg,
	   LS_Chlorophyll_Avg,
	   LS_CDOM_Avg,
	   LS_Turbidity_Avg,
	   LakeSensor_BattV_Min,
	   BP_mmHg,
	   Depth_m4C_Avg,
	   Depth_m4C_Max,
	   Depth_m4C_Min,
	   WaveHeight,
	   Conductivity25C_Avg
FROM [CR1000 - NS Tahoe Vista Modem_LakeData]
WHERE TmStamp <= (CAST('2016-12-18 00:00:00' AS datetime))
ORDER BY TmStamp;

OPEN ts_cursor;
FETCH NEXT FROM ts_cursor 
INTO @cr_TmStamp, 
	 @cr_RecNum,
	 @cr_LS_Conductivity_Avg,
	 @cr_LS_Temp_Avg,
	 @cr_LS_RawPressure_Avg,
	 @cr_LS_DO_Avg,
	 @cr_LS_Chlorophyll_Avg,
	 @cr_LS_CDOM_Avg,
	 @cr_LS_Turbidity_Avg,
	 @cr_LakeSensor_BattV_Min,
	 @cr_BP_mmHg,
	 @cr_Depth_m4C_Avg,
	 @cr_Depth_m4C_Max,
	 @cr_Depth_m4C_Min,
	 @cr_WaveHeight,
	 @cr_Conductivity25C_Avg;

WHILE @@FETCH_STATUS = 0
BEGIN

	--LS_Conductivity_Avg
	IF @cr_LS_Conductivity_Avg IS NULL
		BEGIN
			SELECT @nv_LS_Conductivity_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_Conductivity_Avg = CONVERT(NVARCHAR(200), @cr_LS_Conductivity_Avg, 128)
		END

		--LS_Temp_Avg
	IF @cr_LS_Temp_Avg IS NULL
		BEGIN
			SELECT @nv_LS_Temp_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_Temp_Avg = CONVERT(NVARCHAR(200), @cr_LS_Temp_Avg, 128)
		END

		--LS_RawPressure_Avg
	IF @cr_LS_RawPressure_Avg IS NULL
		BEGIN
			SELECT @nv_LS_RawPressure_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_RawPressure_Avg = CONVERT(NVARCHAR(200), @cr_LS_RawPressure_Avg, 128)
		END

		--LS_DO_Avg
	IF @cr_LS_DO_Avg IS NULL
		BEGIN
			SELECT @nv_LS_DO_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_DO_Avg = CONVERT(NVARCHAR(200), @cr_LS_DO_Avg, 128)
		END

	--LS_Chlorophyll_Avg
	IF @cr_LS_Chlorophyll_Avg IS NULL
		BEGIN
			SELECT @nv_LS_Chlorophyll_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_Chlorophyll_Avg = CONVERT(NVARCHAR(200), @cr_LS_Chlorophyll_Avg, 128)
		END

	--LS_CDOM_Avg
	IF @cr_LS_CDOM_Avg IS NULL
		BEGIN
			SELECT @nv_LS_CDOM_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_CDOM_Avg = CONVERT(NVARCHAR(200), @cr_LS_CDOM_Avg, 128)
		END

	--LS_Turbidity_Avg
	IF @cr_LS_Turbidity_Avg IS NULL
		BEGIN
			SELECT @nv_LS_Turbidity_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LS_Turbidity_Avg = CONVERT(NVARCHAR(200), @cr_LS_Turbidity_Avg, 128)
		END

	--LakeSensor_BattV_Min
	IF @cr_LakeSensor_BattV_Min IS NULL
		BEGIN
			SELECT @nv_LakeSensor_BattV_Min = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_LakeSensor_BattV_Min = CONVERT(NVARCHAR(200), @cr_LakeSensor_BattV_Min, 128)
		END

	--BP_mmHg
	IF @cr_BP_mmHg IS NULL
		BEGIN
			SELECT @nv_BP_mmHg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_BP_mmHg = CONVERT(NVARCHAR(200), @cr_BP_mmHg, 128)
		END

	--Depth_m4C_Avg
	IF @cr_Depth_m4C_Avg IS NULL
		BEGIN
			SELECT @nv_Depth_m4C_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Depth_m4C_Avg = CONVERT(NVARCHAR(200), @cr_Depth_m4C_Avg, 128)
		END

	--Depth_m4C_Max
	IF @cr_Depth_m4C_Max IS NULL
		BEGIN
			SELECT @nv_Depth_m4C_Max = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Depth_m4C_Max = CONVERT(NVARCHAR(200), @cr_Depth_m4C_Max, 128)
		END

	--Depth_m4C_Min
	IF @cr_Depth_m4C_Min IS NULL
		BEGIN
			SELECT @nv_Depth_m4C_Min = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Depth_m4C_Min = CONVERT(NVARCHAR(200), @cr_Depth_m4C_Min, 128)
		END

	--WaveHeight
	IF @cr_WaveHeight IS NULL
		BEGIN
			SELECT @nv_WaveHeight = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_WaveHeight = CONVERT(NVARCHAR(200), @cr_WaveHeight, 128)
		END

	--Conductivity25C_Avg
	IF @cr_Conductivity25C_Avg IS NULL
		BEGIN
			SELECT @nv_Conductivity25C_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Conductivity25C_Avg = CONVERT(NVARCHAR(200), @cr_Conductivity25C_Avg, 128)
		END

	SELECT @D_SQL = 'CALL sp_insert_cr1000_ns_tahoe_vista_modem_lakedata(''' + CONVERT(nvarchar, @cr_TmStamp, 120) + ''',' 
					 + CAST(@cr_RecNum AS nvarchar) + ','
					 + @nv_LS_Conductivity_Avg + ','
					 + @nv_LS_Temp_Avg + ','
					 + @nv_LS_RawPressure_Avg + ','
					 + @nv_LS_DO_Avg + ','
					 + @nv_LS_Chlorophyll_Avg + ','
					 + @nv_LS_CDOM_Avg + ','
					 + @nv_LS_Turbidity_Avg + ','
					 + @nv_LakeSensor_BattV_Min + ','
					 + @nv_BP_mmHg + ','
					 + @nv_Depth_m4C_Avg + ','
					 + @nv_Depth_m4C_Max + ','
					 + @nv_Depth_m4C_Min + ','
					 + @nv_WaveHeight + ','
					 + @nv_Conductivity25C_Avg 
					 + ');';

	INSERT INTO TERCExport(terccmd)
	VALUES(@D_SQL);

	FETCH NEXT FROM ts_cursor 
	INTO @cr_TmStamp, 
	 @cr_RecNum,
	 @cr_LS_Conductivity_Avg,
	 @cr_LS_Temp_Avg,
	 @cr_LS_RawPressure_Avg,
	 @cr_LS_DO_Avg,
	 @cr_LS_Chlorophyll_Avg,
	 @cr_LS_CDOM_Avg,
	 @cr_LS_Turbidity_Avg,
	 @cr_LakeSensor_BattV_Min,
	 @cr_BP_mmHg,
	 @cr_Depth_m4C_Avg,
	 @cr_Depth_m4C_Max,
	 @cr_Depth_m4C_Min,
	 @cr_WaveHeight,
	 @cr_Conductivity25C_Avg;

END;
CLOSE ts_cursor;
DEALLOCATE ts_cursor;


print 'all done';
