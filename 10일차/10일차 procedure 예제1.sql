/* 
영화를 예매하면, 예매내역을 추가하는 프로시저를 작성하세요.
insert into ticketing(ti_amount, ti_total_price,ti_me_id,ti_ss_num)
	values(3,30000,'abc',25);
insert into ticketing_seat(ts_ti_num,ts_se_num)
	values(3,11),(3,13),(3,15);
-- 예매 가능 좌석을 수정 
update screen_schedule set ss_parssible = ss_parssible - 3
	where ss_num = 25;
-해당 프로시저는 좌석을 3개 고정으로 선택
-아이디,영화 상영번호, 좌석명을 전달
*/
drop procedure if exists movie_ticketing;
delimiter //
create procedure movie_ticketing(
	in _id varchar(20),
    in _ss_num int,
    in _seat1 varchar(10),
    in _seat2 varchar(10),
    in _seat3 varchar(10)
)
begin
	declare _count int default 0;
    declare _total_price int default 0;
    declare _se_num int default 0;
    declare _ti_num int default 0;
    
	if _seat1 is not null then
		set _count = _count + 1;
        set _total_price = _total_price + (select se_price from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat1);
	end if;
    if _seat2 is not null then
		set _count = _count + 1;
        set _total_price = _total_price + (select se_price from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat2);
	end if;
    if _seat3 is not null then
		set _count = _count + 1;
        set _total_price = _total_price + (select se_price from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat3);
	end if;
    insert into ticketing(ti_amount, ti_total_price,ti_me_id,ti_ss_num)
		values(_count,_total_price, _id, _ss_num);
    
    set _ti_num = (select max(ti_num) from ticketing);
    if _seat1 is not null then
		set _se_num =  (select se_num from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat1);
		insert into ticketing_seat(ts_ti_num,ts_se_num)values(_ti_num,_se_num);
    end if;
    if _seat2 is not null then
		set _se_num =  (select se_num from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat2);
		insert into ticketing_seat(ts_ti_num,ts_se_num)values(_ti_num,_se_num);
    end if;
    if _seat3 is not null then
		set _se_num =  (select se_num from screen_schedule
							join cinema on ss_ci_num = ci_num
							join seat on se_ci_num = ci_num
							where ss_num = _ss_num and se_name = _seat3);
		insert into ticketing_seat(ts_ti_num,ts_se_num)values(_ti_num,_se_num);
    end if;
    
	update screen_schedule set ss_parssible = ss_parssible - _count
		where ss_num = _ss_num;
end //
delimiter ; 
call movie_ticketing('abc',27,'A1','A2',null);


