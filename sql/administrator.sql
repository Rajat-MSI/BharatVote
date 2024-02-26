create database online_voting_application;
use online_voting_application;

create table administrator
(
    admin_id varchar(8) primary key,
    admin_name varchar(50) not null,
    admin_password varchar(100) not null,
    admin_email varchar(50) not null
);

select * from administrator;
show tables;
drop table administrator;