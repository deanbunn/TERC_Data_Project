<#
    Script: TERC_Sync_TahoeRBR.ps1
    Author: Dean Bunn
    Version: 2.1
    Last Modified: 01/31/17
#>

#Load .NET System.Data DLL
[Void][system.reflection.assembly]::LoadWithPartialName("System.Data");

[int]$tercStmpDiff = 1;

#Array of TERC Stations
$arrTERCStations = @();

#Custom Object for NS Cascade
$cstTahoeRBR = new-object PSObject -Property (@{ SQLTbl="[CR1000_Tahoe_RBR(Homewood)_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/tahoerbr";
                                                  Station="TahoeRBR"
                                                });


#Load TERC Stations
$arrTERCStations += $cstTahoeRBR;

#Var for 
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"};

#Connection String Settings (Using Integrated Security So No UserID and Password Needed)
$sqlConString = "Server=xxxxxxxxxxxxxxx\SQLEXPRESS;Database=Master;Integrated Security=SSPI;";

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
        [string]$sqlQuery = "SELECT TmStamp,
                                RecNum,
	                            XR_T1,
                                XR_T2,
                                XR_T3,
                                XR_T4,
                                XR_T5,
                                XR_T6,
                                XR_T7,
                                XR_T8,
                                XR_T9,
                                XR_T10,
                                XR_T11,
                                XR_T12,
                                XR_T13,
                                XR_T14,
                                XR_T15,
                                XR_T16,
                                XR_DO2,
                                XR_Raw_Z,
                                XR_Batt,
                                BP_mmHg,
                                O2_uM_corr_T16,
                                Pct_Sat_T1,
                                O2_uM_cal_T1,
                                Depth_m4C,
                                BP_mmHg_Avg,
                                BP_mmHgAVG
                                FROM " + $tercStation.SQLTbl + "
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
                                                                 RecNum="";
                                                                 XR_T1="";
                                                                 XR_T2="";
                                                                 XR_T3="";
                                                                 XR_T4="";
                                                                 XR_T5="";
                                                                 XR_T6="";
                                                                 XR_T7="";
                                                                 XR_T8="";
                                                                 XR_T9="";
                                                                 XR_T10="";
                                                                 XR_T11="";
                                                                 XR_T12="";
                                                                 XR_T13="";
                                                                 XR_T14="";
                                                                 XR_T15="";
                                                                 XR_T16="";
                                                                 XR_DO2="";
                                                                 XR_Raw_Z="";
                                                                 XR_Batt="";
                                                                 BP_mmHg="";
                                                                 O2_uM_corr_T16="";
                                                                 Pct_Sat_T1="";
                                                                 O2_uM_cal_T1="";
                                                                 Depth_m4C="";
                                                                 BP_mmHg_Avg="";
                                                                 BP_mmHgAVG=""});

    
                ###########################################
                #Load Values (Checks for Some Null Values)
                ###########################################	
        
                #Load TimeStamp    
                $cstStatObjt.TmStamp = $sqlRdr["TmStamp"].ToString("yyyy-MM-dd HH:mm:ss");

                #Load Record Number
                $cstStatObjt.RecNum = $sqlRdr["RecNum"].ToString();
    
                #XR_T1
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T1"].ToString()))
                {
                    $cstStatObjt.XR_T1 = $sqlRdr["XR_T1"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T1 = "NULL";
                }


                #XR_T2
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T2"].ToString()))
                {
                    $cstStatObjt.XR_T2 = $sqlRdr["XR_T2"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T2 = "NULL";
                }

                #XR_T3
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T3"].ToString()))
                {
                    $cstStatObjt.XR_T3 = $sqlRdr["XR_T3"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T3 = "NULL";
                }


                #XR_T4
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T4"].ToString()))
                {
                    $cstStatObjt.XR_T4 = $sqlRdr["XR_T4"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T4 = "NULL";
                }


                #XR_T5
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T5"].ToString()))
                {
                    $cstStatObjt.XR_T5 = $sqlRdr["XR_T5"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T5 = "NULL";
                }

                #XR_T6
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T6"].ToString()))
                {
                    $cstStatObjt.XR_T6 = $sqlRdr["XR_T6"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T6 = "NULL";
                }

                #XR_T7
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T7"].ToString()))
                {
                    $cstStatObjt.XR_T7 = $sqlRdr["XR_T7"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T7 = "NULL";
                }

                #XR_T8
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T8"].ToString()))
                {
                    $cstStatObjt.XR_T8 = $sqlRdr["XR_T8"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T8 = "NULL";
                }

                #XR_T9
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T9"].ToString()))
                {
                    $cstStatObjt.XR_T9 = $sqlRdr["XR_T9"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T9 = "NULL";
                }

                #XR_T10
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T10"].ToString()))
                {
                    $cstStatObjt.XR_T10 = $sqlRdr["XR_T10"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T10 = "NULL";
                }

                #XR_T11
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T11"].ToString()))
                {
                    $cstStatObjt.XR_T11 = $sqlRdr["XR_T11"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T11 = "NULL";
                }

                #XR_T12
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T12"].ToString()))
                {
                    $cstStatObjt.XR_T12 = $sqlRdr["XR_T12"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T12 = "NULL";
                }

                #XR_T13
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T13"].ToString()))
                {
                    $cstStatObjt.XR_T13 = $sqlRdr["XR_T13"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T13 = "NULL";
                }

                #XR_T14
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T14"].ToString()))
                {
                    $cstStatObjt.XR_T14 = $sqlRdr["XR_T14"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T14 = "NULL";
                }

                #XR_T15
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T15"].ToString()))
                {
                    $cstStatObjt.XR_T15 = $sqlRdr["XR_T15"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T15 = "NULL";
                }
               
                #XR_T16
                if(![string]::IsNullOrEmpty($sqlRdr["XR_T16"].ToString()))
                {
                    $cstStatObjt.XR_T16 = $sqlRdr["XR_T16"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_T16 = "NULL";
                }

                #XR_DO2
                if(![string]::IsNullOrEmpty($sqlRdr["XR_DO2"].ToString()))
                {
                    $cstStatObjt.XR_DO2 = $sqlRdr["XR_DO2"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_DO2 = "NULL";
                }


                #XR_Raw_Z
                if(![string]::IsNullOrEmpty($sqlRdr["XR_Raw_Z"].ToString()))
                {
                    $cstStatObjt.XR_Raw_Z = $sqlRdr["XR_Raw_Z"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_Raw_Z = "NULL";
                }


                #XR_Batt
                if(![string]::IsNullOrEmpty($sqlRdr["XR_Batt"].ToString()))
                {
                    $cstStatObjt.XR_Batt = $sqlRdr["XR_Batt"].ToString();
                }
                else
                {
                    $cstStatObjt.XR_Batt = "NULL";
                }


                #BP_mmHg
                if(![string]::IsNullOrEmpty($sqlRdr["BP_mmHg"].ToString()))
                {
                    $cstStatObjt.BP_mmHg = $sqlRdr["BP_mmHg"].ToString();
                }
                else
                {
                    $cstStatObjt.BP_mmHg = "NULL";
                }


                #O2_uM_corr_T16
                if(![string]::IsNullOrEmpty($sqlRdr["O2_uM_corr_T16"].ToString()))
                {
                    $cstStatObjt.O2_uM_corr_T16 = $sqlRdr["O2_uM_corr_T16"].ToString();
                }
                else
                {
                    $cstStatObjt.O2_uM_corr_T16 = "NULL";
                }


                #Pct_Sat_T1
                if(![string]::IsNullOrEmpty($sqlRdr["Pct_Sat_T1"].ToString()))
                {
                    $cstStatObjt.Pct_Sat_T1 = $sqlRdr["Pct_Sat_T1"].ToString();
                }
                else
                {
                    $cstStatObjt.Pct_Sat_T1 = "NULL";
                }

                #O2_uM_cal_T1
                if(![string]::IsNullOrEmpty($sqlRdr["O2_uM_cal_T1"].ToString()))
                {
                    $cstStatObjt.O2_uM_cal_T1 = $sqlRdr["O2_uM_cal_T1"].ToString();
                }
                else
                {
                    $cstStatObjt.O2_uM_cal_T1 = "NULL";
                }


                #Depth_m4C
                if(![string]::IsNullOrEmpty($sqlRdr["Depth_m4C"].ToString()))
                {
                    $cstStatObjt.Depth_m4C = $sqlRdr["Depth_m4C"].ToString();
                }
                else
                {
                    $cstStatObjt.Depth_m4C = "NULL";
                }

                #BP_mmHg_Avg
                if(![string]::IsNullOrEmpty($sqlRdr["BP_mmHg_Avg"].ToString()))
                {
                    $cstStatObjt.BP_mmHg_Avg = $sqlRdr["BP_mmHg_Avg"].ToString();
                }
                else
                {
                    $cstStatObjt.BP_mmHg_Avg = "NULL";
                }


                #BP_mmHgAVG
                if(![string]::IsNullOrEmpty($sqlRdr["BP_mmHgAVG"].ToString()))
                {
                    $cstStatObjt.BP_mmHgAVG = $sqlRdr["BP_mmHgAVG"].ToString();
                }
                else
                {
                    $cstStatObjt.BP_mmHgAVG = "NULL";
                }


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


    }#End of $tsLstDate Null\Empty Check


}#End of $arrTERCStations Foreach
