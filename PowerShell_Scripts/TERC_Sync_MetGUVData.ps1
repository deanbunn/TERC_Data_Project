<#
   Script: TERC_Sync_MetGUVData.ps1
   Author: Dean Bunn
   Version: 1.0
   Last Modified: 12/02/17
#>


#Var for Bio Data Files Location
[string]$metBioDataFldr = "C:\BioData\"

#Var for Sync Processed Folder Path
[string]$metBioProcesFldr = $metBioDataFldr + "Sync_Processed";

#Var for TERC API Header
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"};

#Var for TERC Met GUV API URI
$tercMetGuvAPIURI = "https://xxxxxxxxxxxxxxxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/met-guv";

#Var for Epoch Start Date
$dtEpoch = [DateTime]::Parse("01/01/1970");

#DateTime for Not Active Files Filter
[datetime]$dtNotActive = (Get-Date).AddHours(-24);

#Check for Processed Folder and Create If Not There
if((Test-Path -Path $metBioProcesFldr) -eq $false)
{
    New-Item -Path $metBioProcesFldr -ItemType "directory";
}

#Var for Progress Indictator and AWS API Call Count
[int]$prgIndctr = 0;

#Var for File Search
[string]$fldrFilter = $metBioDataFldr + "*_0000.csv";

#Pull Data Files
$colMetBioDataFiles = Get-ChildItem -Path $fldrFilter | Where {$_.CreationTime -lt $dtNotActive } | Sort -Property LastWriteTime;

