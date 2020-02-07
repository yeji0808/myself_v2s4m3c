
/**********************************/
/* Table Name: 선택 */
/**********************************/
DROP TABLE choice cascade constraint;

CREATE TABLE choice(
		cho_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cho_title                     		VARCHAR2(100)		 NOT NULL,
		cho_content                   		VARCHAR2(3000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cho_word                      		VARCHAR2(100)		 NULL ,
		memberno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE choice is '선택';
COMMENT ON COLUMN choice.cho_no is '선택 번호';
COMMENT ON COLUMN choice.cho_title is '선택 제목';
COMMENT ON COLUMN choice.cho_content is '선택 내용';
COMMENT ON COLUMN choice.rdate is '등록일';
COMMENT ON COLUMN choice.cho_word is '검색어';

-- 1)등록
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, 
                         rdate, cho_word, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '산천어 축제', '아이 좋아',
             sysdate, '감사',1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, 
                         rdate, cho_word, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '산천어 축제', '아이 좋아',
             sysdate, '감사',1 );
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, 
                         rdate, cho_word, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '산천어 축제', '아이 좋아',
             sysdate, '감사4',1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, 
                         rdate, cho_word, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '산천어 축제', '아이 좋아',
             sysdate, '감사3',1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, 
                         rdate, cho_word, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '산천어 축제', '아이 좋아',
             sysdate, '감사2',1);



-- 2) 목록
SELECT cho_no, 
          cho_title, cho_content, 
          rdate, cho_word, memberno
FROM choice
ORDER BY cho_no asc;

 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      1 산천어 축제    아이 좋아                 0 2019-12-26 14:46:57.0 감사             2        1
      2 산천어 축제    아이 좋아                 0 2019-12-26 14:46:58.0 감사             2        1
      3 산천어 축제    아이 좋아                 0 2019-12-26 14:46:59.0 감사4            2        1
      4 산천어 축제    아이 좋아                 0 2019-12-26 14:47:39.0 감사             2        1
      5 산천어 축제    아이 좋아                 0 2019-12-26 14:47:40.0 감사             2        1
      6 산천어 축제    아이 좋아                 0 2019-12-26 14:47:41.0 감사4            2        1
      7 산천어 축제    아이 좋아                 0 2019-12-26 14:47:42.0 감사3            2        1
      8 산천어 축제    아이 좋아                 0 2019-12-26 14:47:43.0 감사2            2        1

      
-- 3) 전체 레코드 수
SELECT COUNT(*) as count
FROM choice;

 COUNT
 -----
   8

-- 4) 수정
UPDATE choice
SET cho_title='산천어 축제9', cho_content='오늘은 이게 고민이야'
WHERE cho_no = 2;
 
SELECT * from choice;
 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      1 산천어 축제    아이 좋아                 0 2019-12-26 14:46:57.0 감사             2        1
      2 산천어 축제9   오늘은 이게 고민이야           0 2019-12-26 14:46:58.0 감사             2        1
      3 산천어 축제    아이 좋아                 0 2019-12-26 14:46:59.0 감사4            2        1
      4 산천어 축제    아이 좋아                 0 2019-12-26 14:47:39.0 감사             2        1
      5 산천어 축제    아이 좋아                 0 2019-12-26 14:47:40.0 감사             2        1
      6 산천어 축제    아이 좋아                 0 2019-12-26 14:47:41.0 감사4            2        1
      7 산천어 축제    아이 좋아                 0 2019-12-26 14:47:42.0 감사3            2        1
      8 산천어 축제    아이 좋아                 0 2019-12-26 14:47:43.0 감사2            2        1





-- 5) 하나만 조회할 때 read 
SELECT cho_no, 
          cho_title, cho_content, cho_rec_cnt, 
          rdate, cho_word, memberno
FROM choice
where cho_no = 2;

 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      2 산천어 축제9   오늘은 이게 고민이야           0 2019-12-26 14:46:58.0 감사             2        1


-- 7) 삭제
delete from choice
where cho_no =3;

    CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO
 ------ --------- ----------- ----------- --------------------- -------- -------
      2 산천어 축제9   오늘은 이게 고민이야           0 2019-12-18 18:51:30.0 감사             5
      4 산천어 축제    아이 좋아                 0 2019-12-18 18:53:08.0 감사3            5
      5 산천어 축제    아이 좋아                 0 2019-12-18 18:53:09.0 감사2            5
      
   

