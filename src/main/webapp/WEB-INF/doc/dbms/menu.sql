/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE menu;
CREATE TABLE menu(
    menuno                  NUMBER(10)        NOT NULL    PRIMARY KEY,
    restno                     NUMBER(10)        NULL ,
    mname                   VARCHAR2(100)    NOT NULL,
    mprice                    VARCHAR2(100)         NOT NULL,
CONSTRAINT menu_restno_fk
FOREIGN KEY (restno) REFERENCES restrnts(restno)
ON DELETE CASCADE
);

COMMENT ON TABLE menu is '�޴�';
COMMENT ON COLUMN menu.menuno is '�޴���ȣ';
COMMENT ON COLUMN menu.restno is '������ ��ȣ';
COMMENT ON COLUMN menu.mname is '�޴��̸�';
COMMENT ON COLUMN menu.mprice is '�޴�����';

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