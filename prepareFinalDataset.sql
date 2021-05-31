select * from dv_dataset ;


create table dv_real_test (Id integer,
premise varchar(100),o_gender varchar(10),o_age varchar(50),relationship varchar(50),area varchar(100),v_gender varchar(10)
	,v_age varchar(50),day varchar(10),time varchar(50),alcoho varchar(1),month integer,result integer,
premise_id integer,	o_gender_id	integer, o_gender_age_id integer,
v_gender_id	integer,v_gender_age_id integer,
relationship_id	integer,day_id integer,time_id integer,alcohol_id integer,location_id integer);

insert into dv_real_test(id,premise,o_gender,o_age,relationship,area,v_gender,v_age,day,time,alcoho,month,result)
select * from dv_dataset;

select count(0) from dv_real_test;
--5713
select * from dv_real_test where premise is null or relationship is null or
area is null or v_gender is null or v_age is null or day is null or time is null or alcoho is null or month is null;


select * from dv_real_test where premise_id is null or relationship_id is null or
location_id is null or v_gender_id is null or v_gender_age_id is null or day_id is null or time_id is null or 
alcohol_id is null or month is null;


delete from dv_real_test where premise is null or relationship is null or
area is null or v_gender is null or v_age is null or day is null or time is null or alcoho is null or month is null;

update dv_real_test d
set day_id = a.id
from day a
where d.day = a.day;

update dv_real_test d
set time_id = a.id
from time a
where d.time = a.time;


update dv_real_test d
set v_gender_id = a.id
from gender a
where d.v_gender = a.gender;



update dv_real_test d
set v_gender_age_id = a.id
from victim_age a
where d.v_age = a.age;

update dv_real_test
set alcohol_id = a.id
from alcohol a
where alcoho = a.alcohol;

update dv_real_test d
set premise_id = a.id
from premise a
where d.premise = a.premise;

update dv_real_test d
set relationship_id = a.id
from offender_victim_relation a
where d.relationship = a.relationship;

update dv_real_test d
set location_id = a.id
from location a
where d.area = a.location;
