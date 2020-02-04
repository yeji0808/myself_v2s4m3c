/**********************************/
/* Table Name: 글쓰기 */
/**********************************/
DROP TABLE s_write;

CREATE TABLE s_write(
		writeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		somoimno                          NUMBER(10)     NOT NULL ,
    memberno                        NUMBER(10)     NOT NULL ,
		title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (somoimno) REFERENCES somoim (somoimno) ON DELETE CASCADE,
  FOREIGN KEY (memberno) REFERENCES members (memberno) ON DELETE CASCADE
);

COMMENT ON TABLE s_write is '글쓰기';
COMMENT ON COLUMN s_write.writeno is '글쓰기 번호';
COMMENT ON COLUMN s_write.somoimno is '소모임 번호';
COMMENT ON COLUMN s_write.memberno is '회원 번호';
COMMENT ON COLUMN s_write.title is '글쓰기 이름';
COMMENT ON COLUMN s_write.content is '글쓰기 내용';
COMMENT ON COLUMN s_write.recom is '추천수';
COMMENT ON COLUMN s_write.cnt is '조회수';
COMMENT ON COLUMN s_write.replycnt is '댓글수';
COMMENT ON COLUMN s_write.rdate is '등록일';
COMMENT ON COLUMN s_write.word is '검색어';

-- 등록
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '제목1', '내용1',
             0, 0, 0, sysdate, '');
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '제목2', '내용2',
             0, 0, 0, sysdate, '');
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '제목3', '내용3',
             0, 0, 0, sysdate, '');             
             
-- 목록
SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
ORDER BY writeno DESC;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ----
       3        1        1 제목3   내용3         0   0        0 2019-12-12 18:33:07.0 NULL
       2        1        1 제목2   내용2         0   0        0 2019-12-12 18:33:06.0 NULL
       1        1        1 제목1   내용1         0   0        0 2019-12-12 18:33:05.0 NULL
       
-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM s_write;

 COUNT
 -----
     3
  
-- 조회
SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
WHERE writeno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ----
       1        1        1 제목1   내용1         0   0        0 2019-12-12 18:33:05.0 NULL

-- 수정
UPDATE s_write
SET title='제목 수정', content='내용 수정', word='검색어 수정'
WHERE writeno = 1;

SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
WHERE writeno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ------
       1        1        1 제목 수정 내용 수정       0   0        0 2019-12-12 18:33:05.0 검색어 수정

-- 7) 삭제
DELETE FROM s_write
WHERE writeno = 6;

-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT writeno, somoimno, memberno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM s_write
WHERE somoimno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ------
       1        1        1 제목 수정 내용 수정       0   0        0 2019-12-12 18:33:05.0 검색어 수정
       2        1        1 제목2   내용2         0   0        0 2019-12-12 18:33:06.0 NULL
       3        1        1 제목3   내용3         0   0        0 2019-12-12 18:33:07.0 NULL

SELECT COUNT(*) as cnt
FROM s_write
WHERE somoimno = 1;

 CNT
 ---
   3
   
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM s_write
WHERE somoimno = 1;





     