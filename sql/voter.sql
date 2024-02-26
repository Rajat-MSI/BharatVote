use online_voting_application;

create table voter
(
    voter_id varchar(20) primary key,
    voter_image mediumblob,
    voter_name varchar(50) not null,
    voter_father_name varchar(50) not null,
    voter_gender varchar(10) not null,
    voter_dob varchar(20) not null,
    voter_phone varchar(10) not null,
    voter_district varchar(25) not null,
    voter_state varchar(25) not null,
    voter_address varchar(100) not null,
    voter_aadhaar_number varchar(20) unique,
    voter_password varchar(200) not null
);

alter table voter add column voter_password varchar(200) not null;

select * from voter;
truncate table voter;
desc voter;
drop table voter;