#Loop Through Each Data File
foreach($metBioDF in $colMetBioDataFiles)
{

    #Array for Station Data
    $arrStationData = @();
    
    #Pull File Contents into Array
    $fcMetBioDF = Get-Content -Path $metBioDF.FullName.ToString() | Select-Object -Skip 9

    #Loop Through Each Data Line Entry
    foreach($fcMetBioLE in $fcMetBioDF)
    {
       
        #Split Line by Comma
        $arrLEMetBio = $fcMetBioLE.ToString().Split(",");

        if($arrLEMetBio -ne $null -and $arrLEMetBio.Length -eq 12)
        {
            #Custom Object for Json Conversion for API Call Payload
            $cstJCMetBio = new-object PSObject -Property (@{ RD_Date_Time_UTC="";
                                                             RD_Date_Time_POSIX="";
                                                             Ed0Gnd="NULL";
                                                             Ed0305="NULL";
                                                             Ed0313="NULL";
                                                             Ed0320="NULL";
                                                             Ed0340="NULL";
                                                             Ed0380="NULL";
                                                             Ed0395="NULL";
                                                             Ed0PAR="NULL";
                                                             Ed0Temp="NULL";
                                                             Ed0Vin="NULL";
                                                             NumberSampled="NULL";});

            
            #Parse Reading Date
            $dtMetReading = [datetime]::Parse($arrLEMetBio[0].ToString());

            #Load UTC Date
            $cstJCMetBio.RD_Date_Time_UTC = $dtMetReading.ToString("yyyy-MM-dd HH:mm:ss");

            #Load POSIX 
            $cstJCMetBio.RD_Date_Time_POSIX = (New-TimeSpan -Start $dtEpoch -End $dtMetReading).TotalSeconds.ToString();

            #Load Ed0Gnd
            if([string]::IsNullOrEmpty($arrLEMetBio[1].ToString()) -eq $false)
            {

                if($arrLEMetBio[1].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0Gnd = "0" + $arrLEMetBio[1].ToString();
                }
                elseif($arrLEMetBio[1].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0Gnd = $arrLEMetBio[1].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0Gnd = $arrLEMetBio[1].ToString();
                }

             }
            
            #Load Ed0305
            if([string]::IsNullOrEmpty($arrLEMetBio[2].ToString()) -eq $false)
            {

                if($arrLEMetBio[2].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0305 = "0" + $arrLEMetBio[2].ToString();
                }
                elseif($arrLEMetBio[2].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0305 = $arrLEMetBio[2].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0305 = $arrLEMetBio[2].ToString();
                }

             }

            #Load Ed0313
            if([string]::IsNullOrEmpty($arrLEMetBio[3].ToString()) -eq $false)
            {

                if($arrLEMetBio[3].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0313 = "0" + $arrLEMetBio[3].ToString();
                }
                elseif($arrLEMetBio[3].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0313 = $arrLEMetBio[3].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0313 = $arrLEMetBio[3].ToString();
                }

             }

            #Load Ed0320
            if([string]::IsNullOrEmpty($arrLEMetBio[4].ToString()) -eq $false)
            {

                if($arrLEMetBio[4].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0320 = "0" + $arrLEMetBio[4].ToString();
                }
                elseif($arrLEMetBio[4].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0320 = $arrLEMetBio[4].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0320 = $arrLEMetBio[4].ToString();
                }

             }

            #Load Ed0340
            if([string]::IsNullOrEmpty($arrLEMetBio[5].ToString()) -eq $false)
            {

                if($arrLEMetBio[5].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0340 = "0" + $arrLEMetBio[5].ToString();
                }
                elseif($arrLEMetBio[5].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0340 = $arrLEMetBio[5].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0340 = $arrLEMetBio[5].ToString();
                }

             }

             #Load Ed0380
            if([string]::IsNullOrEmpty($arrLEMetBio[6].ToString()) -eq $false)
            {

                if($arrLEMetBio[6].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0380 = "0" + $arrLEMetBio[6].ToString();
                }
                elseif($arrLEMetBio[6].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0380 = $arrLEMetBio[6].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0380 = $arrLEMetBio[6].ToString();
                }

             }

            #Load Ed0395
            if([string]::IsNullOrEmpty($arrLEMetBio[7].ToString()) -eq $false)
            {

                if($arrLEMetBio[7].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0395 = "0" + $arrLEMetBio[7].ToString();
                }
                elseif($arrLEMetBio[7].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0395 = $arrLEMetBio[7].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0395 = $arrLEMetBio[7].ToString();
                }

             }

            #Load Ed0PAR
            if([string]::IsNullOrEmpty($arrLEMetBio[8].ToString()) -eq $false)
            {

                if($arrLEMetBio[8].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0PAR = "0" + $arrLEMetBio[8].ToString();
                }
                elseif($arrLEMetBio[8].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0PAR = $arrLEMetBio[8].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0PAR = $arrLEMetBio[8].ToString();
                }

             }

             #Load Ed0Temp
            if([string]::IsNullOrEmpty($arrLEMetBio[9].ToString()) -eq $false)
            {

                if($arrLEMetBio[9].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0Temp = "0" + $arrLEMetBio[9].ToString();
                }
                elseif($arrLEMetBio[9].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0Temp = $arrLEMetBio[9].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0Temp = $arrLEMetBio[9].ToString();
                }

             }

            #Load Ed0Vin
            if([string]::IsNullOrEmpty($arrLEMetBio[10].ToString()) -eq $false)
            {

                if($arrLEMetBio[10].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.Ed0Vin = "0" + $arrLEMetBio[10].ToString();
                }
                elseif($arrLEMetBio[10].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.Ed0Vin = $arrLEMetBio[10].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.Ed0Vin = $arrLEMetBio[10].ToString();
                }

             }

            #Load NumberSampled
            if([string]::IsNullOrEmpty($arrLEMetBio[11].ToString()) -eq $false)
            {

                if($arrLEMetBio[11].ToString().StartsWith(".") -eq $true)
                {
                    $cstJCMetBio.NumberSampled = "0" + $arrLEMetBio[11].ToString();
                }
                elseif($arrLEMetBio[11].ToString().StartsWith("-.") -eq $true)
                {
                    $cstJCMetBio.NumberSampled = $arrLEMetBio[11].ToString().Replace("-.","-0.");
                }
                else
                {
                    $cstJCMetBio.NumberSampled = $arrLEMetBio[11].ToString();
                }

             }

            
            #Add Custom Object to Station Data Array
	        $arrStationData += $cstJCMetBio;
        
        }#End of Data Line Null\Length Checks


    }#End of $fcMetBioDF Foreach


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
                Write-Output ("Met GUV " + [datetime]::Now.ToString());

                #Convert Post Body to Json Object
                $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

                #Make API call to AWS
                $awsStatus = Invoke-RestMethod -Uri $tercMetGuvAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

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
            Write-Output ("Met GUV" + [datetime]::Now.ToString());

            #Convert Post Body to Json Object
            $jsonPostBody = $cstPostBody | ConvertTo-Json -Compress;

            #Make API call to AWS
            $awsStatus = Invoke-RestMethod -Uri $tercMetGuvAPIURI -Method Post -Headers $tercHeader -Body $jsonPostBody -ContentType "application/json" -TimeoutSec 240;

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
    Move-Item -Path $metBioDF.FullName -Destination $metBioProcesFldr;


}#End of $colMetBioDataFiles Foreach
