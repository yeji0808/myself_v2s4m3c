/**********************************/
/* Table Name: 첨부파일 */
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

COMMENT ON TABLE menu is '메뉴';
COMMENT ON COLUMN menu.menuno is '메뉴번호';
COMMENT ON COLUMN menu.restno is '음식점 번호';
COMMENT ON COLUMN menu.mname is '메뉴이름';
COMMENT ON COLUMN menu.mprice is '메뉴가격';

-- 1) 등록
SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu;

INSERT INTO menu(menuno, restno, mname, mprice)
VALUES((SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu),
             1, '가츠동', 8000);

INSERT INTO menu(menuno, restno, mname, mprice)
VALUES((SELECT NVL(MAX(menuno), 0) + 1 as menuno FROM menu),
             1, '사케동', 11000);
             
-- 4) 하나의 파일 삭제
DELETE FROM rattachfile
WHERE attachfileno = 1;

SELECT *
FROM MENU;