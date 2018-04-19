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
            tercsp = ("CALL sp_insert_met_station_rawdata('" +
			trStat['Station_ID'] + "','" +
			trStat['RD_Date_Time_UTC'] + "'," +
			trStat['RD_Date_Time_POSIX'] + "," +
			trStat['RD_Year'] + "," +
			trStat['RD_Julian_Day'] + "," +
			trStat['RD_Time'] + "," +
			trStat['Wind_Spd1'] + "," +
			trStat['Wind_Spd2'] + "," +
			trStat['Wind_Dir'] + "," +
			trStat['Wind_Dir_SD'] + "," + 
			trStat['GUST'] + "," +
                        trStat['Air_Temp'] + "," +
			trStat['Air_Temp_SD'] + "," +
			trStat['RH'] + "," +
			trStat['RH_SD'] + "," +
			trStat['Atm_Pres'] + "," +
			trStat['Atm_Pres_SD'] + "," +
			trStat['Precip'] + "," +
			trStat['Raft_Dir'] + "," +
			trStat['Water_Temp'] + "," +
			trStat['Water_Temp_SD'] + "," +
			trStat['BATT'] + "," +
			trStat['RD_Note'] + "," +
			trStat['RD_Station_ID'] + ")")
               
            #Call SP for Reporting
            tercdbcr.execute(tercsp) 
            tercdbcon.commit()







    #Update Return Status
    rtn_status = "Success"

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rtn_status






