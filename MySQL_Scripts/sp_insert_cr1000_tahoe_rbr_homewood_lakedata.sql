USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_cr1000_tahoe_rbr_homewood_lakedata(IN ld_tmstamp varchar(200), 
																 IN ld_recnum bigint, 
                                                                 IN ld_xr_t1 real,
                                                                 IN ld_xr_t2 real,
                                                                 IN ld_xr_t3 real,
                                                                 IN ld_xr_t4 real,
                                                                 IN ld_xr_t5 real,
                                                                 IN ld_xr_t6 real,
                                                                 IN ld_xr_t7 real,
                                                                 IN ld_xr_t8 real,
                                                                 IN ld_xr_t9 real,
                                                                 IN ld_xr_t10 real,
                                                                 IN ld_xr_t11 real,
                                                                 IN ld_xr_t12 real,
                                                                 IN ld_xr_t13 real,
                                                                 IN ld_xr_t14 real,
                                                                 IN ld_xr_t15 real,
                                                                 IN ld_xr_t16 real,
                                                                 IN ld_xr_DO2 real,
                                                                 IN ld_xr_raw_Z real,
                                                                 IN ld_xr_batt real,
                                                                 IN ld_bp_mmhg real,
                                                                 IN ld_o2_um_corr_t16 real,
                                                                 IN ld_pct_sat_t1 real,
                                                                 IN ld_o2_um_cal_t1 real,
                                                                 IN ld_depth_m4c real,
                                                                 IN ld_bp_mmhg_avg real,
                                                                 IN ld_bp_mmhgavg real)
BEGIN

	DECLARE d_dupcnt int;
    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
    SET d_dupcnt = (SELECT COUNT(*) FROM CR1000_Tahoe_RBR_Homewood_LakeData WHERE TmStamp = d_date);
    
    IF d_dupcnt = 0 THEN
    
		INSERT INTO CR1000_Tahoe_RBR_Homewood_LakeData(TmStamp,
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
                                                    BP_mmHgAVG)
		VALUES (d_date,
				ld_recnum,
                ld_xr_t1,
				ld_xr_t2,
				ld_xr_t3,
				ld_xr_t4,
			    ld_xr_t5,
				ld_xr_t6,
				ld_xr_t7,
				ld_xr_t8,
				ld_xr_t9,
				ld_xr_t10,
				ld_xr_t11,
				ld_xr_t12,
				ld_xr_t13,
				ld_xr_t14,
				ld_xr_t15,
				ld_xr_t16,
				ld_xr_DO2,
				ld_xr_raw_Z,
				ld_xr_batt,
				ld_bp_mmhg,
				ld_o2_um_corr_t16,
				ld_pct_sat_t1,
				ld_o2_um_cal_t1,
				ld_depth_m4c,
				ld_bp_mmhg_avg,
				ld_bp_mmhgavg);
        
	END IF;


END //
DELIMITER ;