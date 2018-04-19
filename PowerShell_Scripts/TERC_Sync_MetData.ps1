<#
    Script: TERC_Sync_MetData.ps1
    Author: Dean Bunn
    Version: 1.0
    Last Modified: 06/15/17

#>

#C_Rock, Rubicon, Snnyside, T_Cove, T_Vista, TDR1, TDR2, USCG

#Var for Data Files Location
[string]$metDataFldr = "C:\Data\"

#Var for Sync Partial Folder Path
[string]$metPartialFldr = $metDataFldr + "Sync_Partial";

#Var for Sync Processed Folder Path
[string]$metProcesFldr = $metDataFldr + "Sync_Processed";

#Array for USCG Stations 
$arrMetUSCGStations = @();

#Array for Met Stations
$arrMet7Stations = @();

#Custom Object for Met Cave Rock Station
$cstMetC_Rock = new-object PSObject -Property (@{ FileName="C_Rock"; 
                                                  StationName="Cave Rock";
                                                  ColNumber=17;
                                                  RD_Station_ID="1";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=4;
                                                  Wind_Spd2=5;
                                                  Wind_Dir=6;
                                                  Wind_Dir_SD=7;
                                                  GUST=8;
                                                  Air_Temp=9;
                                                  Air_Temp_SD=10;
                                                  RH=11;
                                                  RH_SD=12;
                                                  Atm_Pres=13;
                                                  Atm_Pres_SD=14;
                                                  Precip=15;
                                                  Raft_Dir=0;
                                                  Water_Temp=0;
                                                  Water_Temp_SD=0;
                                                  BATT=16;
                                                });



$arrMet7Stations += $cstMetC_Rock;

#Custom Object for Met Rubicon Station
$cstMetRubicon = new-object PSObject -Property (@{ FileName="Rubicon"; 
                                                  StationName="Rubicon";
                                                  ColNumber=15;
                                                  RD_Station_ID="2";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=4;
                                                  Wind_Spd2=5;
                                                  Wind_Dir=6;
                                                  Wind_Dir_SD=7;
                                                  GUST=0;
                                                  Air_Temp=8;
                                                  Air_Temp_SD=9;
                                                  RH=10;
                                                  RH_SD=11;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=0;
                                                  Raft_Dir=0;
                                                  Water_Temp=12;
                                                  Water_Temp_SD=13;
                                                  BATT=15;
                                                });



$arrMet7Stations += $cstMetRubicon;

#Custom Object for Met Sunnyside Station
$cstMetSnnyside = new-object PSObject -Property (@{ FileName="Snnyside"; 
                                                  StationName="Sunnyside";
                                                  ColNumber=17;
                                                  RD_Station_ID="3";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=4;
                                                  Wind_Spd2=5;
                                                  Wind_Dir=6;
                                                  Wind_Dir_SD=7;
                                                  GUST=8;
                                                  Air_Temp=9;
                                                  Air_Temp_SD=10;
                                                  RH=11;
                                                  RH_SD=12;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=15;
                                                  Raft_Dir=0;
                                                  Water_Temp=13;
                                                  Water_Temp_SD=14;
                                                  BATT=16;
                                                });

$arrMet7Stations += $cstMetSnnyside;

#Custom Object for Met Timber Cove Station
$cstMetT_Cove = new-object PSObject -Property (@{ FileName="T_Cove"; 
                                                  StationName="Timber Cove";
                                                  ColNumber=16;
                                                  RD_Station_ID="4";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=4;
                                                  Wind_Spd2=5;
                                                  Wind_Dir=6;
                                                  Wind_Dir_SD=7;
                                                  GUST=8;
                                                  Air_Temp=9;
                                                  Air_Temp_SD=10;
                                                  RH=11;
                                                  RH_SD=12;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=0;
                                                  Raft_Dir=0;
                                                  Water_Temp=13;
                                                  Water_Temp_SD=14;
                                                  BATT=15;
                                                });

$arrMet7Stations += $cstMetT_Cove;

#Custom Object for Met Tahoe Vista Station
$cstMetT_Vista = new-object PSObject -Property (@{ FileName="T_Vista"; 
                                                  StationName="Tahoe Vista";
                                                  ColNumber=17;
                                                  RD_Station_ID="5";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=4;
                                                  Wind_Spd2=5;
                                                  Wind_Dir=6;
                                                  Wind_Dir_SD=7;
                                                  GUST=8;
                                                  Air_Temp=9;
                                                  Air_Temp_SD=10;
                                                  RH=11;
                                                  RH_SD=12;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=15;
                                                  Raft_Dir=0;
                                                  Water_Temp=13;
                                                  Water_Temp_SD=14;
                                                  BATT=16;
                                                });

$arrMet7Stations += $cstMetT_Vista;

#Custom Object for Met TDR1 (Buoy) Station
$cstMetTDR1 = new-object PSObject -Property (@{ FileName="TDR1"; 
                                                  StationName="TDR1 (Buoy)";
                                                  ColNumber=17;
                                                  RD_Station_ID="6";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=10;
                                                  Wind_Spd2=11;
                                                  Wind_Dir=12;
                                                  Wind_Dir_SD=13;
                                                  GUST=14;
                                                  Air_Temp=6;
                                                  Air_Temp_SD=7;
                                                  RH=8;
                                                  RH_SD=9;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=0;
                                                  Raft_Dir=15;
                                                  Water_Temp=4;
                                                  Water_Temp_SD=5;
                                                  BATT=16;
                                                });

$arrMet7Stations += $cstMetTDR1;

