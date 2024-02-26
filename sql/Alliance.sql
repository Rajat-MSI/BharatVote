use online_voting_application;
create table alliance
(
    alliance_id varchar(3) primary key,
    alliance_name varchar(50) not null

);

drop table alliance;
truncate table alliance;
select * from alliance;
insert into alliance value ('1','I.N.D.I.A');
insert into alliance value ('2','N.D.A');
