-- abc회원이 반집업 맨투맨(1번제품) 빨강을 2개 장바구니에 담았다. 이때 실행되어야하는 쿼리작성
insert into basket(ba_amount, ba_me_id, ba_po_num)
	values(2,'abc',1);
-- abc 회원이 장바구니에 담긴 모든 제품을 구매. 이때 실행되어야 하는 쿼리 작성
	-- 적립 포인트는 제품 금액의 10%, 사용 포인트는 X. 배송지는 집
insert into `order`(or_total_price, or_price, or_add_point, or_use_point,
	or_ab_num,or_me_id)
    values(17000*2,17000*2,17000*2/10,0,1,'abc');
insert into order_list(ol_amount, ol_price,ol_or_num, ol_po_num)
	values(2,17000,1,1);
-- 제품 옵션에 재고를 변경
UPDATE product_option 
	SET 
		po_amount = po_amount - 2
	WHERE
		po_num = 1;
    
select*from product_option;
select*from `order`;
select*from order_list;
select*from product;
select*from address_book;