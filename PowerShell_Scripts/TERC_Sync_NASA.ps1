<#
    TERC_Sync_NASA.ps1
#>


#Var for Private Key
[string]$nasaKeyLoc = "C:\users\dbunn\.ssh\xxxxxxxxx.ppk";

#Var for NASA Server and Main Folder
[string]$nasaSrvMainSSHPath = "ucdavis@xxxxxxxxxxxxx.jpl.nasa.gov:/home/xxxxxxxx/xxxxxxxx/";


#Var Local Buoy Folder Location
[string]$fldrRootBuoyData = "C:\TERC_Sync\"

#Var for TERC API Header
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxxxx"};

#Var for TERC NASA TB API URI
$tercNASAAPIURI = "https://xxxxxxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/nasa-tb";


#Array for NASA Buoys
$arrNASABuoys = @();

#Custom Object for Buoy TB1
$cstBouyTB1 = new-object PSObject -Property (@{ SyncFolder="tb1"; 
                                                BuoyName="tb1";
                                                BuoyID="1";
                                              });

#Custom Object for Buoy TB2
$cstBouyTB2 = new-object PSObject -Property (@{ SyncFolder="tb2"; 
                                                BuoyName="tb2";
                                                BuoyID="2";
                                              });

#Custom Object for Buoy TB3
$cstBouyTB3 = new-object PSObject -Property (@{ SyncFolder="tb3"; 
                                                BuoyName="tb3";
                                                BuoyID="3";
                                              });

#Custom Object for Buoy TB4
$cstBouyTB4 = new-object PSObject -Property (@{ SyncFolder="tb4"; 
                                                BuoyName="tb4";
                                                BuoyID="4";
                                              });

#Load Buoy Objects into Array
$arrNASABuoys += $cstBouyTB1;
$arrNASABuoys += $cstBouyTB2;
$arrNASABuoys += $cstBouyTB3;
$arrNASABuoys += $cstBouyTB4;

#Empty and Reload the Buoy Data Files
foreach($buoy in $arrNASABuoys)
{

    #Var for Buoy Folder Location
    [string]$fldrBouyData = $fldrRootBuoyData + $buoy.SyncFolder; 

    #Var for Bouy Folder CSV Filter 
    [string]$fldrCSVFilter = $fldrBouyData + "\*.csv";

    #Var for Bouy SSH Path
    [string]$sshNASABouySyncPath = $nasaSrvMainSSHPath + $buoy.SyncFolder + "/*.csv"

    #Remove Old Files
    Get-ChildItem -Path $fldrCSVFilter | Remove-Item -Force;

    #PSCP Pull Data
    pscp -p -i $nasaKeyLoc $sshNASABouySyncPath $fldrBouyData;


}#End of Empty and Reload Buoy Data


