/**********************************/
/* Table Name: ��õ */
/**********************************/
DROP TABLE recommand cascade constraint

CREATE TABLE recommand(
    recom_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    content                           VARCHAR2(100)    NOT NULL,
    cnt                               NUMBER(20)     DEFAULT 0     NOT NULL,
    list_cnt                          NUMBER(20)     DEFAULT 1     NOT NULL,
   cho_no                            NUMBER(10)     NULL,
  FOREIGN KEY (cho_no) REFERENCES choice (cho_no) on delete cascade
);


COMMENT ON TABLE choice is '��õ';
COMMENT ON COLUMN choice.cho_no is '��õ ��ȣ';
COMMENT ON COLUMN choice.cho_title is '��õ ����';
COMMENT ON COLUMN choice.cho_content is '��õ ����';
COMMENT ON COLUMN choice.cho_rec_cnt is '��õ ��õ ��';
COMMENT ON COLUMN choice.rdate is '�����';
COMMENT ON COLUMN choice.cho_word is '�˻���';
COMMENT ON COLUMN choice.boardno is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN choice.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ����÷�� */
/**********************************/
drop table rec_img
CREATE TABLE rec_img(
		img_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		fname                         		VARCHAR2(1000)		 NOT NULL,
		fupname                       		VARCHAR2(1000)		 NOT NULL,
		thumb                         		VARCHAR2(1000)		 NOT NULL,
		fsize                         		NUMBER(10)		 NOT NULL,
		recom_no                      		NUMBER(20)		 NULL ,
  FOREIGN KEY (recom_no) REFERENCES recommand (recom_no) on delete cascade
);

COMMENT ON TABLE rec_img is '����÷��';
COMMENT ON COLUMN rec_img.img_no is '÷�ι�ȣ';
COMMENT ON COLUMN rec_img.fname is '���ϸ�';
COMMENT ON COLUMN rec_img.fupname is '���ε�';
COMMENT ON COLUMN rec_img.thumb is '���';
COMMENT ON COLUMN rec_img.fsize is '����ũ��';
COMMENT ON COLUMN rec_img.recom_no is '��õ �׸� ��ȣ';

1)���
SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img;
 rec_imgNO
 ----------
          1

SELECT *
FROM recommand
ORDER BY recom_no ASC;
 
 CHO_NO RECOM_NO CONTENT  CNT LIST_CNT
 ------ -------- -------- --- --------
      3        1 ���������� ��    0        1
     10        2 ������        0        1
     11        4 ����� �����   0        1


   
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_1.jpg', 'samyang_t1.jpg', 1000, 2);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_2.jpg', 'samyang_t2.jpg', 1000, 1);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_3.jpg', 'samyang_t3.jpg', 1000, 4);
INSERT INTO rec_img(img_no, fname, fupname, thumb, fsize, recom_no)
VALUES((SELECT NVL(MAX(img_no), 0) + 1 as img_no FROM rec_img),
              'samyang.jpg', 'samyang_4.jpg', 'samyang_t4.jpg', 1000,4);
              
              
-- 2) ���( wno ���� ���� ����, w_attachno ���� ��������)
SELECT img_no, fname, fupname, thumb, fsize, recom_no
FROM rec_img
ORDER BY recom_no asc,  img_no desc;



-- 3) ��õ �׸� �� ���� ���(wno ���� ���� ����, w_attachno ���� ��������)
SELECT img_no, fname, fupname, thumb, fsize, recom_no
FROM rec_img
WHERE recom_no =2
ORDER BY fname ASC;
 IMG_NO FNAME       FUPNAME       THUMB          FSIZE RECOM_NO
 ------ ----------- ------------- -------------- ----- --------
      1 samyang.jpg samyang_1.jpg samyang_t.jpg   1000        2
      4 samyang.jpg samyang_4.jpg samyang_t4.jpg  1000        2
      3 samyang.jpg samyang_3.jpg samyang_t3.jpg  1000        2
      2 samyang.jpg samyang_2.jpg samyang_t2.jpg  1000        2


-- 4) rec_img, w_attach join
    SELECT r.content, 
               i.img_no, i.recom_no, i.fname, i.fupname, i.thumb, i.fsize
    FROM recommand r, rec_img i
    WHERE r.recom_no = i.recom_no
    ORDER BY r.recom_no DESC,  i.img_no ASC
 CONTENT  IMG_NO RECOM_NO FNAME       FUPNAME       THUMB          FSIZE
 -------- ------ -------- ----------- ------------- -------------- -----
 ����� �����      4        2 samyang.jpg samyang_4.jpg samyang_t4.jpg  1000
 ������           2        2 samyang.jpg samyang_2.jpg samyang_t2.jpg  1000
 ���������� ��       1        2 samyang.jpg samyang_1.jpg samyang_t.jpg   1000


-- 5) �ϳ��� ���� ����
DELETE FROM rec_img


