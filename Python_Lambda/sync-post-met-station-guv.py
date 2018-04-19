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
            tercsp = ("CALL sp_insert_met_guv_rawdata('" +
			trStat['RD_Date_Time_UTC'] + "'," +
			trStat['RD_Date_Time_POSIX'] + "," +
			trStat['Ed0Gnd'] + "," +
			trStat['Ed0305'] + "," +
			trStat['Ed0313'] + "," +
			trStat['Ed0320'] + "," +
			trStat['Ed0340'] + "," +
			trStat['Ed0380'] + "," +
			trStat['Ed0395'] + "," + 
			trStat['Ed0PAR'] + "," +
                        trStat['Ed0Temp'] + "," +
			trStat['Ed0Vin'] + "," +
			trStat['NumberSampled'] + ")")
               
            #Call SP for Reporting
            tercdbcr.execute(tercsp) 
            tercdbcon.commit()







    #Update Return Status
    rtn_status = "Success"

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rtn_status






