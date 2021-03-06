USE TERC;

DELIMITER //

CREATE PROCEDURE sp_report_state_of_the_lake(IN rpt_year int)

BEGIN

	SELECT Report_Year,
	   Max_Air_Temp_Ave,	
	   Min_Air_Temp_Ave,	
	   Annual_Precipitation,	
	   Annual_Snow,
	   Snow_Propotion,
	   Monthly_Max_Air_Temp_Jan,	
	   Monthly_Max_Air_Temp_Feb,
	   Monthly_Max_Air_Temp_Mar,
	   Monthly_Max_Air_Temp_Apr,
	   Monthly_Max_Air_Temp_May,
	   Monthly_Max_Air_Temp_Jun,
	   Monthly_Max_Air_Temp_July,	
	   Monthly_Max_Air_Temp_Aug,	
	   Monthly_Max_Air_Temp_Sep,	
	   Monthly_Max_Air_Temp_Oct,
	   Monthly_Max_Air_Temp_Nov,
	   Monthly_Max_Air_Temp_Dec,
	   Monthly_Min_Air_Temp_Jan,
	   Monthly_Min_Air_Temp_Feb,
	   Monthly_Min_Air_Temp_Mar,
	   Monthly_Min_Air_Temp_Apr,
	   Monthly_Min_Air_Temp_May,
	   Monthly_Min_Air_Temp_Jun,
	   Monthly_Min_Air_Temp_July,
	   Monthly_Min_Air_Temp_Aug,
	   Monthly_Min_Air_Temp_Sep,
	   Monthly_Min_Air_Temp_Oct,
	   Monthly_Min_Air_Temp_Nov,
	   Monthly_Min_Air_Temp_Dec,
	   Monthly_Precipitation_Jan,
	   Monthly_Precipitation_Feb,
	   Monthly_Precipitation_Mar,
	   Monthly_Precipitation_Apr,
	   Monthly_Precipitation_May,
	   Monthly_Precipitation_Jun,
	   Monthly_Precipitation_July,
	   Monthly_Precipitation_Aug,
	   Monthly_Precipitation_Sep,
	   Monthly_Precipitation_Oct,
	   Monthly_Precipitation_Nov,
	   Monthly_Precipitation_Dec,
	   Surface_Water_Temp_Ave,
	   Secchi_Annual_Ave,
	   Secchi_Winter_Ave,
	   Secchi_Summer_Ave,
	   Chla_Ave
FROM State_Of_The_Lake
WHERE Report_Year = rpt_year;

END //

DELIMITER ;