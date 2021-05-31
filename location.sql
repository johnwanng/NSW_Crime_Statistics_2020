select into id_var floor(random()* (32078-1 + 1) + 1)

--
select area,count(0) from dv_dataset 
where dv = 1 
group by area order by 1;




select count(0) from dv_dataset where dv = 1 and area is not null;

select count(0) from dv_dataset where dv = 0 and area is not null;


drop table dv_dataset;

create table dv_dataset (id SERIAL PRIMARY KEY,
premise varchar(100),o_gender varchar(10),o_age varchar(50),relationship varchar(50),area varchar(100),v_gender varchar(10)
	,v_age varchar(50),day varchar(10),time varchar(50),alcoho varchar(1),month integer,dv integer);
	
do
$$
begin
   for counter in 1..81872 loop
	    insert into dv_dataset(dv) values(0);	    
   end loop;
end;
$$


-- dv
do
$$
declare
    f record;
	id_var integer;
begin
	for counter in 1..32078 loop      
	
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set dv = 1
		where id = id_var and dv = 0;
		
   end loop;
END;
$$

-- dv
do
$$
declare
    f record;
	id_var integer;
begin
	for counter in 1..10000 loop      
	
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set dv = 1
		where id = id_var and dv = 0;
		
   end loop;
END;
$$



-- Location
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..50 loop
   for f in (select location, dv_no from location) loop
      select into id_cnt count(0) from dv_dataset where area = f.location and dv = 1;
	  id_cnt = f.dv_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set area = f.location
		where id = id_var and dv = 1 and area is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$

-- Location
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..50 loop
   for f in (select location, other_no from location) loop
      select into id_cnt count(0) from dv_dataset where area = f.location and dv = 0;
	  id_cnt = f.other_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set area = f.location
		where id = id_var and dv = 0 and area is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$