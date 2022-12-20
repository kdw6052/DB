drop procedure if exists test1;
delimiter //
create procedure test1()
begin
	show databases;
end //
delimiter ; 
call test1();
-- 
drop procedure if exists test2;
delimiter //
create procedure test2(
	in num int,
    out out_num int
)
begin
	select num;
    set out_num = num;
end //
delimiter ; 
set @t_num = 0;
call test2(2, @t_num);
select @t_num;