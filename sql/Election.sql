use online_voting_application;
create table election
(
    election_id varchar(30) primary key,
    election_type varchar(50) not null,
    election_start_time varchar(50) not null,
    election_end_time varchar(50) not null,
    election_start_date varchar(50) not null,
    election_end_date varchar(50) not null
);

select * from election;
delete from election where election_id = 'ELECT231128132516';
truncate table election;
create table election_process
(
    party_votes varchar(30) primary key,
    party_id varchar(30),
    election_id varchar(30)
);

select * from election_process;

select count(party_votes) from election_process where election_id = 'ELECT231128132516' AND party_id = 'PARTY231022171445';
drop table election_process;
truncate table election_process;