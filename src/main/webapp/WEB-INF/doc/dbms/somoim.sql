/**********************************/
/* Table Name: 소모임 그룹 */
/**********************************/

DROP TABLE somoim;

CREATE TABLE somoim(
		somoimno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(100)		 NOT NULL,
		somoimtype                    		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		membercnt                     		NUMBER(7)		 NOT NULL,
		fname                     VARCHAR2(100)         NOT NULL,
    fupname                  VARCHAR2(100)         NOT NULL,
    thumb                    VARCHAR2(100)         NULL,
    fsize                       NUMBER(10)         DEFAULT 0         NOT NULL
);

COMMENT ON TABLE somoim is '소모임 그룹';
COMMENT ON COLUMN somoim.somoimno is '소모임 번호';
COMMENT ON COLUMN somoim.name is '소모임 이름';
COMMENT ON COLUMN somoim.somoimtype is '소모임 분류';
COMMENT ON COLUMN somoim.seqno is '소모임 출력순서';
COMMENT ON COLUMN somoim.visible is '소모임 출력 모드';
COMMENT ON COLUMN somoim.rdate is '소모임 생성일';
COMMENT ON COLUMN somoim.membercnt is '소모임 회원수';
COMMENT ON COLUMN somoim.fname is '원본 파일명';
COMMENT ON COLUMN somoim.fupname is '업로드 파일명';
COMMENT ON COLUMN somoim.thumb is 'Thumb 파일';
COMMENT ON COLUMN somoim.fsize is '파일 사이즈';

-- 등록
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), '종로먹거리', '맛집탐방', 1, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), '당구클럽', '스포츠활동', 2, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), 'LG트윈스', '스포츠관람', 3, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

-- 목록
SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize
FROM somoim
ORDER BY somoimno ASC;


SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 종로먹거리 맛집탐방           1 Y       2019-12-02 17:39:30.0         0
        2 당구클럽  스포츠활동          2 Y       2019-12-02 17:39:31.0         0
        3 LG트윈스 스포츠관람          3 Y       2019-12-02 17:39:33.0         0
         
-- 수정
UPDATE somoim
SET name='야구관람', seqno = 1, visible='N'
WHERE somoimno = 3;

SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt
FROM somoim
ORDER BY somoimno ASC;

SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 종로먹거리 맛집탐방           1 Y       2019-12-02 17:39:30.0         0
        2 당구클럽  스포츠활동          2 Y       2019-12-02 17:39:31.0         0
        3 야구관람  스포츠관람          1 N       2019-12-02 17:39:33.0         0
        
-- 삭제
DELETE FROM somoim
WHERE somoimno = 6;

SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt
FROM somoim
ORDER BY somoimno ASC;

 SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 종로먹거리 맛집탐방           1 Y       2019-12-02 17:39:30.0         0
        2 당구클럽  스포츠활동          2 Y       2019-12-02 17:39:31.0         0

-- 연쇄 삭제
DELETE somoim
WHERE somoimno = 6
ON DELETE CASECADE;

         
         
         
         