#Custom Object for Met TDR2 (Buoy) Station
$cstMetTDR2 = new-object PSObject -Property (@{ FileName="TDR2"; 
                                                  StationName="TDR2 (Buoy)";
                                                  ColNumber=17;
                                                  RD_Station_ID="7";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  Wind_Spd1=10;
                                                  Wind_Spd2=11;
                                                  Wind_Dir=12;
                                                  Wind_Dir_SD=13;
                                                  GUST=14;
                                                  Air_Temp=6;
                                                  Air_Temp_SD=7;
                                                  RH=8;
                                                  RH_SD=9;
                                                  Atm_Pres=0;
                                                  Atm_Pres_SD=0;
                                                  Precip=0;
                                                  Raft_Dir=15;
                                                  Water_Temp=4;
                                                  Water_Temp_SD=5;
                                                  BATT=16;
                                                });

$arrMet7Stations += $cstMetTDR2;

#Custom Object for Met USCG Station
$cstMetUSCG = new-object PSObject -Property (@{ FileName="USCG"; 
                                                  StationName="US Coast Guard Pier";
                                                  ColNumber=35;
                                                  RD_Station_ID="8";
                                                  Year=1;
                                                  Julian_Day=2;
                                                  Time=3;
                                                  KZ=4;
									              KZ_SD=5;
										          Epp_LW=6;
										          Epp_LW_SD=7;
										          CNR1_Rsin=8;
                                                  CNR1_Rsin_SD=9;
									              CNR1_Rsout=10;
									              CNR1_Rsout_SD=11;
										          CNR1_Rlin=12;
										          CNR1_Rlin_SD=13;
										          CNR1_Rlout=14;
										          CNR1_Rlout_SD=15;
										          Precip=16;
										          Atm_Pres=17;
										          Atm_Pres_SD=18;
										          Air_Temp=19;
										          Air_Temp_SD=20;
										          RH=21;
										          RH_SD=22;
										          Water_Temp=23;
										          Water_Temp_SD=24;
										          Wind_Spd1=25;
										          Wind_Spd2=26;
										          Wind_Dir=27;
										          Wind_Dir_SD=28;
										          GUST=29;
										          OS_Wind_Spd1=30;
										          OS_Wind_Spd2=31;
										          OS_Wind_Dir=32;
										          OS_Wind_Dir_SD=33;
										          BATT=34;
                                                });

#Add USCG Station to Array
$arrMetUSCGStations += $cstMetUSCG;

#Var for TERC API Header
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxx"};

#Var for TERC Met7 API URI
$tercMet7APIURI = "https://xxxxxxxxxxxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/met-stations";

#Var for TERC USCG API URI
$tercMetUSCGAPIURI = "https://xxxxxxxxxxxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/met-station-uscg";

#Var for Epoch Start Date
$dtEpoch = [DateTime]::Parse("01/01/1970");

#Check for Partial Folder and Create If Not There
if((Test-Path -Path $metPartialFldr) -eq $false)
{
    New-Item -Path $metPartialFldr -ItemType "directory";
}

#Check for Processed Folder and Create If Not There
if((Test-Path -Path $metProcesFldr) -eq $false)
{
    New-Item -Path $metProcesFldr -ItemType "directory";
}

#Var for Progress Indictator and AWS API Call Count
[int]$prgIndctr = 0;

