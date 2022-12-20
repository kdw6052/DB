use shoppingmall2;
/*
with rollup은 group by와 세트
*/
select pr_pc_num, sum(pr_amount) from product group by pr_pc_num with rollup;

use cgv;
select ss_mo_num, ss_ci_num, sum(ss_parssible) as '예매 가능 총 좌석' 
	from screen_schedule
    group by ss_mo_num, ss_ci_num
    with rollup;