DROP TABLE atcfile;
CREATE TABLE atcfile(
        atcfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        writeno                   NUMBER(10)         NULL ,
        fname                     VARCHAR2(100)         NOT NULL,
        fupname                  VARCHAR2(100)         NOT NULL,
        thumb                    VARCHAR2(100)         NULL ,
        fsize                       NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                         DATE              NOT NULL,
  FOREIGN KEY (writeno) REFERENCES s_write (writeno) ON DELETE CASCADE
);

COMMENT ON TABLE atcfile is '÷������';
COMMENT ON COLUMN atcfile.atcfileno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN atcfile.writeno is '�۹�ȣ';
COMMENT ON COLUMN atcfile.fname is '���� ���ϸ�';
COMMENT ON COLUMN atcfile.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN atcfile.thumb is 'Thumb ����';
COMMENT ON COLUMN atcfile.fsize is '���� ������';
COMMENT ON COLUMN atcfile.rdate is '�����';

-- 1) ���
SELECT NVL(MAX(atcfileno), 0) + 1 as atcfileno FROM atcfile;

 atcfileNO
 ------------
            1

SELECT writeno, memberno, categrpno, title
FROM s_write
ORDER BY writeno ASC;
 
writeNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----
          1        1         1 ��� ����

          
INSERT INTO atcfile(atcfileno, writeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(atcfileno), 0) + 1 as atcfileno FROM atcfile),
             1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO atcfile(atcfileno, writeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(atcfileno), 0) + 1 as atcfileno FROM atcfile),
             1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO atcfile(atcfileno, writeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(atcfileno), 0) + 1 as atcfileno FROM atcfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
-- 2) ���( writeno ���� ���� ����, atcfileno ���� ��������)
SELECT atcfileno, writeno, fname, fupname, thumb, fsize, rdate
FROM atcfile
ORDER BY writeno DESC,  atcfileno ASC;

 atcfileNO writeNO FNAME        FUPNAME        THUMB          FSIZE RDATE
 ------------ ---------- ------------ -------------- -------------- ----- ---------------------
            1          1 samyang.jpg  samyang_1.jpg  samyang_t.jpg   1000 2019-12-04 14:50:51.0
            2          1 samyang2.jpg samyang2_1.jpg samyang2_t.jpg  2000 2019-12-04 14:50:52.0
            3          1 samyang3.jpg samyang3_1.jpg samyang3_t.jpg  3000 2019-12-04 14:50:53.0

-- 3) �ۺ� ���� ���(writeno ���� ���� ����, atcfileno ���� ��������)
SELECT atcfileno, writeno, fname, fupname, thumb, fsize, rdate
FROM atcfile
WHERE writeno = 5
ORDER BY fname ASC;

 atcfileNO writeNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
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
DELETE FROM atcfile
WHERE atcfileno = 1;

-- 5) FK writeno �θ� ���̺� ���ڵ� ���� ����
SELECT atcfileno, writeno, fname, fupname, thumb, fsize, rdate
FROM atcfile
WHERE writeno=1;

atcfileNO writeNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

SELECT COUNT(*) as cnt
FROM atcfile
WHERE writeno=1;

 CNT
 ---
   3             
             
-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM atcfile
WHERE writeno=1;

(3 rows affected)
------------------------------------------------------------------------------------------------------------------------------
-- 7) writem atcfile join

SELECT c.title, a.atcfileno, a.writeno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
FROM atcfile a
INNER JOIN write c
ON a.writeno = c.writeno
ORDER BY c.writeno DESC,  a.atcfileno ASC;

TITLE atcfileNO writeNO FNAME           FUPNAME         THUMB             FSIZE  RDATE
 ----- ------------ ---------- --------------- --------------- ----------------- ------ ---------------------
 �ܿ￩��             5          2 snow07.jpg      snow07.jpg      snow07_t.jpg      183646 2019-12-17 13:17:11.0
 �ܿ￩��             6          2 snow08.jpg      snow08.jpg      snow08_t.jpg       63467 2019-12-17 13:17:11.0
 �ܿ￩��             7          2 snow10.jpg      snow10.jpg      snow10_t.jpg      500026 2019-12-17 13:17:11.0
 ũ��������          1          1 christmas04.jpg christmas04.jpg christmas04_t.jpg  56303 2019-12-17 12:48:42.0
 ũ��������          2          1 christmas05.jpg christmas05.jpg christmas05_t.jpg 211480 2019-12-17 12:48:42.0
 ũ��������          4          1 christmas15.jpg christmas15.jpg christmas15_t.jpg  77757 2019-12-17 12:48:42.0
 
SELECT c.somoimno, a.atcfileno, a.writeno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
FROM atcfile a
INNER JOIN s_write c
ON a.writeno = c.writeno AND somoimno=1
ORDER BY c.writeno DESC,  a.atcfileno ASC;








 