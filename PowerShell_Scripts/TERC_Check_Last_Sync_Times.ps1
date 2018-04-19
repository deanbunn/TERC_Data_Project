<#
    TERC_Check_Last_Sync_Times.ps1
#>

#Array of TERC Stations
$arrTERCStations = @();

#Custom Object for NS Cascade
$cstNSCascade = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Cascade Wifi_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-cascade";
                                                  Station="NS-Cascade"
                                                });



#Custom Object for NS Dollar
$cstNSDollar = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Dollar Point Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-dollar";
                                                  Station="NS-Dollar"
                                                });


#Custom Object for NS Glenbrook
$cstNSGlenbrook = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Glenbrook Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-glenbrook";
                                                  Station="NS-Glenbrook"
                                                });


#Custom Object for NS Homewood
$cstNSHomewood = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Homewood Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-homewood";
                                                  Station="NS-Homewood"
                                                });


#Custom Object for NS Meeks
$cstNSMeeks = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Meeks Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-meeks";
                                                  Station="NS-Meeks"
                                                });


#Custom Object for NS Homewood
$cstNSRubicon = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Rubicon Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-rubicon";
                                                  Station="NS-Rubicon"
                                                });


#Custom Object for Sand Harbor
$cstNSSandHarbor = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Sand Harbor Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-sandharbor";
                                                  Station="NS-SandHarbor"
                                                });


#Custom Object for Tahoe Vista
$cstNSTahoeVista = new-object PSObject -Property (@{ SQLTbl="[CR1000 - NS Tahoe Vista Modem_LakeData]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/ns-tahoevista";
                                                  Station="NS-TahoeVista"
                                                });


#Custom Object for Homewood T-Chain
$cstHomewoodTChain = new-object PSObject -Property (@{ SQLTbl="[blah blah]"; 
                                                  APIURI="https://xxxxxxxxxxxxxxx.execute-api.us-west-2.amazonaws.com/v1/sync/tahoerbr";
                                                  Station="Homewood T-Chain"
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
$arrTERCStations += $cstHomewoodTChain;

#Var for 
$tercHeader = @{"x-api-key"="xxxxxxxxxxxxxxx"};


foreach($tercStation in $arrTERCStations)
{
    
    #Pull Latest Sync Date from TERC Station AWS API Call
    [string]$tsLstDate = Invoke-RestMethod -Uri $tercStation.APIURI -Method Get -Headers $tercHeader;

    Write-Output ($tercStation.Station + ": " + $tsLstDate);

}#End of $arrTERCStations
