use shoppingmall2;
-- 제품명에 tv가 들어가는 제품들을 조회
select * from product where pr_title like '%tv%';
set @a = 'tv';
select @a;
select * from product where pr_title like '%@a%';
select * from product where pr_title like concat('%','tv','%');

select format(1000000,000);
-- 파일명이 주어졌을 때 확장자를 추출하는 예제
select right('test.txt',3);

-- adddate, subdate (둘다 자주씀)
select adddate(now(), interval 1 day);
select adddate(now(), interval 1 week);
select adddate(now(), interval 1 month);
select adddate(now(), interval 1 year);
select subdate(now(), interval 1 year);