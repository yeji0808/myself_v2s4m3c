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
/* Table Name: ���� */
/**********************************/
drop table choice cascade constraints
CREATE TABLE choice(
		cho_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cho_title                     		VARCHAR2(100)		 NOT NULL,
		cho_content                   		VARCHAR2(100)		 NOT NULL,
		cho_rec_cnt                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cho_word                      		VARCHAR2(100)		 NULL ,
		boardno                       		NUMBER(10)		 NULL ,
		memberno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE choice is '����';
COMMENT ON COLUMN choice.cho_no is '���� ��ȣ';
COMMENT ON COLUMN choice.cho_title is '���� ����';
COMMENT ON COLUMN choice.cho_content is '���� ����';
COMMENT ON COLUMN choice.cho_rec_cnt is '���� ��õ ��';
COMMENT ON COLUMN choice.rdate is '�����';
COMMENT ON COLUMN choice.cho_word is '�˻���';
COMMENT ON COLUMN choice.boardno is '�Խ��ǹ�ȣ';

-- 1)���
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, cho_rec_cnt, 
                         rdate, cho_word, boardno, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '��õ�� ����', '���� ����', 0,
             sysdate, '����',2,1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, cho_rec_cnt, 
                         rdate, cho_word, boardno, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '��õ�� ����', '���� ����', 0,
             sysdate, '����',2,1 );
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, cho_rec_cnt, 
                         rdate, cho_word, boardno, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '��õ�� ����', '���� ����', 0,
             sysdate, '����4',2,1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, cho_rec_cnt, 
                         rdate, cho_word, boardno, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '��õ�� ����', '���� ����', 0,
             sysdate, '����3',2,1);
INSERT INTO choice(cho_no, 
                         cho_title, cho_content, cho_rec_cnt, 
                         rdate, cho_word, boardno, memberno)
VALUES((SELECT NVL(MAX(cho_no), 0) + 1 as cho_no FROM choice),
             '��õ�� ����', '���� ����', 0,
             sysdate, '����2',2,1);



-- 2) ���
SELECT cho_no, 
          cho_title, cho_content, cho_rec_cnt, 
          rdate, cho_word, boardno, memberno
FROM choice
ORDER BY cho_no asc;

 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      1 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:57.0 ����             2        1
      2 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:58.0 ����             2        1
      3 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:59.0 ����4            2        1
      4 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:39.0 ����             2        1
      5 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:40.0 ����             2        1
      6 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:41.0 ����4            2        1
      7 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:42.0 ����3            2        1
      8 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:43.0 ����2            2        1



-- 2-2) Boardno �� ��� ����
SELECT cho_no, 
          cho_title, cho_content, cho_rec_cnt, 
          rdate, cho_word, boardno, memberno
FROM choice
where boardno =2
order by cho_no desc
   
 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      8 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:43.0 ����2            2        1
      7 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:42.0 ����3            2        1
      6 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:41.0 ����4            2        1
      5 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:40.0 ����             2        1
      4 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:39.0 ����             2        1
      3 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:59.0 ����4            2        1
      2 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:58.0 ����             2        1
      1 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:57.0 ����             2        1


      
-- 3) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM choice;

 COUNT
 -----
   8

-- 4) ����
UPDATE choice
SET cho_title='��õ�� ����9', cho_content='������ �̰� ����̾�'
WHERE cho_no = 2;
 
SELECT * from choice;
 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      1 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:57.0 ����             2        1
      2 ��õ�� ����9   ������ �̰� ����̾�           0 2019-12-26 14:46:58.0 ����             2        1
      3 ��õ�� ����    ���� ����                 0 2019-12-26 14:46:59.0 ����4            2        1
      4 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:39.0 ����             2        1
      5 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:40.0 ����             2        1
      6 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:41.0 ����4            2        1
      7 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:42.0 ����3            2        1
      8 ��õ�� ����    ���� ����                 0 2019-12-26 14:47:43.0 ����2            2        1





-- 5) �ϳ��� ��ȸ�� �� read
SELECT cho_no, 
          cho_title, cho_content, cho_rec_cnt, 
          rdate, cho_word, boardno, memberno
FROM choice
where cho_no = 2;

 CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO MEMBERNO
 ------ --------- ----------- ----------- --------------------- -------- ------- --------
      2 ��õ�� ����9   ������ �̰� ����̾�           0 2019-12-26 14:46:58.0 ����             2        1


-- 7) ����
delete from choice
where cho_no =3;

    CHO_NO CHO_TITLE CHO_CONTENT CHO_REC_CNT RDATE                 CHO_WORD BOARDNO
 ------ --------- ----------- ----------- --------------------- -------- -------
      2 ��õ�� ����9   ������ �̰� ����̾�           0 2019-12-18 18:51:30.0 ����             5
      4 ��õ�� ����    ���� ����                 0 2019-12-18 18:53:08.0 ����3            5
      5 ��õ�� ����    ���� ����                 0 2019-12-18 18:53:09.0 ����2            5
      
-- 8) boardno�� ���ڵ� ���� ����
SELECT COUNT(*) as cnt
FROM choice
where boardno = 2;

 CNT
 ---
   7
     
-- 9) boardno�� ���ڵ� ����
delete FROM choice
where boardno = 2;  
   

   (7 rows affected)


