/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE review;

CREATE TABLE review(
		reviewno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		restno                   		NUMBER(10)	NOT	 NULL ,
		memberno                    		NUMBER(6)		 NOT NULL ,
		content                       		VARCHAR2(1000)		 NOT NULL,
		passwd                        		VARCHAR2(20)		 NOT NULL,
		rdate                              DATE NOT NULL,
	CONSTRAINT review_restno_fk	
  FOREIGN KEY (restno) REFERENCES restrnts (restno)
  ON DELETE CASCADE,
  CONSTRAINT review_memberno_fk
  FOREIGN KEY (memberno) REFERENCES members (memberno)
  ON DELETE CASCADE
);

COMMENT ON TABLE review is '���';
COMMENT ON COLUMN review.reviewno is '��۹�ȣ';
COMMENT ON COLUMN review.restno is '��������ȣ';
COMMENT ON COLUMN review.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.content is '����';
COMMENT ON COLUMN review.passwd is '��й�ȣ';
COMMENT ON COLUMN review.rdate is '�����';

1) ���
INSERT INTO review(reviewno, restno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
             6, 1, '���1', '1234', sysdate);
INSERT INTO review(reviewno, restno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
             1, 1, '���2', '1234', sysdate);
INSERT INTO review(reviewno, restno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
             1, 1, '���3', '1234', sysdate);             

2) ��ü ���
SELECT reviewno, restno, memberno, content, passwd, rdate
FROM review
ORDER BY reviewno DESC;

 reviewNO restno MEMBERNO CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 ���3     1234   2019-12-17 16:59:38.0
       2          1        1 ���2     1234   2019-12-17 16:59:37.0
       1          1        1 ���1     1234   2019-12-17 16:59:36.0


3) restno �� ���
SELECT reviewno, restno, memberno, content, passwd, rdate
FROM review
WHERE memberno=1
ORDER BY reviewno DESC;

 reviewNO restno MEMBERNO CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 ���3     1234   2019-12-17 16:59:38.0
       2          1        1 ���2     1234   2019-12-17 16:59:37.0
       1          1        1 ���1     1234   2019-12-17 16:59:36.0


4) ����
-- �н����� �˻�
SELECT count(passwd) as cnt
FROM review
WHERE reviewno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- ����
DELETE FROM review
WHERE reviewno=1;

5) restno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM review
WHERE restno=1;

 CNT
 ---
   1

DELETE FROM review
WHERE restno=1;

6) memberno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM review
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM review
WHERE memberno=1;

7) ȸ�� ID�� ���
SELECT m.id,
           r.reviewno, r.restno, r.memberno, r.content, r.passwd, r.rdate
FROM member m,  review r
WHERE (m.memberno = r.memberno) AND r.restno=1
ORDER BY r.reviewno DESC;

 ID    reviewNO restno MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 ��� 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 ��� 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 ��� 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM review
WHERE reviewno=1 AND passwd='1234';

 CNT
 ---
   0

9) ����
DELETE FROM review
WHERE reviewno=1;