#Loop Through Met 7 Stations
foreach($metStation in $arrMet7Stations)
{
    
    #Hashtable for Already Submitted Data Date Readings (Prevent Duplicates)
    $htSubmittedDates = @{};

    #Var for Partial File for Met Station
    [string]$metPartialFilePath = $metPartialFldr + "\Partial_" + $metStation.FileName + ".txt";

    #Var for File Search
    [string]$fldrFilter = $metDataFldr + $metStation.FileName + "*.dat";

    #Var for Active File Name 
    [string]$actFileName = $metStation.FileName.ToString().ToLower() + ".dat";

    #Var for Active File Full Path
    [string]$actFilePath = $metDataFldr + $actFileName;

    #Test for Path of Active File
    #if((Test-Path -Path $actFilePath) -eq $true)
    #{

        #Pull Data Files
        $colMetDataFiles = Get-ChildItem -Path $fldrFilter | Sort -Property LastWriteTime;

        #Loop Through Each Data File
        foreach($metDF in $colMetDataFiles)
        {

            #Check for Active File
            if($metDF.Name.ToString().Tolower() -ne $actFileName)
            {

                #Array for Station Data
                $arrStationData = @();

                #Pull File Contents into Array
                $fcMetDF = Get-Content -Path $metDF.FullName.ToString();

                #Loop Through Each Data Line Entry
                foreach($fcMetLE in $fcMetDF)
                {
                    #Split Line by Comma
                    $arrLEMet = $fcMetLE.ToString().Split(",");

                    #Check for the Correct Number of Columns 
                    if($arrLEMet -ne $null -and $arrLEMet.Length -eq $metStation.ColNumber)
                    {

                        #Custom Object for Json Conversion for API Call Payload
                        $cstJCMet = new-object PSObject -Property (@{ Station_ID="";
                                                                      RD_Date_Time_UTC="";
                                                                      RD_Date_Time_POSIX="";
                                                                      RD_Year="";
                                                                      RD_Julian_Day="";
                                                                      RD_Time="";
                                                                      Wind_Spd1="NULL";
                                                                      Wind_Spd2="NULL";
                                                                      Wind_Dir="NULL";
                                                                      Wind_Dir_SD="NULL";
                                                                      GUST="NULL";
                                                                      Air_Temp="NULL";
                                                                      Air_Temp_SD="NULL";
                                                                      RH="NULL";
                                                                      RH_SD="NULL";
                                                                      Atm_Pres="NULL";
                                                                      Atm_Pres_SD="NULL";
                                                                      Precip="NULL";
                                                                      Raft_Dir="NULL";
                                                                      Water_Temp="NULL";
                                                                      Water_Temp_SD="NULL";
                                                                      BATT="NULL";
                                                                      RD_Note="NULL"
                                                                      RD_Station_ID="NULL";
                                                                  });

                    
                        #Load Station Name
                        $cstJCMet.Station_ID = $metStation.StationName;

                        #Load Station RD ID
                        $cstJCMet.RD_Station_ID = $metStation.RD_Station_ID;
                    
                        #Convert Log Entry Timestamps to DateTime
                        $met_Year = $arrLEMet[$metStation.Year].ToString()
                        $met_DayOfYear = [int]::Parse($arrLEMet[$metStation.Julian_Day].ToString());
                        $met_Time = $arrLEMet[$metStation.Time].ToString();
                        $milTime = $Met_Time.PadLeft(4,'0');
                        $nMilHour = [int]::Parse(($milTime).Substring(0,2));
                        $nMilMinute = [int]::Parse(($milTime).Substring(2,2));
                        $dtMetReading = ([DateTime]::Parse("01/01/" + $met_Year)).AddDays($met_DayOfYear -1).AddHours($nMilHour).AddMinutes($nMilMinute);

                        #Load UTC Date
                        $cstJCMet.RD_Date_Time_UTC = $dtMetReading.ToString("yyyy-MM-dd HH:mm:ss");

                        #Load POSIX 
                        $cstJCMet.RD_Date_Time_POSIX = (New-TimeSpan -Start $dtEpoch -End $dtMetReading).TotalSeconds.ToString();

                        #Load Year
                        $cstJCMet.RD_Year = $met_Year;

                        #Load Julian Day
                        $cstJCMet.RD_Julian_Day = $arrLEMet[$metStation.Julian_Day].ToString();

                        #Load Military Time
                        $cstJCMet.RD_Time = $met_Time;

                        #Load Wind Speed 1
                        if($metStation.Wind_Spd1 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Spd1].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Spd1].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Wind_Spd1 = "0" + $arrLEMet[$metStation.Wind_Spd1].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Spd1].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Wind_Spd1 = $arrLEMet[$metStation.Wind_Spd1].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Spd1 = $arrLEMet[$metStation.Wind_Spd1].ToString();
                            }

                        }

                  
                        #Load Wind Speed 2
                        if($metStation.Wind_Spd2 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Spd2].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Spd2].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Wind_Spd2 = "0" + $arrLEMet[$metStation.Wind_Spd2].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Spd2].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Wind_Spd2 = $arrLEMet[$metStation.Wind_Spd2].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Spd2 = $arrLEMet[$metStation.Wind_Spd2].ToString();
                            }
                        
                        }
                                             
                        #Load Wind Dir
                        if($metStation.Wind_Dir -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Dir].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Dir].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Wind_Dir = "0" + $arrLEMet[$metStation.Wind_Dir].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Dir].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Wind_Dir = $arrLEMet[$metStation.Wind_Dir].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Dir = $arrLEMet[$metStation.Wind_Dir].ToString();
                            }

                        
                        }
                    
                        #Load Wind Dir SD
                        if($metStation.Wind_Dir_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Dir_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Dir_SD].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Wind_Dir_SD = "0" + $arrLEMet[$metStation.Wind_Dir_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Dir_SD].ToString().StartsWith("-.") -eq $true)
                            {
                                 $cstJCMet.Wind_Dir_SD = $arrLEMet[$metStation.Wind_Dir_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Dir_SD = $arrLEMet[$metStation.Wind_Dir_SD].ToString();
                            }

                        
                        }

                        #Load GUST
                        if($metStation.GUST -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.GUST].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.GUST].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.GUST = "0" + $arrLEMet[$metStation.GUST].ToString();
                            }
                            elseif($arrLEMet[$metStation.GUST].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.GUST = $arrLEMet[$metStation.GUST].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.GUST = $arrLEMet[$metStation.GUST].ToString();
                            }

                        
                        }                        
                        
                        #Load Air Temp
                        if($metStation.Air_Temp -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Air_Temp].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Air_Temp].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Air_Temp = "0" + $arrLEMet[$metStation.Air_Temp].ToString();
                            }
                            elseif($arrLEMet[$metStation.Air_Temp].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Air_Temp = $arrLEMet[$metStation.Air_Temp].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Air_Temp = $arrLEMet[$metStation.Air_Temp].ToString();
                            }
                        
                        }    
                                               
                         
                        #Load Air Temp SD
                        if($metStation.Air_Temp_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Air_Temp_SD].ToString()) -eq $false)
                        {
                        
                            if($arrLEMet[$metStation.Air_Temp_SD].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Air_Temp_SD = "0" + $arrLEMet[$metStation.Air_Temp_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Air_Temp_SD].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Air_Temp_SD = $arrLEMet[$metStation.Air_Temp_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Air_Temp_SD = $arrLEMet[$metStation.Air_Temp_SD].ToString();
                            }

                        }                           
                     
                        #Load RH
                        if($metStation.RH -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.RH].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.RH].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.RH = "0" + $arrLEMet[$metStation.RH].ToString();
                            }
                            elseif($arrLEMet[$metStation.RH].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.RH = $arrLEMet[$metStation.RH].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.RH = $arrLEMet[$metStation.RH].ToString();
                            }
                        
                        }
                    
                        #Load RH SD
                        if($metStation.RH_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.RH_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.RH_SD].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.RH_SD = "0" + $arrLEMet[$metStation.RH_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.RH_SD].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.RH_SD = $arrLEMet[$metStation.RH_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.RH_SD = $arrLEMet[$metStation.RH_SD].ToString();
                            }

                        
                        }
                                               
                        #Load Atm Pres
                        if($metStation.Atm_Pres -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Atm_Pres].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Atm_Pres].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Atm_Pres = "0" + $arrLEMet[$metStation.Atm_Pres].ToString();
                            }
                            elseif($arrLEMet[$metStation.Atm_Pres].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Atm_Pres = $arrLEMet[$metStation.Atm_Pres].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Atm_Pres = $arrLEMet[$metStation.Atm_Pres].ToString();
                            }
                        
                        }                       
                                                
                        #Load Atm Pres SD
                        if($metStation.Atm_Pres_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Atm_Pres_SD].ToString()) -eq $false)
                        {
                        
                            if($arrLEMet[$metStation.Atm_Pres_SD].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Atm_Pres_SD = "0" + $arrLEMet[$metStation.Atm_Pres_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Atm_Pres_SD].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Atm_Pres_SD = $arrLEMet[$metStation.Atm_Pres_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Atm_Pres_SD = $arrLEMet[$metStation.Atm_Pres_SD].ToString();
                            }

                        }                              
                                               
                        #Load Precip
                        if($metStation.Precip -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Precip].ToString()) -eq $false)
                        {
                        
                            if($arrLEMet[$metStation.Precip].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Precip = "0" + $arrLEMet[$metStation.Precip].ToString();
                            }
                            elseif($arrLEMet[$metStation.Precip].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Precip = $arrLEMet[$metStation.Precip].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Precip = $arrLEMet[$metStation.Precip].ToString();
                            }
                        
                        }                              
                      
                        #Load Raft Dir
                        if($metStation.Raft_Dir -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Raft_Dir].ToString()) -eq $false)
                        {
                            if($arrLEMet[$metStation.Raft_Dir].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Raft_Dir = "0" + $arrLEMet[$metStation.Raft_Dir].ToString();
                            }
                            elseif($arrLEMet[$metStation.Raft_Dir].ToString().StartsWith("-.") -eq $true)
                            {
                                 $cstJCMet.Raft_Dir = $arrLEMet[$metStation.Raft_Dir].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Raft_Dir = $arrLEMet[$metStation.Raft_Dir].ToString();
                            }
                        
                        }   
                      
                        #Load Water Temp
                        if($metStation.Water_Temp -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Water_Temp].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Water_Temp].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Water_Temp = "0" + $arrLEMet[$metStation.Water_Temp].ToString();
                            }
                            elseif($arrLEMet[$metStation.Water_Temp].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Water_Temp = $arrLEMet[$metStation.Water_Temp].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Water_Temp = $arrLEMet[$metStation.Water_Temp].ToString();
                            }
                        
                        }                         
                     
                        #Load Water Temp SD
                        if($metStation.Water_Temp_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Water_Temp_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Water_Temp_SD].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.Water_Temp_SD = "0" + $arrLEMet[$metStation.Water_Temp_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Water_Temp_SD].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.Water_Temp_SD = $arrLEMet[$metStation.Water_Temp_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Water_Temp_SD = $arrLEMet[$metStation.Water_Temp_SD].ToString();
                            }
                        
                        }                           
                                                 
                        #Load BATT
                        if($metStation.BATT -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.BATT].ToString()) -eq $false)
                        {
                        
                            if($arrLEMet[$metStation.BATT].ToString().StartsWith(".") -eq $true)
                            {
                                $cstJCMet.BATT = "0" + $arrLEMet[$metStation.BATT].ToString();
                            }
                            elseif($arrLEMet[$metStation.BATT].ToString().StartsWith("-.") -eq $true)
                            {
                                $cstJCMet.BATT = $arrLEMet[$metStation.BATT].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.BATT = $arrLEMet[$metStation.BATT].ToString();
                            }
                        
                        }    
                    
                                              
                        #Check to See If Data Date Has Already Been Added
                        if($htSubmittedDates.ContainsKey($cstJCMet.RD_Date_Time_POSIX) -eq $false)
                        {
                       
                            #Add Custom Object to Station Data Array
	                        $arrStationData += $cstJCMet;

                            #Add POSIX Date to Submitted Dates
                            $htSubmittedDates.Add($cstJCMet.RD_Date_Time_POSIX,"1");
                    
                        }#End of Data Date Duplication Check
                    

                   }
                   else
                   {
                        #Write Partial Reading to Partial File for Met Station
                        Add-Content $metPartialFilePath ("`n" + $fcMetLE.ToString());
                   }


                }#End of $fcMetDF Foreach

          
               #Load Up to AWS If Any
               if($arrStationData.count -gt 0)
               {

                    #Custom Object for the API Call Post Body
                    $cstPostBody = new-object PSObject -Property (@{TSReadings=@(); Status=""});
                    $cstPostBody.Status = "Success";

                
                    #Loop Through Station Data
                    foreach($tsData in $arrStationData)
                    {

                        #Load Terc Station Data into Readings Array
                        $cstPostBody.TSReadings += $tsData;

                        if($cstPostBody.TSReadings.Count % 10 -eq 0)
                        {
                            #Notify of Progess
                            Write-Output ($metStation.StationName + " " + [datetime]::Now.ToString());

                            #Convert Post Body to Json Object
                            $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                            #Make API call to AWS
                            $awsStatus = Invoke-RestMethod -Uri $tercMet7APIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                            #For No Successful API Calls Exit Loops
                            if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                            {
                                 #$awsStatus | Select-Object \96ExpandProperty stacktrace
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
                        Write-Output ($metStation.StationName);

                        #Convert Post Body to Json Object
                        $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                        #Make API call to AWS
                        $awsStatus = Invoke-RestMethod -Uri $tercMet7APIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                        #For No Successful API Calls Exit Loops
                        if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                        {
                           #$awsStatus | Select-Object \96ExpandProperty stacktrace
                           exit;
                        }

                        #Clear TSReadings Array
                        $cstPostBody.TSReadings = @();

                     }#End of TSReadings Remaining Check


               }#End of $arrStationData Count Check for Each File


               #Move the File to Processed
               Move-Item -Path $metDF.FullName -Destination $metProcesFldr;


            }#End of Active File Check


        }#End of $colMetDataFiles Foreach


    #}#End of $actFilePath Test-Path


}#End of $arrMet7Stations Foreach

