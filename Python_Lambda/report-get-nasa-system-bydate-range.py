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
    nasaStatReport = []


    if(event['id'] and event['id'].isdigit() and event['rptdate'] and event['rptdate'].isdigit() and len(event['rptdate']) == 8):

        #Var for Stored Procedure Command
        sp_cmd = "CALL sp_report_nasa_tb_granrange('"

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

 	    nasaData = {'ID':'',
                       'Station_Name':'',
                       'TmStamp':'',
                       'RBR_0p5_m':'',
		       'WindSpeed_1':'',
		       'AirTemp_1':'',
                       'WindSpeed_2':'',
                       'AirTemp_2':''}

        
            nasaData['ID'] = event['id']
            nasaData['Station_Name'] = rptEntry[0]
            nasaData['TmStamp'] = rptEntry[1].strftime('%Y-%m-%d %H:%M:%S')
            nasaData['RBR_0p5_m'] = str(rptEntry[2])
            nasaData['WindSpeed_1'] = str(rptEntry[3])
            nasaData['AirTemp_1'] = str(rptEntry[4])
            nasaData['WindSpeed_2'] = str(rptEntry[5])
            nasaData['AirTemp_2'] = str(rptEntry[6])
                
            #Add to Report
            nasaStatReport.append(nasaData)



    

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()


    return nasaStatReport


