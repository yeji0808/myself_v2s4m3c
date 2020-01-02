/**********************************/
/* Table Name: �Ҹ��� �׷� */
/**********************************/

DROP TABLE somoim;

CREATE TABLE somoim(
		somoimno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(100)		 NOT NULL,
		somoimtype                    		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		membercnt                     		NUMBER(7)		 NOT NULL,
		fname                     VARCHAR2(100)         NOT NULL,
    fupname                  VARCHAR2(100)         NOT NULL,
    thumb                    VARCHAR2(100)         NULL,
    fsize                       NUMBER(10)         DEFAULT 0         NOT NULL
);

COMMENT ON TABLE somoim is '�Ҹ��� �׷�';
COMMENT ON COLUMN somoim.somoimno is '�Ҹ��� ��ȣ';
COMMENT ON COLUMN somoim.name is '�Ҹ��� �̸�';
COMMENT ON COLUMN somoim.somoimtype is '�Ҹ��� �з�';
COMMENT ON COLUMN somoim.seqno is '�Ҹ��� ��¼���';
COMMENT ON COLUMN somoim.visible is '�Ҹ��� ��� ���';
COMMENT ON COLUMN somoim.rdate is '�Ҹ��� ������';
COMMENT ON COLUMN somoim.membercnt is '�Ҹ��� ȸ����';
COMMENT ON COLUMN somoim.fname is '���� ���ϸ�';
COMMENT ON COLUMN somoim.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN somoim.thumb is 'Thumb ����';
COMMENT ON COLUMN somoim.fsize is '���� ������';

-- ���
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), '���θ԰Ÿ�', '����Ž��', 1, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), '�籸Ŭ��', '������Ȱ��', 2, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);
INSERT INTO somoim(somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize)
VALUES ((SELECT NVL(MAX(somoimno), 0) + 1 as somoimno FROM somoim), 'LGƮ����', '����������', 3, 'Y', sysdate, 0, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

-- ���
SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt, fname, fupname, thumb, fsize
FROM somoim
ORDER BY somoimno ASC;


SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 ���θ԰Ÿ� ����Ž��           1 Y       2019-12-02 17:39:30.0         0
        2 �籸Ŭ��  ������Ȱ��          2 Y       2019-12-02 17:39:31.0         0
        3 LGƮ���� ����������          3 Y       2019-12-02 17:39:33.0         0
         
-- ����
UPDATE somoim
SET name='�߱�����', seqno = 1, visible='N'
WHERE somoimno = 3;

SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt
FROM somoim
ORDER BY somoimno ASC;

SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 ���θ԰Ÿ� ����Ž��           1 Y       2019-12-02 17:39:30.0         0
        2 �籸Ŭ��  ������Ȱ��          2 Y       2019-12-02 17:39:31.0         0
        3 �߱�����  ����������          1 N       2019-12-02 17:39:33.0         0
        
-- ����
DELETE FROM somoim
WHERE somoimno = 6;

SELECT somoimno, name, somoimtype, seqno, visible, rdate, membercnt
FROM somoim
ORDER BY somoimno ASC;

 SOMOIMNO NAME  SOMOIMTYPE SEQNO VISIBLE RDATE                 MEMBERCNT
 -------- ----- ---------- ----- ------- --------------------- ---------
        1 ���θ԰Ÿ� ����Ž��           1 Y       2019-12-02 17:39:30.0         0
        2 �籸Ŭ��  ������Ȱ��          2 Y       2019-12-02 17:39:31.0         0

-- ���� ����
DELETE somoim
WHERE somoimno = 6
ON DELETE CASECADE;

         
         
         
         