#Loop Through Met USCG Stations
foreach($metStation in $arrMetUSCGStations)
{

    #Hashtable for Already Submitted Data Date Readings (Prevent Duplicates)
    $htSubmittedDates = @{};

    #Var for Partial File for Met Station
    [string]$metPartialFilePath = $metPartialFldr + "\Partial_" + $metStation.FileName + ".txt";

    #Var for File Search
    [string]$fldrFilter = $metDataFldr + $metStation.FileName + "*.dat";

    #Var for Active File Name 
    [string]$actFileName = $metStation.FileName.ToString().ToLower() + ".dat";

    #Var for Active File Full Path
    [string]$actFilePath = $metDataFldr + $actFileName;

    #Test for Path of Active File
    #if((Test-Path -Path $actFilePath) -eq $true)
    #{
        
        #Pull Data Files
        $colMetDataFiles = Get-ChildItem -Path $fldrFilter | Sort -Property LastWriteTime;

        #Loop Through Each Data File
        foreach($metDF in $colMetDataFiles)
        {

             #Check for Active File
             if($metDF.Name.ToString().Tolower() -ne $actFileName)
             {
                #Array for Station Data
                $arrStationData = @();

                #Pull File Contents into Array
                $fcMetDF = Get-Content -Path $metDF.FullName.ToString();

                #Loop Through Each Data Line Entry
                foreach($fcMetLE in $fcMetDF)
                {

                    #Split Line by Comma
                    $arrLEMet = $fcMetLE.ToString().Split(",");

                    #Check for the Correct Number of Columns 
                    if($arrLEMet -ne $null -and $arrLEMet.Length -eq $metStation.ColNumber)
                    {
                        #Custom Object for Json Conversion for API Call Payload
                        $cstJCMet = new-object PSObject -Property (@{ Station_ID="";
                                                                      RD_Date_Time_UTC="";
                                                                      RD_Date_Time_POSIX="";
                                                                      RD_Year="";
                                                                      RD_Julian_Day="";
                                                                      RD_Time="";
                                                                      KZ="NULL";
									                                  KZ_SD="NULL";
										                              Epp_LW="NULL";
										                              Epp_LW_SD="NULL";
										                              CNR1_Rsin="NULL";
                                                                      CNR1_Rsin_SD="NULL";
									                                  CNR1_Rsout="NULL";
									                                  CNR1_Rsout_SD="NULL";
										                              CNR1_Rlin="NULL";
										                              CNR1_Rlin_SD="NULL";
										                              CNR1_Rlout="NULL";
										                              CNR1_Rlout_SD="NULL";
										                              Precip="NULL";
										                              Atm_Pres="NULL";
										                              Atm_Pres_SD="NULL";
										                              Air_Temp="NULL";
										                              Air_Temp_SD="NULL";
										                              RH="NULL";
										                              RH_SD="NULL";
										                              Water_Temp="NULL";
										                              Water_Temp_SD="NULL";
										                              Wind_Spd1="NULL";
										                              Wind_Spd2="NULL";
										                              Wind_Dir="NULL";
										                              Wind_Dir_SD="NULL";
										                              GUST="NULL";
										                              OS_Wind_Spd1="NULL";
										                              OS_Wind_Spd2="NULL";
										                              OS_Wind_Dir="NULL";
										                              OS_Wind_Dir_SD="NULL";
										                              BATT="NULL";
                                                                      RD_Station_ID="NULL";
                                                                  });


                        #Load Station Name
                        $cstJCMet.Station_ID = $metStation.StationName;

                        #Load Station RD ID
                        $cstJCMet.RD_Station_ID = $metStation.RD_Station_ID;
                    
                        #Convert Log Entry Timestamps to DateTime
                        $met_Year = $arrLEMet[$metStation.Year].ToString()
                        $met_DayOfYear = [int]::Parse($arrLEMet[$metStation.Julian_Day].ToString());
                        $met_Time = $arrLEMet[$metStation.Time].ToString();
                        $milTime = $Met_Time.PadLeft(4,'0');
                        $nMilHour = [int]::Parse(($milTime).Substring(0,2));
                        $nMilMinute = [int]::Parse(($milTime).Substring(2,2));
                        $dtMetReading = ([DateTime]::Parse("01/01/" + $met_Year)).AddDays($met_DayOfYear -1).AddHours($nMilHour).AddMinutes($nMilMinute);

                        #Load UTC Date
                        $cstJCMet.RD_Date_Time_UTC = $dtMetReading.ToString("yyyy-MM-dd HH:mm:ss");

                        #Load POSIX 
                        $cstJCMet.RD_Date_Time_POSIX = (New-TimeSpan -Start $dtEpoch -End $dtMetReading).TotalSeconds.ToString();

                        #Load Year
                        $cstJCMet.RD_Year = $met_Year;

                        #Load Julian Day
                        $cstJCMet.RD_Julian_Day = $arrLEMet[$metStation.Julian_Day].ToString();

                        #Load Military Time
                        $cstJCMet.RD_Time = $met_Time;

                        #Load KZ
                        if($metStation.KZ -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.KZ].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.KZ].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.KZ = "0" + $arrLEMet[$metStation.KZ].ToString();
                            }
                            elseif($arrLEMet[$metStation.KZ].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.KZ = $arrLEMet[$metStation.KZ].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.KZ = $arrLEMet[$metStation.KZ].ToString();
                            }

                        }#End of KZ

                        #Load KZ_SD
                        if($metStation.KZ_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.KZ_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.KZ_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.KZ_SD = "0" + $arrLEMet[$metStation.KZ_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.KZ_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.KZ_SD = $arrLEMet[$metStation.KZ_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.KZ_SD = $arrLEMet[$metStation.KZ_SD].ToString();
                            }

                        }#End of KZ_SD

                        #Load Epp_LW
                        if($metStation.Epp_LW -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Epp_LW].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Epp_LW].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Epp_LW = "0" + $arrLEMet[$metStation.Epp_LW].ToString();
                            }
                            elseif($arrLEMet[$metStation.Epp_LW].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Epp_LW = $arrLEMet[$metStation.Epp_LW].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Epp_LW = $arrLEMet[$metStation.Epp_LW].ToString();
                            }

                        }#End of Epp_LW

                        #Load Epp_LW_SD
                        if($metStation.Epp_LW_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Epp_LW_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Epp_LW_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Epp_LW_SD = "0" + $arrLEMet[$metStation.Epp_LW_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Epp_LW_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Epp_LW_SD = $arrLEMet[$metStation.Epp_LW_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Epp_LW_SD = $arrLEMet[$metStation.Epp_LW_SD].ToString();
                            }

                        }#End of Epp_LW_SD

                        #Load CNR1_Rsin
                        if($metStation.CNR1_Rsin -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rsin].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rsin].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsin = "0" + $arrLEMet[$metStation.CNR1_Rsin].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rsin].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsin = $arrLEMet[$metStation.CNR1_Rsin].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rsin = $arrLEMet[$metStation.CNR1_Rsin].ToString();
                            }

                        }#End of CNR1_Rsin


                        #Load CNR1_Rsin_SD
                        if($metStation.CNR1_Rsin_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rsin_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rsin_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsin_SD = "0" + $arrLEMet[$metStation.CNR1_Rsin_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rsin_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsin_SD = $arrLEMet[$metStation.CNR1_Rsin_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rsin_SD = $arrLEMet[$metStation.CNR1_Rsin_SD].ToString();
                            }

                        }#End of CNR1_Rsin_SD



                        #Load CNR1_Rsout
                        if($metStation.CNR1_Rsout -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rsout].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rsout].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsout = "0" + $arrLEMet[$metStation.CNR1_Rsout].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rsout].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsout = $arrLEMet[$metStation.CNR1_Rsout].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rsout = $arrLEMet[$metStation.CNR1_Rsout].ToString();
                            }

                        }#End of CNR1_Rsout


                        #Load CNR1_Rsout_SD
                        if($metStation.CNR1_Rsout_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rsout_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rsout_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsout_SD = "0" + $arrLEMet[$metStation.CNR1_Rsout_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rsout_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rsout_SD = $arrLEMet[$metStation.CNR1_Rsout_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rsout_SD = $arrLEMet[$metStation.CNR1_Rsout_SD].ToString();
                            }

                        }#End of CNR1_Rsout_SD

                        #Load CNR1_Rlin
                        if($metStation.CNR1_Rlin -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rlin].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rlin].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlin = "0" + $arrLEMet[$metStation.CNR1_Rlin].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rlin].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlin = $arrLEMet[$metStation.CNR1_Rlin].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rlin = $arrLEMet[$metStation.CNR1_Rlin].ToString();
                            }

                        }#End of CNR1_Rlin

                        #Load CNR1_Rlin_SD
                        if($metStation.CNR1_Rlin_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rlin_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rlin_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlin_SD = "0" + $arrLEMet[$metStation.CNR1_Rlin_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rlin_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlin_SD = $arrLEMet[$metStation.CNR1_Rlin_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rlin_SD = $arrLEMet[$metStation.CNR1_Rlin_SD].ToString();
                            }

                        }#End of CNR1_Rlin_SD

                        #Load CNR1_Rlout
                        if($metStation.CNR1_Rlout -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rlout].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rlout].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlout = "0" + $arrLEMet[$metStation.CNR1_Rlout].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rlout].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlout = $arrLEMet[$metStation.CNR1_Rlout].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rlout = $arrLEMet[$metStation.CNR1_Rlout].ToString();
                            }

                        }#End of CNR1_Rlout

                        #Load CNR1_Rlout_SD
                        if($metStation.CNR1_Rlout_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.CNR1_Rlout_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.CNR1_Rlout_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlout_SD = "0" + $arrLEMet[$metStation.CNR1_Rlout_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.CNR1_Rlout_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.CNR1_Rlout_SD = $arrLEMet[$metStation.CNR1_Rlout_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.CNR1_Rlout_SD = $arrLEMet[$metStation.CNR1_Rlout_SD].ToString();
                            }

                        }#End of CNR1_Rlout_SD

                        #Load Precip
                        if($metStation.Precip -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Precip].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Precip].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Precip = "0" + $arrLEMet[$metStation.Precip].ToString();
                            }
                            elseif($arrLEMet[$metStation.Precip].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Precip = $arrLEMet[$metStation.Precip].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Precip = $arrLEMet[$metStation.Precip].ToString();
                            }

                        }#End of Precip


                        #Load Atm_Pres
                        if($metStation.Atm_Pres -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Atm_Pres].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Atm_Pres].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Atm_Pres = "0" + $arrLEMet[$metStation.Atm_Pres].ToString();
                            }
                            elseif($arrLEMet[$metStation.Atm_Pres].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Atm_Pres = $arrLEMet[$metStation.Atm_Pres].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Atm_Pres = $arrLEMet[$metStation.Atm_Pres].ToString();
                            }

                        }#End of Atm_Pres

                        #Load Atm_Pres_SD
                        if($metStation.Atm_Pres_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Atm_Pres_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Atm_Pres_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Atm_Pres_SD = "0" + $arrLEMet[$metStation.Atm_Pres_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Atm_Pres_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Atm_Pres_SD = $arrLEMet[$metStation.Atm_Pres_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Atm_Pres_SD = $arrLEMet[$metStation.Atm_Pres_SD].ToString();
                            }

                        }#End of Atm_Pres_SD

                        #Load Air_Temp
                        if($metStation.Air_Temp -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Air_Temp].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Air_Temp].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Air_Temp = "0" + $arrLEMet[$metStation.Air_Temp].ToString();
                            }
                            elseif($arrLEMet[$metStation.Air_Temp].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Air_Temp = $arrLEMet[$metStation.Air_Temp].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Air_Temp = $arrLEMet[$metStation.Air_Temp].ToString();
                            }

                        }#End of Air_Temp

                        #Load Air_Temp_SD
                        if($metStation.Air_Temp_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Air_Temp_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Air_Temp_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Air_Temp_SD = "0" + $arrLEMet[$metStation.Air_Temp_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Air_Temp_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Air_Temp_SD = $arrLEMet[$metStation.Air_Temp_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Air_Temp_SD = $arrLEMet[$metStation.Air_Temp_SD].ToString();
                            }

                        }#End of Air_Temp_SD

                        #Load RH
                        if($metStation.RH -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.RH].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.RH].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.RH = "0" + $arrLEMet[$metStation.RH].ToString();
                            }
                            elseif($arrLEMet[$metStation.RH].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.RH = $arrLEMet[$metStation.RH].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.RH = $arrLEMet[$metStation.RH].ToString();
                            }

                        }#End of RH

                        #Load RH_SD
                        if($metStation.RH_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.RH_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.RH_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.RH_SD = "0" + $arrLEMet[$metStation.RH_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.RH_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.RH_SD = $arrLEMet[$metStation.RH_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.RH_SD = $arrLEMet[$metStation.RH_SD].ToString();
                            }

                        }#End of RH_SD

                        #Load Water_Temp
                        if($metStation.Water_Temp -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Water_Temp].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Water_Temp].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Water_Temp = "0" + $arrLEMet[$metStation.Water_Temp].ToString();
                            }
                            elseif($arrLEMet[$metStation.Water_Temp].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Water_Temp = $arrLEMet[$metStation.Water_Temp].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Water_Temp = $arrLEMet[$metStation.Water_Temp].ToString();
                            }

                        }#End of Water_Temp

                        #Load Water_Temp_SD
                        if($metStation.Water_Temp_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Water_Temp_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Water_Temp_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Water_Temp_SD = "0" + $arrLEMet[$metStation.Water_Temp_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Water_Temp_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Water_Temp_SD = $arrLEMet[$metStation.Water_Temp_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Water_Temp_SD = $arrLEMet[$metStation.Water_Temp_SD].ToString();
                            }

                        }#End of Water_Temp_SD

                        #Load Wind_Spd1
                        if($metStation.Wind_Spd1 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Spd1].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Spd1].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Wind_Spd1 = "0" + $arrLEMet[$metStation.Wind_Spd1].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Spd1].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Wind_Spd1 = $arrLEMet[$metStation.Wind_Spd1].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Spd1 = $arrLEMet[$metStation.Wind_Spd1].ToString();
                            }

                        }#End of Wind_Spd1

                        #Load Wind_Spd2
                        if($metStation.Wind_Spd2 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Spd2].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Spd2].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Wind_Spd2 = "0" + $arrLEMet[$metStation.Wind_Spd2].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Spd2].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Wind_Spd2 = $arrLEMet[$metStation.Wind_Spd2].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Spd2 = $arrLEMet[$metStation.Wind_Spd2].ToString();
                            }

                        }#End of Wind_Spd2

                        #Load Wind_Dir
                        if($metStation.Wind_Dir -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Dir].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Dir].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Wind_Dir = "0" + $arrLEMet[$metStation.Wind_Dir].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Dir].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Wind_Dir = $arrLEMet[$metStation.Wind_Dir].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Dir = $arrLEMet[$metStation.Wind_Dir].ToString();
                            }

                        }#End of Wind_Dir

                        #Load Wind_Dir_SD
                        if($metStation.Wind_Dir_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.Wind_Dir_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.Wind_Dir_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.Wind_Dir_SD = "0" + $arrLEMet[$metStation.Wind_Dir_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.Wind_Dir_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.Wind_Dir_SD = $arrLEMet[$metStation.Wind_Dir_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.Wind_Dir_SD = $arrLEMet[$metStation.Wind_Dir_SD].ToString();
                            }

                        }#End of Wind_Dir_SD

                        #Load GUST
                        if($metStation.GUST -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.GUST].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.GUST].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.GUST = "0" + $arrLEMet[$metStation.GUST].ToString();
                            }
                            elseif($arrLEMet[$metStation.GUST].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.GUST = $arrLEMet[$metStation.GUST].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.GUST = $arrLEMet[$metStation.GUST].ToString();
                            }

                        }#End of GUST

                        #Load OS_Wind_Spd1
                        if($metStation.OS_Wind_Spd1 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.OS_Wind_Spd1].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.OS_Wind_Spd1].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Spd1 = "0" + $arrLEMet[$metStation.OS_Wind_Spd1].ToString();
                            }
                            elseif($arrLEMet[$metStation.OS_Wind_Spd1].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Spd1 = $arrLEMet[$metStation.OS_Wind_Spd1].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.OS_Wind_Spd1 = $arrLEMet[$metStation.OS_Wind_Spd1].ToString();
                            }

                        }#End of OS_Wind_Spd1

                        #Load OS_Wind_Spd2
                        if($metStation.OS_Wind_Spd2 -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.OS_Wind_Spd2].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.OS_Wind_Spd2].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Spd2 = "0" + $arrLEMet[$metStation.OS_Wind_Spd2].ToString();
                            }
                            elseif($arrLEMet[$metStation.OS_Wind_Spd2].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Spd2 = $arrLEMet[$metStation.OS_Wind_Spd2].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.OS_Wind_Spd2 = $arrLEMet[$metStation.OS_Wind_Spd2].ToString();
                            }

                        }#End of OS_Wind_Spd2

                        #Load OS_Wind_Dir
                        if($metStation.OS_Wind_Dir -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.OS_Wind_Dir].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.OS_Wind_Dir].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Dir = "0" + $arrLEMet[$metStation.OS_Wind_Dir].ToString();
                            }
                            elseif($arrLEMet[$metStation.OS_Wind_Dir].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Dir = $arrLEMet[$metStation.OS_Wind_Dir].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.OS_Wind_Dir = $arrLEMet[$metStation.OS_Wind_Dir].ToString();
                            }

                        }#End of OS_Wind_Dir

                        #Load OS_Wind_Dir_SD
                        if($metStation.OS_Wind_Dir_SD -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.OS_Wind_Dir_SD].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.OS_Wind_Dir_SD].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Dir_SD = "0" + $arrLEMet[$metStation.OS_Wind_Dir_SD].ToString();
                            }
                            elseif($arrLEMet[$metStation.OS_Wind_Dir_SD].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.OS_Wind_Dir_SD = $arrLEMet[$metStation.OS_Wind_Dir_SD].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.OS_Wind_Dir_SD = $arrLEMet[$metStation.OS_Wind_Dir_SD].ToString();
                            }

                        }#End of OS_Wind_Dir_SD

                        #Load BATT
                        if($metStation.BATT -ne 0 -and [string]::IsNullOrEmpty($arrLEMet[$metStation.BATT].ToString()) -eq $false)
                        {

                            if($arrLEMet[$metStation.BATT].ToString().StartsWith(".") -eq $true)
                            {
                               $cstJCMet.BATT = "0" + $arrLEMet[$metStation.BATT].ToString();
                            }
                            elseif($arrLEMet[$metStation.BATT].ToString().StartsWith("-.") -eq $true)
                            {
                               $cstJCMet.BATT = $arrLEMet[$metStation.BATT].ToString().Replace("-.","-0.");
                            }
                            else
                            {
                                $cstJCMet.BATT = $arrLEMet[$metStation.BATT].ToString();
                            }

                        }#End of BATT

                        
                        #Check to See If Data Date Has Already Been Added
                        if($htSubmittedDates.ContainsKey($cstJCMet.RD_Date_Time_POSIX) -eq $false)
                        {
                       
                            #Add Custom Object to Station Data Array
	                        $arrStationData += $cstJCMet;

                            #Add POSIX Date to Submitted Dates
                            $htSubmittedDates.Add($cstJCMet.RD_Date_Time_POSIX,"1");
                    
                        }#End of Data Date Duplication Check



                    }
                    else
                    {
                        #Write Partial Reading to Partial File for Met Station
                        Add-Content $metPartialFilePath ("`n" + $fcMetLE.ToString());

                    }#End of $arrLEMet Checks



                }#End of $fcMetDF Foreach

                

                #Load Up to AWS If Any
               if($arrStationData.count -gt 0)
               {

                    #Custom Object for the API Call Post Body
                    $cstPostBody = new-object PSObject -Property (@{TSReadings=@(); Status=""});
                    $cstPostBody.Status = "Success";

                
                    #Loop Through Station Data
                    foreach($tsData in $arrStationData)
                    {

                        #Load Terc Station Data into Readings Array
                        $cstPostBody.TSReadings += $tsData;

                        if($cstPostBody.TSReadings.Count % 10 -eq 0)
                        {
                            #Notify of Progess
                            Write-Output ($metStation.StationName + " " + [datetime]::Now.ToString());

                            #Convert Post Body to Json Object
                            $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                            #Make API call to AWS
                            $awsStatus = Invoke-RestMethod -Uri $tercMetUSCGAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                            #For No Successful API Calls Exit Loops
                            if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                            {
                                 #$awsStatus | Select-Object -ExpandProperty stacktrace
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
                        Write-Output ($metStation.StationName);

                        #Convert Post Body to Json Object
                        $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                        #Make API call to AWS
                        $awsStatus = Invoke-RestMethod -Uri $tercMetUSCGAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                        #For No Successful API Calls Exit Loops
                        if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                        {
                           #$awsStatus | Select-Object -ExpandProperty stacktrace
                           exit;
                        }

                        #Clear TSReadings Array
                        $cstPostBody.TSReadings = @();

                     }#End of TSReadings Remaining Check


               }#End of $arrStationData Count Check for Each File

               #Move the File to Processed
               Move-Item -Path $metDF.FullName -Destination $metProcesFldr;

             }#End of $actFileName Check

        }#End of $colMetDataFiles Foreach


    #}#End of $actFilePath Test-Path 


}#End of $arrMetUSCGStations Foreach

#Run Hourly Executable
C:\Data_Utilities\Run_Hourly.exe
