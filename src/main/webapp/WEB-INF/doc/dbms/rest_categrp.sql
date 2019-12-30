/**********************************/
/* Table Name: 음식점 분류별 카테고리 */
/**********************************/
-- 삭제
DROP TABLE rest_categrp;

-- 생성
CREATE TABLE rest_categrp(
    rcateno                     NUMBER(10)     NOT NULL    PRIMARY KEY,
    rcatename                      VARCHAR2(50)     NOT NULL,
    rcnt                               NUMBER(10)    DEFAULT 0     NOT NULL            
);

COMMENT ON TABLE rest_categrp is '음식점 분류 카테고리';
COMMENT ON COLUMN rest_categrp.rcateno is '분류 번호';
COMMENT ON COLUMN rest_categrp.rcatename is '분류명';
COMMENT ON COLUMN rest_categrp.rcnt is '등록된 음식점 수';

-- 등록
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '한식', 0);
            
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '중식', 0);

INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '양식', 0);
            
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '양식', 0);

-- 목록            
SELECT *
FROM rest_categrp
ORDER BY rcateno ASC;

 RCATENO RCATENAME RCNT
 ------- --------- ----
       1 한식           0
       2 중식           0
       3 양식           0


