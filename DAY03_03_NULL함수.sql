/* 
    샘플 테이블
    */
CREATE TABLE SAMPLE_T(
NAME VARCHAR2(20 BYTE),
KOR NUMBER(3),
ENG NUMBER(3),
MATH NUMBER(3)
);

INSERT INTO SAMPLE_T(NAME, KOR, ENG, MATH) VALUES('A', 100, 100, NULL); 
INSERT INTO SAMPLE_T(NAME, KOR, ENG, MATH) VALUES('B', 100, NULL, 100);
INSERT INTO SAMPLE_T(NAME, KOR, ENG, MATH) VALUES('A', NULL, 100, 100); 
COMMIT;

-- SAMPLE_T의 전체 데이터 조회하기
SELECT *
FROM SAMPLE_T ;

-- SAMPLE_T의 전체 데이터와 점수 합계 조회하기

SELECT NAME, KOR, ENG,MATH
           , (KOR + ENG + MATH) AS TOTAL-- 연산에 NULL값이 있으면 값이 NULL값으로 나옴
           FROM SAMPLE_T ;
           
/*
     NULL 처리 함수
     1. NVL(EXPR, VALUE IF EXPR IS NULL)
     2. NVL2(EXPR, VALUE IF EXPR IS NOT NULL, VALUE IF EXPR IS NULL)
*/
    
SELECT NAME
      , NVL(KOR, 0) AS 국어
      , NVL(ENG, 0) AS 영어
      , NVL(MATH, 0) AS 수학
      , NVL(KOR, 0) + NVL(ENG, 0) + NVL(MATH,0) AS 합계
      FROM SAMPLE_T ;

-- HR 계정으로 접속한 뒤 문제 풀이
-- 사원들의 급여를 구하시오.
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME, SALARY, COMMISSION_PCT
    -- , NVL2(COMMISSION_PCT, SALARY + SALARY * COMMISSION_PCT, SALARY) AS PAY
     , NVL(COMMISSION_PCT, 0) * NVL(SALARY, 0) + NVL(SALARY, 0) AS PAY
     FROM EMPLOYEES ;
     
     
     
