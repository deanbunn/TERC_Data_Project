USE TERCDB;

CREATE TABLE TERC_RCRD1
(
	rcrd_id bigint not null auto_increment,
    rcrd_date datetime not null,
    rcrd_level01 int null,
    rcrd_level02 int null,
    primary key (rcrd_id)
);


