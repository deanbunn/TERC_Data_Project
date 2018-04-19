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

    #Var for Last Sync Time
    rpt_last_sync = ""

    #Establish DB Cursor
    tercdbcr = tercdbcon.cursor()

    if(event['id'] and event['id'].isdigit()):
        
        #Var for Stored Procedure Command
        sp_cmd = "CALL sp_lastsync_usgs_ws(" + str(event['id']) + ")"
        
        #Call SP for Reporting
        tercdbcr.execute(sp_cmd) 
        tercdbcon.commit()
        tdb_rslt = tercdbcr.fetchall()

        #Set Last Sync Date
        for rptEntry in tdb_rslt:

            rpt_last_sync = rptEntry[0].strftime('%Y-%m-%d %H:%M:%S')
    





    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()

    
    return rpt_last_sync






