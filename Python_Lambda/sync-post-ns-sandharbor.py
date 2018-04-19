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
            tercsp = ("CALL sp_insert_cr1000_ns_sand_harbor_modem_lakedata('" +
                        trStat['TmStamp'] + "'," +
                        trStat['RecNum'] + "," +
                        trStat['LS_Conductivity_Avg'] + "," +
                        trStat['LS_Temp_Avg'] + "," +
                        trStat['LS_RawPressure_Avg'] + "," +
                        trStat['LS_DO_Avg'] + "," +
                        trStat['LS_Chlorophyll_Avg'] + "," +
                        trStat['LS_CDOM_Avg'] + "," +
                        trStat['LS_Turbidity_Avg'] + "," +
                        trStat['LakeSensor_BattV_Min'] + "," + 
                        trStat['BP_mmHg'] + "," +
                        trStat['Depth_m4C_Avg'] + "," +
                        trStat['Depth_m4C_Max'] + "," +
                        trStat['Depth_m4C_Min'] + "," +
                        trStat['WaveHeight'] + "," +
                        trStat['Conductivity25C_Avg'] + ")")
               
            #Call SP for Reporting
            tercdbcr.execute(tercsp) 
            tercdbcon.commit()







    #Update Return Status
    rtn_status = "Success"

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rtn_status






