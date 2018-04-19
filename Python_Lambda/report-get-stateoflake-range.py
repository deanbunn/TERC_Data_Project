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
    stolStatReport = []


    if(event['id'] and event['id'].isdigit()):

        #Var for StartDate
        sp_start_date = str(event['id'])

        #Var for EndDate
        sp_end_date = str(event['id'])

        #Check for End Date
        if(event['rptend'] and event['rptend'].isdigit()):

            sp_end_date = str(event['rptend'])




        #Var for Stored Procedure Command
        sp_cmd = "CALL sp_report_state_of_the_lake_range(" + sp_start_date + "," + sp_end_date + ")"  

        #Call SP for Reporting
        tercdbcr.execute(sp_cmd) 
        tercdbcon.commit()
        tdb_rslt = tercdbcr.fetchall()

	#Set Last Sync Date
        for rptEntry in tdb_rslt:

 	    stolData = {'Year':'',
                       'Max_Air_Temp_Ave':'',
                       'Min_Air_Temp_Ave':'',
                       'Annual_Precipitation':'',
		       'Annual_Snow':'',
		       'Snow_Propotion':'',
                       'Monthly_Max_Air_Temp_Jan':'',
                       'Monthly_Max_Air_Temp_Feb':'',
                       'Monthly_Max_Air_Temp_Mar':'',
                       'Monthly_Max_Air_Temp_Apr':'',
                       'Monthly_Max_Air_Temp_May':'',
                       'Monthly_Max_Air_Temp_Jun':'',
                       'Monthly_Max_Air_Temp_July':'',
                       'Monthly_Max_Air_Temp_Aug':'',
                       'Monthly_Max_Air_Temp_Sep':'',
                       'Monthly_Max_Air_Temp_Oct':'',
                       'Monthly_Max_Air_Temp_Nov':'',
                       'Monthly_Max_Air_Temp_Dec':'',
                       'Monthly_Min_Air_Temp_Jan':'',
                       'Monthly_Min_Air_Temp_Feb':'',
                       'Monthly_Min_Air_Temp_Mar':'',
                       'Monthly_Min_Air_Temp_Apr':'',
                       'Monthly_Min_Air_Temp_May':'',
                       'Monthly_Min_Air_Temp_Jun':'',
                       'Monthly_Min_Air_Temp_July':'',
                       'Monthly_Min_Air_Temp_Aug':'',
                       'Monthly_Min_Air_Temp_Sep':'',
                       'Monthly_Min_Air_Temp_Oct':'',
                       'Monthly_Min_Air_Temp_Nov':'',
                       'Monthly_Min_Air_Temp_Dec':'',
                       'Monthly_Precipitation_Jan':'',
                       'Monthly_Precipitation_Feb':'',
                       'Monthly_Precipitation_Mar':'',
                       'Monthly_Precipitation_Apr':'',
                       'Monthly_Precipitation_May':'',
                       'Monthly_Precipitation_Jun':'',
                       'Monthly_Precipitation_July':'',
                       'Monthly_Precipitation_Aug':'',
                       'Monthly_Precipitation_Sep':'',
                       'Monthly_Precipitation_Oct':'',
                       'Monthly_Precipitation_Nov':'',
                       'Monthly_Precipitation_Dec':'',
                       'Surface_Water_Temp_Ave':'',
                       'Secchi_Annual_Ave':'',
                       'Secchi_Winter_Ave':'',
                       'Secchi_Summer_Ave':'',
                       'Chla_Ave':''}

        
            stolData['Year'] = str(rptEntry[0])
            stolData['Max_Air_Temp_Ave'] = str(rptEntry[1])
            stolData['Min_Air_Temp_Ave'] = str(rptEntry[2])
            stolData['Annual_Precipitation'] = str(rptEntry[3])
            stolData['Annual_Snow'] = str(rptEntry[4])
            stolData['Snow_Propotion'] = str(rptEntry[5])
            stolData['Monthly_Max_Air_Temp_Jan'] = str(rptEntry[6])
            stolData['Monthly_Max_Air_Temp_Feb'] = str(rptEntry[7])
            stolData['Monthly_Max_Air_Temp_Mar'] = str(rptEntry[8])
            stolData['Monthly_Max_Air_Temp_Apr'] = str(rptEntry[9])
            stolData['Monthly_Max_Air_Temp_May'] = str(rptEntry[10])
            stolData['Monthly_Max_Air_Temp_Jun'] = str(rptEntry[11])
            stolData['Monthly_Max_Air_Temp_July'] = str(rptEntry[12])
            stolData['Monthly_Max_Air_Temp_Aug'] = str(rptEntry[13])
            stolData['Monthly_Max_Air_Temp_Sep'] = str(rptEntry[14])
            stolData['Monthly_Max_Air_Temp_Oct'] = str(rptEntry[15])
            stolData['Monthly_Max_Air_Temp_Nov'] = str(rptEntry[16])
            stolData['Monthly_Max_Air_Temp_Dec'] = str(rptEntry[17])
            stolData['Monthly_Min_Air_Temp_Jan'] = str(rptEntry[18])
            stolData['Monthly_Min_Air_Temp_Feb'] = str(rptEntry[19])
            stolData['Monthly_Min_Air_Temp_Mar'] = str(rptEntry[20])
            stolData['Monthly_Min_Air_Temp_Apr'] = str(rptEntry[21])
            stolData['Monthly_Min_Air_Temp_May'] = str(rptEntry[22])
            stolData['Monthly_Min_Air_Temp_Jun'] = str(rptEntry[23])
            stolData['Monthly_Min_Air_Temp_July'] = str(rptEntry[24])
            stolData['Monthly_Min_Air_Temp_Aug'] = str(rptEntry[25])
            stolData['Monthly_Min_Air_Temp_Sep'] = str(rptEntry[26])
            stolData['Monthly_Min_Air_Temp_Oct'] = str(rptEntry[27])
            stolData['Monthly_Min_Air_Temp_Nov'] = str(rptEntry[28])
            stolData['Monthly_Min_Air_Temp_Dec'] = str(rptEntry[29])
            stolData['Monthly_Precipitation_Jan'] = str(rptEntry[30])
            stolData['Monthly_Precipitation_Feb'] = str(rptEntry[31])
            stolData['Monthly_Precipitation_Mar'] = str(rptEntry[32])
            stolData['Monthly_Precipitation_Apr'] = str(rptEntry[33])
            stolData['Monthly_Precipitation_May'] = str(rptEntry[34])
            stolData['Monthly_Precipitation_Jun'] = str(rptEntry[35])
            stolData['Monthly_Precipitation_July'] = str(rptEntry[36])
            stolData['Monthly_Precipitation_Aug'] = str(rptEntry[37])
            stolData['Monthly_Precipitation_Sep'] = str(rptEntry[38])
            stolData['Monthly_Precipitation_Oct'] = str(rptEntry[39])
            stolData['Monthly_Precipitation_Nov'] = str(rptEntry[40])
            stolData['Monthly_Precipitation_Dec'] = str(rptEntry[41])
            stolData['Surface_Water_Temp_Ave'] = str(rptEntry[42])
            stolData['Secchi_Annual_Ave'] = str(rptEntry[43])
            stolData['Secchi_Winter_Ave'] = str(rptEntry[44])
            stolData['Secchi_Summer_Ave'] = str(rptEntry[45])
            stolData['Chla_Ave'] = str(rptEntry[46])
        
                
            #Add to Report
            stolStatReport.append(stolData)



    

    #Close Out Cursor and Connection
    tercdbcr.close()
    #tercdbcon.close()


    return stolStatReport


