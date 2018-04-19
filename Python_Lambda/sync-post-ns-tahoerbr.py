import pymysql
import rds_config

#Var for RDS Connection
rds_dbhost = rds_config.db_host
rds_dbname = rds_config.db_name
rds_dbuser = rds_config.db_username
rds_dbpwd = rds_config.db_password

#Make Connection to RDS Instance
tercdbcon = pymysql.connect(rds_dbhost, user=rds_dbuser, passwd=rds_dbpwd, db=rds_dbname, connect_timeout=5)

def handler(event,context):

    #Var for Return Status
    rtn_status = ""

    #Establish DB Cursor
    tercdbcr = tercdbcon.cursor()

    if(event['TSReadings'] and len(event['TSReadings']) > 0):

        for trStat in event['TSReadings']:

            #Var for Stored Procedure Call
            tercsp = ("CALL sp_insert_cr1000_tahoe_rbr_homewood_lakedata('" +
                        trStat['TmStamp'] + "'," +
                        trStat['RecNum'] + "," +
                        trStat['XR_T1'] + "," +
                        trStat['XR_T2'] + "," +
                        trStat['XR_T3'] + "," +
                        trStat['XR_T4'] + "," +
                        trStat['XR_T5'] + "," +
                        trStat['XR_T6'] + "," +
                        trStat['XR_T7'] + "," +
                        trStat['XR_T8'] + "," +
                        trStat['XR_T9'] + "," +
                        trStat['XR_T10'] + "," +
                        trStat['XR_T11'] + "," +
                        trStat['XR_T12'] + "," +
                        trStat['XR_T13'] + "," +
                        trStat['XR_T14'] + "," +
                        trStat['XR_T15'] + "," +
                        trStat['XR_T16'] + "," +
                        trStat['XR_DO2'] + "," +
                        trStat['XR_Raw_Z'] + "," +
                        trStat['XR_Batt'] + "," +
                        trStat['BP_mmHg'] + "," +
                        trStat['O2_uM_corr_T16'] + "," +
                        trStat['Pct_Sat_T1'] + "," +
                        trStat['O2_uM_cal_T1'] + "," +
                        trStat['Depth_m4C'] + "," +
                        trStat['BP_mmHg_Avg'] + "," +
                        trStat['BP_mmHgAVG'] + ")")
               

    
            #Call SP for Reporting
            tercdbcr.execute(tercsp) 
            tercdbcon.commit()






    #Update Return Status
    rtn_status = "Success"

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rtn_status






