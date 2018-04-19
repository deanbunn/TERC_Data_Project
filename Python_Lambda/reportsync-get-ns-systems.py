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

    #Var for Text of Stored Procedure Update Call
    txtSPU = ""

    #Establish DB Cursor
    tercdbcr = tercdbcon.cursor()

    if(event['cid'] and event['cid'].isdigit()):
        
        #Var for LastSync Stored Procedure Name
        lastsync_sp = ""
        
        #Var for numeric of submitted cid value
        n_cid = int(event['cid'])
        
        if(n_cid == 1):
            lastsync_sp = "sp_lastsync_cr1000_ns_cascade_wifi_lakedata"
            
        if(n_cid == 2):
            lastsync_sp = "sp_lastsync_cr1000_ns_dollar_point_modem_lakedata"
            
        if(n_cid == 3):
            lastsync_sp = "sp_lastsync_cr1000_ns_glenbrook_modem_lakedata"
            
        if(n_cid == 4):
            lastsync_sp = "sp_lastsync_cr1000_ns_homewood_modem_lakedata"
        
        if(n_cid == 5):
            lastsync_sp = "sp_lastsync_cr1000_ns_meeks_modem_lakedata"
        
        if(n_cid == 6):
            lastsync_sp = "sp_lastsync_cr1000_ns_rubicon_modem_lakedata"
        
        if(n_cid == 7):
            lastsync_sp = "sp_lastsync_cr1000_ns_sand_harbor_modem_lakedata"
            
        if(n_cid == 8):
            lastsync_sp = "sp_lastsync_cr1000_ns_tahoe_vista_modem_lakedata"
        
        if(n_cid == 9):
            lastsync_sp = "sp_lastsync_cr1000_ns_tahoe_city_modem_lakedata"

        if(n_cid == 10):
            lastsync_sp = "sp_lastsync_cr1000_ns_camp_richardson_modem_lakedata"

        if(n_cid == 11):
            lastsync_sp = "sp_lastsync_cr1000_ns_timber_cove_modem_lakedata"


        if(len(lastsync_sp) > 1):
            
            #Call SP for Reporting
            tercdbcr.callproc(lastsync_sp,()) 
            tercdbcon.commit()
            tdb_rslt = tercdbcr.fetchall()

            #Set Last Sync Date
            for rptEntry in tdb_rslt:

                txtSPU = ("CALL sp_report_ns_stations_update(" + str(n_cid) + ",'" +
                                rptEntry[0].strftime('%Y-%m-%d %H:%M:%S') + "'," +
                                str(rptEntry[1]) + "," +
                                str(rptEntry[2]) + "," +
                                str(rptEntry[3]) + "," +
                                str(rptEntry[4]) + "," +
                                str(rptEntry[5]) + "," +
                                str(rptEntry[6]) + "," +
                                str(rptEntry[7]) + "," +
                                str(rptEntry[8]) + "," +
                                str(rptEntry[9]) + "," + 
                                str(rptEntry[10]) + "," +
                                str(rptEntry[11]) + "," +
                                str(rptEntry[12]) + "," +
                                str(rptEntry[13]) + "," +
                                str(rptEntry[14]) + ")")


                #Call SP for Reporting
                tercdbcr.execute(txtSPU.replace("None","NULL")) 
                tercdbcon.commit()



    


    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    #Update Return Status
    rtn_status = "Success"


    return rtn_status




