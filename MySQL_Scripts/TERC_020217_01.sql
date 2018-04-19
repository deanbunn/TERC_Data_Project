USE TERC;

(SELECT TmStamp,
       RecNum
FROM CR1000_NS_Cascade_Wifi_LakeData
ORDER BY TmStamp desc
LIMIT 1)

UNION ALL

(SELECT TmStamp,
       RecNum
FROM CR1000_NS_Dollar_Point_Modem_LakeData
ORDER BY TmStamp desc
LIMIT 1)




