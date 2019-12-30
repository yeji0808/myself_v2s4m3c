
ALTER TABLE rattachfile
ADD CONSTRAINT rattachfile_restno_fk
FOREIGN KEY (restno) REFERENCES restrnts(restno)
ON DELETE CASCADE;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'restrnts';

ALTER TABLE rattachfile DROP CONSTRAINT rattachfile_restno_fk;


/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE rattachfile;
CREATE TABLE rattachfile(
		attachfileno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		restno                          NUMBER(10)		 NULL ,
		fname                         	VARCHAR2(100)		 NOT NULL,
		fupname                      VARCHAR2(100)		 NOT NULL,
		thumb                         VARCHAR2(100)		 NULL ,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
CONSTRAINT rattachfile_restno_fk
FOREIGN KEY (restno) REFERENCES restrnts(restno)
ON DELETE CASCADE
);

COMMENT ON TABLE rattachfile is '÷������';
COMMENT ON COLUMN rattachfile.attachfileno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN rattachfile.restno is '������ ��ȣ';
COMMENT ON COLUMN rattachfile.fname is '���� ���ϸ�';
COMMENT ON COLUMN rattachfile.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN rattachfile.thumb is 'Thumb ����';
COMMENT ON COLUMN rattachfile.fsize is '���� ������';

-- 1) ���
SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM rattachfile;

 ATTACHFILENO
 ------------
            1

INSERT INTO rattachfile(attachfileno, restno, fname, fupname, thumb, fsize)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM rattachfile),
             4, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

INSERT INTO rattachfile(attachfileno, restno, fname, fupname, thumb, fsize)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             4, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 1000);
             
INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
-- 2) ���( contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachfileno, restno, fname, fupname, thumb, fsize
FROM rattachfile
ORDER BY restno DESC,  attachfileno ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB          FSIZE RDATE
 ------------ ---------- ------------ -------------- -------------- ----- ---------------------
            1          1 samyang.jpg  samyang_1.jpg  samyang_t.jpg   1000 2019-12-04 14:50:51.0
            2          1 samyang2.jpg samyang2_1.jpg samyang2_t.jpg  2000 2019-12-04 14:50:52.0
            3          1 samyang3.jpg samyang3_1.jpg samyang3_t.jpg  3000 2019-12-04 14:50:53.0

-- 3) �ۺ� ���� ���(contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE contentsno = 1
ORDER BY fname ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) �ϳ��� ���� ����
DELETE FROM attachfile
WHERE attachfileno = 1;


-- 5) FK contentsno �θ� ���̺� ���ڵ� ���� ����
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE contentsno=1;

ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

SELECT COUNT(*) as cnt
FROM attachfile
WHERE contentsno=1;

 CNT
 ---
   3             
             
-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM attachfile
WHERE contentsno=1;

(3 rows affected)

   
7) Contents, Attachfile join
    SELECT c.title, 
               a.attachfileno, a.contentsno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
    FROM contents c, attachfile a
    WHERE c.contentsno = a.contentsno
    ORDER BY c.contentsno DESC,  a.attachfileno ASC;
   
 TITLE     ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB            FSIZE  RDATE
 --------- ------------ ---------- ------------ -------------- ---------------- ------ ---------------------
 ũ��������            4          2 winter14.jpg winter14.jpg   winter14_t.jpg   160966 2019-12-17 12:43:24.0
 ũ��������            5          2 winter15.jpg winter15.jpg   winter15_t.jpg   180887 2019-12-17 12:43:24.0
 ũ��������            6          2 winter16.jpg winter16.jpg   winter16_t.jpg    53359 2019-12-17 12:43:24.0
 �ܿ� ����              1          1 winter01.jpg winter01_0.jpg winter01_0_t.jpg 171853 2019-12-17 12:42:46.0
 �ܿ� ����              2          1 winter02.jpg winter02_0.jpg winter02_0_t.jpg 176114 2019-12-17 12:42:47.0
 �ܿ� ����              3          1 winter03.jpg winter03_0.jpg winter03_0_t.jpg 192743 2019-12-17 12:42:47.0













