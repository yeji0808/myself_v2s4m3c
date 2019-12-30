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

drop table board


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.memberno is '회원번호';

insert into members(memberno)
values (1)
select * from members

/**********************************/
/* Table Name: 글 */
/**********************************/
CREATE TABLE b_write(
		wno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		wtitle                        		VARCHAR2(100)  NOT NULL,
		wcontent                      		CLOB		     NOT NULL,
		wrecom                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		wreplycnt                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		 DATE		           NOT NULL,
		wword                         		VARCHAR2(100)		 NULL, 
		boardno                       		NUMBER(10)		 NULL,
		memberno                      	NUMBER(10)		 NULL,
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);
drop table b_write
COMMENT ON TABLE b_write is '글';
COMMENT ON COLUMN b_write.wno is '글 번호';
COMMENT ON COLUMN b_write.wtitle is '글 제목 ';
COMMENT ON COLUMN b_write.wcontent is '글 내용';
COMMENT ON COLUMN b_write.wrecom is '추천 수';
COMMENT ON COLUMN b_write.wreplycnt is '뎃글 수';
COMMENT ON COLUMN b_write.rdate is '등록 일자';
COMMENT ON COLUMN b_write.wword is '검색어';
COMMENT ON COLUMN b_write.boardno is '게시판번호';
COMMENT ON COLUMN b_write.memberno is '회원번호';


-- 1)등록
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '산천어 축제', '아이 좋아', 0,
             0, sysdate, '감사',1,1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '크리스마스', '아이 좋아', 0,
             0, sysdate, '감사',1,1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '망년회', '아이 좋아', 0,
             0, sysdate, '감사',1,1);

select * from b_write
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- ------- --------
   1 산천어 축제 아이 좋아         0         0 2019-12-24 17:40:44.0 감사          1        1
   2 크리스마스  아이 좋아         0         0 2019-12-24 17:40:45.0 감사          1        1
   3 망년회    아이 좋아         0         0 2019-12-24 17:41:09.0 감사          1        1

-- 2) 목록
SELECT wno,
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
ORDER BY wno asc;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- ------- --------
   1 산천어 축제 아이 좋아         0         0 2019-12-24 17:40:44.0 감사          1        1
   2 크리스마스  아이 좋아         0         0 2019-12-24 17:40:45.0 감사          1        1
   3 망년회    아이 좋아         0         0 2019-12-24 17:41:09.0 감사          1        1


-- 2-2) Boardno 별 출력 순서
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
where boardno =3
order by wno desc
   
-- 3) 전체 레코드 수
SELECT COUNT(*) as count
FROM b_write;

-- 4) 수정
UPDATE b_write
SET wtitle='산천어 축제2', wcontent='야호랑이'
WHERE wno = 1;
 
SELECT * from b_write;
 WNO WTITLE  WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO
 --- ------- -------- ------ --------- --------------------- ----- -------
   1 산천어 축제2 아이 좋아         0         0 2019-12-09 18:02:21.0 감사          3
   2 크리스마스   아이 좋아         0         0 2019-12-09 18:02:22.0 감사          3
   3 망년회     아이 좋아         0         0 2019-12-09 18:02:23.0 감사          3

-- 5) 하나만 조회할 때 read
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
where wno = 1;
  
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO
 --- ------ -------- ------ --------- --------------------- ----- -------
   1 산천어 축제 아이 좋아         0         0 2019-12-09 18:02:21.0 감사          3

-- 7) 삭제
delete from b_write
where wno = 1;
   
    WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE WWORD BOARDNO
 --- ------ -------- ------ --------- ----- ----- -------

-- 8) boardno별 레코드 갯수 산출
SELECT COUNT(*) as cnt
FROM b_write
where boardno = 3;
   
 COUNT
 -----
     2
     
-- 9) boardno별 레코드 삭제
delete FROM b_write
where boardno = 3;  
   
-- 10) 추천수 증가
update b_write
set wrecom = wrecom+1
where wno=4