#Parse Buoy Data and Send to AWS
foreach($buoy in $arrNASABuoys)
{

    #Var for API with Buoy ID Query String 
    [string]$uriBuoyGetLastSync = $tercNASAAPIURI + "?id=" + $buoy.BuoyID;

    #Pull Last Sync Date for Buoy
    [string]$lstSyncdDate = Invoke-RestMethod -Uri $uriBuoyGetLastSync -Method Get -Headers $tercHeader;

    #DateTime for Last Sync Date
    $dtLastSyncdDate = [DateTime]::Parse($lstSyncdDate);

    
    if([string]::IsNullOrEmpty($lstSyncdDate) -eq $false)
    {
        
        #Var for CSV Filter
        [string]$fpFltrBuoyDataFiles = $fldrRootBuoyData + $buoy.SyncFolder + "\*.csv";

        #Pull Buoy CSV files
        $colBuoyDataFiles = Get-ChildItem -Path $fpFltrBuoyDataFiles | Sort -Property LastWriteTime;

        #Loop Through Each Buoy Data File
        foreach($buoyDF in $colBuoyDataFiles)
        {

           #Array for Station Data
           $arrStationData = @();

           #Import CSV of Buoy Data File   
           $csvBuoyDF = Import-Csv -Path $buoyDF.FullName.ToString();

           #Loop CSV Data
           foreach($dtRow in $csvBuoyDF)
           {

                #Check for Rows with Actual Dates
                if($dtRow.Date.StartsWith("2") -eq $true -and [string]::IsNullOrEmpty($dtRow.Time) -eq $false)
                {
                    
                    #Convert Buoy Date and Time Values in DateTime
                    $dtBuoyLE = [DateTime]::Parse($dtRow.Date + " " + $dtRow.Time);

                    #Compare to Last Sync Date for Buoy
                    if($dtBuoyLE -gt $dtLastSyncdDate)
                    {

                        #Custom Object for Json Conversion for API Call Payload
                        $cstBDROJC = new-object PSObject -Property (@{ TB_ID="";
                                                                       TB_Name="";
                                                                       TmStamp="";
                                                                       Date_RD="";
                                                                       Time_RD="";
                                                                       RBR_5p5_m="NULL";
                                                                       RBR_5p0_m="NULL";
                                                                       RBR_4p0_m="NULL";
                                                                       RBR_3p0_m="NULL";
                                                                       RBR_2p0_m="NULL";
                                                                       RBR_1p5_m="NULL";
                                                                       RBR_1p0_m="NULL";
                                                                       RBR_0p5_m="NULL";
                                                                       WindSpeed_1="NULL";
                                                                       WindDir_1="NULL";
                                                                       Compass_1="NULL";
                                                                       AirTemp_1="NULL";
                                                                       RH_1="NULL";
                                                                       Pressure_1="NULL";
                                                                       WindSpeed_2="NULL";
                                                                       WindDir_2="NULL";
                                                                       Compass_2="NULL";
                                                                       AirTemp_2="NULL";
                                                                       RH_2="NULL";
                                                                       Pressure_2="NULL";
                                                                     });

                        #Load Data Row Values into Custom JC Objects
                        $cstBDROJC.TB_ID = $buoy.BuoyID;
                        $cstBDROJC.TB_Name = $buoy.BuoyName;
                        $cstBDROJC.TmStamp = $dtRow.Date + " " + $dtRow.Time;
                        $cstBDROJC.Date_RD = $dtRow.Date;
                        $cstBDROJC.Time_RD = $dtRow.Time;

                        #Check RBR1
                        if([string]::IsNullOrEmpty($dtRow.RBR1) -eq $false)
                        {
                            $cstBDROJC.RBR_5p5_m = $dtRow.RBR1;
                        }

                        #Check RBR2
                        if([string]::IsNullOrEmpty($dtRow.RBR2) -eq $false)
                        {
                            $cstBDROJC.RBR_5p0_m = $dtRow.RBR2;
                        }

                        #Check RBR3
                        if([string]::IsNullOrEmpty($dtRow.RBR3) -eq $false)
                        {
                            $cstBDROJC.RBR_4p0_m = $dtRow.RBR3;
                        }

                        #Check RBR4
                        if([string]::IsNullOrEmpty($dtRow.RBR4) -eq $false)
                        {
                            $cstBDROJC.RBR_3p0_m = $dtRow.RBR4;
                        }

                        #Check RBR5
                        if([string]::IsNullOrEmpty($dtRow.RBR5) -eq $false)
                        {
                            $cstBDROJC.RBR_2p0_m = $dtRow.RBR5;
                        }

                        #Check RBR6
                        if([string]::IsNullOrEmpty($dtRow.RBR6) -eq $false)
                        {
                            $cstBDROJC.RBR_1p5_m = $dtRow.RBR6;
                        }

                        #Check RBR7
                        if([string]::IsNullOrEmpty($dtRow.RBR7) -eq $false)
                        {
                            $cstBDROJC.RBR_1p0_m = $dtRow.RBR7;
                        }

                        #Check RBR8
                        if([string]::IsNullOrEmpty($dtRow.RBR8) -eq $false)
                        {
                            $cstBDROJC.RBR_0p5_m = $dtRow.RBR8;
                        }

                        #Check WindSpeed_1
                        if([string]::IsNullOrEmpty($dtRow.WindSpeed_1) -eq $false)
                        {
                            $cstBDROJC.WindSpeed_1 = $dtRow.WindSpeed_1;
                        }

                        #Check WindDir_1
                        if([string]::IsNullOrEmpty($dtRow.WindDir_1) -eq $false)
                        {
                            $cstBDROJC.WindDir_1 = $dtRow.WindDir_1;
                        }

                        #Check Compass_1
                        if([string]::IsNullOrEmpty($dtRow.Compass_1) -eq $false)
                        {
                            $cstBDROJC.Compass_1 = $dtRow.Compass_1;
                        }

                        #Check AirTemp_1
                        if([string]::IsNullOrEmpty($dtRow.AirTemp_1) -eq $false)
                        {
                            $cstBDROJC.AirTemp_1 = $dtRow.AirTemp_1;
                        }

                        #Check RH_1
                        if([string]::IsNullOrEmpty($dtRow.RH_1) -eq $false)
                        {
                            $cstBDROJC.RH_1 = $dtRow.RH_1;
                        }

                        #Check Pressure_1
                        if([string]::IsNullOrEmpty($dtRow.Pressure_1) -eq $false)
                        {
                            $cstBDROJC.Pressure_1 = $dtRow.Pressure_1;
                        }

                        #Check WindSpeed_2
                        if([string]::IsNullOrEmpty($dtRow.WindSpeed_2) -eq $false)
                        {
                            $cstBDROJC.WindSpeed_2 = $dtRow.WindSpeed_2;
                        }

                        #Check WindDir_2
                        if([string]::IsNullOrEmpty($dtRow.WindDir_2) -eq $false)
                        {
                            $cstBDROJC.WindDir_2 = $dtRow.WindDir_2;
                        }

                        #Check Compass_2
                        if([string]::IsNullOrEmpty($dtRow.Compass_2) -eq $false)
                        {
                            $cstBDROJC.Compass_2 = $dtRow.Compass_2;
                        }

                        #Check AirTemp_2
                        if([string]::IsNullOrEmpty($dtRow.AirTemp_2) -eq $false)
                        {
                            $cstBDROJC.AirTemp_2 = $dtRow.AirTemp_2;
                        }

                        #Check RH_2
                        if([string]::IsNullOrEmpty($dtRow.RH_2) -eq $false)
                        {
                            $cstBDROJC.RH_2 = $dtRow.RH_2;
                        }

                        #Check Pressure_2
                        if([string]::IsNullOrEmpty($dtRow.Pressure_2) -eq $false)
                        {
                            $cstBDROJC.Pressure_2 = $dtRow.Pressure_2;
                        }


                        #Add Custom Object to Station Data Array
	                    $arrStationData += $cstBDROJC;


                    }#End of Compare Last Sync Date Check
                    

                }#End of Rows with Actual Dates Checks


           }#End of $csvBuoyDF Foreach


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
                        #Write-Output ($buoy.BuoyName + " " + [datetime]::Now.ToString());

                        #Convert Post Body to Json Object
                        $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                        #Make API call to AWS
                        $awsStatus = Invoke-RestMethod -Uri $tercNASAAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

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
                    #Write-Output ($buoy.BuoyName);

                    #Convert Post Body to Json Object
                    $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                    #Make API call to AWS
                    $awsStatus = Invoke-RestMethod -Uri $tercNASAAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                    #For No Successful API Calls Exit Loops
                    if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                    {
                        #$awsStatus | Select-Object -ExpandProperty stacktrace
                        exit;
                    }

                    #Clear TSReadings Array
                    $cstPostBody.TSReadings = @();

               }#End of TSReadings Remaining Check


           }#End of $arrStationData Count Check


        }#End of $colBuoyDataFiles Foreach


    }#End of $lstSyncdDate Null\Empty Check
    

}#End of Parse Buoy Data and Send to AWS
