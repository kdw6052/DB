/*
DBMS : DB 관리하는 시스템
DDL : 
	- CREATE , ALTER , DROP
타입
	-DATE : 날짜, 년, 월, 일, 시, 분, 초
    -TIME : 시 분 초
    -VARCHAR : 문자열
JOIN
	-INNER JOIN : 키값을 기준으로 교집합을 출력하는 방법으로 키값이 각 테이블의 NULL값을 포함하지 않음
    -OUTER JOIN : 여러 테이블 중에서 한 쪽에 데이터가 있고, 한쪽에는 데이터가 없는 경우 모두 출력하는 방법
문자열 함수
CONCAT : 문자열 이어 붙이기
SUBSTRING : 부분 문자열 추출
테이블
	-데이터를 일종의 표로 표현한 것
RESULT SET
	-SELECT를 이용하여 조회한 결과를 표로 나타낸 것
문자열을 날짜로 변환
20221222 -> 2022년 12월 22일
함수 
  - lead(속성) : 속성의 다음 값을 가져옴
  - lead(속성 , n , x) : 속성의 다음 n개의 값을 가져오고 없으면 x로 대체
  - lag(속성) : 속성의 이전 값을 가져옴
  - lag(속성 , n , x) : 속성의 이전 n개의 값을 가져오고 없으면 x로 대체
  - first_value(속성) : 속성의 가장 첫번째 값과 나머지를 비교
  - cume_dist() : 백분율
순위 함수
 - row_number() : 같은 값이 있을 때 등수가 서로 다름
 - dense_rank() : 
	- 같은 값이 있을 때 등수가 같음
    - 같은 값이 있는 행 다음 등수는 같은 값이 있는 등수 + 1
 - rank() :
	- 같은 값이 있을 때 등수가 같음
    - 같은 값이 있는 행 다음 등수는 같은 값이 있는 등수 + 같은 값이 있는 개수
 - ntile() : 
	- 등수를 총 n등까지 분할
- with rollup : 
	- group by와 세트
    - 그룹별로 합계를 한번에 구할때 사용
*/
select date_format('20221222','%Y년%m월%d일');
-- 실수 1.23을 정수 1로 변환
select cast(1.23 as signed integer);
select convert(1.23,signed integer);