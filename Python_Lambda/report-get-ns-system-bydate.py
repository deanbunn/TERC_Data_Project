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

    #Report Dict
    nsStatReport = []

    if(event['id'] and event['id'].isdigit() and event['rptdate'] and event['rptdate'].isdigit() and len(event['rptdate']) == 8):

        #Var for Stored Procedure Command
        sp_cmd = ""

        #Var for Parse Report Date
        tmp_rpt_date = str(event['rptdate'])

        #Var for Report Date 
        sp_rpt_date = tmp_rpt_date[:4] + "-" + tmp_rpt_date[4:-2]  + "-" + tmp_rpt_date[-2:]

        #Var for Station Name
        terc_station = ""


        #Var for numeric of submitted cid value
        n_stationid = int(event['id'])
        
        if(n_stationid == 1):
            sp_cmd = "CALL sp_report_ns_station_range_cascade('"
            terc_station = "Cascade" 
            
        if(n_stationid == 2):
            sp_cmd = "CALL sp_report_ns_station_range_dollarpoint('"
            terc_station = "Dollar Point"
            
        if(n_stationid == 3):
            sp_cmd = "CALL sp_report_ns_station_range_glenbrook('"
            terc_station = "Glenbrook"
            
        if(n_stationid == 4):
            sp_cmd = "CALL sp_report_ns_station_range_homewood('"
            terc_station = "Homewood"
        
        if(n_stationid == 5):
            sp_cmd = "CALL sp_report_ns_station_range_meeks('"
            terc_station = "Meeks"
        
        if(n_stationid == 6):
            sp_cmd = "CALL sp_report_ns_station_range_rubicon('"
            terc_station = "Rubicon"
        
        if(n_stationid == 7):
            sp_cmd = "CALL sp_report_ns_station_range_sandharbor('"
            terc_station = "Sand Harbor"
             
        if(n_stationid == 8):
            sp_cmd = "CALL sp_report_ns_station_range_tahoevista('"
            terc_station = "Tahoe Vista"
            
        if(n_stationid == 9):
            sp_cmd = "CALL sp_report_ns_station_range_tahoecity('"
            terc_station = "Tahoe City"

        if(n_stationid == 10):
            sp_cmd = "CALL sp_report_ns_station_range_camprichardson('"
            terc_station = "Camp Richardson"
            
        if(n_stationid == 11):
            sp_cmd = "CALL sp_report_ns_station_range_timbercove('"
            terc_station = "Timber Cove"

       
        if(len(sp_cmd) > 1):
        
            sp_cmd += sp_rpt_date + " 00:00:00','" + sp_rpt_date + " 23:59:59')"  

            #Call SP for Reporting
            tercdbcr.execute(sp_cmd) 
            tercdbcon.commit()
            tdb_rslt = tercdbcr.fetchall()

            #Set Last Sync Date
            for rptEntry in tdb_rslt:

                nssData = {'ID':'',
                           'Station_Name':'',
                           'TmStamp':'',
                           'LS_Chlorophyll_Avg':'',
                           'LS_Temp_Avg':'',
                           'LS_Turbidity_Avg':'',
                           'WaveHeight':''}

        
                nssData['ID'] = event['id']
                nssData['Station_Name'] = terc_station
                nssData['TmStamp'] = rptEntry[0].strftime('%Y-%m-%d %H:%M:%S')
                nssData['LS_Chlorophyll_Avg'] = str(rptEntry[1])
                nssData['LS_Temp_Avg'] = str(rptEntry[2])
                nssData['LS_Turbidity_Avg'] = str(rptEntry[3])
                nssData['WaveHeight'] = str(rptEntry[4])
                
                #Add to Report
                nsStatReport.append(nssData)



    


    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()


    return nsStatReport


