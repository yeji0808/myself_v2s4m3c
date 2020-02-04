/**********************************/
/* Table Name: 추천 */
/**********************************/
DROP TABLE recommand cascade constraint

CREATE TABLE recommand(
    recom_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    content                           VARCHAR2(100)    NOT NULL,
    cnt                               NUMBER(20)     DEFAULT 0     NOT NULL,
    list_cnt                          NUMBER(20)     DEFAULT 1     NOT NULL,
   cho_no                            NUMBER(10)     NULL,
  FOREIGN KEY (cho_no) REFERENCES choice (cho_no) on delete cascade
);


COMMENT ON TABLE choice is '추천';
COMMENT ON COLUMN choice.cho_no is '추천 번호';
COMMENT ON COLUMN choice.cho_title is '추천 제목';
COMMENT ON COLUMN choice.cho_content is '추천 내용';
COMMENT ON COLUMN choice.cho_rec_cnt is '추천 추천 수';
COMMENT ON COLUMN choice.rdate is '등록일';
COMMENT ON COLUMN choice.cho_word is '검색어';
COMMENT ON COLUMN choice.boardno is '게시판번호';
COMMENT ON COLUMN choice.memberno is '회원번호';


/**********************************/
/* Table Name: 선택첨부 */
/**********************************/
drop table rec_img
CREATE TABLE rec_img(
		img_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		fname                         		VARCHAR2(1000)		 NOT NULL,
		fupname                       		VARCHAR2(1000)		 NOT NULL,
		thumb                         		VARCHAR2(1000)		 NOT NULL,
		fsize                         		NUMBER(10)		 NOT NULL,
		recom_no                      		NUMBER(20)		 NULL ,
  FOREIGN KEY (recom_no) REFERENCES recommand (recom_no) on delete cascade
);

COMMENT ON TABLE rec_img is '선택첨부';
COMMENT ON COLUMN rec_img.img_no is '첨부번호';
COMMENT ON COLUMN rec_img.fname is '파일명';
COMMENT ON COLUMN rec_img.fupname is '업로드';
COMMENT ON COLUMN rec_img.thumb is '썸브';
COMMENT ON COLUMN rec_img.fsize is '파일크기';
COMMENT ON COLUMN rec_img.recom_no is '추천 항목 번호';

1)등록
SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img;
 rec_imgNO
 ----------
          1

SELECT *
FROM recommand
ORDER BY recom_no ASC;
 
 CHO_NO RECOM_NO CONTENT  CNT LIST_CNT
 ------ -------- -------- --- --------
      3        1 따끈따끈한 고    0        1
     10        2 각설이        0        1
     11        4 담백한 된장찌개   0        1


   
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_1.jpg', 'samyang_t1.jpg', 1000, 2);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_2.jpg', 'samyang_t2.jpg', 1000, 1);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_3.jpg', 'samyang_t3.jpg', 1000, 4);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_4.jpg', 'samyang_t4.jpg', 1000,4);
              
              
-- 2) 목록( wno 기준 내림 차순, w_attachno 기준 오르차순)
SELECT img_no, fname, fupname, thumb, fsize, recom_no
FROM rec_img
ORDER BY recom_no asc,  img_no desc;



-- 3) 추천 항목 별 파일 목록(wno 기준 내림 차순, w_attachno 기준 오르차순)
SELECT img_no, fname, fupname, thumb, fsize, recom_no
FROM rec_img
WHERE recom_no =2
ORDER BY fname ASC;
 IMG_NO FNAME       FUPNAME       THUMB          FSIZE RECOM_NO
 ------ ----------- ------------- -------------- ----- --------
      1 samyang.jpg samyang_1.jpg samyang_t.jpg   1000        2
      4 samyang.jpg samyang_4.jpg samyang_t4.jpg  1000        2
      3 samyang.jpg samyang_3.jpg samyang_t3.jpg  1000        2
      2 samyang.jpg samyang_2.jpg samyang_t2.jpg  1000        2


-- 4) rec_img, w_attach join
    SELECT r.content, 
               i.img_no, i.recom_no, i.fname, i.fupname, i.thumb, i.fsize
    FROM recommand r, rec_img i
    WHERE r.recom_no = i.recom_no
    ORDER BY r.recom_no DESC,  i.img_no ASC
 CONTENT  IMG_NO RECOM_NO FNAME       FUPNAME       THUMB          FSIZE
 -------- ------ -------- ----------- ------------- -------------- -----
 담백한 된장찌개      4        2 samyang.jpg samyang_4.jpg samyang_t4.jpg  1000
 각설이           2        2 samyang.jpg samyang_2.jpg samyang_t2.jpg  1000
 따끈따끈한 고       1        2 samyang.jpg samyang_1.jpg samyang_t.jpg   1000


-- 5) 하나의 파일 삭제
DELETE FROM rec_img


