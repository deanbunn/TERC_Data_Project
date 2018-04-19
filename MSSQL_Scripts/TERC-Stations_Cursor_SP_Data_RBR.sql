USE [TERC-Stations]
GO


DECLARE @cr_TmStamp datetime, 
	    @cr_RecNum bigint,
	    @cr_XR_T1 real,
	    @cr_XR_T2 real,
	    @cr_XR_T3 real,
	    @cr_XR_T4 real,
	    @cr_XR_T5 real,
	    @cr_XR_T6 real,
	    @cr_XR_T7 real,
	    @cr_XR_T8 real,
	    @cr_XR_T9 real,
	    @cr_XR_T10 real,
	    @cr_XR_T11 real,
	    @cr_XR_T12 real,
	    @cr_XR_T13 real,
	    @cr_XR_T14 real,
		@cr_XR_T15 real,
		@cr_XR_T16 real,
		@cr_XR_DO2 real,
		@cr_XR_Raw_Z real,
		@cr_XR_Batt real,
		@cr_BP_mmHg real,
		@cr_O2_uM_corr_T16 real,
		@cr_Pct_Sat_T1 real,
		@cr_O2_uM_cal_T1 real,
		@cr_Depth_m4C real,
		@cr_BP_mmHg_Avg real,
		@cr_BP_mmHgAVG real

DECLARE @D_SQL nvarchar(max);

DECLARE @nv_XR_T1 nvarchar(200),
	    @nv_XR_T2 nvarchar(200),
	    @nv_XR_T3 nvarchar(200),
	    @nv_XR_T4 nvarchar(200),
	    @nv_XR_T5 nvarchar(200),
	    @nv_XR_T6 nvarchar(200),
	    @nv_XR_T7 nvarchar(200),
	    @nv_XR_T8 nvarchar(200),
	    @nv_XR_T9 nvarchar(200),
	    @nv_XR_T10 nvarchar(200),
	    @nv_XR_T11 nvarchar(200),
	    @nv_XR_T12 nvarchar(200),
	    @nv_XR_T13 nvarchar(200),
	    @nv_XR_T14 nvarchar(200),
		@nv_XR_T15 nvarchar(200),
		@nv_XR_T16 nvarchar(200),
		@nv_XR_DO2 nvarchar(200),
		@nv_XR_Raw_Z nvarchar(200),
		@nv_XR_Batt nvarchar(200),
		@nv_BP_mmHg nvarchar(200),
		@nv_O2_uM_corr_T16 nvarchar(200),
		@nv_Pct_Sat_T1 nvarchar(200),
		@nv_O2_uM_cal_T1 nvarchar(200),
		@nv_Depth_m4C nvarchar(200),
		@nv_BP_mmHg_Avg nvarchar(200),
		@nv_BP_mmHgAVG nvarchar(200)

DECLARE ts_cursor CURSOR FOR
SELECT TmStamp,
       RecNum,
	   XR_T1,
       XR_T2,
       XR_T3,
       XR_T4,
       XR_T5,
       XR_T6,
       XR_T7,
       XR_T8,
       XR_T9,
       XR_T10,
       XR_T11,
       XR_T12,
       XR_T13,
       XR_T14,
       XR_T15,
       XR_T16,
       XR_DO2,
       XR_Raw_Z,
       XR_Batt,
       BP_mmHg,
       O2_uM_corr_T16,
       Pct_Sat_T1,
       O2_uM_cal_T1,
       Depth_m4C,
       BP_mmHg_Avg,
       BP_mmHgAVG
FROM [CR1000_Tahoe_RBR(Homewood)_LakeData]
WHERE TmStamp <= (CAST('2016-12-18 00:00:00' AS datetime))
ORDER BY TmStamp;

OPEN ts_cursor;
FETCH NEXT FROM ts_cursor 
INTO @cr_TmStamp, 
	 @cr_RecNum,
	 @cr_XR_T1,
	 @cr_XR_T2,
	 @cr_XR_T3,
	 @cr_XR_T4,
	 @cr_XR_T5,
	 @cr_XR_T6,
	 @cr_XR_T7,
	 @cr_XR_T8,
	 @cr_XR_T9,
	 @cr_XR_T10,
	 @cr_XR_T11,
	 @cr_XR_T12,
	 @cr_XR_T13,
	 @cr_XR_T14,
	 @cr_XR_T15,
     @cr_XR_T16,
     @cr_XR_DO2,
     @cr_XR_Raw_Z,
	 @cr_XR_Batt,
     @cr_BP_mmHg,
	 @cr_O2_uM_corr_T16,
	 @cr_Pct_Sat_T1,
     @cr_O2_uM_cal_T1,
	 @cr_Depth_m4C,
	 @cr_BP_mmHg_Avg,
	 @cr_BP_mmHgAVG

