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
            tercsp = ("CALL sp_insert_nasa_tb_data(" +
                        trStat['TB_ID'] + ",'" +
                        trStat['TB_Name'] + "','" +
                        trStat['TmStamp'] + "','" +
                        trStat['Date_RD'] + "','" +
                        trStat['Time_RD'] + "'," +
                        trStat['RBR_5p5_m'] + "," +
                        trStat['RBR_5p0_m'] + "," +
                        trStat['RBR_4p0_m'] + "," +
                        trStat['RBR_3p0_m'] + "," +
                        trStat['RBR_2p0_m'] + "," +
                        trStat['RBR_1p5_m'] + "," +
                        trStat['RBR_1p0_m'] + "," + 
                        trStat['RBR_0p5_m'] + "," +
                        trStat['WindSpeed_1'] + "," +
                        trStat['WindDir_1'] + "," +
                        trStat['Compass_1'] + "," +
                        trStat['AirTemp_1'] + "," +
                        trStat['RH_1'] + "," +
                        trStat['Pressure_1'] + "," +
                        trStat['WindSpeed_2'] + "," +
                        trStat['WindDir_2'] + "," + 
                        trStat['Compass_2'] + "," +
                        trStat['AirTemp_2'] + "," +
                        trStat['RH_2'] + "," +
                        trStat['Pressure_2'] + ")")
               
            #Call SP for Reporting
            tercdbcr.execute(tercsp) 
            tercdbcon.commit()







    #Update Return Status
    rtn_status = "Success"

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rtn_status






