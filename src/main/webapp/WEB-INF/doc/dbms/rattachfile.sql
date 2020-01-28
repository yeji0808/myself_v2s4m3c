
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
             1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

INSERT INTO rattachfile(attachfileno, restno, fname, fupname, thumb, fsize)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'image.jpg', 'image_1.jpg', 'image_t.jpg', 1000);
             
INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        


-- 4) �ϳ��� ���� ����
DELETE FROM rattachfile
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
   
SELECT *
FROM rattachfile
             



