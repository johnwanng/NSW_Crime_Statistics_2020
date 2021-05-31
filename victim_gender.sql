select into id_var floor(random()* (32078-1 + 1) + 1)

create table victim_gender(gender varchar(10),dv_no integer,other_no integer);

--
select area,count(0) from dv_dataset 
where dv = 1 
group by area order by 1;


select * from dv_dataset 
where o_gender is  null and dv = 1;

select count(0) from dv_dataset where dv = 1 and area is not null and month is not null and premise is not null and
relationship is not null and alcoho is not null and v_gender is not null;

select count(0) from dv_dataset where dv = 0 and area is not null and month is not null and premise is not null and
relationship is not null and alcoho is not null and v_gender is not null;



-- victim_gender
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..100 loop
   for f in (select gender,dv_no from victim_gender) loop
      select into id_cnt count(0) from dv_dataset where v_gender = f.gender and dv = 1;
	  id_cnt = f.dv_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set v_gender = f.gender
		where id = id_var and dv = 1 and v_gender is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$

-- victim_gender
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..100 loop
   for f in (select gender,other_no from victim_gender) loop
      select into id_cnt count(0) from dv_dataset where v_gender = f.gender and dv = 0;
	  id_cnt = f.other_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set v_gender = f.gender
		where id = id_var and dv = 0 and v_gender is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$