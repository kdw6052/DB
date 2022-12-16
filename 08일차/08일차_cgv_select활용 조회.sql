-- 영화 아바타 상영 시간을 조회하는 쿼리를 작성
-- 정렬은 영화관 순으로
select ss_date as '상영날짜' , ss_time as '상영시간', ci_name as '상영관',ss_parssible as '예매가능 좌석수'
	from screen_schedule
	join movie on ss_mo_num = mo_num
    join cinema on ss_ci_num = ci_num
	where mo_title like '아바타-물의 길' 
		and mo_state = '현재상영중'
        and ss_date >= now()
    order by ss_ci_num asc;
-- 강남 CGV 1관에서 18일 9시50분 상영하는 아바타의 예매 가능 좌석들을 조회
select se_name as 좌석명,
	case 
		when ts_num is null
		then 'O'
        else 'X'
	end as 예약가능
	from screen_schedule
	join cinema on ss_ci_num = ci_num
    join movie on ss_mo_num = mo_num
    join seat on se_ci_num = ci_num
	left join ticketing_seat on ts_se_num = se_num
    where ss_date = '2022-12-18' and ss_time = '09:50' 
		and mo_title like '아바타-물의 길' and se_state = '사용가능' and mo_state = '현재상영중';
-- 아바타를 상영하는 극장조회
select th_name as 극장
	from screen_schedule
	join movie on ss_mo_num = mo_num
    join cinema on ss_ci_num = ci_num
    join theater on ci_th_num = th_num
    where mo_title Like '아바타-물의 길' and ss_date >= now()
    group by th_name;
-- cgv강남에서 상영하는 영화를 조회
select mo_title as 영화 from theater
	join cinema on ci_th_num = th_num
    join screen_schedule on ss_ci_num = ci_num
    join movie on ss_mo_num = mo_num
    where th_name = 'CGV강남' and ss_date >= now()
	group by ss_mo_num;