WHILE @@FETCH_STATUS = 0
BEGIN

	--XR_T1
	IF @cr_XR_T1 IS NULL
		BEGIN
			SELECT @nv_XR_T1 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T1 = CONVERT(NVARCHAR(200), @cr_XR_T1, 128)
		END

		--XR_T2
	IF @cr_XR_T2 IS NULL
		BEGIN
			SELECT @nv_XR_T2 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T2 = CONVERT(NVARCHAR(200), @cr_XR_T2, 128)
		END

		--XR_T3
	IF @cr_XR_T3 IS NULL
		BEGIN
			SELECT @nv_XR_T3 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T3 = CONVERT(NVARCHAR(200), @cr_XR_T3, 128)
		END

	--XR_T4
	IF @cr_XR_T4 IS NULL
		BEGIN
			SELECT @nv_XR_T4 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T4 = CONVERT(NVARCHAR(200), @cr_XR_T4, 128)
		END

	--XR_T5
	IF @cr_XR_T5 IS NULL
		BEGIN
			SELECT @nv_XR_T5 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T5 = CONVERT(NVARCHAR(200), @cr_XR_T5, 128)
		END

	--XR_T6
	IF @cr_XR_T6 IS NULL
		BEGIN
			SELECT @nv_XR_T6 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T6 = CONVERT(NVARCHAR(200), @cr_XR_T6, 128)
		END

	--XR_T7
	IF @cr_XR_T7 IS NULL
		BEGIN
			SELECT @nv_XR_T7 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T7 = CONVERT(NVARCHAR(200), @cr_XR_T7, 128)
		END

	--XR_T8
	IF @cr_XR_T8 IS NULL
		BEGIN
			SELECT @nv_XR_T8 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T8 = CONVERT(NVARCHAR(200), @cr_XR_T8, 128)
		END

	--XR_T9
	IF @cr_XR_T9 IS NULL
		BEGIN
			SELECT @nv_XR_T9 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T9 = CONVERT(NVARCHAR(200), @cr_XR_T9, 128)
		END

	--XR_T10
	IF @cr_XR_T10 IS NULL
		BEGIN
			SELECT @nv_XR_T10 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T10 = CONVERT(NVARCHAR(200), @cr_XR_T10, 128)
		END

	--XR_T11
	IF @cr_XR_T11 IS NULL
		BEGIN
			SELECT @nv_XR_T11 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T11 = CONVERT(NVARCHAR(200), @cr_XR_T11, 128)
		END

	--XR_T12
	IF @cr_XR_T12 IS NULL
		BEGIN
			SELECT @nv_XR_T12 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T12 = CONVERT(NVARCHAR(200), @cr_XR_T12, 128)
		END

	--XR_T13
	IF @cr_XR_T13 IS NULL
		BEGIN
			SELECT @nv_XR_T13 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T13 = CONVERT(NVARCHAR(200), @cr_XR_T13, 128)
		END

	--XR_T14
	IF @cr_XR_T14 IS NULL
		BEGIN
			SELECT @nv_XR_T14 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T14 = CONVERT(NVARCHAR(200), @cr_XR_T14, 128)
		END

	--XR_T15
	IF @cr_XR_T15 IS NULL
		BEGIN
			SELECT @nv_XR_T15 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T15 = CONVERT(NVARCHAR(200), @cr_XR_T15, 128)
		END

	--XR_T16
	IF @cr_XR_T16 IS NULL
		BEGIN
			SELECT @nv_XR_T16 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_T16 = CONVERT(NVARCHAR(200), @cr_XR_T16, 128)
		END

	--XR_DO2
	IF @cr_XR_DO2 IS NULL
		BEGIN
			SELECT @nv_XR_DO2 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_DO2 = CONVERT(NVARCHAR(200), @cr_XR_DO2, 128)
		END

	--XR_Raw_Z
	IF @cr_XR_Raw_Z IS NULL
		BEGIN
			SELECT @nv_XR_Raw_Z = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_Raw_Z = CONVERT(NVARCHAR(200), @cr_XR_Raw_Z, 128)
		END

	--XR_Batt
	IF @cr_XR_Batt IS NULL
		BEGIN
			SELECT @nv_XR_Batt = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_XR_Batt = CONVERT(NVARCHAR(200), @cr_XR_Batt, 128)
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

	--O2_uM_corr_T16
	IF @cr_O2_uM_corr_T16 IS NULL
		BEGIN
			SELECT @nv_O2_uM_corr_T16 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_O2_uM_corr_T16 = CONVERT(NVARCHAR(200), @cr_O2_uM_corr_T16, 128)
		END

	--Pct_Sat_T1
	IF @cr_Pct_Sat_T1 IS NULL
		BEGIN
			SELECT @nv_Pct_Sat_T1 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Pct_Sat_T1 = CONVERT(NVARCHAR(200), @cr_Pct_Sat_T1, 128)
		END

	--O2_uM_cal_T1
	IF @cr_O2_uM_cal_T1 IS NULL
		BEGIN
			SELECT @nv_O2_uM_cal_T1 = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_O2_uM_cal_T1 = CONVERT(NVARCHAR(200), @cr_O2_uM_cal_T1, 128)
		END

	--Depth_m4C
	IF @cr_Depth_m4C IS NULL
		BEGIN
			SELECT @nv_Depth_m4C = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_Depth_m4C = CONVERT(NVARCHAR(200), @cr_Depth_m4C, 128)
		END

	--BP_mmHg_Avg
	IF @cr_BP_mmHg_Avg IS NULL
		BEGIN
			SELECT @nv_BP_mmHg_Avg = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_BP_mmHg_Avg = CONVERT(NVARCHAR(200), @cr_BP_mmHg_Avg, 128)
		END

	--BP_mmHgAVG
	IF @cr_BP_mmHgAVG IS NULL
		BEGIN
			SELECT @nv_BP_mmHgAVG = 'NULL'
		END
	ELSE
		BEGIN
			SELECT @nv_BP_mmHgAVG = CONVERT(NVARCHAR(200), @cr_BP_mmHgAVG, 128)
		END


	SELECT @D_SQL = 'CALL sp_insert_cr1000_tahoe_rbr_homewood_lakedata(''' + CONVERT(nvarchar, @cr_TmStamp, 120) + ''',' 
					 + CAST(@cr_RecNum AS nvarchar) + ','
					 + @nv_XR_T1 + ','
					 + @nv_XR_T2 + ','
					 + @nv_XR_T3 + ','
					 + @nv_XR_T4 + ','
					 + @nv_XR_T5 + ','
					 + @nv_XR_T6 + ','
					 + @nv_XR_T7 + ','
					 + @nv_XR_T8 + ','
					 + @nv_XR_T9 + ','
					 + @nv_XR_T10 + ','
					 + @nv_XR_T11 + ','
					 + @nv_XR_T12 + ','
					 + @nv_XR_T13 + ','
					 + @nv_XR_T14 + ','
					 + @nv_XR_T15 + ','
					 + @nv_XR_T16 + ','
					 + @nv_XR_DO2 + ','
				     + @nv_XR_Raw_Z + ','
				     + @nv_XR_Batt + ','
				     + @nv_BP_mmHg + ','
				     + @nv_O2_uM_corr_T16 + ','
					 + @nv_Pct_Sat_T1 + ','
				     + @nv_O2_uM_cal_T1 + ','
					 + @nv_Depth_m4C + ','
					 + @nv_BP_mmHg_Avg + ','
					 + @nv_BP_mmHgAVG 
					 + ');';


	INSERT INTO TERCExport(terccmd)
	VALUES(@D_SQL);

	FETCH NEXT FROM ts_cursor 
	INTO @cr_TmStamp, 
	 @cr_RecNum,
	 @cr_XR_T1,
	 @cr_XR_T2,
	 @cr_XR_T3,
	 @cr_XR_T4,
	 @cr_XR_T5,
	 @cr_XR_T6,
	 @cr_XR_T7,
	 @cr_XR_T8,
	 @cr_XR_T9,
	 @cr_XR_T10,
	 @cr_XR_T11,
	 @cr_XR_T12,
	 @cr_XR_T13,
	 @cr_XR_T14,
	 @cr_XR_T15,
     @cr_XR_T16,
     @cr_XR_DO2,
     @cr_XR_Raw_Z,
	 @cr_XR_Batt,
     @cr_BP_mmHg,
	 @cr_O2_uM_corr_T16,
	 @cr_Pct_Sat_T1,
     @cr_O2_uM_cal_T1,
	 @cr_Depth_m4C,
	 @cr_BP_mmHg_Avg,
	 @cr_BP_mmHgAVG;

END;
CLOSE ts_cursor;
DEALLOCATE ts_cursor;


print 'all done';
