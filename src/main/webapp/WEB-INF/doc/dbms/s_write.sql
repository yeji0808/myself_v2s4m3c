/**********************************/
/* Table Name: �۾��� */
/**********************************/
DROP TABLE s_write;

CREATE TABLE s_write(
		writeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		somoimno                          NUMBER(10)     NOT NULL ,
    memberno                        NUMBER(10)     NOT NULL ,
		title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (somoimno) REFERENCES somoim (somoimno) ON DELETE CASCADE,
  FOREIGN KEY (memberno) REFERENCES members (memberno) ON DELETE CASCADE
);

COMMENT ON TABLE s_write is '�۾���';
COMMENT ON COLUMN s_write.writeno is '�۾��� ��ȣ';
COMMENT ON COLUMN s_write.somoimno is '�Ҹ��� ��ȣ';
COMMENT ON COLUMN s_write.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN s_write.title is '�۾��� �̸�';
COMMENT ON COLUMN s_write.content is '�۾��� ����';
COMMENT ON COLUMN s_write.recom is '��õ��';
COMMENT ON COLUMN s_write.cnt is '��ȸ��';
COMMENT ON COLUMN s_write.replycnt is '��ۼ�';
COMMENT ON COLUMN s_write.rdate is '�����';
COMMENT ON COLUMN s_write.word is '�˻���';

-- ���
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '����1', '����1',
             0, 0, 0, sysdate, '');
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '����2', '����2',
             0, 0, 0, sysdate, '');
INSERT INTO s_write(writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(writeno), 0) + 1 as writeno FROM write),
             1, 1, '����3', '����3',
             0, 0, 0, sysdate, '');             
             
-- ���
SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
ORDER BY writeno DESC;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ----
       3        1        1 ����3   ����3         0   0        0 2019-12-12 18:33:07.0 NULL
       2        1        1 ����2   ����2         0   0        0 2019-12-12 18:33:06.0 NULL
       1        1        1 ����1   ����1         0   0        0 2019-12-12 18:33:05.0 NULL
       
-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM s_write;

 COUNT
 -----
     3
  
-- ��ȸ
SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
WHERE writeno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ----
       1        1        1 ����1   ����1         0   0        0 2019-12-12 18:33:05.0 NULL

-- ����
UPDATE s_write
SET title='���� ����', content='���� ����', word='�˻��� ����'
WHERE writeno = 1;

SELECT writeno, somoimno, memberno, title, content, recom, cnt, replycnt, rdate, word
FROM s_write
WHERE writeno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ------
       1        1        1 ���� ���� ���� ����       0   0        0 2019-12-12 18:33:05.0 �˻��� ����

-- 7) ����
DELETE FROM s_write
WHERE writeno = 6;

-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT writeno, somoimno, memberno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM s_write
WHERE somoimno=1;

WRITENO SOMOIMNO MEMBERNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------- -------- -------- ----- ------- ----- --- -------- --------------------- ------
       1        1        1 ���� ���� ���� ����       0   0        0 2019-12-12 18:33:05.0 �˻��� ����
       2        1        1 ����2   ����2         0   0        0 2019-12-12 18:33:06.0 NULL
       3        1        1 ����3   ����3         0   0        0 2019-12-12 18:33:07.0 NULL

SELECT COUNT(*) as cnt
FROM s_write
WHERE somoimno = 1;

 CNT
 ---
   3
   
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM s_write
WHERE somoimno = 1;





     