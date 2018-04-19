USE TERC;

DELIMITER //

CREATE PROCEDURE sp_insert_cr1000_ns_camp_richardson_modem_lakedata(IN ld_tmstamp varchar(200), 
                                                               IN ld_recnum bigint, 
                                                               IN ld_ls_conductivity_avg real,
                                                               IN ld_ls_temp_avg real,
                                                               IN ld_ls_rawpressure_avg real,
                                                               IN ld_ls_do_avg real,
                                                               IN ld_ls_chlorophyll_avg real,
                                                               IN ld_ls_cdom_avg real,
                                                               IN ld_ls_turbidity_avg real,
                                                               IN ld_lakesensor_battv_min real,
                                                               IN ld_bp_mmhg real,
                                                               IN ld_depth_m4c_avg real,
                                                               IN ld_depth_m4c_max real,
                                                               IN ld_depth_m4c_min real,
                                                               IN ld_waveheight real,
                                                               IN ld_conductivity25c_avg real,
                                                               IN ld_ls_do_conc real,
                                                               IN ld_ls_do_probetemp_avg real)
BEGIN

    DECLARE d_date datetime;
    
    SET d_date = str_to_date(ld_tmstamp,'%Y-%m-%d %H:%i:%s');
    
		INSERT INTO CR1000_NS_Camp_Richardson_Modem_LakeData(TmStamp,
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
                                                    Conductivity25C_Avg,
                                                    LS_DO_Conc_Avg,
                                                    LS_DO_ProbeTemp_Avg)
		VALUES (d_date,
				ld_recnum,
                ld_ls_conductivity_avg,
                ld_ls_temp_avg,
                ld_ls_rawpressure_avg,
                ld_ls_do_avg,
                ld_ls_chlorophyll_avg,
                ld_ls_cdom_avg,
                ld_ls_turbidity_avg,
                ld_lakesensor_battv_min,
                ld_bp_mmhg,
                ld_depth_m4c_avg,
                ld_depth_m4c_max,
                ld_depth_m4c_min,
                ld_waveheight,
                ld_conductivity25c_avg,
                ld_ls_do_conc,
                ld_ls_do_probetemp_avg);
        
	
END //
DELIMITER ;