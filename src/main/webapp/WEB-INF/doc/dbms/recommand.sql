
/**********************************/
/* Table Name: ��õ */
/**********************************/
drop table recommand cascade constraint

CREATE TABLE recommand(
		recom_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		content                       		VARCHAR2(100)		 NOT NULL,
		cnt                           		NUMBER(20)		 DEFAULT 0		 NOT NULL,
		list_cnt                          NUMBER(20)     DEFAULT 1     NOT NULL,
	 cho_no                            NUMBER(10)     NULL,
  FOREIGN KEY (cho_no) REFERENCES choice (cho_no) on delete cascade
);

COMMENT ON TABLE recommand is '��õ';
COMMENT ON COLUMN recommand.cho_no is '���� ��ȣ';
COMMENT ON COLUMN recommand.recom_no is '��õ ��ȣ';
COMMENT ON COLUMN recommand.content is '��õ ����';
COMMENT ON COLUMN recommand.list_cnt is '��õ �׸� ��';
COMMENT ON COLUMN recommand.cnt is '��õ ��';

-- 1) ���
delete from RECOMMAND where cho_no=3

INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '¯��', 0,3);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '¥��', 0,3);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '��Ʈvs�е�', 0,4);
INSERT INTO recommand(recom_no, 
                         content, cnt, cho_no)
VALUES((SELECT NVL(MAX(recom_no), 0) + 1 as recom_no FROM recommand),
             '�θ�vs���', 0,5);

-- 2) ���
SELECT recom_no, 
                         content, cnt, cho_no,list_cnt
FROM RECOMMAND
ORDER BY recom_no asc;

select * from RECOMMAND
-- 3) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM RECOMMAND;

-- 4) ����
UPDATE RECOMMAND
SET content='��Ű'
WHERE recom_no = 3;
-- 4) ����
delete from recommand
WHERE recom_no = 3;

-- 5) ��õ �� ����
update recommand
    set cnt = cnt+1
    where cho_no=#{cho_no}

-- 6) cho_no�� ���
SELECT recom_no, 
                         content, cnt, cho_no,list_cnt
FROM RECOMMAND
where cho_no = 11;

-- 7) ��ȸ
SELECT recom_no, 
                         content, cnt, cho_no, list_cnt
    FROM recommand
    Where recom_no=1
     RECOM_NO CONTENT CNT CHO_NO LIST_CNT
 -------- ------- --- ------ --------
        1 ���������� ��   0      3        1

