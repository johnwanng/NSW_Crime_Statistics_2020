select into id_var floor(random()* (32078-1 + 1) + 1)

--
select area,count(0) from dv_dataset 
where dv = 1 
group by area order by 1;


select count(0) from dv_dataset where dv = 1 and area is not null and month is not null;

select count(0) from dv_dataset where dv = 0 and area is not null and month is not null;



-- month
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..100 loop
   for f in (select month, dv_no from month) loop
      select into id_cnt count(0) from dv_dataset where month = f.month and dv = 1;
	  id_cnt = f.dv_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set month = f.month
		where id = id_var and dv = 1 and month is null;
		
	  end loop;
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
	id_cnt integer;
begin
 for j in 1..100 loop
   for f in (select month, other_no from month) loop
      select into id_cnt count(0) from dv_dataset where month = f.month and dv = 0;
	  id_cnt = f.other_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set month = f.month
		where id = id_var and dv = 0 and month is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$