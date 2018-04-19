<#
    TERC_Sync_USGS.ps1
#>

#Var for TERC API Header
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"};

#Var for TERC USGS WS API URI
[string]$tercUSGSAPIURI = "https://xxxxxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/usgs-ws";

#Var for USGS Data API URI
[string]$usgsAPIBase = "https://xxxxxxxxxxxxxxxxxx.usgs.gov/nwis/dv/?format=json&siteStatus=active&parameterCd=";

#Array for USGS WS Stations
$arrUSGSWaterstations = @();

#Custom Objects for Water Station
$cstWS01 = new-object PSObject -Property (@{ Site="103366092"; 
                                             parameterCd="00060";
                                             Location="Upper Truckee River near Meyers";
                                             Longitude="-120.028";
                                             Latitude="38.848";
                                         });

$cstWS02 = new-object PSObject -Property (@{ Site="10336610"; 
                                             parameterCd="00060";
                                             Location="Upper Truckee River at South Lake Tahoe";
                                             Longitude="-119.992";
                                             Latitude="38.922";
                                         });

$cstWS03 = new-object PSObject -Property (@{ Site="10336645"; 
                                             parameterCd="00060";
                                             Location="General Creek";
                                             Longitude="-120.119";
                                             Latitude="39.052";
                                         });

$cstWS04 = new-object PSObject -Property (@{ Site="10336660"; 
                                             parameterCd="00060";
                                             Location="Blackwood Creek";
                                             Longitude="-120.162";
                                             Latitude="39.107";
                                         });

$cstWS05 = new-object PSObject -Property (@{ Site="10336674"; 
                                             parameterCd="00060";
                                             Location="Ward Creek near Tahoe City";
                                             Longitude="-120.157";
                                             Latitude="39.132";
                                         });


$cstWS06 = new-object PSObject -Property (@{ Site="10336676"; 
                                             parameterCd="00060";
                                             Location="Ward Creek near Tahoe Pines";
                                             Longitude="-120.212";
                                             Latitude="39.141";
                                         });


$cstWS07 = new-object PSObject -Property (@{ Site="10336698"; 
                                             parameterCd="00060";
                                             Location="Third Creek";
                                             Longitude="-119.947";
                                             Latitude="39.24";
                                         });

$cstWS08 = new-object PSObject -Property (@{ Site="10336700"; 
                                             parameterCd="00060";
                                             Location="Incline Creek";
                                             Longitude="-119.945";
                                             Latitude="39.24";
                                         });


$cstWS09 = new-object PSObject -Property (@{ Site="10336730"; 
                                             parameterCd="00060";
                                             Location="Glenbrook Creek";
                                             Longitude="-119.94";
                                             Latitude="39.088";
                                         });


$cstWS10 = new-object PSObject -Property (@{ Site="10336780"; 
                                             parameterCd="00060";
                                             Location="Trout Creek";
                                             Longitude="-119.979";
                                             Latitude="38.932";
                                         });


$cstWS11 = new-object PSObject -Property (@{ Site="10337500"; 
                                             parameterCd="00060";
                                             Location="Truckee River at Tahoe City";
                                             Longitude="-120.145";
                                             Latitude="39.167";
                                         });

$cstWS12 = new-object PSObject -Property (@{ Site="10337000"; 
                                             parameterCd="00065";
                                             Location="Lake Tahoe Water Level";
                                             Longitude="-120.14";
                                             Latitude="39.168";
                                         });

#Add Water Stations to Array
$arrUSGSWaterstations += $cstWS01;
$arrUSGSWaterstations += $cstWS02;
$arrUSGSWaterstations += $cstWS03;
$arrUSGSWaterstations += $cstWS04;
$arrUSGSWaterstations += $cstWS05;
$arrUSGSWaterstations += $cstWS06;
$arrUSGSWaterstations += $cstWS07;
$arrUSGSWaterstations += $cstWS08;
$arrUSGSWaterstations += $cstWS09;
$arrUSGSWaterstations += $cstWS10;
$arrUSGSWaterstations += $cstWS11;
$arrUSGSWaterstations += $cstWS12;


