<#
    Script: TERC_Sync_NearShore.ps1
    Author: Dean Bunn
    Version: 3.0
    Last Modified: 11/29/17
#>

#Load .NET System.Data DLL
[Void][system.reflection.assembly]::LoadWithPartialName("System.Data");

[int]$tercStmpDiff = 1;

#Array of TERC Stations
$arrTERCStations = @();

#Custom Object for NS Cascade
$cstNSCascade = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Cascade Wifi_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-cascade";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=1";
                                                  Station="NS-Cascade";
                                                  StationType="1";
                                                });



#Custom Object for NS Dollar
$cstNSDollar = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Dollar Point Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-dollar";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=2";
                                                  Station="NS-Dollar";
                                                  StationType="1";
                                                });


#Custom Object for NS Glenbrook
$cstNSGlenbrook = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Glenbrook Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-glenbrook";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=3";
                                                  Station="NS-Glenbrook";
                                                  StationType="1";
                                                });


#Custom Object for NS Homewood
$cstNSHomewood = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Homewood Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-homewood";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=4";
                                                  Station="NS-Homewood";
                                                  StationType="1";
                                                });


#Custom Object for NS Meeks
$cstNSMeeks = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Meeks Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-meeks";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=5";
                                                  Station="NS-Meeks";
                                                  StationType="1";
                                                });


#Custom Object for NS Homewood
$cstNSRubicon = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Rubicon Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-rubicon";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=6";
                                                  Station="NS-Rubicon";
                                                  StationType="1";
                                                });


#Custom Object for Sand Harbor
$cstNSSandHarbor = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Sand Harbor Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-sandharbor";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=7";
                                                  Station="NS-SandHarbor";
                                                  StationType="1";
                                                });


#Custom Object for Tahoe Vista
$cstNSTahoeVista = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Tahoe Vista Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-tahoevista";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=8";
                                                  Station="NS-TahoeVista";
                                                  StationType="1";
                                                });


#Custom Object for Tahoe City
$cstNSTahoeCity = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Tahoe City Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-tahoecity";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=9";
                                                  Station="NS-TahoeCity";
                                                  StationType="2";
                                                });

#Custom Object for Camp Richardson
$cstNSCampRichardson = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Camp Richardson Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-camprichardson";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=10";
                                                  Station="NS-CampRichardson";
                                                  StationType="2";
                                                });

#Custom Object for Timber Cove
$cstNSTimberCove = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Timber Cove Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-timbercove";
                                                  APIRSURI="https://xxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/reportsync?cid=11";
                                                  Station="NS-TimberCove";
                                                  StationType="2";
                                                });


#Load TERC Stations
$arrTERCStations += $cstNSCascade;
$arrTERCStations += $cstNSDollar;
$arrTERCStations += $cstNSGlenbrook;
$arrTERCStations += $cstNSHomewood;
$arrTERCStations += $cstNSMeeks;
$arrTERCStations += $cstNSRubicon;
$arrTERCStations += $cstNSSandHarbor;
$arrTERCStations += $cstNSTahoeVista;
$arrTERCStations += $cstNSTahoeCity;
$arrTERCStations += $cstNSCampRichardson;
$arrTERCStations += $cstNSTimberCove;


#Var for 
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"};

#Connection String Settings (Using Integrated Security So No UserID and Password Needed)
$sqlConString = "Server=xxxxxxxxxxxxx;Database=NEARSHORE;Integrated Security=SSPI;";

#Create a SQL Connection Object 
$sqlCon = New-Object System.Data.SqlClient.SqlConnection($sqlConString);

#Var for Progress Indictator and AWS API Call Count
[int]$prgIndctr = 0;

