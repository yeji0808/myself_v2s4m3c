/**********************************/
/* Table Name: ��õ���� */
/**********************************/
DROP TABLE m_rec;
CREATE TABLE m_rec(
    recno                  NUMBER(10)        NOT NULL    PRIMARY KEY,
    restno                 NUMBER(10)    NOT NULL ,
    memberno           NUMBER(10)     NOT NULL,
CONSTRAINT m_rec_restno_fk
FOREIGN KEY (restno) REFERENCES restrnts(restno)
ON DELETE CASCADE,
CONSTRAINT m_rec_memberno_fk
FOREIGN KEY (memberno) REFERENCES members(memberno)
ON DELETE CASCADE
);

COMMENT ON TABLE m_rec is '��õ����';
COMMENT ON COLUMN m_rec.recno is '��õ ��ȣ';
COMMENT ON COLUMN m_rec.restno is '������ ��ȣ';
COMMENT ON COLUMN m_rec.memberno is '��� ��ȣ';

-- 1) ���
SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu;

INSERT INTO menu(menuno, restno, mname, mprice)
VALUES((SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu),
             1, '������', 8000);

INSERT INTO menu(menuno, restno, mname, mprice)
VALUES((SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu),
             1, '���ɵ�', 11000);
             
-- 4) �ϳ��� ���� ����
DELETE FROM rattachfile
WHERE attachfileno = 1;

SELECT *
FROM MENU;