/**********************************/
/* Table Name: 글 */
/**********************************/

DROP TABLE b_write;

CREATE TABLE b_write(
		wno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		wtitle                        		VARCHAR2(100)  NOT NULL,
		wcontent                      		CLOB		     NOT NULL,
		wrecom                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		wreplycnt                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		 DATE		           NOT NULL,
		wword                         		VARCHAR2(100)		 NULL, 
		memberno                      	NUMBER(10)		 NULL,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE b_write is '글';
COMMENT ON COLUMN b_write.wno is '글 번호';
COMMENT ON COLUMN b_write.wtitle is '글 제목 ';
COMMENT ON COLUMN b_write.wcontent is '글 내용';
COMMENT ON COLUMN b_write.wrecom is '추천 수';
COMMENT ON COLUMN b_write.wreplycnt is '뎃글 수';
COMMENT ON COLUMN b_write.rdate is '등록 일자';
COMMENT ON COLUMN b_write.wword is '검색어';
COMMENT ON COLUMN b_write.memberno is '회원번호';


-- 1)등록
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '산천어 축제', '아이 좋아', 0,
             0, sysdate, '감사',1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '크리스마스', '아이 좋아', 0,
             0, sysdate, '감사',1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '망년회', '아이 좋아', 0,
             0, sysdate, '감사',1);


-- 2) 목록
SELECT wno,
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword,  memberno
FROM b_write
ORDER BY wno asc;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   1 산천어 축제 아이 좋아         0         0 2020-01-02 18:31:46.0 감사           1
   2 크리스마스  아이 좋아         0         0 2020-01-02 18:31:47.0 감사           1
   3 망년회    아이 좋아         0         0 2020-01-02 18:31:48.0 감사           1


-- 2-2) memberno 별 출력 순서
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, memberno
FROM b_write
where memberno =1
order by wno desc
   
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   3 망년회    아이 좋아         0         0 2020-01-02 18:31:48.0 감사           1
   2 크리스마스  아이 좋아         0         0 2020-01-02 18:31:47.0 감사           1
   1 산천어 축제 아이 좋아         0         0 2020-01-02 18:31:46.0 감사           1

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
          wreplycnt, rdate, wword, memberno
FROM b_write
where wno = 1;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   1 산천어 축제 아이 좋아         0         0 2020-01-02 18:31:46.0 감사           1

-- 7) 삭제
delete from b_write
where wno = 1;
   
    WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE WWORD BOARDNO
 --- ------ -------- ------ --------- ----- ----- -------

 COUNT
 -----
     2
     
-- 8) 추천수 증가
update b_write
set wrecom = wrecom+1
where wno=1

-- 9) 댓글 수 증가
update b_write
set wreplycnt = wreplycnt+1
where wno=1