#Loop through Water Stations
foreach($wstat in $arrUSGSWaterstations)
{
    #Var for API with USGS WS ID Query String 
    [string]$uriUSGSGetLastSync = $tercUSGSAPIURI + "?id=" + $wstat.Site;

    #Pull Last Sync Date for Buoy
    [string]$lstSyncdDate = Invoke-RestMethod -Uri $uriUSGSGetLastSync -Method Get -Headers $tercHeader;

    #Var for Last Sync DateTime
    [datetime]$dtLastSync = [datetime]::Now;

    #Try Parse Last Sync DateTime
    if([datetime]::TryParse($lstSyncdDate,[ref]$dtLastSync) -eq $true)
    {

        #Array for Station Data
        $arrStationData = @();

        #Var for Start Date
        $dtStartDate = $dtLastSync.AddDays(1);

        #Var for End Date
        $dtEndDate = $dtStartDate.AddYears(1);
        #$dtEndDate = $dtStartDate.AddYears(30);

        #Configure API URI
        [string]$usgsAPIURI = $usgsAPIBase + $wstat.parameterCd + "&startDT=" + $dtStartDate.ToString("yyyy-MM-dd") + "&endDT=" + $dtEndDate.ToString("yyyy-MM-dd") + "&site=" + $wstat.Site;

        #Pull USGS Data via API Call
        $usgsRMResult = Invoke-RestMethod -Uri $usgsAPIURI;

        #Check for Null\Empty API Results
        if($usgsRMResult -ne $null -and $usgsRMResult.value -ne $null -and $usgsRMResult.value.timeSeries -ne $null -and $usgsRMResult.value.timeSeries.values -ne $null)
        {

            #Loop Through the Results     $usgsRMResult.value.timeSeries.values
            foreach($tsValues in $usgsRMResult.value.timeSeries.values)       
            {

                foreach($wsValue in $tsValues.value)
                {
                    
                    #Custom Object for Json Conversion for API Call Payload
                    $cstUSGSJC = new-object PSObject -Property (@{ Site_ID="";
                                                                   Location="";
                                                                   TmStamp="";
                                                                   Longitude="";
                                                                   Latitude="";
                                                                   Lake_Level="NULL";
                                                                   StreamFlow="NULL";
                                                                 });

                    #Load General Information from Site
                    $cstUSGSJC.Site_ID = $wstat.Site;
                    $cstUSGSJC.Location = $wstat.Location;
                    $cstUSGSJC.Latitude = $wstat.Latitude;
                    $cstUSGSJC.Longitude = $wstat.Longitude;

                    #Parse USGS Date Log Entry
                    $dtUSGS = [datetime]::Parse($wsValue.dateTime);

                    #Load USGS Timestamp
                    $cstUSGSJC.TmStamp = $dtUSGS.ToString("yyyy-MM-dd HH:mm:ss");

                    #Load Streamflow or Lake Level
                    if($wstat.parameterCd -eq "00060")
                    {
                        $cstUSGSJC.StreamFlow = $wsValue.value;
                    }
                    else
                    {

                        #Check for Empty Data Value (USGS Reference)
                        if($wsValue.value -ne "-999999.0")
                        {
                            #Set Lake Level According to Heather's Standard
                            $cstUSGSJC.Lake_Level = (6220 + [double]$wsValue.value).ToString();
                        }
                        else
                        {
                            $cstUSGSJC.Lake_Level = $wsValue.value;
                        }

                    }#End of StreamFlow and Lake Level Checks

                    
                    #Check Values Before Loading to Station Data Array
                    if([string]::IsNullOrEmpty($cstUSGSJC.TmStamp) -eq $false)
                    {
                        $arrStationData += $cstUSGSJC;
                    }

                }#End of $tsValues.value Foreach
           
            }#End of $usgsRMResult.value.timeSeries.values Foreach
        
        }#End of Null\Empty Check on API Results

        #################
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
                       
                        #Convert Post Body to Json Object
                        $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                        #Make API call to AWS
                        $awsStatus = Invoke-RestMethod -Uri $tercUSGSAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

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

                    #Convert Post Body to Json Object
                    $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                    #Make API call to AWS
                    $awsStatus = Invoke-RestMethod -Uri $tercUSGSAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

                    #For No Successful API Calls Exit Loops
                    if([string]::IsNullOrEmpty($awsStatus) -eq $true -or $awsStatus -ne "Success")
                    {
                        #$awsStatus | Select-Object -ExpandProperty stacktrace
                        exit;
                    }

                    #Clear TSReadings Array
                    $cstPostBody.TSReadings = @();

               }#End of TSReadings Remaining Check

        }#End of $arrStationData Count
        

    }#End of $lstSyncDate TryParse


}#End of $arrUSGSWaterstations foreach


