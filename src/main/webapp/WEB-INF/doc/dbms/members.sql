
/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE members;

CREATE TABLE members(
    memberno NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL UNIQUE,
    passwd VARCHAR(60) NOT NULL,
    name VARCHAR(20) NOT NULL,
    birth VARCHAR(20) NOT NULL,
    tel VARCHAR(14) NOT NULL,
    email VARCHAR2(70) NOT NULL,
    zipcode VARCHAR(5),
    address1 VARCHAR(80) NOT NULL,
    address2 VARCHAR(50),
    userno NUMERIC(10),
    mdate DATE,
  FOREIGN KEY (userno) REFERENCES users (userno)
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.memberno is '회원번호';
COMMENT ON COLUMN members.id is '아이디';
COMMENT ON COLUMN members.passwd is '비밀번호';
COMMENT ON COLUMN members.name is '회원이름';
COMMENT ON COLUMN members.birth is '생일';
COMMENT ON COLUMN members.tel is '전화번호';
COMMENT ON COLUMN members.email is '이메일';
COMMENT ON COLUMN members.zipcode is '우편번호';
COMMENT ON COLUMN members.address1 is '주소1';
COMMENT ON COLUMN members.address2 is '주소2';
COMMENT ON COLUMN members.userno is '유저번호';
COMMENT ON COLUMN members.mdate is '가입날짜';

1. 등록
 
1) id 중복 확인
SELECT COUNT(id) as cnt
FROM members
WHERE id='user1';
 
 cnt
 ---
   0   ← 중복 되지 않음.
   
2) 등록
- 일련번호 산출 서브쿼리
- MAX(memberno): memberno 컬럼의 값중에 가장 큰 값을 산출
- 레코드가 없으면 MAX 함수의 결과는 NULL이됩니다.
SELECT MAX(memberno) as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NULL 값은 사칙연산의 결과도 NULL이됩니다. 의미 없음.
SELECT MAX(memberno)+1 as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NVL(값, 변환할 값): 값이 NULL이면 변환할 값으로 변경, 
   NULL을 0으로 변경
SELECT NVL(MAX(memberno), 0) as memberno FROM member;
MEMBERNO
 ------
   0
   
- NULL을 처리하면서 새로운 최대값 산출 SQL
SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member;
MEMBERNO
 ------
   1
 
-- 관리용 회원 기준
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                   'admin', '1234', '정유정', '1996-10-06', '000-0000-0000', 
                   'fltk0601@naver.com', '12345', '서울시 종로구', '관철동', 2, sysdate);
 
-- 개인 회원 기준
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                   'user1', '1234', '최연지', '1996-09-24', '000-0000-0000', 
                   'yzzzc@naver.com', '12345', '서울시 종로구', '관철동', 1, sysdate);
 
-- 점주 회원 기준
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                  'user2', '1234', '김경덕', '1995-06-30', '000-0000-0000', 
                   'kmdeok@naver.com', '12345', '서울시 종로구', '관철동', 1, sysdate);
 
2. 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
ORDER BY memberno ASC;
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL              ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- ------------------ ------- -------- -------- ------ ---------------------
        1 admin 1234   정유정  1996-10-06 000-0000-0000 fltk0601@naver.com 12345   서울시 종로구  관철동           3 2019-12-12 18:04:35.0
        2 user1 1234   최연지  1996-09-24 000-0000-0000 yzzzc@naver.com    12345   서울시 종로구  관철동           1 2019-12-12 18:05:29.0
        3 user1 1234   김경덕  1995-06-30 000-0000-0000 kmdeok@naver.com   12345   서울시 종로구  관철동           2 2019-12-12 18:07:46.0

   
3. 조회
 
1) memberno PK로 user1 사원 정보 보기
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE memberno = 1;
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL              ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- ------------------ ------- -------- -------- ------ ---------------------
        1 admin 1234   정유정  1996-10-06 000-0000-0000 fltk0601@naver.com 12345   서울시 종로구  관철동           3 2019-12-12 18:04:35.0

2) id로 user1 사원 정보 보기   
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE id = 'user1';
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL           ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- --------------- ------- -------- -------- ------ ---------------------
        2 user1 1234   최연지  1996-09-24 000-0000-0000 yzzzc@naver.com 12345   서울시 종로구  관철동           1 2019-12-12 18:09:39.0

3) user별 사원 정보 보기
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE userno = 1;      

4. 수정
UPDATE members 
SET name='아로미', birth='1990-02-20', tel='111-1111-1111', email='abcd@naver.com', 
      zipcode='00000', address1='경기도', address2='파주시', userno='1'
WHERE memberno=3;
 
 
5. 패스워드 변경
1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM members
WHERE memberno=1 AND passwd='1234';
 
2) 패스워드 수정
UPDATE members
SET passwd='0000'
WHERE memberno=1;
 
 
6. 삭제
1) 모두 삭제
DELETE FROM members;
 
2) 특정 회원 삭제
DELETE FROM members
WHERE memberno=2;
 
 
7. 로그인
SELECT COUNT(memberno) as cnt
FROM members
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0
   
- 검색을 하지 않는 경우, 전체 목록 출력
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM members
ORDER BY memberno ASC;