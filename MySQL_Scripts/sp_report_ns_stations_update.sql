USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_ns_stations_update(IN rpt_ts_id int, 
                                              IN rpt_tmstamp datetime, 
											  IN rpt_recnum bigint, 
											  IN rpt_ls_conductivity_avg real,
											  IN rpt_ls_temp_avg real,
											  IN rpt_ls_rawpressure_avg real,
											  IN rpt_ls_chlorophyll_avg real,
											  IN rpt_ls_cdom_avg real,
											  IN rpt_ls_turbidity_avg real,
											  IN rpt_lakesensor_battv_min real,
											  IN rpt_bp_mmhg real,
											  IN rpt_depth_m4c_avg real,
											  IN rpt_depth_m4c_max real,
											  IN rpt_depth_m4c_min real,
											  IN rpt_waveheight real,
											  IN rpt_conductivity25c_avg real,
                                              IN rpt_ls_do_avg real)

BEGIN

    UPDATE NS_Stations_Latest_Rpt
    SET TmStamp = rpt_tmstamp,
        LS_Conductivity_Avg = rpt_ls_conductivity_avg,
        LS_Temp_Avg = rpt_ls_temp_avg,
        LS_RawPressure_Avg = rpt_ls_rawpressure_avg,
        LS_Chlorophyll_Avg = rpt_ls_chlorophyll_avg,
        LS_CDOM_Avg = rpt_ls_cdom_avg,
        LS_Turbidity_Avg = rpt_ls_turbidity_avg,
        LakeSensor_BattV_Min = rpt_lakesensor_battv_min,
        BP_mmHg = rpt_bp_mmhg,
        Depth_m4C_Avg = rpt_depth_m4c_avg,
        Depth_m4C_Max = rpt_depth_m4c_max,
        Depth_m4C_Min = rpt_depth_m4c_min,
        WaveHeight = rpt_waveheight,
        Conductivity25C_Avg = rpt_conductivity25c_avg,
        LS_DO_Avg = rpt_ls_do_avg
	WHERE ts_id = rpt_ts_id;
    
END //
DELIMITER ;