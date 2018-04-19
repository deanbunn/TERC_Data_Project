USE TERC;

CREATE TABLE USGS_WS
(
	ws_id bigint not null auto_increment,
    Site_ID int not null,
    TmStamp datetime not null,
    Location nvarchar(100) null,
    Latitude real null,
    Longitude real null,
    Lake_Level real null,
    Streamflow real null,
    primary key (ws_id)
);