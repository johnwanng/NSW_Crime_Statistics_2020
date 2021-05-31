select into id_var floor(random()* (32078-1 + 1) + 1)

--
select area,count(0) from dv_dataset 
where dv = 1 
group by area order by 1;


select count(0) from dv_dataset where dv = 1 and area is not null and month is not null and premise is not null and
relationship is not null and alcoho is not null;

select count(0) from dv_dataset where dv = 0 and area is not null and month is not null and premise is not null and
relationship is not null and alcoho is not null;




-- alcoho
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..200 loop
   for f in (select alcohol, dv_no from alcohol) loop
      select into id_cnt count(0) from dv_dataset where alcoho = f.alcohol and dv = 1;
	  id_cnt = f.dv_no - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set alcoho = f.alcohol
		where id = id_var and dv = 1 and alcoho is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$

-- alcoho
do
$$
declare
    f record;
	id_var integer;
	id_cnt integer;
begin
 for j in 1..200 loop
   for f in (select alcohol, other_dv from alcohol) loop
      select into id_cnt count(0) from dv_dataset where alcoho = f.alcohol and dv = 0;
	  id_cnt = f.other_dv - id_cnt; 
      for i in 1..id_cnt loop
	  
		select into id_var floor(random()* (81872-1 + 1) + 1);
		
		UPDATE dv_dataset
		set alcoho = f.alcohol
		where id = id_var and dv = 0 and alcoho is null;
		
	  end loop;
   end loop;
 end loop;  
END;
$$