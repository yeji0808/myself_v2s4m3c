
/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE members;

CREATE TABLE members(
    memberno NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL UNIQUE,
    passwd VARCHAR(60) NOT NULL,
    name VARCHAR(20) NOT NULL,
    birth VARCHAR(20) NOT NULL,
    tel VARCHAR(14) NOT NULL,
    email VARCHAR2(70) NOT NULL,
    zipcode VARCHAR(5),
    address1 VARCHAR(80) NOT NULL,
    address2 VARCHAR(50),
    userno NUMERIC(10),
    mdate DATE,
  FOREIGN KEY (userno) REFERENCES users (userno)
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN members.id is '���̵�';
COMMENT ON COLUMN members.passwd is '��й�ȣ';
COMMENT ON COLUMN members.name is 'ȸ���̸�';
COMMENT ON COLUMN members.birth is '����';
COMMENT ON COLUMN members.tel is '��ȭ��ȣ';
COMMENT ON COLUMN members.email is '�̸���';
COMMENT ON COLUMN members.zipcode is '�����ȣ';
COMMENT ON COLUMN members.address1 is '�ּ�1';
COMMENT ON COLUMN members.address2 is '�ּ�2';
COMMENT ON COLUMN members.userno is '������ȣ';
COMMENT ON COLUMN members.mdate is '���Գ�¥';

1. ���
 
1) id �ߺ� Ȯ��
SELECT COUNT(id) as cnt
FROM members
WHERE id='user1';
 
 cnt
 ---
   0   �� �ߺ� ���� ����.
   
2) ���
- �Ϸù�ȣ ���� ��������
- MAX(memberno): memberno �÷��� ���߿� ���� ū ���� ����
- ���ڵ尡 ������ MAX �Լ��� ����� NULL�̵˴ϴ�.
SELECT MAX(memberno) as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NULL ���� ��Ģ������ ����� NULL�̵˴ϴ�. �ǹ� ����.
SELECT MAX(memberno)+1 as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NVL(��, ��ȯ�� ��): ���� NULL�̸� ��ȯ�� ������ ����, 
   NULL�� 0���� ����
SELECT NVL(MAX(memberno), 0) as memberno FROM member;
MEMBERNO
 ------
   0
   
- NULL�� ó���ϸ鼭 ���ο� �ִ밪 ���� SQL
SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member;
MEMBERNO
 ------
   1
 
-- ������ ȸ�� ����
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                   'admin', '1234', '������', '1996-10-06', '000-0000-0000', 
                   'fltk0601@naver.com', '12345', '����� ���α�', '��ö��', 2, sysdate);
 
-- ���� ȸ�� ����
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                   'user1', '1234', '�ֿ���', '1996-09-24', '000-0000-0000', 
                   'yzzzc@naver.com', '12345', '����� ���α�', '��ö��', 1, sysdate);
 
-- ���� ȸ�� ����
INSERT INTO members(memberno, id, passwd, name, birth, tel, 
email, zipcode, address1, address2, userno, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM members),
                  'user2', '1234', '����', '1995-06-30', '000-0000-0000', 
                   'kmdeok@naver.com', '12345', '����� ���α�', '��ö��', 1, sysdate);
 
2. ���
- �˻��� ���� �ʴ� ���, ��ü ��� ���
 
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
ORDER BY memberno ASC;
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL              ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- ------------------ ------- -------- -------- ------ ---------------------
        1 admin 1234   ������  1996-10-06 000-0000-0000 fltk0601@naver.com 12345   ����� ���α�  ��ö��           3 2019-12-12 18:04:35.0
        2 user1 1234   �ֿ���  1996-09-24 000-0000-0000 yzzzc@naver.com    12345   ����� ���α�  ��ö��           1 2019-12-12 18:05:29.0
        3 user1 1234   ����  1995-06-30 000-0000-0000 kmdeok@naver.com   12345   ����� ���α�  ��ö��           2 2019-12-12 18:07:46.0

   
3. ��ȸ
 
1) memberno PK�� user1 ��� ���� ����
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE memberno = 1;
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL              ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- ------------------ ------- -------- -------- ------ ---------------------
        1 admin 1234   ������  1996-10-06 000-0000-0000 fltk0601@naver.com 12345   ����� ���α�  ��ö��           3 2019-12-12 18:04:35.0

2) id�� user1 ��� ���� ����   
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE id = 'user1';
 
 MEMBERNO ID    PASSWD NAME BIRTH      TEL           EMAIL           ZIPCODE ADDRESS1 ADDRESS2 USERNO MDATE
 -------- ----- ------ ---- ---------- ------------- --------------- ------- -------- -------- ------ ---------------------
        2 user1 1234   �ֿ���  1996-09-24 000-0000-0000 yzzzc@naver.com 12345   ����� ���α�  ��ö��           1 2019-12-12 18:09:39.0

3) user�� ��� ���� ����
SELECT memberno, id, passwd, name, birth, tel, 
          email, zipcode, address1, address2, userno, mdate
FROM members
WHERE userno = 1;      

4. ����
UPDATE members 
SET name='�Ʒι�', birth='1990-02-20', tel='111-1111-1111', email='abcd@naver.com', 
      zipcode='00000', address1='��⵵', address2='���ֽ�', userno='1'
WHERE memberno=3;
 
 
5. �н����� ����
1) �н����� �˻�
SELECT COUNT(memberno) as cnt
FROM members
WHERE memberno=1 AND passwd='1234';
 
2) �н����� ����
UPDATE members
SET passwd='0000'
WHERE memberno=1;
 
 
6. ����
1) ��� ����
DELETE FROM members;
 
2) Ư�� ȸ�� ����
DELETE FROM members
WHERE memberno=2;
 
 
7. �α���
SELECT COUNT(memberno) as cnt
FROM members
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0
   
- �˻��� ���� �ʴ� ���, ��ü ��� ���
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM members
ORDER BY memberno ASC;