/**********************************/
/* Table Name: 추천여부 */
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

COMMENT ON TABLE m_rec is '추천여부';
COMMENT ON COLUMN m_rec.recno is '추천 번호';
COMMENT ON COLUMN m_rec.restno is '음식점 번호';
COMMENT ON COLUMN m_rec.memberno is '멤버 번호';

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