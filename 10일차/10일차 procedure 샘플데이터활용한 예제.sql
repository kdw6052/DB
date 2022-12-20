use cgv;

drop procedure if exists member_movie_count;
delimiter //
create procedure member_movie_count(
	in _id varchar(20)
)
begin
	-- 지역 변수 선언은 위에 모아줘야 함
	declare _movie_count int default 0;
	with ticketing_count(ss_mo_num, movie_ticketong_count)
		as
		(SELECT ss_mo_num, count(*) FROM ticketing
			join screen_schedule on ti_ss_num = ss_num
			where ti_me_id like _id
			group by ss_mo_num) -- 영화별 예매 횟수, 예매한 전체 영화수가 아님
		select @num := count(*) from ticketing_count;
		set _movie_count = (select @num);
        select _movie_count;
        update member set me_movie_count = _movie_count where me_id = _id;
end //
delimiter ; 
call member_movie_count('abc');