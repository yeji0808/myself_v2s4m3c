
/**********************************/
/* Table Name: 첨부파일 */
/**********************************/

DROP table w_attach

CREATE TABLE w_attach(
		w_attachno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		w_attachname              		VARCHAR2(200)		 NOT NULL,
		w_attachupfile                		VARCHAR2(100)		 NULL ,
		w_attachthumb                 		VARCHAR2(100)		 NULL ,
		w_attachfsize                 		NUMBER(10)		 NOT NULL,
		wno                           		NUMBER(10)		 NULL ,
		w_file_rdate                  		DATE		 NOT NULL,
  FOREIGN KEY (wno) REFERENCES b_write (wno) on delete cascade
);

COMMENT ON TABLE w_attach is '첨부파일';
COMMENT ON COLUMN w_attach.w_attachno is '첨부파일 번호';
COMMENT ON COLUMN w_attach.w_attachname is '원본파일';
COMMENT ON COLUMN w_attach.w_attachupfile is '업로드 파일명';
COMMENT ON COLUMN w_attach.w_attachthumb is 'Thumb 파일';
COMMENT ON COLUMN w_attach.w_attachfsize is '파일 사이즈';
COMMENT ON COLUMN w_attach.wno is '글 번호';
COMMENT ON COLUMN w_attach.w_file_rdate is '파일등록일';

1)등록
SELECT NVL(MAX(w_attachno), 0) + 1 as w_attachno FROM w_attach;
 W_ATTACHNO
 ----------
          1

SELECT wno, boardno, wtitle
FROM b_write
ORDER BY wno ASC;
 
 WNO BOARDNO WTITLE
 --- ------- ------
   2       3 크리스마스
   3       3 망년회
   4       3 4312

   
INSERT INTO w_attach(w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate)
VALUES((SELECT NVL(MAX(w_attachno), 0) + 1 as w_attachno FROM w_attach),
              'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, 1, sysdate);
              
INSERT INTO w_attach(w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate)
VALUES((SELECT NVL(MAX(w_attachno), 0) + 1 as w_attachno FROM w_attach),
              'samyang2.jpg', 'samyang_2.jpg', 'samyang_2t.jpg', 1000, 1, sysdate);
              
INSERT INTO w_attach(w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate)
VALUES((SELECT NVL(MAX(w_attachno), 0) + 1 as w_attachno FROM w_attach),
              'samyang3.jpg', 'samyang_3.jpg', 'samyang_3t.jpg', 1000, 1, sysdate);
              
INSERT INTO w_attach(w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate)
VALUES((SELECT NVL(MAX(w_attachno), 0) + 1 as w_attachno FROM w_attach),
              'samyang4.jpg', 'samyang_4.jpg', 'samyang_4t.jpg', 1000, 1, sysdate);
              
-- 2) 목록( wno 기준 내림 차순, w_attachno 기준 오르차순)
SELECT w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate
FROM w_attach
ORDER BY wno asc,  w_attachno desc;

delete from b_write where wno = 1
 W_ATTACHNO W_ATTACHNAME W_ATTACHUPFILE W_ATTACHTHUMB  W_ATTACHFSIZE WNO W_FILE_RDATE
 ---------- ------------ -------------- -------------- ------------- --- ---------------------
          4 samyang4.jpg samyang_4.jpg  samyang_4t.jpg          1000   1 2019-12-17 18:12:00.0
          3 samyang3.jpg samyang_3.jpg  samyang_3t.jpg          1000   1 2019-12-17 18:11:59.0
          2 samyang2.jpg samyang_2.jpg  samyang_2t.jpg          1000   1 2019-12-17 18:11:58.0
          1 samyang.jpg  samyang_1.jpg  samyang_t.jpg           1000   1 2019-12-17 18:11:57.0



-- 3) 글별 파일 목록(wno 기준 내림 차순, w_attachno 기준 오르차순)
SELECT w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate
FROM w_attach
WHERE wno = 1
ORDER BY w_attachname ASC;

 w_attachNO wno FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) 하나의 파일 삭제
DELETE FROM w_attach
WHERE w_attachno = 1;


-- 5) FK wno 부모 테이블별 레코드 갯수 산출
SELECT w_attachno, w_attachname, w_attachupfile, w_attachthumb, w_attachfsize, wno, w_file_rdate
FROM w_attach
WHERE wno=13;

w_attachNO wno FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

SELECT COUNT(*) as cnt
FROM w_attach
WHERE wno=1;

 CNT
 ---
   3             
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM w_attach
WHERE wno=2;

(3 rows affected)

7) b_write, w_attach join
SELECT w.wtitle, 
               a.w_attachno, a.wno, a.w_attachname, a.w_attachupfile, a.w_attachthumb, a.w_attachfsize, a.w_file_rdate
    FROM b_write w, w_attach a
    WHERE w.wno = a.w_attachno
    ORDER BY w.wno DESC,  a.w_attachno ASC;
 WTITLE  W_ATTACHNO WNO W_ATTACHNAME W_ATTACHUPFILE W_ATTACHTHUMB  W_ATTACHFSIZE W_FILE_RDATE
 ------- ---------- --- ------------ -------------- -------------- ------------- ---------------------
 sapnb           13  15 스크린세이버.png   스크린세이버.png     스크린세이버_t.jpg          111818 2019-12-19 18:50:57.0
 4231            12  15 그림.png       그림.png         그림_t.jpg               78273 2019-12-19 18:50:57.0
 12나와라           11  14 스크린세이버.png   스크린세이버.png     스크린세이버_t.jpg          111818 2019-12-19 18:03:32.0
 지금이순간           10  14 그림.png       그림.png         그림_t.jpg               78273 2019-12-19 18:03:32.0
 52               9  13 그림.png       그림.png         그림_t.jpg               78273 2019-12-19 18:02:16.0
 4123             8  12 스크린세이버.png   스크린세이버.png     스크린세이버_t.jpg          111818 2019-12-19 18:01:29.0
 4321             7  12 그림.png       그림.png         그림_t.jpg               78273 2019-12-19 18:01:29.0
 5213423          6  12 스크린세이버.png   스크린세이버.png     스크린세이버_t.jpg          111818 2019-12-19 14:39:57.0
 5321432          5  12 그림.png       그림.png         그림_t.jpg               78273 2019-12-19 14:39:57.0
 123              4   1 samyang4.jpg samyang_4.jpg  samyang_4t.jpg          1000 2019-12-17 18:14:37.0
 98789            3   1 samyang3.jpg samyang_3.jpg  samyang_3t.jpg          1000 2019-12-17 18:14:36.0
 98789            2   1 samyang2.jpg samyang_2.jpg  samyang_2t.jpg          1000 2019-12-17 18:14:35.0
 산천어 축제2          1   1 samyang.jpg  samyang_1.jpg  samyang_t.jpg           1000 2019-12-17 18:14:34.0



