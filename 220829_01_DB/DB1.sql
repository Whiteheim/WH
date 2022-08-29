-- 테이블의 기본 구조
create table 테이블명(
	컬럼명 자료형 옵션 -- 옵션 : 필요하면 넣는 설정
	컬럼명 자료형,
	...
);
-- 자료형 (데이터 타입)
-- 	3가지 타입 존재
--		1. 문자형
--			char(용량)
--			: 무조건 지정한 용량만큼의 데이터 저장
--			  용량보다 부족한 데이터를 채우면 나머지는 띄어쓰기로 메꿈
--			  처리속도가 비교적 빠름 
--			  정해진 용량의 데이터들을 저장하는데 활용됨
--				ex) 성별, 주민번호, 전화번호, ...etc

--			varchar2(용량)
--			: 용량보다 부족한 데이터를 채우면 
--			  용량을 따로 채우지 않고 조절하여 저장
--			  (범위보다 큰 용량은 넣을 수 없음)
--			  용량을 조절하는 만큼 처리속도가 비교적 느림
--			  주력으로 사용
--			  가변 용량 데이터들 저장시 이용
--				ex) 이름, 주소, ...etc
-----------------------------------------------------------
--			문자형의 용량
--				varchar2(5) : 5byte까지 담을 수 있다는 의미
--					영어, 숫자, 띄어쓰기는 1byte
--					한글 한글자는 3byte

--				varchar2(5 char)
--					한글/영어 5글자 -> 최대 15byte의 용량을 가질 수 있음			
--				=> 문자형 자료형을 쓸 때는 용량에 char를 넣어 사용
create table test(
	t_name varchar2(5)
);
create table test2(
	t_name varchar2(5 char)
);

-- 문자형의 값을 넣을 때는 작은따옴표 사용
insert into test values('가나다'); -- 용량 초과로 인한 에러 발생
insert into test2 values('가나다');
drop table test cascade constraint purge;
drop table test cascade constraint purge;
-------------------------------------------

--		2. 숫자형
--			NUMBER(P, S)
--				- 주로 사용
--				- 십진수 기준
--				- P : 정밀도(Precision) / S : 범위 (Scale)
--				- P는 소수점 기준 모든 유효숫자를 의미
--				- P에 명시한 값 보다 큰 데이터를 입력하면 오류 발생
--				- S 가 양수면 소수점 이하, 음수면 소수점 이상 (소수점 기준 왼쪽)
--					의 유효숫자 자릿수를 나타냄 

--					 1  2  3  .  4  5  6 
--		    소수점 이상(음수)   소숫점 이하(양수)

--				- S에 명시한 값 이상의 숫자를 입력하면, S에 명시한 숫자로 반올림 처리
--				- S가 음수면 소숫점 기준 왼쪽 자릿수 만큼 반올림
--				- P > S 일때, P는 소숫점 이하 유효숫자 자릿수를 나타냄 

--				값이 123.54
--				값의 범위는 소숫점 포함한 길이
--				number(3)		->	123 	=> 124 
--									S는 명시하지 않아 0으로 처리, p = 3
--									소수점 첫자리에서 반올림

--				number(3, 2)	->	123.54	=> 오류!			
--									P = 3, 123.54는 유효숫자가 5글자
--									유효숫자가 P보다 크면 오류 발생

--				number(5, 2)	->	123.54 	=> 123.54

--				number(7, 1)	->	123.5 
--									S =  1, 소수점 둘째자리가 반올림되어 5

--				number(7, -1)	->	124		=> 120
--									S = -1 , 소수점 기준 왼쪽 첫번째 자리 숫자가 반올림 되어 표기

--			FLOAT(P)
--				- Number의 하위타입
--				- 이진수 기준
create table testNum(
	t_num number(5),
	t_flo float(5)
);
insert into testNum values(12345, 12345);
select * from testNum;
drop table testNum cascade constraint purge;

-- float(5) 라고 하면, 5자리 10진수가 아닌, 5자리 2진수(ex: 10110)를 의미함
-- 2진수 to 10진수 = 2진수 * 약 0.3
-- 5 * 약 0.3 = 약 1.5
-- =>	float(5)는 실제로는 float(2) (1.5는 반올림 하여 2)
-- 		12345 중 앞의 1, 2 만 제대로 나오고 나머지는 0으로 채워진 형태
-- 		잘 안씀 / 크기조절시 P,S 적절히 조절하기


-- 		3. 날짜
--			Date : 연도, 월, 일, 시, 분, 초 까지 입력 가능
--			Timestamp : 연도, 월, 일, 시, 분, 초, 밀리초 까지 입력 가능
--			=> Date 를 주로 사용
-- 			java 연동시 java.util.Date / java.sql.Date 확인 가능함. => 연동할 때 용이





















