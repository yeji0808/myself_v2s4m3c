

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE members(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.memberno is 'ȸ����ȣ';

insert into members(memberno)
values (1)
select * from members

/**********************************/
/* Table Name: �� */
/**********************************/
CREATE TABLE b_write(
		wno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		wtitle                        		VARCHAR2(100)  NOT NULL,
		wcontent                      		CLOB		     NOT NULL,
		wrecom                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		wreplycnt                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		 DATE		           NOT NULL,
		wword                         		VARCHAR2(100)		 NULL, 
		memberno                      	NUMBER(10)		 NULL,
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);
drop table wreply cascade constraint
COMMENT ON TABLE b_write is '��';
COMMENT ON COLUMN b_write.wno is '�� ��ȣ';
COMMENT ON COLUMN b_write.wtitle is '�� ���� ';
COMMENT ON COLUMN b_write.wcontent is '�� ����';
COMMENT ON COLUMN b_write.wrecom is '��õ ��';
COMMENT ON COLUMN b_write.wreplycnt is '���� ��';
COMMENT ON COLUMN b_write.rdate is '��� ����';
COMMENT ON COLUMN b_write.wword is '�˻���';
COMMENT ON COLUMN b_write.memberno is 'ȸ����ȣ';


-- 1)���
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '��õ�� ����', '���� ����', 0,
             0, sysdate, '����',1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             'ũ��������', '���� ����', 0,
             0, sysdate, '����',1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '����ȸ', '���� ����', 0,
             0, sysdate, '����',1);


-- 2) ���
SELECT wno,
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword,  memberno
FROM b_write
ORDER BY wno asc;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   1 ��õ�� ���� ���� ����         0         0 2020-01-02 18:31:46.0 ����           1
   2 ũ��������  ���� ����         0         0 2020-01-02 18:31:47.0 ����           1
   3 ����ȸ    ���� ����         0         0 2020-01-02 18:31:48.0 ����           1


-- 2-2) memberno �� ��� ����
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, memberno
FROM b_write
where memberno =1
order by wno desc
   
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   3 ����ȸ    ���� ����         0         0 2020-01-02 18:31:48.0 ����           1
   2 ũ��������  ���� ����         0         0 2020-01-02 18:31:47.0 ����           1
   1 ��õ�� ���� ���� ����         0         0 2020-01-02 18:31:46.0 ����           1

-- 3) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM b_write;

-- 4) ����
UPDATE b_write
SET wtitle='��õ�� ����2', wcontent='��ȣ����'
WHERE wno = 1;
 
SELECT * from b_write;
 WNO WTITLE  WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO
 --- ------- -------- ------ --------- --------------------- ----- -------
   1 ��õ�� ����2 ���� ����         0         0 2019-12-09 18:02:21.0 ����          3
   2 ũ��������   ���� ����         0         0 2019-12-09 18:02:22.0 ����          3
   3 ����ȸ     ���� ����         0         0 2019-12-09 18:02:23.0 ����          3

-- 5) �ϳ��� ��ȸ�� �� read
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, memberno
FROM b_write
where wno = 1;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- --------
   1 ��õ�� ���� ���� ����         0         0 2020-01-02 18:31:46.0 ����           1

-- 7) ����
delete from b_write
where wno = 1;
   
    WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE WWORD BOARDNO
 --- ------ -------- ------ --------- ----- ----- -------

 COUNT
 -----
     2
     
-- 8) ��õ�� ����
update b_write
set wrecom = wrecom+1
where wno=1

-- 9) ��� �� ����
update b_write
set wreplycnt = wreplycnt+1
where wno=1





