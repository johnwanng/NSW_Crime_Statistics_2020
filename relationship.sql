select into id_var floor(random()* (32078-1 + 1) + 1)

--
select area,count(0) from dv_dataset 
where dv = 1 
group by area order by 1;


select count(0) from dv_dataset where dv = 1 and area is not null and month is not null and premise is not null and
relationship is not null;

select count(0) from dv_dataset where dv = 0 and area is not null and month is not null and premise is not null and
relationship is not null;




-- relationship
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..100 loop
   for f in (select relationship, dv_no from offender_victim_relation) loop
      select into id_cnt count(0) from dv_dataset where relationship = f.relationship and dv = 1;
	  id_cnt = f.dv_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set relationship = f.relationship
		where id = id_var and dv = 1 and relationship is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$

-- relationship
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..200 loop
   for f in (select relationship, other_no from offender_victim_relation) loop
      select into id_cnt count(0) from dv_dataset where relationship = f.relationship and dv = 0;
	  id_cnt = f.other_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set relationship = f.relationship
		where id = id_var and dv = 0 and relationship is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$
