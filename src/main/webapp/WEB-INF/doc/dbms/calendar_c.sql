/**********************************/
/* Table Name: ���� �׸� */
/**********************************/
DROP TABLE calendar;

CREATE TABLE calendar(
  calendarno  NUMBER(8)      NOT NULL PRIMARY KEY,
  somoimno   NUMBER(8)      NOT NULL, -- �Ҹ��� ��ȣ
  labeldate     VARCHAR(10)   NOT NULL, -- ����� ��¥ 2013-10-20 
  label           VARCHAR(30)   NOT NULL, -- �޷¿� ��µ� ���̺�
  title             VARCHAR(500) NOT NULL, -- ����(*)
  content       CLOB                NOT NULL, -- �� ����
  cnt              NUMBER(8)       DEFAULT 0, -- ��ȸ��
  regdate       DATE                NOT NULL,  -- ��� ��¥
  FOREIGN KEY (somoimno) REFERENCES somoim (somoimno) ON DELETE CASCADE
);

SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar;

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-13', '���� ����', '���� �ȳ��Դϴ�.', '���� �����Դϴ�.', 0, sysdate);

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-14', '���� ����', '���� �ȳ��Դϴ�.', '���� �����Դϴ�.', 0, sysdate);

INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             1, '2020-01-15', '���� �Ұ�', '���� �Ұ� �ȳ��Դϴ�.', '�̹� ������ �Ǿ����ϴ�.', 0, sysdate);
             
INSERT INTO calendar(calendarno, somoimno, labeldate, label, title, content, cnt, regdate)
VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),
             2, '2020-01-16', '���� �Ұ�', '���� �Ұ� �ȳ��Դϴ�.', '�̹� ������ �Ǿ����ϴ�.', 0, sysdate);

-- ��ü ���
SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
ORDER BY calendarno ASC;

 CALENDARNO LABELDATE  LABEL        TITLE            CONTENT          CNT REGDATE
 ---------- ---------- ------------ ---------------- ---------------- --- ---------------------
          1 2019-12-26 ���� ����        ���� �ȳ��Դϴ�.        ���� �����Դϴ�.          0 2019-12-26 15:13:05.0
          2 2019-12-26 ���� ����        ���� �ȳ��Դϴ�.        ���� �����Դϴ�.          0 2019-12-26 15:13:06.0
          3 2019-12-28 ���� �Ұ�        ���� �Ұ� �ȳ��Դϴ�.     �̹� ������ �Ǿ����ϴ�.      0 2019-12-26 15:13:07.0
          4 2019-12-27 A�� 101 ���� ���� A�� 101 ���� �����մϴ�. A�� 101 ���� �����մϴ�.   0 2019-12-26 15:13:12.0


-- Ư�� ��¥�� ���
SELECT calendarno, labeldate, label
FROM calendar
WHERE labeldate = '2019-12-26';

 CALENDARNO LABELDATE  LABEL
 ---------- ---------- -----
          1 2019-12-26 ���� ����
          2 2019-12-26 ���� ����
          
SELECT calendarno, labeldate, label
FROM calendar
WHERE substr(labeldate, 1, 7) = '2019-12'; -- 12����

 CALENDARNO LABELDATE  LABEL
 ---------- ---------- -----
          1 2019-12-26 ���� ����
          2 2019-12-26 ���� ����
          3 2019-12-28 ���� �Ұ�

          
-- ��ȸ
UPDATE calendar
SET cnt = cnt + 1
WHERE calendarno = 1;


SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE calendarno = 1;


-- ����
UPDATE calendar
SET labeldate=sysdate+1, label='���� ����', title='���� �����մϴ�.', content='�ִ� 10�α��� �����մϴ�.'
WHERE calendarno = 1;


-- ����
DELETE FROM calendar
WHERE calendarno = 1;

SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE somoimno=1
ORDER BY calendarno ASC;

SELECT * FROM calendar;

SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE somoimno=1
ORDER BY calendarno DESC

SELECT calendarno, labeldate, label
FROM calendar
WHERE labeldate='2020-01-28'
