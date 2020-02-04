DROP TABLE member IF EXISTS;
DROP TABLE users IF EXISTS;

/**********************************/
/* Table Name: ����ī�װ� */
/**********************************/
DROP TABLE users;

CREATE TABLE users(
		userno NUMERIC(10) NOT NULL PRIMARY KEY,
		user_name VARCHAR(50) NOT NULL,
		user_cnt NUMERIC(30) NOT NULL,
		seqno NUMERIC(10) DEFAULT 0 NOT NULL,
		visible CHAR(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON TABLE users is 'ȸ��ī�װ�';
COMMENT ON COLUMN users.userno is '������ȣ';
COMMENT ON COLUMN users.user_name is '�����̸�';
COMMENT ON COLUMN users.user_cnt is '������';
COMMENT ON COLUMN users.seqno is '��¼���';
COMMENT ON COLUMN users.visible is '��¸��';


-- ���
INSERT INTO users(userno, user_name, user_cnt, seqno, visible)
VALUES((SELECT NVL(MAX(userno), 0) + 1 as userno FROM users), '�Ϲ�', 40, 1, 'Y');
INSERT INTO users(userno, user_name, user_cnt, seqno, visible)
VALUES((SELECT NVL(MAX(userno), 0) + 1 as userno FROM users), '����', 7, 1, 'Y');


-- ���
SELECT userno, user_name, user_cnt, seqno, visible
FROM users
ORDER BY userno DESC;

USERNO USER_NAME USER_CNT SEQNO VISIBLE
 ------ --------- -------- ----- -------
      2 ����               7     1 Y
      1 �Ϲ�              40     1 Y


-- ��ȸ
SELECT userno, user_name, user_cnt, seqno, visible
FROM users
WHERE userno = 1;

USERNO USER_NAME USER_CNT SEQNO VISIBLE
 ------ --------- -------- ----- -------
      1 �Ϲ�              40     1 Y

-- ����
UPDATE users
SET user_cnt = '10'
WHERE name = '����';


-- ����
DELETE FROM users
WHERE userno = 2;




