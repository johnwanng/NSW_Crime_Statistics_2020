

select l.area,
--m.month,
a.alcohol
--,dt.day,dt.time
,v.gender v_gender,v.age v_age,p.premise
--,o.gender o_gender, o.age o_age
,ovr.relationship
from location l,--month m,
alcohol a 
--day_time dt
,victim v,premise p
--p,offender o;
,offender_victim_relation ovr;
--,victim v, premise p, offender o,offender_victim_relation ovr;


select l.area,m.month,a.alcohol,dt.day,dt.time,v.gender v_gender,v.age v_age,p.premise, o.gender o_gender, o.age o_age,
ovr.relationship
from location l,month m, alcohol a,day_time dt, victim v, premise p, offender o,offender_victim_relation ovr;

drop table location;

create table location (ID integer primary key,location varchar(100),dv_no integer,other_no integer);

drop table month;

create table month (month integer,dv_no integer,other_no integer);

drop table Alcohol;

create table Alcohol(ID integer primary key,Alcohol varchar(1),dv_No integer, other_dv integer);

drop table day_time;

create table day_time(ID integer primary key,Day varchar(10),	Time varchar(50),	dv_No integer, other_no integer);

drop table victim;

create table victim(ID integer primary key,Gender varchar(10),	Age varchar(50),dv_no integer,other_no integer);

drop table premise;

create table premise(ID integer primary key,premise varchar(50),dv_no integer, other_dv integer);

drop table offender;
create table offender(ID integer primary key,Gender varchar(10),	Age varchar(50),dv_no integer, other_no integer);

drop table offender_victim_relation;

create table offender_victim_relation(ID integer primary key,relationship varchar(50),dv_no integer, other_no integer);

select * from offender_victim_relation;


create table domestic_violence_dataset (Id integer,
premise varchar(100),o_gender varchar(10),o_age varchar(50),relationship varchar(50),area varchar(100),v_gender varchar(10)
	,v_age varchar(50),day varchar(10),time varchar(50),alcoho varchar(1),month integer,result integer,
premise_id integer,	o_gender_id	integer, o_gender_age_id integer,
v_gender_id	integer,v_gender_age_id integer,
relationship_id	integer,day_id integer,time_id integer,alcohol_id integer,location_id integer);


drop table dv_dataset_2;

create table dv_dataset_2 (Id integer,
premise varchar(100),o_gender varchar(10),o_age varchar(50),relationship varchar(50),area varchar(100),v_gender varchar(10)
	,v_age varchar(50),day varchar(10),time varchar(50),alcoho varchar(1),month integer,dv integer,
premise_id integer,	o_gender_id	integer,v_gender_id	integer,relationship_id	integer,day_time_id	integer,alcohol_id
integer,location_id integer);

drop table dv_dataset;

create table dv_dataset (id SERIAL PRIMARY KEY,
premise varchar(100),o_gender varchar(10),o_age varchar(50),relationship varchar(50),area varchar(100),v_gender varchar(10)
	,v_age varchar(50),day varchar(10),time varchar(50),alcoho varchar(1),month integer,dv integer);

DO
$$
BEGIN
 FOR i IN 1..10 LOOP
       RAISE NOTICE '%', i; -- i will take on the values 1,2,3,4,5,6,7,8,9,10 within the loop
 END LOOP;
END
$$

update dv_dataset
set dv = 0;

select * from dv_dataset where dv = 1;

delete from dv_dataset;
--32078	49794	81872
do
$$
begin
   for counter in 1..81872 loop
      if counter > 32078 THEN
	    insert into dv_dataset(dv) values(0);	    
	  ELSE
	    insert into dv_dataset(dv) values(1);
	  END IF;	
   end loop;
end;
$$


select * from dv_dataset where dv = 1 order by 1;


update dv_dataset
set dv = 0,area = null;

UPDATE dv_dataset SET dv = 1

select area,premise,dv from dv_dataset;

select area,count(0) from dv_dataset where area is not null;

select area,count(0),premise,o_gender,o_age,relationship,v_gender,v_gender,v_age,day,time,alcoho,month
from dv_dataset where dv = 1 group by 
area,premise,o_gender,o_age,relationship,v_gender,v_gender,v_age,day,time,alcoho,month order by 1;

select max(id) from dv_dataset where dv = 1;

select * from dv_dataset where v_age is not null;

select * from dv_dataset where o_gender is not null;


select floor(random()* (32078-1 + 1) + 1)

SELECT * FROM dv_dataset;
where dv = 0 and area is null;

--delete from dv_dataset;

select random_
		select into id_var floor(random()* (32078-1 + 1) + 1)

-- Location
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select location, dv_no from location) loop
      for i in 1..f.dv_no loop
		
		SELECT INTO id_var id FROM dv_dataset where dv = 1 and area is null
   		ORDER  BY id DESC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set area = f.location
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$

