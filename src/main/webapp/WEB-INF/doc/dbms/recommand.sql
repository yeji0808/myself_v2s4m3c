
/**********************************/
/* Table Name: 추천 */
/**********************************/
drop table recommand cascade constraint

CREATE TABLE recommand(
		recom_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		content                       		VARCHAR2(100)		 NOT NULL,
		cnt                           		NUMBER(20)		 DEFAULT 0		 NOT NULL,
		list_cnt                          NUMBER(20)     DEFAULT 1     NOT NULL,
	 cho_no                            NUMBER(10)     NULL,
  FOREIGN KEY (cho_no) REFERENCES choice (cho_no) on delete cascade
);

COMMENT ON TABLE recommand is '추천';
COMMENT ON COLUMN recommand.cho_no is '선택 번호';
COMMENT ON COLUMN recommand.recom_no is '추천 번호';
COMMENT ON COLUMN recommand.content is '추천 내용';
COMMENT ON COLUMN recommand.list_cnt is '추천 항목 수';
COMMENT ON COLUMN recommand.cnt is '추천 수';

-- 1) 등록
delete from RECOMMAND where cho_no=3

INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '짱뽕', 0,3);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '짜장', 0,3);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '코트vs패딩', 0,4);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '부먹vs찍먹', 0,5);

-- 2) 목록
SELECT recom_no, 
                         content, cnt, cho_no,list_cnt
FROM RECOMMAND
ORDER BY recom_no asc;

select * from RECOMMAND
-- 3) 전체 레코드 수
SELECT COUNT(*) as count
FROM RECOMMAND;

-- 4) 수정
UPDATE RECOMMAND
SET content='스키'
WHERE recom_no = 3;
-- 4) 삭제
delete from recommand
WHERE recom_no = 3;

-- 5) 추천 수 증가
update recommand
    set cnt = cnt+1
    where cho_no=#{cho_no}

-- 6) cho_no별 목록
SELECT recom_no, 
                         content, cnt, cho_no,list_cnt
FROM RECOMMAND
where cho_no = 11;

-- 7) 조회
SELECT recom_no, 
                         content, cnt, cho_no, list_cnt
    FROM recommand
    Where recom_no=1
     RECOM_NO CONTENT CNT CHO_NO LIST_CNT
 -------- ------- --- ------ --------
        1 따끈따끈한 고   0      3        1

