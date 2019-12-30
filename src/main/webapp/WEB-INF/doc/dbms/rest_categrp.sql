/**********************************/
/* Table Name: ������ �з��� ī�װ� */
/**********************************/
-- ����
DROP TABLE rest_categrp;

-- ����
CREATE TABLE rest_categrp(
    rcateno                     NUMBER(10)     NOT NULL    PRIMARY KEY,
    rcatename                      VARCHAR2(50)     NOT NULL,
    rcnt                               NUMBER(10)    DEFAULT 0     NOT NULL            
);

COMMENT ON TABLE rest_categrp is '������ �з� ī�װ�';
COMMENT ON COLUMN rest_categrp.rcateno is '�з� ��ȣ';
COMMENT ON COLUMN rest_categrp.rcatename is '�з���';
COMMENT ON COLUMN rest_categrp.rcnt is '��ϵ� ������ ��';

-- ���
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '�ѽ�', 0);
            
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '�߽�', 0);

INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '���', 0);
            
INSERT INTO rest_categrp(rcateno, rcatename, rcnt)
VALUES((SELECT NVL(MAX(rcateno), 0) + 1 as rcateno FROM rest_categrp),
            '���', 0);

-- ���            
SELECT *
FROM rest_categrp
ORDER BY rcateno ASC;

 RCATENO RCATENAME RCNT
 ------- --------- ----
       1 �ѽ�           0
       2 �߽�           0
       3 ���           0


