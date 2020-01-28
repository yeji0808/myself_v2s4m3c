/**********************************/
/* Table Name: �Խ��� */
/**********************************/
CREATE TABLE board(
		boardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(300)		 NOT NULL,
		count                         		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE board is '�Խ���';
COMMENT ON COLUMN board.boardno is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN board.name is '�Խ����̸�';
COMMENT ON COLUMN board.count is '�Խ��ǵ���ڷ��';



/**********************************/
/* Table Name: �� */
/**********************************/
CREATE TABLE b_write(
		wno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		wtitle                        		VARCHAR2(100)		 NOT NULL,
		wcontent                      		CLOB(10)		 NOT NULL,
		wrecom                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		wreplycnt                     		INTEGER(10)		 DEFAULT 0		 NULL ,
		rdate                         		DATE		 NOT NULL,
		wword                         		VARCHAR2(100)		 NULL ,
		boardno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (boardno) REFERENCES board (boardno)
);

COMMENT ON TABLE b_write is '��';
COMMENT ON COLUMN b_write.wno is '�� ��ȣ';
COMMENT ON COLUMN b_write.wtitle is '�� ���� ';
COMMENT ON COLUMN b_write.wcontent is '�� ����';
COMMENT ON COLUMN b_write.wrecom is '��õ ��';
COMMENT ON COLUMN b_write.wreplycnt is '���� ��';
COMMENT ON COLUMN b_write.rdate is '��� ����';
COMMENT ON COLUMN b_write.wword is '�˻���';
COMMENT ON COLUMN b_write.boardno is '�Խ��ǹ�ȣ';


drop table w_attach
/**********************************/
/* Table Name: �� ��� */
/**********************************/
CREATE TABLE wreply(
		wreplyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rcontent                      		VARCHAR2(1000)		 NOT NULL,
		rrdate                         		DATE		 NOT NULL,
		rpasswd                       		NUMBER(10)		 NOT NULL,
		wno                           		NUMBER(10)		 NOT NULL ,
		memberno                       NUMBER(10)   NOT NULL,
  FOREIGN KEY (wno) REFERENCES b_write (wno) on delete cascade,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);
drop table wreply
COMMENT ON TABLE wreply is '�� ���';
COMMENT ON COLUMN wreply.wreplyno is '��۹�ȣ';
COMMENT ON COLUMN wreply.rcontent is '��۳���';
COMMENT ON COLUMN wreply.rrdate is '�����';
COMMENT ON COLUMN wreply.rpasswd is '��й�ȣ';
COMMENT ON COLUMN wreply.wno is '�� ��ȣ';

1) ���
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '��', '1234', sysdate, 1);
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '����', '1234', sysdate, 1);
INSERT INTO wreply(wreplyno, wno, rcontent, rpasswd, rrdate, memberno)
VALUES((SELECT NVL(MAX(wreplyno), 0) + 1 as wreplyno FROM wreply),
             1, '����', '1234', sysdate, 1);             

2) ��ü ���
SELECT wreplyno, wno, rcontent, rpasswd, rrdate, memberno
FROM wreply
ORDER BY wreplyno DESC;
 WREPLYNO WNO RCONTENT RPASSWD RRDATE                MEMBERNO
 -------- --- -------- ------- --------------------- --------
        3   1 ����          1234 2019-12-26 10:13:41.0        1
        2   1 ����          1234 2019-12-26 10:13:40.0        1
        1   1 ��           1234 2019-12-26 10:13:39.0        1


3) wno �� ���
SELECT wreplyno, wno, rcontent, rpasswd, rrdate, memberno
FROM wreply
WHERE wno=1
ORDER BY wreplyno DESC;

 WREPLYNO WNO RCONTENT RPASSWD RRDATE
 -------- --- -------- ------- ---------------------
        4   1 ���3         1234 2019-12-24 13:14:16.0
        3   1 ���2         1234 2019-12-24 13:14:06.0
        2   1 ���2         1234 2019-12-24 13:13:59.0
        1   1 ���1         1234 2019-12-24 13:13:56.0



4) ����
-- �н����� �˻�
SELECT count(rpasswd) as cnt
FROM wreply
WHERE wreplyno=1 AND rpasswd='1234';

 CNT
 ---
   1
   
-- ����
DELETE FROM wreply
WHERE wreplyno=1;

5) wno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM wreply
WHERE wno=1;

 CNT
 ---
   2

DELETE FROM wreply
WHERE wno=1;
(3 rows affected)

6) memberno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM wreply
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM wreply
WHERE memberno=1;

7) ȸ�� ID�� ���
SELECT m.id,
           r.wreplyno, r.wno, r.memberno, r.rcontent, r.rpasswd, r.rrdate
FROM members m,  wreply r
WHERE (m.memberno = r.memberno) AND r.wno=1
ORDER BY r.wreplyno DESC;

 ID    wreplyNO wno MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 ��� 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 ��� 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 ��� 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM wreply
WHERE wreplyno=1 AND rpasswd='1234';

 CNT
 ---
   0

9) ����
DELETE FROM wreply
WHERE wreplyno=1;



