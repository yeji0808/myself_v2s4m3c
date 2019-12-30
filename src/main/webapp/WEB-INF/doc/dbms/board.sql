/**********************************/
/* Table Name: 게시판 */
/**********************************/
DROP table board
 SELECT boardno, name, count 
     FROM board
     ORDER BY boardno asc
CREATE TABLE board(
boardno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(300)  NOT NULL,
count                          NUMBER(10)  DEFAULT 0  NOT NULL
);

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.boardno is '게시판번호';
COMMENT ON COLUMN board.name is '게시판이름';
COMMENT ON COLUMN board.count is '게시판등록자료수';

1) 등록

select * from board
-- PK 생성
SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board;                                
 BOARDNO
 -------
       1

INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             '자유게시판', 0);
INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             '추천게시판', 0);
INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             '회원 사진 게시판', 0);

2) 목록
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 자유게신판     0
       2 추천게시판          0
       3 회원 사진 게시판          0

2-2) 하나만 조회할 때 read
SELECT boardno, name, count
FROM board
where boardno=2;
       
       
3) 수정
UPDATE board
SET name='FREE BOARD'
WHERE boardno = 1;
 
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 
 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 FREE BOARD     0
       2 추천게시판          0
       3 추천게시판          0

4) 삭제
-- 모든 레코드 삭제
DELETE FROM board
where boardno = 3;
COMMIT;
 
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 

 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 FREE BOARD     0
       2 추천게시판          0
       

-----------------------------------------------------------------------------------------
1. 예약 카테고리: reservation
-----------------------------------------------------------------------------------------
DROP TABLE reservation;

CREATE TABLE reservation(
    resno                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    resname                         VARCHAR2(50)     NOT NULL,
    phonenum                        NUMBER(10)     NOT NULL,
    store                             VARCHAR2(50)     NOT NULL,
    resdate                         DATE     NOT NULL,
    rescount                        NUMBER(10)     DEFAULT 1     NOT NULL
);

COMMENT ON TABLE reservation is '예약';
COMMENT ON COLUMN reservation.resno is '예약번호';
COMMENT ON COLUMN reservation.resname is '예약자';
COMMENT ON COLUMN reservation.phonenum is '연락처';
COMMENT ON COLUMN reservation.store is '상호명';
COMMENT ON COLUMN reservation.resdate is '예약일 수';
COMMENT ON COLUMN reservation.rescount is '예약자 수';
       

1) 등록
-- PK 생성
SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation;                                
 RESNO
 -----
     1

INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '구굴링', 01066046216, '플렉스 해버렸지 머람', sysdate, 1);
INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '네이빙', 01065046216, '연안상회 꼬막 맛있쭤요 드루와요', sysdate, 1);
INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '다음링', 01063046216, '유박사 곱창', sysdate, 1);
             
-- 2) 목록
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 RESNO RESNAME PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------- ---------- ----------------- --------------------- --------
     3 구굴링     1066046216 플렉스 해버렸지 머람       2019-11-27 17:38:33.0        1
     4 구굴링     1066046216 플렉스 해버렸지 머람       2019-11-27 17:39:34.0        1
     5 네이빙     1065046216 연안상회 꼬막 맛있쭤요 드루와요 2019-11-27 17:39:35.0        1
     6 다음링     1063046216 유박사 곱창            2019-11-27 17:39:36.0        1


3) 수정
UPDATE reservation
SET resname='FLEX 해버렸지 뭐람~'
WHERE resno = 3;
 
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 
 RESNO RESNAME       PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------------- ---------- ----------------- --------------------- --------
     3 FLEX 해버렸지 뭐람~ 1066046216 플렉스 해버렸지 머람       2019-11-27 17:38:33.0        1
     4 구굴링           1066046216 플렉스 해버렸지 머람       2019-11-27 17:39:34.0        1
     5 네이빙           1065046216 연안상회 꼬막 맛있쭤요 드루와요 2019-11-27 17:39:35.0        1
     6 다음링           1063046216 유박사 곱창            2019-11-27 17:39:36.0        1


4) 삭제
-- 모든 레코드 삭제
DELETE FROM reservation
where resno = 4;
COMMIT;
 
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 
 RESNO RESNAME       PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------------- ---------- ----------------- --------------------- --------
     3 FLEX 해버렸지 뭐람~ 1066046216 플렉스 해버렸지 머람       2019-11-27 17:38:33.0        1
     5 네이빙           1065046216 연안상회 꼬막 맛있쭤요 드루와요 2019-11-27 17:39:35.0        1
     6 다음링           1063046216 유박사 곱창            2019-11-27 17:39:36.0        1
     
5) count별 조회

 
10) board 추가에따른 등록된 글수의 증가
UPDATE board 
SET count = count + 1 
WHERE boardno=3;
 
11) board 삭제에따른 등록된 글수의 감소
UPDATE board 
SET count = count - 1 
WHERE boardno=3;
 
12) categrp 테이블을 삭제하고 생성할것.
-- DROP TABLE contents;
-- DROP TABLE categrp;
-- categrp 생성
-- insert 실행
SELECT boardno, name, count
FROM board
ORDER BY boardno ASC;

 BOARDNO NAME  COUNT
 ------- ----- -----
       3 자유게시판     0



13) 자식 레코드가 있는 경우의 삭제
DELETE FROM contents;
DELETE FROM categrp;
         
14) cnt 컬럼의 0으로 초기화
UPDATE board
SET count=0
WHERE boardno=3;

