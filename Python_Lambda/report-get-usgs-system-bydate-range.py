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
    usgsStatReport = []


    if(event['id'] and event['id'].isdigit() and event['rptdate'] and event['rptdate'].isdigit() and len(event['rptdate']) == 8):

        #Var for Stored Procedure Command
        sp_cmd = "CALL sp_report_usgs_ws_granrange('"

        #Var for Parse Report Date
        tmp_rpt_date = str(event['rptdate'])

        #Var for Report Date 
        sp_rpt_date = tmp_rpt_date[:4] + "-" + tmp_rpt_date[4:-2]  + "-" + tmp_rpt_date[-2:]

        #Var for Rpt End Date
        sp_rpt_end = sp_rpt_date
    
        #Check for End Date
        if(event['rptend'] and event['rptend'].isdigit() and len(event['rptend']) == 8):
            
            #Var for Parse Report End Date
            tmp_rpt_end = str(event['rptend'])
            
            #Set Report Date End with Submitted Value
            sp_rpt_end = tmp_rpt_end[:4] + "-" + tmp_rpt_end[4:-2] + "-" + tmp_rpt_end[-2:]



       
        #Var for Stored Procedure Command
        sp_cmd += sp_rpt_date + " 00:00:00','" + sp_rpt_end + " 23:59:59'," + str(event['id']) + ")"  

        #Call SP for Reporting
        tercdbcr.execute(sp_cmd) 
        tercdbcon.commit()
        tdb_rslt = tercdbcr.fetchall()

	#Set Last Sync Date
        for rptEntry in tdb_rslt:

 	    usgsData = {'ID':'',
                       'Location':'',
                       'TmStamp':'',
                       'Latitude':'',
		       'Longitude':'',
		       'Lake_Level':'',
                       'Streamflow':''}

        
            usgsData['ID'] = event['id']
            usgsData['Location'] = rptEntry[0]
            usgsData['TmStamp'] = rptEntry[1].strftime('%Y-%m-%d %H:%M:%S')
            usgsData['Latitude'] = str(rptEntry[2])
            usgsData['Longitude'] = str(rptEntry[3])
            usgsData['Lake_Level'] = str(rptEntry[4])
            usgsData['Streamflow'] = str(rptEntry[5])
            
                
            #Add to Report
            usgsStatReport.append(usgsData)



    

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()


    return usgsStatReport


