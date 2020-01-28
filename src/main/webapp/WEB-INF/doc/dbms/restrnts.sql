DROP TABLE menu CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE restrnts; CASCADE CONSTRAINTS;
DROP TABLE rest_categrp CASCADE CONSTRAINTS;


/**********************************/
/* Table Name: 음식점 */
/**********************************/
CREATE TABLE restrnts(
		restno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rcateno                       		NUMBER(10)		 NULL ,
		memberno                     NUMBER(10)		 NOT NULL,
		rname                          	VARCHAR2(50)		 NOT NULL,
		rmain                            VARCHAR2(50)     NOT NULL,
    rintro                             VARCHAR2(200)    NULL,
    rtime                             VARCHAR2(100)     NOT NULL,
    rcall                             VARCHAR2(50)     NOT NULL,
		rzipcode                       	VARCHAR2(10)		 NOT NULL,
		raddress1                        VARCHAR2(100)    NOT NULL,
		raddress2                        VARCHAR2(100)    NOT NULL,
		rword                             VARCHAR2(50)    NULL,
		rrecom                           NUMBER(10)       DEFAULT 0    NOT NULL,
    rcnt                               NUMBER(10)       DEFAULT 0    NOT NULL,
    reviewcnt                       NUMBER(10)        DEFAULT 0     NOT NULL,
    fname                            VARCHAR2(100)         NOT NULL,
    fupname                        VARCHAR2(100)         NOT NULL,
    thumb                           VARCHAR2(100)         NULL ,
    fsize                              NUMBER(10)         DEFAULT 0         NOT NULL,		
  FOREIGN KEY (rcateno) REFERENCES rest_categrp (rcateno)
);

COMMENT ON TABLE restrnts is '음식점';
COMMENT ON COLUMN restrnts.restno is '음식점 번호';
COMMENT ON COLUMN restrnts.rcateno is '분류 번호';
COMMENT ON COLUMN restrnts.memberno is '점주 번호';
COMMENT ON COLUMN restrnts.rname is '음식점 이름';
COMMENT ON COLUMN restrnts.rmain is '메인요리';
COMMENT ON COLUMN restrnts.rintro is '한줄소개';
COMMENT ON COLUMN restrnts.rtime is '영업시간';
COMMENT ON COLUMN restrnts.rcall is '전화번호';
COMMENT ON COLUMN restrnts.rzipcode is '음식점 우편번호';
COMMENT ON COLUMN restrnts.raddress1 is '음식점 주소1';
COMMENT ON COLUMN restrnts.raddress2 is '음식점 주소2';
COMMENT ON COLUMN restrnts.rword is '검색어';
COMMENT ON COLUMN restrnts.rrecom is '추천수';
COMMENT ON COLUMN restrnts.rcnt is '조회수';
COMMENT ON COLUMN restrnts.reviewcnt is '리뷰수';
COMMENT ON COLUMN restrnts.fname is '원본 파일명';
COMMENT ON COLUMN restrnts.fupname is '업로드 파일명';
COMMENT ON COLUMN restrnts.thumb is 'Thumb 파일';
COMMENT ON COLUMN restrnts.fsize is '파일 사이즈';


-- 1) restrnts 등록(memberno: 1),
INSERT INTO restrnts(restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
                                  rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
                                  fname, fupname, thumb, fsize)
VALUES((SELECT NVL(MAX(restno), 0) + 1 as restno FROM restrnts),
             1, 1, '엉생', '돼지고기무한리필', '맛있음', '매일 11:00 - 11:00', '02-123-4567', 
             '1234', '서울 종로구 청계천로 67 관철동', '155 1층', '맛집', 0, 0, 0,
             'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

-- 2) 전체 목록(지도)
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
ORDER BY rname ASC;

-- 3) rcatno별 목록
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
WHERE rcateno=4 -- 1)한식 2)양식
ORDER BY rname DESC;

-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM restrnts;
             
-- 5) 조회
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
WHERE restno=1;

-- 6) 수정
UPDATE contents
SET title='제목 수정', content='내용 수정', word='검색어'
WHERE contentsno = 1;

-- 7) 삭제
DELETE FROM restrnts
WHERE rcateno=1;
-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT contentsno, memberno, categrpno, title
FROM contents
WHERE categrpno=6;

SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=6;

 CNT
 ---
   3             
             
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contents
WHERE categrpno=6;

SELECT restno 
    FROM(
            SELECT restno
            FROM restrnts
            ORDER BY restno DESC)
    WHERE ROWNUM = 1
