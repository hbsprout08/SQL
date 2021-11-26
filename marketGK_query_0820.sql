CREATE TABLE member (
mem_id  VARCHAR2(20)
CONSTRAINT memeber_memid_pk PRIMARY KEY,

mem_pw  VARCHAR2(20)
CONSTRAINT member_mempw_nn NOT NULL,

mem_name VARCHAR2(17)
CONSTRAINT member_memname_nn NOT NULL,

mem_email VARCHAR2(30)
CONSTRAINT member_mememail_nn NOT NULL
CONSTRAINT member_mememail_uk UNIQUE,

mem_tel VARCHAR2(12) 
CONSTRAINT member_memtel_nn NOT NULL
CONSTRAINT member_memtel_uk UNIQUE,

mem_addr VARCHAR2(30)
CONSTRAINT member_memaddr_nn NOT NULL,

mem_birth DATE
CONSTRAINT member_membirth NOT NULL
);


CREATE TABLE product (
prod_id VARCHAR2(20)
CONSTRAINT product_prodid_pk PRIMARY KEY,

prod_name VARCHAR2(20)
CONSTRAINT product_prodname_nn NOT NULL,

prod_price NUMBER(10)
CONSTRAINT product_prodprice_nn NOT NULL
);

CREATE TABLE buylist(
buy_id NUMBER(10)
CONSTRAINT buylist_buyid_pk PRIMARY KEY,

prod_id VARCHAR2(20)
CONSTRAINT buylist_prodid_fk REFERENCES product(prod_id),

buy_num NUMBER
CONSTRAINT buylist_buynum_ck CHECK(buy_num>0),

mem_id VARCHAR2(20)
CONSTRAINT buylist_memid_fk REFERENCES MEMBER(mem_id),

buy_date DATE DEFAULT sysdate
);

commit;



/*상품명은 join으로 뽑아오면 됩니다.*/
select buy_id, p.prod_name, buy_num from buylist b, product p
where b.prod_id = p.prod_id and mem_id like ?;





/*--------------- + 2021/08/10 ------------------------*/

alter table member modify(mem_tel varchar2(13));
alter table member modify(mem_addr varchar2(80));
alter table product modify(prod_name varchar2(80));
commit;

/*임시데이터*/
/*회원테이블*/
INSERT INTO MEMBER VALUES('apple01', 'apple', '홍길동', 'apple01@naver.com',
'010-1234-5678', '서울특별시 종로구 묘동 돈화문로 26', '19890711');

INSERT INTO MEMBER VALUES
('tomato02', 'tomato', '이순신', 'tomato02@daum.net', '010-2345-6789',
'서울특별시 강남구 강남대로84길 16 제이스타워', '19960824');

INSERT INTO MEMBER VALUES
('orange03', 'orange', '견휜', 'orange03@gmail.com', '010-3456-7890',
'부산광역시 해운대구 우동 센텀2로 25 센텀드림월드', '19860126');


/*상품테이블*/
INSERT INTO product VALUES
('PA00001', '[사람밥] 청송사과 (30개입)', 25900);

INSERT INTO product VALUES
('PA00002', '[사람밥] 청송사과 (15개입)', 12800);

INSERT INTO product VALUES
('PA00003', '[사람밥] 하우스 미나리(한단)', 2480);

INSERT INTO product VALUES
('PA00004', '[사람밥] 홍천 쌀 (5kg)', 21600);

INSERT INTO product VALUES
('PA00005', '[사람밥] 장어 (1kg)', 19900);

INSERT INTO product VALUES
('PA00006', '[사람밥] 냉동 떡갈비 (1.2kg)', 10980);

INSERT INTO product VALUES
('PA00007', '[사람밥] 알배추 (4통)', 15200);

INSERT INTO product VALUES
('PA00008', '[사람밥] 국산 고춧가루 (500g)', 16500);

INSERT INTO product VALUES
('PA00009', '[사람밥] 의성 깐마늘 (1kg)', 7900);

INSERT INTO product VALUES
('PA00010', '[간식줘] 동결건조 닭가슴살 (50g)', 6300);

INSERT INTO product VALUES
('PA00011', '[간식줘] 오리 황태말이 강아지간식 (6개)', 3300); /* 54byte */

INSERT INTO product VALUES
('PA00012', '[간식줘] 건조밀웜 (10g)', 1300);

INSERT INTO product VALUES
('PA00013', '[간식줘] 동결건조 열빙어', 4700);

INSERT INTO product VALUES
('PA00014', '[간식줘]앵무새 영양바 12종', 3140);

INSERT INTO product VALUES
('PA00015', '[간식줘]해바라기씨 간식(2.5kg)', 9690);

commit;


/* ----------------- + 2021/08/20 ----------------- */

ALTER TABLE product ADD(prod_count number);

UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00001';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00002';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00003';
UPDATE product SET prod_count = 15 WHERE prod_id = 'PA00004';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00005';
UPDATE product SET prod_count = 100 WHERE prod_id = 'PA00006';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00007';
UPDATE product SET prod_count = 50 WHERE prod_id = 'PA00008';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00009';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00010';
UPDATE product SET prod_count = 10 WHERE prod_id = 'PA00011';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00012';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00013';
UPDATE product SET prod_count = 25 WHERE prod_id = 'PA00014';
UPDATE product SET prod_count = 0 WHERE prod_id = 'PA00015';

COMMIT;

/*임시 확인용 로그인 정보*/
insert into member values('aaa', 'aaa', 'hong', 'hong@gmail.com',
'010*1234-5678', '서울특별시 종로구', '2009/08/13');

commit;