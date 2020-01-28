DROP TABLE menu CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE restrnts; CASCADE CONSTRAINTS;
DROP TABLE rest_categrp CASCADE CONSTRAINTS;


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE restrnts(
		restno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rcateno                       		NUMBER(10)		 NULL ,
		memberno                     NUMBER(10)		 NOT NULL,
		rname                          	VARCHAR2(50)		 NOT NULL,
		rmain                            VARCHAR2(50)     NOT NULL,
    rintro                             VARCHAR2(200)    NULL,
    rtime                             VARCHAR2(100)     NOT NULL,
    rcall                             VARCHAR2(50)     NOT NULL,
		rzipcode                       	VARCHAR2(10)		 NOT NULL,
		raddress1                        VARCHAR2(100)    NOT NULL,
		raddress2                        VARCHAR2(100)    NOT NULL,
		rword                             VARCHAR2(50)    NULL,
		rrecom                           NUMBER(10)       DEFAULT 0    NOT NULL,
    rcnt                               NUMBER(10)       DEFAULT 0    NOT NULL,
    reviewcnt                       NUMBER(10)        DEFAULT 0     NOT NULL,
    fname                            VARCHAR2(100)         NOT NULL,
    fupname                        VARCHAR2(100)         NOT NULL,
    thumb                           VARCHAR2(100)         NULL ,
    fsize                              NUMBER(10)         DEFAULT 0         NOT NULL,		
  FOREIGN KEY (rcateno) REFERENCES rest_categrp (rcateno)
);

COMMENT ON TABLE restrnts is '������';
COMMENT ON COLUMN restrnts.restno is '������ ��ȣ';
COMMENT ON COLUMN restrnts.rcateno is '�з� ��ȣ';
COMMENT ON COLUMN restrnts.memberno is '���� ��ȣ';
COMMENT ON COLUMN restrnts.rname is '������ �̸�';
COMMENT ON COLUMN restrnts.rmain is '���ο丮';
COMMENT ON COLUMN restrnts.rintro is '���ټҰ�';
COMMENT ON COLUMN restrnts.rtime is '�����ð�';
COMMENT ON COLUMN restrnts.rcall is '��ȭ��ȣ';
COMMENT ON COLUMN restrnts.rzipcode is '������ �����ȣ';
COMMENT ON COLUMN restrnts.raddress1 is '������ �ּ�1';
COMMENT ON COLUMN restrnts.raddress2 is '������ �ּ�2';
COMMENT ON COLUMN restrnts.rword is '�˻���';
COMMENT ON COLUMN restrnts.rrecom is '��õ��';
COMMENT ON COLUMN restrnts.rcnt is '��ȸ��';
COMMENT ON COLUMN restrnts.reviewcnt is '�����';
COMMENT ON COLUMN restrnts.fname is '���� ���ϸ�';
COMMENT ON COLUMN restrnts.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN restrnts.thumb is 'Thumb ����';
COMMENT ON COLUMN restrnts.fsize is '���� ������';


-- 1) restrnts ���(memberno: 1),
INSERT INTO restrnts(restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
                                  rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
                                  fname, fupname, thumb, fsize)
VALUES((SELECT NVL(MAX(restno), 0) + 1 as restno FROM restrnts),
             1, 1, '����', '������⹫�Ѹ���', '������', '���� 11:00 - 11:00', '02-123-4567', 
             '1234', '���� ���α� û��õ�� 67 ��ö��', '155 1��', '����', 0, 0, 0,
             'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

-- 2) ��ü ���(����)
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
ORDER BY rname ASC;

-- 3) rcatno�� ���
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
WHERE rcateno=4 -- 1)�ѽ� 2)���
ORDER BY rname DESC;

-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM restrnts;
             
-- 5) ��ȸ
SELECT restno, rcateno, memberno, rname, rmain, rintro, rtime, rcall, 
           rzipcode, raddress1, raddress2, rword, rrecom, rcnt, reviewcnt,
           fname, fupname, thumb, fsize
FROM restrnts
WHERE restno=1;

-- 6) ����
UPDATE contents
SET title='���� ����', content='���� ����', word='�˻���'
WHERE contentsno = 1;

-- 7) ����
DELETE FROM restrnts
WHERE rcateno=1;
-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT contentsno, memberno, categrpno, title
FROM contents
WHERE categrpno=6;

SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=6;

 CNT
 ---
   3             
             
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contents
WHERE categrpno=6;

SELECT restno 
    FROM(
            SELECT restno
            FROM restrnts
            ORDER BY restno DESC)
    WHERE ROWNUM = 1
