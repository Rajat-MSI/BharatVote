select * from party;
create database online_voting_application;
use online_voting_application;
create table party
(
    party_id varchar(20) primary key,
    party_flag mediumblob,
    party_name varchar(50) not null unique,
    party_abbreviation varchar(5) not null unique,
    party_symbol varchar(50) not null unique,
    party_leader varchar(20) ,
    party_alliance_id varchar(3)
#     foreign key (party_alliance_id) references alliance(alliance_id) on delete set null,
#     foreign key (party_leader) references candidate(candidate_id) on delete cascade
);
drop table party;
truncate table party;
# alter table Party add constraint foreign key(party_leader) references candidate(candidate_id) on delete cascade;
# select party_name,party_abbreviation,party_alliance_id,alliance_name from party join alliance a on party.party_alliance_id = a.alliance_id;