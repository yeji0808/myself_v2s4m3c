/**********************************/
/* Table Name: �Խ��� */
/**********************************/
DROP table board
 SELECT boardno, name, count 
     FROM board
     ORDER BY boardno asc
CREATE TABLE board(
boardno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(300)  NOT NULL,
count                          NUMBER(10)  DEFAULT 0  NOT NULL
);

COMMENT ON TABLE board is '�Խ���';
COMMENT ON COLUMN board.boardno is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN board.name is '�Խ����̸�';
COMMENT ON COLUMN board.count is '�Խ��ǵ���ڷ��';

1) ���

select * from board
-- PK ����
SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board;                                
 BOARDNO
 -------
       1

INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             '�����Խ���', 0);
INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             '��õ�Խ���', 0);
INSERT INTO board(boardno, name, count)
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
             'ȸ�� ���� �Խ���', 0);

2) ���
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 �����Խ���     0
       2 ��õ�Խ���          0
       3 ȸ�� ���� �Խ���          0

2-2) �ϳ��� ��ȸ�� �� read
SELECT boardno, name, count
FROM board
where boardno=2;
       
       
3) ����
UPDATE board
SET name='FREE BOARD'
WHERE boardno = 1;
 
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 
 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 FREE BOARD     0
       2 ��õ�Խ���          0
       3 ��õ�Խ���          0

4) ����
-- ��� ���ڵ� ����
DELETE FROM board
where boardno = 3;
COMMIT;
 
SELECT boardno, name, count
FROM board
ORDER BY boardno asc;
 

 BOARDNO NAME       COUNT
 ------- ---------- -----
       1 FREE BOARD     0
       2 ��õ�Խ���          0
       

-----------------------------------------------------------------------------------------
1. ���� ī�װ�: reservation
-----------------------------------------------------------------------------------------
DROP TABLE reservation;

CREATE TABLE reservation(
    resno                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    resname                         VARCHAR2(50)     NOT NULL,
    phonenum                        NUMBER(10)     NOT NULL,
    store                             VARCHAR2(50)     NOT NULL,
    resdate                         DATE     NOT NULL,
    rescount                        NUMBER(10)     DEFAULT 1     NOT NULL
);

COMMENT ON TABLE reservation is '����';
COMMENT ON COLUMN reservation.resno is '�����ȣ';
COMMENT ON COLUMN reservation.resname is '������';
COMMENT ON COLUMN reservation.phonenum is '����ó';
COMMENT ON COLUMN reservation.store is '��ȣ��';
COMMENT ON COLUMN reservation.resdate is '������ ��';
COMMENT ON COLUMN reservation.rescount is '������ ��';
       

1) ���
-- PK ����
SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation;                                
 RESNO
 -----
     1

INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '������', 01066046216, '�÷��� �ع����� �Ӷ�', sysdate, 1);
INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '���̺�', 01065046216, '���Ȼ�ȸ ���� ������� ���Ϳ�', sysdate, 1);
INSERT INTO reservation(resno, resname, phonenum,store,resdate,rescount)
VALUES((SELECT NVL(MAX(resno), 0) + 1 as resno FROM reservation),
             '������', 01063046216, '���ڻ� ��â', sysdate, 1);
             
-- 2) ���
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 RESNO RESNAME PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------- ---------- ----------------- --------------------- --------
     3 ������     1066046216 �÷��� �ع����� �Ӷ�       2019-11-27 17:38:33.0        1
     4 ������     1066046216 �÷��� �ع����� �Ӷ�       2019-11-27 17:39:34.0        1
     5 ���̺�     1065046216 ���Ȼ�ȸ ���� ������� ���Ϳ� 2019-11-27 17:39:35.0        1
     6 ������     1063046216 ���ڻ� ��â            2019-11-27 17:39:36.0        1


3) ����
UPDATE reservation
SET resname='FLEX �ع����� ����~'
WHERE resno = 3;
 
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 
 RESNO RESNAME       PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------------- ---------- ----------------- --------------------- --------
     3 FLEX �ع����� ����~ 1066046216 �÷��� �ع����� �Ӷ�       2019-11-27 17:38:33.0        1
     4 ������           1066046216 �÷��� �ع����� �Ӷ�       2019-11-27 17:39:34.0        1
     5 ���̺�           1065046216 ���Ȼ�ȸ ���� ������� ���Ϳ� 2019-11-27 17:39:35.0        1
     6 ������           1063046216 ���ڻ� ��â            2019-11-27 17:39:36.0        1


4) ����
-- ��� ���ڵ� ����
DELETE FROM reservation
where resno = 4;
COMMIT;
 
SELECT resno, resname, phonenum,store,resdate,rescount
FROM reservation
ORDER BY resno asc;
 
 RESNO RESNAME       PHONENUM   STORE             RESDATE               RESCOUNT
 ----- ------------- ---------- ----------------- --------------------- --------
     3 FLEX �ع����� ����~ 1066046216 �÷��� �ع����� �Ӷ�       2019-11-27 17:38:33.0        1
     5 ���̺�           1065046216 ���Ȼ�ȸ ���� ������� ���Ϳ� 2019-11-27 17:39:35.0        1
     6 ������           1063046216 ���ڻ� ��â            2019-11-27 17:39:36.0        1
     
5) count�� ��ȸ

 
10) board �߰������� ��ϵ� �ۼ��� ����
UPDATE board 
SET count = count + 1 
WHERE boardno=3;
 
11) board ���������� ��ϵ� �ۼ��� ����
UPDATE board 
SET count = count - 1 
WHERE boardno=3;
 
12) categrp ���̺��� �����ϰ� �����Ұ�.
-- DROP TABLE contents;
-- DROP TABLE categrp;
-- categrp ����
-- insert ����
SELECT boardno, name, count
FROM board
ORDER BY boardno ASC;

 BOARDNO NAME  COUNT
 ------- ----- -----
       3 �����Խ���     0



13) �ڽ� ���ڵ尡 �ִ� ����� ����
DELETE FROM contents;
DELETE FROM categrp;
         
14) cnt �÷��� 0���� �ʱ�ȭ
UPDATE board
SET count=0
WHERE boardno=3;