-- premise
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select premise, other_dv from premise) loop
      for i in 1..f.other_dv loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and premise is null
   		ORDER  BY id DESC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set premise = f.premise
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$


-- alcohol
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select alcohol, other_dv from alcohol) loop
      for i in 1..f.other_dv loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and alcoho is null
   		ORDER BY id DESC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set alcoho = f.alcohol
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$


-- day_time
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select day, time, other_no from day_time) loop
      for i in 1..f.other_no loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and day is null
   		ORDER BY id DESC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set day = f.day, time = f.time
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$

-- month
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select month, other_no from month) loop
      for i in 1..f.other_no loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and month is null
   		ORDER BY id ASC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set month = f.month
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$


-- offender
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select gender, age,other_no from offender) loop
      for i in 1..f.other_no loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and o_gender is null
   		ORDER BY id ASC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set o_gender = f.gender,o_age = f.age
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$

-- victim
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select gender, age,other_no from victim) loop
      for i in 1..f.other_no loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and v_gender is null
   		ORDER BY id ASC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set v_gender = f.gender,v_age = f.age
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$

-- offender_victim_relation
do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select relationship,other_no from offender_victim_relation) loop
      for i in 1..f.other_no loop
	 
	 	SELECT INTO id_var id FROM dv_dataset where dv = 0 and relationship is null
   		ORDER BY id ASC NULLS LAST
   		LIMIT  1;
		
		UPDATE dv_dataset
		set relationship = f.relationship
		where id = id_var;
		
	  end loop;
   end loop;
END;
$$


do
$$
declare
    f record;
	id_var integer;
begin
   for f in (select * from alcohol order by alcohol) loop
		
		SELECT INTO id_var max(COALESCE(id,0)) FROM alcohol;

		id_var = id_var + 1;
		
		UPDATE alcohol
		set id = id_var
		where alcohol = f.alcohol;
		
   end loop;
END;
$$


create table day (ID integer primary key,Day varchar(10));

create table offender_age (ID integer primary key,age varchar(50));

create table victim_age (ID integer primary key,age varchar(50));


create table time (ID integer primary key,time varchar(50));

create table gender (ID integer primary key,gender varchar(50));



select sum(dv_no),sum(other_no) from offender;

select * from dv_dataset where o_gender is null;

select round( 1/100000000::decimal, 8 )::text
select round(328/32078::decimal,3)

with a as
(select sum(no) as tot from location)
select area, round(no/tot::decimal,3), no from location, a;

with a as
(select sum(no) as tot from location)
select area, round(no/tot::decimal,3), no from location, a;


update dv_dataset_2
set alcohol_id = a.id
from alcohol a
where alcoho = a.alcohol;

update dv_dataset_2 d
set premise_id = a.id
from premise a
where d.premise = a.premise;

update dv_dataset_2 d
set relationship_id = a.id
from offender_victim_relation a
where d.relationship = a.relationship;

update dv_dataset_2 d
set location_id = a.id
from location a
where d.area = a.location;

update dv_dataset_2 d
set day_time_id = a.id
from day_time a
where d.day = a.day and d.time = a.time;


update dv_dataset_2 d
set v_gender_id = a.id
from victim a
where v_gender = a.gender and v_age = a.age;

update dv_dataset_2 d
set o_gender_id = a.id
from offender a
where o_gender = a.gender and o_age = a.age;


update domestic_violence_dataset d
set day_id = a.id
from day a
where d.day = a.day;

update domestic_violence_dataset d
set time_id = a.id
from time a
where d.time = a.time;

update domestic_violence_dataset d
set o_gender_id = a.id
from gender a
where d.o_gender = a.gender;

update domestic_violence_dataset d
set v_gender_id = a.id
from gender a
where d.v_gender = a.gender;


update domestic_violence_dataset d
set o_gender_age_id = a.id
from age a
where d.o_age = a.age;

update domestic_violence_dataset d
set o_gender_age_id = a.id
from offender_age a
where d.o_age = a.age;


update domestic_violence_dataset d
set v_gender_age_id = a.id
from victim_age a
where d.v_age = a.age;

update domestic_violence_dataset
set alcohol_id = a.id
from alcohol a
where alcoho = a.alcohol;

update domestic_violence_dataset d
set premise_id = a.id
from premise a
where d.premise = a.premise;

update domestic_violence_dataset d
set relationship_id = a.id
from offender_victim_relation a
where d.relationship = a.relationship;

update domestic_violence_dataset d
set location_id = a.id
from location a
where d.area = a.location;

--o_gender_id
--o_gender_age_id
select * from domestic_violence_dataset where o_gender_id is null;

--3
select * from gender;
--8
select * from victim_age;
--10
select * from offender_age;


create table domestic_violence_dataset_backup as select * from domestic_violence_dataset;

