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

COMMENT ON TABLE s_reply is '���';
COMMENT ON COLUMN s_reply.replyno is '��۹�ȣ';
COMMENT ON COLUMN s_reply.writeno is '�۹�ȣ';
COMMENT ON COLUMN s_reply.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN s_reply.content is '����';
COMMENT ON COLUMN s_reply.passwd is '��й�ȣ';
COMMENT ON COLUMN s_reply.rdate is '�����';

1) ���
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '���1', '1234', sysdate);
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '���2', '1234', sysdate);
INSERT INTO s_reply(replyno, writeno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM s_reply),
           1, 1, '���3', '1234', sysdate);           

2) ���
SELECT replyno, writeno, memberno, content, passwd, rdate
FROM s_reply
WHERE writeno = 1
ORDER BY replyno DESC;

 REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ------- ------- -------- ------- ------ ---------------------
       3       1        1 ���3     1234   2020-01-07 17:55:51.0
       2       1        1 ���2     1234   2020-01-07 17:55:50.0
       1       1        1 ���1     1234   2020-01-07 17:55:49.0

3) ����
-- �н����� �˻�
SELECT count(passwd) as cnt
FROM s_reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ----
   1

-- ����
DELETE FROM s_reply
WHERE replyno = 1;

SELECT replyno, writeno, memberno, content, passwd, rdate
FROM s_reply
WHERE writeno = 1
ORDER BY replyno DESC;

 REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ------- ------- -------- ------- ------ ---------------------
       3       1        1 ���3     1234   2020-01-07 17:55:51.0
       2       1        1 ���2     1234   2020-01-07 17:55:50.0

5) writeno�� �ش��ϴ� ��ۼ� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM s_reply
WHERE writeno = 1;

 CNT
 ----
   2
   
DELETE FROM s_reply
WHERE writeno = 1;

6) memberno�� �ش��ϴ� ��ۼ� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM s_reply
WHERE memberno = 1;

 CNT
 ----
   2

DELETE s_reply
WHERE memberno = 1;

7) ȸ�� ID�� ���
SELECT m.id, 
          r.replyno, r.writeno, r.memberno, r.content, r.passwd, r.rdate
FROM members m, s_reply r
WHERE (m.memberno = r.memberno) AND r.writeno = 1
ORDER BY r.replyno DESC;
   
 ID    REPLYNO WRITENO MEMBERNO CONTENT PASSWD RDATE
 ----- ------- ------- -------- ------- ------ ---------------------
 user1       3       1        1 ���3     1234   2020-01-07 17:57:51.0
 user1       2       1        1 ���2     1234   2020-01-07 17:57:50.0
 user1       1       1        1 ���1     1234   2020-01-07 17:57:49.0                 

8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM s_reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ----
   0

9) ����
DELETE FROM s_reply
WHERE replyno=1;

10) ����
UPDATE s_reply
SET content='��ۼ���'
WHERE replyno=2;