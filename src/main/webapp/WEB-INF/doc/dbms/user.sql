DROP TABLE member IF EXISTS;
DROP TABLE users IF EXISTS;

/**********************************/
/* Table Name: 유저카테고리 */
/**********************************/
DROP TABLE users;

CREATE TABLE users(
		userno NUMERIC(10) NOT NULL PRIMARY KEY,
		user_name VARCHAR(50) NOT NULL,
		user_cnt NUMERIC(30) NOT NULL,
		seqno NUMERIC(10) DEFAULT 0 NOT NULL,
		visible CHAR(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON TABLE users is '회원카테고리';
COMMENT ON COLUMN users.userno is '유저번호';
COMMENT ON COLUMN users.user_name is '유저이름';
COMMENT ON COLUMN users.user_cnt is '유저수';
COMMENT ON COLUMN users.seqno is '출력순서';
COMMENT ON COLUMN users.visible is '출력모드';


-- 등록
INSERT INTO users(userno, user_name, user_cnt, seqno, visible)
VALUES((SELECT NVL(MAX(userno), 0) + 1 as userno FROM users), '일반', 40, 1, 'Y');
INSERT INTO users(userno, user_name, user_cnt, seqno, visible)
VALUES((SELECT NVL(MAX(userno), 0) + 1 as userno FROM users), '점주', 7, 1, 'Y');


-- 목록
SELECT userno, user_name, user_cnt, seqno, visible
FROM users
ORDER BY userno DESC;

USERNO USER_NAME USER_CNT SEQNO VISIBLE
 ------ --------- -------- ----- -------
      2 점주               7     1 Y
      1 일반              40     1 Y


-- 조회
SELECT userno, user_name, user_cnt, seqno, visible
FROM users
WHERE userno = 1;

USERNO USER_NAME USER_CNT SEQNO VISIBLE
 ------ --------- -------- ----- -------
      1 일반              40     1 Y

-- 수정
UPDATE users
SET user_cnt = '10'
WHERE name = '점주';


-- 삭제
DELETE FROM users
WHERE userno = 2;