foreach($tercStation in $arrTERCStations)
{

    #Pull Latest Sync Date from TERC Station AWS API Call
    [string]$tsLstDate = Invoke-RestMethod -Uri $tercStation.APIURI -Method Get -Headers $tercHeader;


    #Null\Empty Check on Latest Sync Date
    if(![string]::IsNullOrEmpty($tsLstDate))
    {

        #Var for Date of Last TERC Sync'd Entry in MySQL Table
        $dtTERCStat = Get-date($tsLstDate);
   
        #Var for Current Timestamp
        $dtCrntTme = Get-Date;

        #Array for Station Data
        $arrStationData = @();

        #Var for SQL Query Pulling 
        [string]$sqlQuery = "SELECT TOP(10000) TmStamp,
                             RecNum,
	                         LS_Conductivity_Avg,
	                         LS_Temp_Avg,
	                         LS_RawPressure_Avg,
	                         LS_DO_Avg,
	                         LS_Chlorophyll_Avg,
	                         LS_CDOM_Avg,
	                         LS_Turbidity_Avg,
	                         LakeSensor_BattV_Min,
	                         BP_mmHg,
	                         Depth_m4C_Avg,
	                         Depth_m4C_Max,
	                         Depth_m4C_Min,
	                         WaveHeight,
	                         Conductivity25C_Avg";

        #Check Station Type Additions to SQL Query
        if($tercStation.StationType -eq "2")
        {
            $sqlQuery += ", LS_DO_Conc_Avg, LS_DO_ProbeTemp_Avg "
        }
        
        #Finish SQL Query
        $sqlQuery += " FROM " + $tercStation.SQLTbl + "
                      WHERE TmStamp > (CAST('" +  $dtTERCStat.ToString("yyyy-MM-dd HH:mm:ss") + "' AS datetime))
                      ORDER BY TmStamp;";


           
        #Create and Configure a SQL Command for SQL Query
        $sqlComm = New-Object System.Data.SqlClient.SqlCommand($sqlQuery,$sqlCon);
        #Set the Command Timeout
        $sqlComm.CommandTimeout = 7200;
        #Open the SQL Connection
        $sqlCon.Open();
        #Execute Reader for SQL Command
        $sqlRdr = $sqlComm.ExecuteReader();


        #Load Data Table with Reader Info
        While($sqlRdr.Read())
        {

                #Create Custom Object
                $cstStatObjt = new-object PSObject -Property (@{ TmStamp=""; 
                                                         RecNum="NULL";
                                                         LS_Conductivity_Avg="NULL";
	                                                     LS_Temp_Avg="NULL";
	                                                     LS_RawPressure_Avg="NULL";
	                                                     LS_DO_Avg="NULL";
	                                                     LS_Chlorophyll_Avg="NULL";
	                                                     LS_CDOM_Avg="NULL";
	                                                     LS_Turbidity_Avg="NULL";
	                                                     LakeSensor_BattV_Min="NULL";
	                                                     BP_mmHg="NULL";
	                                                     Depth_m4C_Avg="NULL";
	                                                     Depth_m4C_Max="NULL";
	                                                     Depth_m4C_Min="NULL";
	                                                     WaveHeight="NULL";
	                                                     Conductivity25C_Avg="NULL";
                                                         LS_DO_Conc_Avg="NULL";
                                                         LS_DO_ProbeTemp_Avg="NULL"; });

    
                ###########################################
                #Load Values (Checks for Some Null Values)
                ###########################################	
        
                #Load TimeStamp    
                $cstStatObjt.TmStamp = $sqlRdr["TmStamp"].ToString("yyyy-MM-dd HH:mm:ss");

                #Load Record Number
                $cstStatObjt.RecNum = $sqlRdr["RecNum"].ToString();
    
                #LS_Conductivity_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_Conductivity_Avg"].ToString()))
                {
                    $cstStatObjt.LS_Conductivity_Avg = $sqlRdr["LS_Conductivity_Avg"].ToString();
                }
                
                #LS_Temp_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_Temp_Avg"].ToString()))
                {
                    $cstStatObjt.LS_Temp_Avg = $sqlRdr["LS_Temp_Avg"].ToString();
                }
                
                #LS_RawPressure_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_RawPressure_Avg"].ToString()))
                {
                    $cstStatObjt.LS_RawPressure_Avg = $sqlRdr["LS_RawPressure_Avg"].ToString();
                }
               
                #LS_DO_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_DO_Avg"].ToString()))
                {
                    $cstStatObjt.LS_DO_Avg = $sqlRdr["LS_DO_Avg"].ToString();
                }
               
                #LS_Chlorophyll_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_Chlorophyll_Avg"].ToString()))
                {
                    $cstStatObjt.LS_Chlorophyll_Avg = $sqlRdr["LS_Chlorophyll_Avg"].ToString();
                }
                
                #LS_CDOM_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_CDOM_Avg"].ToString()))
                {
                    $cstStatObjt.LS_CDOM_Avg = $sqlRdr["LS_CDOM_Avg"].ToString();
                }
                
                #LS_Turbidity_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["LS_Turbidity_Avg"].ToString()))
                {
                    $cstStatObjt.LS_Turbidity_Avg = $sqlRdr["LS_Turbidity_Avg"].ToString();
                }
                
                #LakeSensor_BattV_Min
                if(![string]::IsNullOrEmpty($sqlRdr["LakeSensor_BattV_Min"].ToString()))
                {
                    $cstStatObjt.LakeSensor_BattV_Min = $sqlRdr["LakeSensor_BattV_Min"].ToString();
                }
                
                #BP_mmHg
                if(![string]::IsNullOrEmpty($sqlRdr["BP_mmHg"].ToString()))
                {
                    $cstStatObjt.BP_mmHg = $sqlRdr["BP_mmHg"].ToString();
                }
                
                #BP_mmHg
                if(![string]::IsNullOrEmpty($sqlRdr["BP_mmHg"].ToString()))
                {
                    $cstStatObjt.BP_mmHg = $sqlRdr["BP_mmHg"].ToString();
                }
                
                #Depth_m4C_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["Depth_m4C_Avg"].ToString()))
                {
                    $cstStatObjt.Depth_m4C_Avg = $sqlRdr["Depth_m4C_Avg"].ToString();
                }
                
                #Depth_m4C_Max
                if(![string]::IsNullOrEmpty($sqlRdr["Depth_m4C_Max"].ToString()))
                {
                    $cstStatObjt.Depth_m4C_Max = $sqlRdr["Depth_m4C_Max"].ToString();
                }
                
    
                #Depth_m4C_Min
                if(![string]::IsNullOrEmpty($sqlRdr["Depth_m4C_Min"].ToString()))
                {
                    $cstStatObjt.Depth_m4C_Min = $sqlRdr["Depth_m4C_Min"].ToString();
                }
                
                #WaveHeight
                if(![string]::IsNullOrEmpty($sqlRdr["WaveHeight"].ToString()))
                {
                    $cstStatObjt.WaveHeight = $sqlRdr["WaveHeight"].ToString();
                }
                
                #Conductivity25C_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["Conductivity25C_Avg"].ToString()))
                {
                    $cstStatObjt.Conductivity25C_Avg = $sqlRdr["Conductivity25C_Avg"].ToString();
                }
                
                #Check Station Type Additions to SQL Query
                if($tercStation.StationType -eq "2")
                {
            
                    #LS_DO_Conc_Avg
                    if(![string]::IsNullOrEmpty($sqlRdr["LS_DO_Conc_Avg"].ToString()))
                    {
                        $cstStatObjt.LS_DO_Conc_Avg = $sqlRdr["LS_DO_Conc_Avg"].ToString();
                    }

                    #LS_DO_ProbeTemp_Avg
                    if(![string]::IsNullOrEmpty($sqlRdr["LS_DO_ProbeTemp_Avg"].ToString()))
                    {
                        $cstStatObjt.LS_DO_ProbeTemp_Avg = $sqlRdr["LS_DO_ProbeTemp_Avg"].ToString();
                    }

                }#End of Additional SQL Props Check


	            #Add Custom Object to Station Data Array
	            $arrStationData += $cstStatObjt;
	
        }#End of $sqlRdrMS1

        #Close Reader and SQL Connection
        $sqlRdr.close();
        $sqlCon.close();


        #Check for Entries to Sync to AWS
        if($arrStationData.Count -gt 0)
        {

                #Custom Object for the API Call Post Body
                $cstPostBody = new-object PSObject -Property (@{TSReadings=@(); Status=""});
                $cstPostBody.Status = "Success";

                
                #
                foreach($tsData in $arrStationData)
                {

                    #Load Terc Station Data into Readings Array
                    $cstPostBody.TSReadings += $tsData;

                    if($cstPostBody.TSReadings.Count % 10 -eq 0)
                    {
                        #Notify of Progess
                        Write-Output ($tercStation.Station + " " + $tsData.TmStamp);

                        #Convert Post Body to Json Object
                        $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                        #Make API call to AWS
                        $awsStatus = Invoke-RestMethod -Uri $tercStation.APIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                        #For No Successful API Calls Exit Loops
                        if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                        {
                            
                            #$cstPostBody.Status = "NoGo";
                            exit;
                        }

                        #Clear TSReadings Array
                        $cstPostBody.TSReadings = @();

                    }#End of TSReadings Modulus Check


                }#End of $arrStationData Foreach

                #Check for Remaining to Send
                if($cstPostBody.TSReadings.Count -gt 0)
                {

                    #Notify of Progess
                    Write-Output ($tercStation.Station);

                    #Convert Post Body to Json Object
                    $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                    #Make API call to AWS
                    $awsStatus = Invoke-RestMethod -Uri $tercStation.APIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                    #For No Successful API Calls Exit Loops
                    if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                    {
                        exit;
                    }

                    #Clear TSReadings Array
                    $cstPostBody.TSReadings = @();

                 }#End of TSReadings Remaining Check


        }#End of $arrStationData Length Check


        #Make Report Sync Call to AWS
        $awsStatusRS = Invoke-RestMethod -Uri $tercStation.APIRSURI -Method Get -Headers $tercHeader -TimeoutSec 240;


    }#End of $tsLstDate Null\Empty Check


}#End of $arrTERCStations Foreach
