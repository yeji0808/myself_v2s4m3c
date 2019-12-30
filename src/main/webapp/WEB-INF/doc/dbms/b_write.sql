/**********************************/
/* Table Name: �Խ��� */
/**********************************/
CREATE TABLE board(
		boardno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(300)		 NOT NULL,
		count                         		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE board is '�Խ���';
COMMENT ON COLUMN board.boardno is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN board.name is '�Խ����̸�';
COMMENT ON COLUMN board.count is '�Խ��ǵ���ڷ��';

drop table board


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
		boardno                       		NUMBER(10)		 NULL,
		memberno                      	NUMBER(10)		 NULL,
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
);
drop table b_write
COMMENT ON TABLE b_write is '��';
COMMENT ON COLUMN b_write.wno is '�� ��ȣ';
COMMENT ON COLUMN b_write.wtitle is '�� ���� ';
COMMENT ON COLUMN b_write.wcontent is '�� ����';
COMMENT ON COLUMN b_write.wrecom is '��õ ��';
COMMENT ON COLUMN b_write.wreplycnt is '���� ��';
COMMENT ON COLUMN b_write.rdate is '��� ����';
COMMENT ON COLUMN b_write.wword is '�˻���';
COMMENT ON COLUMN b_write.boardno is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN b_write.memberno is 'ȸ����ȣ';


-- 1)���
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '��õ�� ����', '���� ����', 0,
             0, sysdate, '����',1,1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             'ũ��������', '���� ����', 0,
             0, sysdate, '����',1,1);
             
INSERT INTO b_write(wno, 
                         wtitle, wcontent, wrecom, 
                         wreplycnt, rdate, wword, boardno, memberno)
VALUES((SELECT NVL(MAX(wno), 0) + 1 as wno FROM b_write),
             '����ȸ', '���� ����', 0,
             0, sysdate, '����',1,1);

select * from b_write
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- ------- --------
   1 ��õ�� ���� ���� ����         0         0 2019-12-24 17:40:44.0 ����          1        1
   2 ũ��������  ���� ����         0         0 2019-12-24 17:40:45.0 ����          1        1
   3 ����ȸ    ���� ����         0         0 2019-12-24 17:41:09.0 ����          1        1

-- 2) ���
SELECT wno,
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
ORDER BY wno asc;

 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO MEMBERNO
 --- ------ -------- ------ --------- --------------------- ----- ------- --------
   1 ��õ�� ���� ���� ����         0         0 2019-12-24 17:40:44.0 ����          1        1
   2 ũ��������  ���� ����         0         0 2019-12-24 17:40:45.0 ����          1        1
   3 ����ȸ    ���� ����         0         0 2019-12-24 17:41:09.0 ����          1        1


-- 2-2) Boardno �� ��� ����
SELECT wno, 
          wtitle, wcontent, wrecom, 
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
where boardno =3
order by wno desc
   
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
          wreplycnt, rdate, wword, boardno, memberno
FROM b_write
where wno = 1;
  
 WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE                 WWORD BOARDNO
 --- ------ -------- ------ --------- --------------------- ----- -------
   1 ��õ�� ���� ���� ����         0         0 2019-12-09 18:02:21.0 ����          3

-- 7) ����
delete from b_write
where wno = 1;
   
    WNO WTITLE WCONTENT WRECOM WREPLYCNT RDATE WWORD BOARDNO
 --- ------ -------- ------ --------- ----- ----- -------

-- 8) boardno�� ���ڵ� ���� ����
SELECT COUNT(*) as cnt
FROM b_write
where boardno = 3;
   
 COUNT
 -----
     2
     
-- 9) boardno�� ���ڵ� ����
delete FROM b_write
where boardno = 3;  
   
-- 10) ��õ�� ����
update b_write
set wrecom = wrecom+1
where wno=4





