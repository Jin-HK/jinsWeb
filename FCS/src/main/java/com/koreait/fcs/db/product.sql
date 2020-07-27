
--상품
DROP TABLE C_PRODUCT;
CREATE TABLE C_PRODUCT(
    PNO NUMBER PRIMARY KEY,
    PNAME VARCHAR2(100) NOT NULL,
    PPRICE NUMBER NOT NULL,
    PCATEGORY NUMBER, --외래키
    PGENDER NUMBER NOT NULL,
    PCOMPANY VARCHAR2(100),
    PTHUMBNAIL VARCHAR2(300), -- 이미지 파일명
    PFILENAME VARCHAR2(300),
    PDESCRIPTION VARCHAR2(2000),
    PSTOCK1 NUMBER NOT NULL,
    PSTOCK2 NUMBER NOT NULL,
    PSTOCK3 NUMBER NOT NULL,
    PREGDATE DATE,
    CONSTRAINT PRODUCT_CATEGORY_FK FOREIGN KEY (PCATEGORY) REFERENCES C_CATEGORY (CNO)
);

DROP SEQUENCE C_PRODUCT_SEQ;
CREATE SEQUENCE C_PRODUCT_SEQ
START WITH 10000
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '메탈 로고 레더 벨트', 55290, 31, 3, 'ROUGE', 'man/acc/beltTh.jpg', 'man/acc/beltMain.jpg', '소가죽메탈로 만들어진 벨트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '카나비 캔버스 슈즈', 71000, 33, 3, 'BLANC', 'man/acc/shoesTh.jpg', 'man/acc/shoesMain.jpg', '편안한 쿠셔닝과 향균성을 강화한 제품', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '레터링 스니커즈', 110000, 33, 3, 'BLANC', 'man/acc/sneakersTh.jpg', 'man/acc/sneakersMain.jpg', '편안함을 주는 스니커즈', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '레더 클러치', 195000, 32, 3, 'ROUGE', 'man/acc/clutchTh.jpg', 'man/acc/clutchMain.jpg', '내구성과 아름다움을 모두 담은 클러치', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, 'Y넥 버튼 가디건', 142000, 12, 1, 'VERT', 'man/cardigan/1th.jpg', 'man/cardigan/1main.jpg', '청색 슬림핏 와이넥 가디건', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '투라인 포인트 가디건', 130000, 12, 1, 'ARGENT', 'man/cardigan/2th.jpg', 'man/cardigan/2main.jpg', '단정한 핏의 가디건', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '블랙 캐시미어 가디건', 85000, 12, 1, 'NOIR', 'man/cardigan/3th.jpg', 'man/cardigan/3main.jpg', '루즈핏으로 편안함을 더해주는 가디건', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '캐시미어 브이넥 가디건', 49900, 12, 1, 'ROUGE', 'man/cardigan/4th.jpg', 'man/cardigan/4main.jpg', '부드러운 촉감의 가디건', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '라인 디테일 카라니트', 74000, 13, 1, 'ROUGE', 'man/knit/1th.jpg', 'man/knit/1main.jpg', '편안함을 더해준 반팔 니트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '면혼방 반팔 폴로니트', 122000, 13, 1, 'NOIR', 'man/knit/2th.jpg', 'man/knit/2main.jpg', '브리티시 모던 컴템프러리 니트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '체크 썸머 니트티', 28000, 13, 1, 'BLANC', 'man/knit/3th.jpg', 'man/knit/3main.jpg', '깔끔한 이미지를 연출할 수 있는 니트', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '스트레치 셔츠', 98000, 14, 1, 'VERT', 'man/shirts/1th.jpg', 'man/shirts/1main.jpg', '깔끔한 이미지를 연출할 수 있는 셔츠', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '블루 스트라이프 셔츠', 55000, 14, 1, 'ARGENT', 'man/shirts/2th.jpg', 'man/shirts/2main.jpg', '모던한 분위기의 셔츠', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '클래식 린넨 셔츠', 139000, 14, 1, 'NOIR', 'man/shirts/3th.jpg', 'man/shirts/3main.jpg', '편안함을 더해준 셔츠', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '스트라이프 셔츠', 75000, 14, 1, 'BLANC', 'man/shirts/4th.jpg', 'man/shirts/4main.jpg', '컬러풀한 색상의 셔츠', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '블루종 점퍼', 195000, 15, 1, 'ROUGE', 'man/jumper/1th.jpg', 'man/jumper/1main.jpg', '트렌디한 네이비 블루종 점퍼', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '보아 플리스 집업	', 87000, 15, 1, 'VERT', 'man/jumper/2th.jpg', 'man/jumper/2main.jpg', '패션과 보온성을 한번에', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '마 100% 그린자켓', 132000, 15, 1, 'NOIR', 'man/jumper/3th.jpg', 'man/jumper/3main.jpg', '여름 필수 자켓', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '경량체크제킷', 214000, 15, 1, 'BLANC', 'man/jumper/4th.jpg', 'man/jumper/4main.jpg', '가벼운 원단의 여름 필수 자켓', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '풀밴딩 슬랙스', 25000, 16, 1, 'ARGENT', 'man/pants/1th.jpg', 'man/pants/1main.jpg', '편안한 여름용 슬랙스', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '슬림핏 체크팬츠', 49000, 16, 1, 'VERT', 'man/pants/2th.jpg', 'man/pants/2main.jpg', '페이크 핏 체크팬츠', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '슬림 스판 정장', 39000, 16, 1, 'NOIR', 'man/pants/3th.jpg', 'man/pants/3main.jpg', '여름용 시원한 정장바지', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '슬림핏 스커트', 25000, 26, 2, 'ROUGE', 'woman/skirts/skirt1_th.jpg', 'woman/skirts/skirt1_de.jpg', 
'슬림라인 스커트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '플레어 롱 스커트', 29000, 26, 2, 'BLANC', 'woman/skirts/skirt2_th.jpg', 'woman/skirts/skirt2_de.jpg', 
'편안한 롱 플레어 스커트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '바캉스 스커트', 31000, 26, 2, 'NOIR', 'woman/skirts/skirt3_th.jpg', 'woman/skirts/skirt3_de.jpg', 
'여름바캉스 스커트', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '와이드 핏 팬츠', 49000, 22, 2, 'ROUGE', 'woman/pants/pants1_th.jpg', 'woman/pants/pants1_de.jpg', 
'편안한 와이드 핏', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '슬림핏 슬랙스', 38000, 22, 2, 'ROUGE', 'woman/pants/pants2_th.jpg', 'woman/pants/pants2_de.jpg', 
'정장용 슬림핏 슬랙스', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '썸머 쿨링 슬랙스', 27000, 22, 2, 'BLANC', 'woman/pants/pants3_th.jpg', 'woman/pants/pants3_de.jpg', 
'여름 필수템 쿨링 슬랙스', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '반팔 니트', 19000, 21, 2, 'NOIR', 'woman/knits/knit1_th.jpg', 'woman/knits/knit1_de.jpg', 
'여름용 반팔 니트', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '울 니트', 25000, 21, 2, 'VERT', 'woman/knits/knit2_th.jpg', 'woman/knits/knit2_de.jpg', 
'울 소재의 반팔 니트', 100, 100, 100, SYSDATE);


INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '슬림핏 블라우스', 55000, 23, 2, 'ARGENT', 'woman/blouse/blouse1_th.jpg', 'woman/blouse/blouse1_de.jpg', 
'정장용 슬림 블라우스', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '썸머 블라우스', 59000, 23, 2, 'VERT', 'woman/blouse/blouse2_th.jpg', 'woman/blouse/blouse2_de.jpg', 
'여름용 편안한 블라우스', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '단정 블라우스', 47000, 23, 2, 'ROUGE', 'woman/blouse/blouse3_th.jpg', 'woman/blouse/blouse3_de.jpg', 
'모던한 느낌의 블라우스', 100, 100, 100, SYSDATE);

INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '하객 원피스', 75000, 24, 2, 'ROUGE', 'woman/dress/dress1_th.jpg', 'woman/dress/dress1_de.jpg', 
'하객 코디 원피스', 100, 100, 100, SYSDATE);
INSERT INTO C_PRODUCT
VALUES (C_PRODUCT_SEQ.NEXTVAL, '바캉스 원피스', 87000, 24, 2, 'ARGENT', 'woman/dress/dress2_th.jpg', 'woman/dress/dress2_de.jpg', 
'바캉스 코디 원피스', 100, 100, 100, SYSDATE);
