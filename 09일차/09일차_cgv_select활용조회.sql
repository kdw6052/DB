-- 아바타-물의 길에 출연한 감독 및 배우들을 조회하는 쿼리
select mo_title as 영화제목 ,mc_role as 역할, mp_name as 영화인 from movie
	join movie_casting on mc_mo_num = mo_num
    join movie_person on mc_mp_num = mp_num
    where mo_title like '아바타-물의 길';
    
-- 제임스 카메론의 참여 영화 리스트를 조회하는 쿼리
select mp_name as 영화인,mc_role as 역할, mo_title as 영화제목 from movie_person
	join movie_casting on mc_mp_num = mp_num
    join movie on mc_mo_num = mo_num
    where mp_name like '제임스 카메론';
    
-- 아바타 누적 관객 수를 조회하는 쿼리
select sum(ti_amount) as '아바타 누적 관객 수' from ticketing
	join screen_schedule on ti_ss_num = ss_num
    join movie on ss_mo_num = mo_num
    where ss_date <= now() and ss_time <= now() and mo_title like '아바타-물의 길';
    
-- 누적 관객 수가 1명 이상인 영화를 조회하는 쿼리
select mo_title as 영화제목, sum(ti_amount) as 누적관객수 from ticketing
	join screen_schedule on ti_ss_num = ss_num
    join movie on ss_mo_num = mo_num
    where ss_date <= now() and ss_time <= now()
    group by mo_num having 누적관객수 >= 1; 
-- abc 회원이 예매한 올빼미 상영좌석을 조회(관이름, 좌석번호 조회)
select ci_name as 관이름, se_name as 'abc회원이 예매한 영화 올빼미 좌석' from ticketing
	join ticketing_seat on ts_ti_num = ti_num
    join screen_schedule on ti_ss_num = ss_num
    join seat on ts_se_num = se_num
    join cinema on ss_ci_num = ci_num
    join movie on ss_mo_num = mo_num
    where ti_me_id like 'abc' and mo_title like '올빼미' and mo_state like '현재상영중'
    