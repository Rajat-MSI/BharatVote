create table candidate
(
    candidate_id varchar(20) primary key,
    candidate_image mediumblob,
    candidate_name varchar(50) not null,
    candidate_father_name varchar(50) not null,
    candidate_party varchar(50) not null,
    candidate_phone varchar(13) not null,
    candidate_aadhaar_number varchar(12) not null unique,
    candidate_gender varchar(20) not null,
    candidate_dob varchar(20) not null,
    candidate_state int not null,
    candidate_district int not null,
    candidate_address varchar(200) not null,
    candidate_designation varchar(30) not null
#     foreign key (candidate_state) references online_voting_application.state(state_id) on delete cascade ,
#     foreign key (candidate_district) references online_voting_application.district(district_id) on delete cascade ,
#     foreign key (candidate_party) references online_voting_application.party(party_id) on delete cascade
);
select * from candidate;
alter table candidate add column candidate_designation varchar(0);
truncate table candidate;
drop table candidate;
desc candidate;
alter table candidate add column candidate_designation varchar(30) not null;

desc  candidate;