import pymysql
import json
import rds_config

#Var for RDS Connection
rds_dbhost = rds_config.db_host
rds_dbname = rds_config.db_name
rds_dbuser = rds_config.db_username
rds_dbpwd = rds_config.db_password


#Make Connection to RDS Instance
tercdbcon = pymysql.connect(rds_dbhost, user=rds_dbuser, passwd=rds_dbpwd, db=rds_dbname, connect_timeout=5)

def handler(event,context):

    #Establish DB Cursor
    tercdbcr = tercdbcon.cursor()

    #Call SP for Reporting
    tercdbcr.callproc("sp_report_ns_stations_latest",()) 
    tercdbcon.commit()
    tdb_rslt = tercdbcr.fetchall()

    #Report List
    nsStatReport = []

    #Set Last Sync Date
    for rptEntry in tdb_rslt:

        nssData = {'ID':'',
                   'Station_Name':'',
                   'TmStamp':'',
                   'LS_Conductivity_Avg':'',
                   'LS_Temp_Avg':'',
                   'LS_RawPressure_Avg':'',
                   'LS_Chlorophyll_Avg':'',
                   'LS_CDOM_Avg':'',
                   'LS_Turbidity_Avg':'',
                   'LakeSensor_BattV_Min':'',
                   'BP_mmHg':'',
                   'Depth_m4C_Avg':'',
                   'Depth_m4C_Max':'',
                   'Depth_m4C_Min':'',
                   'WaveHeight':'',
                   'Conductivity25C_Avg':'',
                   'LS_DO_Avg':''}

        
        nssData['ID'] = str(rptEntry[0])
        nssData['Station_Name'] = str(rptEntry[1])
        nssData['TmStamp'] = rptEntry[2].strftime('%Y-%m-%d %H:%M:%S')
        nssData['LS_Conductivity_Avg'] = str(rptEntry[3])    
        nssData['LS_Temp_Avg'] = str(rptEntry[4])
        nssData['LS_RawPressure_Avg'] = str(rptEntry[5])
        nssData['LS_Chlorophyll_Avg'] = str(rptEntry[6])
        nssData['LS_CDOM_Avg'] = str(rptEntry[7])
        nssData['LS_Turbidity_Avg'] = str(rptEntry[8])
        nssData['LakeSensor_BattV_Min'] = str(rptEntry[9])
        nssData['BP_mmHg'] = str(rptEntry[10])
        nssData['Depth_m4C_Avg'] = str(rptEntry[11])
        nssData['Depth_m4C_Max'] = str(rptEntry[12])
        nssData['Depth_m4C_Min'] = str(rptEntry[13])
        nssData['WaveHeight'] = str(rptEntry[14])
        nssData['Conductivity25C_Avg'] = str(rptEntry[15])
        nssData['LS_DO_Avg'] = str(rptEntry[16])
    
        nsStatReport.append(nssData)



    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return nsStatReport






