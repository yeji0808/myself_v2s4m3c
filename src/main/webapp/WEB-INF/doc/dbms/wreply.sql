/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE board(
		boardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(300)		 NOT NULL,
		count                         		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.boardno is '게시판번호';
COMMENT ON COLUMN board.name is '게시판이름';
COMMENT ON COLUMN board.count is '게시판등록자료수';



/**********************************/
/* Table Name: 글 */
/**********************************/
CREATE TABLE b_write(
		wno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		wtitle                        		VARCHAR2(100)		 NOT NULL,
		wcontent                      		CLOB(10)		 NOT NULL,
		wrecom                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		wreplycnt                     		INTEGER(10)		 DEFAULT 0		 NULL ,
		rdate                         		DATE		 NOT NULL,
		wword                         		VARCHAR2(100)		 NULL ,
		boardno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (boardno) REFERENCES board (boardno)
);

COMMENT ON TABLE b_write is '글';
COMMENT ON COLUMN b_write.wno is '글 번호';
COMMENT ON COLUMN b_write.wtitle is '글 제목 ';
COMMENT ON COLUMN b_write.wcontent is '글 내용';
COMMENT ON COLUMN b_write.wrecom is '추천 수';
COMMENT ON COLUMN b_write.wreplycnt is '뎃글 수';
COMMENT ON COLUMN b_write.rdate is '등록 일자';
COMMENT ON COLUMN b_write.wword is '검색어';
COMMENT ON COLUMN b_write.boardno is '게시판번호';


drop table w_attach
/**********************************/
/* Table Name: 글 댓글 */
/**********************************/
CREATE TABLE wreply(
		wreplyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rcontent                      		VARCHAR2(1000)		 NOT NULL,
		rrdate                         		DATE		 NOT NULL,
		rpasswd                       		NUMBER(10)		 NOT NULL,
		wno                           		NUMBER(10)		 NOT NULL ,
		memberno                       NUMBER(10)   NOT NULL,
  FOREIGN KEY (wno) REFERENCES b_write (wno) on delete cascade,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);
drop table wreply
COMMENT ON TABLE wreply is '글 댓글';
COMMENT ON COLUMN wreply.wreplyno is '댓글번호';
COMMENT ON COLUMN wreply.rcontent is '댓글내용';
COMMENT ON COLUMN wreply.rrdate is '등록일';
COMMENT ON COLUMN wreply.rpasswd is '비밀번호';
COMMENT ON COLUMN wreply.wno is '글 번호';

1) 등록
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '봄', '1234', sysdate, 1);
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '여름', '1234', sysdate, 1);
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '가을', '1234', sysdate, 1);             

2) 전체 목록
SELECT wreplyno, wno, rcontent, rpasswd, rrdate, memberno
FROM wreply
ORDER BY wreplyno DESC;
 WREPLYNO WNO RCONTENT RPASSWD RRDATE                MEMBERNO
 -------- --- -------- ------- --------------------- --------
        3   1 가을          1234 2019-12-26 10:13:41.0        1
        2   1 여름          1234 2019-12-26 10:13:40.0        1
        1   1 봄           1234 2019-12-26 10:13:39.0        1


3) wno 별 목록
SELECT wreplyno, wno, rcontent, rpasswd, rrdate, memberno
FROM wreply
WHERE wno=1
ORDER BY wreplyno DESC;

 WREPLYNO WNO RCONTENT RPASSWD RRDATE
 -------- --- -------- ------- ---------------------
        4   1 댓글3         1234 2019-12-24 13:14:16.0
        3   1 댓글2         1234 2019-12-24 13:14:06.0
        2   1 댓글2         1234 2019-12-24 13:13:59.0
        1   1 댓글1         1234 2019-12-24 13:13:56.0



4) 삭제
-- 패스워드 검사
SELECT count(rpasswd) as cnt
FROM wreply
WHERE wreplyno=1 AND rpasswd='1234';

 CNT
 ---
   1
   
-- 삭제
DELETE FROM wreply
WHERE wreplyno=1;

5) wno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM wreply
WHERE wno=1;

 CNT
 ---
   2

DELETE FROM wreply
WHERE wno=1;
(3 rows affected)

6) memberno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM wreply
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM wreply
WHERE memberno=1;

7) 회원 ID의 출력
SELECT m.id,
           r.wreplyno, r.wno, r.memberno, r.rcontent, r.rpasswd, r.rrdate
FROM members m,  wreply r
WHERE (m.memberno = r.memberno) AND r.wno=1
ORDER BY r.wreplyno DESC;

 ID    wreplyNO wno MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 댓글 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 댓글 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 댓글 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM wreply
WHERE wreplyno=1 AND rpasswd='1234';

 CNT
 ---
   0

9) 삭제
DELETE FROM wreply
WHERE wreplyno=1;



