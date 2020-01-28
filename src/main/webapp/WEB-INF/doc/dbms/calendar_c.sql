/**********************************/
/* Table Name: 예약 항목 */
/**********************************/
DROP TABLE calendar;

CREATE TABLE calendar(
  calendarno  NUMBER(8)      NOT NULL PRIMARY KEY,
  somoimno   NUMBER(8)      NOT NULL, -- 소모임 번호
  labeldate     VARCHAR(10)   NOT NULL, -- 출력할 날짜 2013-10-20 
  label           VARCHAR(30)   NOT NULL, -- 달력에 출력될 레이블
  title             VARCHAR(500) NOT NULL, -- 제목(*)
  content       CLOB                NOT NULL, -- 글 내용
  cnt              NUMBER(8)       DEFAULT 0, -- 조회수
  regdate       DATE                NOT NULL,  -- 등록 날짜
  FOREIGN KEY (somoimno) REFERENCES somoim (somoimno) ON DELETE CASCADE
);

SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar;

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-13', '예약 가능', '예약 안내입니다.', '예약 내용입니다.', 0, sysdate);

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-14', '예약 가능', '예약 안내입니다.', '예약 내용입니다.', 0, sysdate);

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-15', '예약 불가', '예약 불가 안내입니다.', '이미 예약이 되었습니다.', 0, sysdate);
             
INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             2, '2020-01-16', '예약 불가', '예약 불가 안내입니다.', '이미 예약이 되었습니다.', 0, sysdate);

-- 전체 목록
SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
ORDER BY calendarno ASC;

 CALENDARNO LABELDATE  LABEL        TITLE            CONTENT          CNT REGDATE
 ---------- ---------- ------------ ---------------- ---------------- --- ---------------------
          1 2019-12-26 예약 가능        예약 안내입니다.        예약 내용입니다.          0 2019-12-26 15:13:05.0
          2 2019-12-26 예약 가능        예약 안내입니다.        예약 내용입니다.          0 2019-12-26 15:13:06.0
          3 2019-12-28 예약 불가        예약 불가 안내입니다.     이미 예약이 되었습니다.      0 2019-12-26 15:13:07.0
          4 2019-12-27 A동 101 예약 가능 A동 101 예약 가능합니다. A동 101 예약 가능합니다.   0 2019-12-26 15:13:12.0


-- 특정 날짜의 목록
SELECT calendarno, labeldate, label
FROM calendar
WHERE labeldate = '2019-12-26';

 CALENDARNO LABELDATE  LABEL
 ---------- ---------- -----
          1 2019-12-26 예약 가능
          2 2019-12-26 예약 가능
          
SELECT calendarno, labeldate, label
FROM calendar
WHERE substr(labeldate, 1, 7) = '2019-12'; -- 12월달

 CALENDARNO LABELDATE  LABEL
 ---------- ---------- -----
          1 2019-12-26 예약 가능
          2 2019-12-26 예약 가능
          3 2019-12-28 예약 불가

          
-- 조회
UPDATE calendar
SET cnt = cnt + 1
WHERE calendarno = 1;


SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE calendarno = 1;


-- 변경
UPDATE calendar
SET labeldate=sysdate+1, label='예약 가능', title='예약 가능합니다.', content='최대 10인까지 가능합니다.'
WHERE calendarno = 1;


-- 삭제
DELETE FROM calendar
WHERE calendarno = 1;

SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE somoimno=1
ORDER BY calendarno ASC;

SELECT * FROM calendar;

SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE somoimno=1
ORDER BY calendarno DESC

SELECT calendarno, labeldate, label
FROM calendar
WHERE labeldate='2020-01-28'
