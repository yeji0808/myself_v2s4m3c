DROP TABLE s_reply;
CREATE TABLE s_reply(
        replyno                               NUMBER(10)         NOT NULL         PRIMARY KEY,
        writeno                            NUMBER(10)         NOT NULL ,
        memberno                              NUMBER(6)         NOT NULL ,
        content                               VARCHAR2(1000)         NOT NULL,
        passwd                                VARCHAR2(20)         NOT NULL,
        rdate                                   DATE                    NOT NULL,
  FOREIGN KEY (writeno) REFERENCES s_write (writeno),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE s_reply is '댓글';
COMMENT ON COLUMN s_reply.replyno is '댓글번호';
COMMENT ON COLUMN s_reply.writeno is '글번호';
COMMENT ON COLUMN s_reply.memberno is '회원 번호';
COMMENT ON COLUMN s_reply.content is '내용';
COMMENT ON COLUMN s_reply.passwd is '비밀번호';
COMMENT ON COLUMN s_reply.rdate is '등록일';

1) 등록
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '댓글1', '1234', sysdate);
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '댓글2', '1234', sysdate);
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '댓글3', '1234', sysdate);           

2) 목록
SELECT replyno, writeno, memberno, content, passwd, rdate
FROM s_reply
WHERE writeno = 1
ORDER BY replyno DESC;

 REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ------- ------- -------- ------- ------ ---------------------
       3       1        1 댓글3     1234   2020-01-07 17:55:51.0
       2       1        1 댓글2     1234   2020-01-07 17:55:50.0
       1       1        1 댓글1     1234   2020-01-07 17:55:49.0

3) 삭제
-- 패스워드 검사
SELECT count(passwd) as cnt
FROM s_reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ----
   1

-- 삭제
DELETE FROM s_reply
WHERE replyno = 1;

SELECT replyno, writeno, memberno, content, passwd, rdate
FROM s_reply
WHERE writeno = 1
ORDER BY replyno DESC;

 REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ------- ------- -------- ------- ------ ---------------------
       3       1        1 댓글3     1234   2020-01-07 17:55:51.0
       2       1        1 댓글2     1234   2020-01-07 17:55:50.0

5) writeno에 해당하는 댓글수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM s_reply
WHERE writeno = 1;

 CNT
 ----
   2
   
DELETE FROM s_reply
WHERE writeno = 1;

6) memberno에 해당하는 댓글수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM s_reply
WHERE memberno = 1;

 CNT
 ----
   2

DELETE s_reply
WHERE memberno = 1;

7) 회원 ID의 출력
SELECT m.id, 
          r.replyno, r.writeno, r.memberno, r.content, r.passwd, r.rdate
FROM members m, s_reply r
WHERE (m.memberno = r.memberno) AND r.writeno = 1
ORDER BY r.replyno DESC;
   
 ID    REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ----- ------- ------- -------- ------- ------ ---------------------
 user1       3       1        1 댓글3     1234   2020-01-07 17:57:51.0
 user1       2       1        1 댓글2     1234   2020-01-07 17:57:50.0
 user1       1       1        1 댓글1     1234   2020-01-07 17:57:49.0                 

8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM s_reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ----
   0

9) 삭제
DELETE FROM s_reply
WHERE replyno=1;

10) 수정
UPDATE s_reply
SET content='댓글수정'
WHERE replyno=2;