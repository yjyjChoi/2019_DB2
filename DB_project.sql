CREATE TABLE 간호사(
    간호사id number(5,0)  not null,
    입사일 date,    
    이름 varchar2(20) not null,
    성별 varchar2(3) not null,
    담당업무 varchar2(30),
    도로명주소 varchar2(50),
    상세주소 varchar2(40),
    주민번호 varchar2(15) not null,
    전화번호 varchar2(15),
    CONSTRAINT 간호사_pk PRIMARY KEY(간호사id)
    );

CREATE TABLE 의사(
    의사id number(5,0)  not null,
    입사일 date, 
    이름 varchar2(20) not null,
    성별 varchar2(3) not null,
    도로명주소 varchar2(50),
    상세주소 varchar2(50),
    주민번호 varchar2(15) not null,
    전화번호 varchar2(15),
    CONSTRAINT 의사_pk PRIMARY KEY(의사id)
    );
    
CREATE TABLE 환자(
    환자id number(5,0)  not null,
    이름 varchar2(20) not null,
    성별 varchar2(3) not null,
    혈액형 varchar2(2),
    도로명주소 varchar2(50),
    상세주소 varchar2(50),
    주민번호 varchar2(15) not null,
    전화번호 varchar2(15),
    진료비용 number,
    진료날짜 date,
    간호사id number(5,0),
    의사id number(5,0),
    CONSTRAINT 환자_pk PRIMARY KEY(환자id),
    CONSTRAINT 환자_fk1 FOREIGN KEY(의사id) references 의사(의사id),
    CONSTRAINT 환자_fk2 FOREIGN KEY(간호사id) references 간호사(간호사id)
    );
    
CREATE TABLE 병실(
    병실번호 number(5,0) not null,
    병실종류 number(5),
    병실위치 varchar2(27),
    청소날짜 date,
    담당간호사 varchar2(20),
    CONSTRAINT 병실_pk PRIMARY KEY(병실번호)
    );
   
CREATE TABLE 입원환자(
    입원환자id number(5,0) not null,
    입원일 date,
    퇴원일 date,
    간병인 varchar2(20),
    보호자 varchar2(20),
    전화번호 varchar2(15),
    병실번호 number(5,0),
    CONSTRAINT 입원환자_pk PRIMARY KEY(입원환자id),
    CONSTRAINT 입원환자_fk1 FOREIGN KEY(입원환자id) references 환자(환자id),
    CONSTRAINT 입원환자_fk2 FOREIGN KEY(병실번호) references 병실(병실번호)
    );

CREATE TABLE 예약(
    예약번호 number(10,0) not null,
    담당의사 varchar2(20),
    예약날짜 date,
    예약시간 date, 
    예약내용 varchar2(30),
    환자id number(5,0),
    CONSTRAINT 예약_pk PRIMARY KEY(예약번호),
    CONSTRAINT 예약_fk FOREIGN KEY(환자id) references 환자(환자id)
    );

CREATE TABLE 공급업체(
    업체id number(5,0) not null,
    업체이름 varchar2(30),
    주소 varchar2(50),
    담당자이름 varchar2(20),
    CONSTRAINT 공급업체_pk PRIMARY KEY(업체id)
    );

CREATE TABLE 의료장비(
    장비id number(5,0) not null,
    장비이름 varchar(30),
    가격 number,
    장비위치 varchar(30),
    수리날짜 date,
    설치날짜 date,
    업체id number(5,0),
    장비사용환자id number(5,0),
    CONSTRAINT 의료장비_pk PRIMARY KEY(장비id),
    CONSTRAINT 의료장비_fk FOREIGN KEY(업체id) references 공급업체(업체id),
    CONSTRAINT 장비사용_fk FOREIGN KEY(장비사용환자id) references 환자(환자id)
    );

CREATE TABLE 공급업체번호(
    업체id number(5,0) not null,
    전화번호 varchar2(15),
    CONSTRAINT 공급업체번호_pk2 PRIMARY KEY(전화번호),
    CONSTRAINT 공급업체번호_fk1 FOREIGN KEY(업체id) references 공급업체(업체id)
    );

CREATE TABLE 약(
    약품id number(5,0) not null,
    약품이름 varchar(30),
    제조회사 varchar(15),
    가격 number,
    유통기한 date,
    재고 number,
    CONSTRAINT 약_pk PRIMARY KEY(약품id)
    );

CREATE TABLE 약처방(
    환자id number(5,0) not null,
    약품id number(5,0) not null,
    처방날짜 date,
    CONSTRAINT 약처방_pk1 FOREIGN KEY(환자id) references 환자(환자id),
    CONSTRAINT 약처방_pk2 FOREIGN KEY(약품id) references 약(약품id)
    );

insert into 간호사 values (4001, '07/02/20', '김철용', '남',  '간병', '서울시 금천구 구각로16가길', '한신 빌라', '901111-111111', '010-3232-3434');
insert into 간호사 values (4002, '05/03/11', '김인권', '여', '진료', '울산시 익산구 익산로2나길', '푸르지오 501동', '891203-203333', '010-2334-2323');
insert into 간호사 values (4003, '08/04/22',  '김슬기','여',  '수술', '부산시 부천구 부천로4가길', '232-9 302호', '850303-201234', '010-1577-1577');
insert into 간호사 values (4004, '05/03/12',  '김하늬', '여', '간병', '서울시 관악구 관악로5나길', '11-1','860304-102023', '010-2323-1212');
insert into 간호사 values (4005, '09/09/12', '김유빈','남',  '진료', '서울시 성북구 성북로29가길', '아나길파크', '890402-102299', '010-4949-2929');
insert into 간호사 values (4006, '11/02/04', '김경현','남',  '간병', '서울시 노원구 노원로15다길', '아이파크 103호','900829-102132',  '010-3838-3232');
insert into 간호사 values (4007,  '14/03/22', '박민하', '여', '간병', '서울시 용산구 용산로2가길', '용두동아파트 306호','890101-105959', '010-9999-3333');
insert into 간호사 values (4008, '12/12/04', '최민아', '여', '진료', '서울시 북악동 북악로4가길', '스카이길 102호','931212-203939',  '010-2344-4324');
insert into 간호사 values (4009, '15/04/03',  '김민혁', '남', '수술', '제주시 우이동 우이로23가길', '239-4','921223-203039',  '010-2321-7765');
insert into 간호사 values (4010,  '17/9/29', '이아나',  '여', '간병', '서울시 도봉구 도봉로23가길', '11-92','941029-202323', '010-2323-4501');

insert into 의사 values(2001,'98-09-29','윤성우','남','인천광역시 미추홀구 인하로 24', '장미아파트 201동','650314-3049581','010-7312-1555');    
insert into 의사 values(2002,'02-01-23','김규연','남','서울시 노원구 노원로 22가길', '극동아파트 834동','730911-3453567','010-3456-4748');
insert into 의사 values(2003,'05-04-13','김지연','여','군포시 궁내동 고산로 6가길', '롯데아파트 934동','711203-2135237','010-2440-4234'); 
insert into 의사 values(2004,'05-12-01','이지수','여','서울시 강북구 강북로 11가길', '휴먼시아 339동','691101-2197777','010-3902-3945'); 
insert into 의사 values(2005,'06-10-08','이진수','남','서울시 서대문구 거북골로 12가길', '무궁화아파트 530동','800311-1290067','010-1256-3030'); 
insert into 의사 values(2006,'11-11-01','박규창','남','서울시 노원구 강북로 5가길', '가나아파트 490동','750811-1234567','010-9090-2233'); 
insert into 의사 values(2007,'13-04-19','김진우','남','서울시 서대문구 명지대길 5가길', '자이아파트 700동','670811-1234567','010-2355-3349'); 
insert into 의사 values(2008,'14-09-05','최예나','여','서울시 서대문구 명지대길 5가길', '자이아파트 702동','710811-2134655','010-1001-2141'); 
insert into 의사 values(2009,'15-11-10','황태희','여','안양시 비산동 비산로 10가길', '힐스테이트아파트 350동','840821-2134567','010-2030-4949'); 
insert into 의사 values(2010,'15-03-16','김지민','남','서울시 관악구 관악로 9가길', '한양아파트500동','730811-1234567','010-3450-4129'); 

INSERT INTO 환자 VALUES(5001, '마동식', '남', 'B', '서울시 노원구 노원로 532', '상계주공9단지 아파트 904동',
'010-2314-5634', '831213-1043464', 15300, '15/10/16', 4004, 2009);
INSERT INTO 환자 VALUES(5002, '한혜슬', '여', 'B', '서울시 용산구 용산로124', '용산아파트 117동', 
'010-4367-1236', '951213-2034124', 20000, '17/05/04', 4009, 2010);
INSERT INTO 환자 VALUES(5003, '한정민', '여', 'O', '서울시 강북구 삼양로19길 113', '삼성래미안 114동',
'010-8567-0345', '811213-2073459', 13500, '18/10/25', 4001, 2001);
INSERT INTO 환자 VALUES(5004, '김태미', '여', 'AB', '서울시 도봉구 방학로 193', '213-56', 
'010-3784-8456', '791213-224657', 54000, '19/11/20', 4002, 2002);
INSERT INTO 환자 VALUES(5005, '이숭재', '남', 'B', '서울시 강북구 인수봉로72길 4', '극동아파트 202동', 
'010-2346-9716', '401213-1947523', 5000, '19/12/14', 4003, 2005);
INSERT INTO 환자 VALUES(5006, '하정욱', '남', 'A', '서울시 노원구 노원로 526', '중계주공5단지 아파트 508동',
'010-1378-4172', '701213-1347458', 10500, '10/08/20', 4005, 2008);
INSERT INTO 환자 VALUES(5007, 'Chris Hemsworth', '남', 'B', '서울시 서대문구 거북골로34', '명지대학교 인문생활관', 
'016-7327-8224', '821213-1964212', 8900, '19/11/11', 4005, 2003);
INSERT INTO 환자 VALUES(5008, '전자현', '여', 'AB', '서울시 동대문구 답십리로 130', '래미안위브 305동', 
'010-5783-1357', '911213-2464574', 9000, '05/07/07', 4009, 2001);
INSERT INTO 환자 VALUES(5009, '나무니', '여', 'O', '서울시 강북구 삼양로19길 113', '벽산라이브파크 302동', 
'010-8271-2477', '471213-2041524', 7500, '19/01/20', 4006, 2006);
INSERT INTO 환자 VALUES(5010, '김경현', '여', 'O', '서울시 노원구 노원로 526', '장미아파트 205동', 
'010-3668-1392', '971213-1010101', 25300, '19/12/20', 4010, 2009);
INSERT INTO 환자 VALUES(5011, '홍은서', '여', 'A', '서울시 도봉구 방학로 26', '롯데캐슬 105동', 
'010-4773-1285', '971213-2020202', 15500, '19/12/20', 4003, 2007);
INSERT INTO 환자 VALUES(5012, '최윤정', '여', 'B', '서울시 관악구 관악로', '관악산휴먼시아 504동', 
'010-9230-5555', '961130-2030303', 18000, '19/12/20', 4003, 2003);
INSERT INTO 환자 VALUES(5013, '최우식', '남', 'AB', '서울시 강남구 테헤란로', '자이아파트 301동', 
'010-8462-5677', '891215-1035596', 23300, '19/12/24', 4001, 2006);
INSERT INTO 환자 VALUES(5014, 'Ariana Grande', '여', 'O', '서울시 용산구 녹사평대로 286', '이태원주공 132동', 
'010-7371-9000', '921215-2567636', 12500, '19/12/24', 4008, 2008);
INSERT INTO 환자 VALUES(5015, '이숙자', '여', 'O', '서울시 강북구 삼양로19길 113', '롯데캐슬 501동', 
'010-6278-4526', '400312-2516744', 3500, '19/12/24', 4003, 2010);
INSERT INTO 환자 VALUES(5016, '주지훈', '남', 'O', '서울시 강북구 삼양로14길 15', '행복빌라 102동', 
'010-1245-8452', '821101-1546833', 8000, '19/12/26', 4010, 2002);
INSERT INTO 환자 VALUES(5017, '전광렬', '남', 'A', '서울시 강북구 삼양로19길 113', '이태원주공 132동', 
'010-5632-1245', '560225-1204056', 14500, '19/12/27', 4002, 2004);

INSERT INTO 병실 VALUES(1350, 4, '입원동3층', '19/12/11', '김철용');
INSERT INTO 병실 VALUES(1351, 4, '입원동3층', '19/12/02', '김철용');
INSERT INTO 병실 VALUES(1352, 2, '입원동3층', '19/12/19', '김하늬');
INSERT INTO 병실 VALUES(1353, 2, '입원동3층', '19/12/10', '김경현');
INSERT INTO 병실 VALUES(1450, 6, '입원동4층', '19/12/18', '김경현');

INSERT INTO 입원환자 VALUES(5001, '19/10/28', '19/12/28', '김을주', '김민영', '010-2333-9898', 1350);
INSERT INTO 입원환자 VALUES(5003, '19/11/20', '19/12/10', '박의령', '박남용', '', 1350);
INSERT INTO 입원환자 VALUES(5005, '19/11/28', '19/12/15', '', '이가영', '010-2633-1325', 1351);
INSERT INTO 입원환자 VALUES(5006, '19/12/03', '19/12/29', '김기주', '이하영', '010-2612-3322', 1450);
INSERT INTO 입원환자 VALUES(5007, '19/12/10', '20/01/05', '한기주', '박이영', '010-3531-9778', 1352);
INSERT INTO 입원환자 VALUES(5014, '19/12/24', '20/01/10', '', 'Tom Holland', '010-3412-5211', 1352);
INSERT INTO 입원환자 VALUES(5015, '19/12/24', '20/12/31', '장기용', '황정민', '010-4678-8356', 1450);
INSERT INTO 입원환자 VALUES(5017, '19/12/26', '20/01/20', '이한솔', '최민식', '010-2457-5536', 1450);

INSERT INTO 예약 VALUES(10001, '김지민', '2019/12/29', TO_DATE('10:20', 'hh24:mi'), '진료', 5003);
INSERT INTO 예약 VALUES(10002, '김진우', '2019/12/29', TO_DATE('13:30', 'hh24:mi'), '수술', 5005);
INSERT INTO 예약 VALUES(10003, '박규창', '2019/12/30', TO_DATE('10:50', 'hh24:mi'), '진료', 5001);
INSERT INTO 예약 VALUES(10004, '이지수', '2019/12/30', TO_DATE('11:20', 'hh24:mi'), '진료', 5004);
INSERT INTO 예약 VALUES(10005, '박규창', '2019/12/30', TO_DATE('14:40', 'hh24:mi'), '수술', 5011);
INSERT INTO 예약 VALUES(10006, '최예나', '2020/01/05', TO_DATE('18:00', 'hh24:mi'), '수술', 5003);
INSERT INTO 예약 VALUES(10007, '강덕구', '2020/01/05', TO_DATE('14:50', 'hh24:mi'), '수술', 5006);
INSERT INTO 예약 VALUES(10008, '이진수', '2020/01/08', TO_DATE('09:50', 'hh24:mi'), '진료', 5009);
INSERT INTO 예약 VALUES(10009, '김규연', '2020/01/20', TO_DATE('15:00', 'hh24:mi'), '진료', 5012);
INSERT INTO 예약 VALUES(10010, '최예나', '2020/02/13', TO_DATE('15:40', 'hh24:mi'), '수술', 5007);
        
insert into 공급업체 values (3001,'제일','서울시 강북구','곽철용');
insert into 공급업체 values (3002,'현대','서울시 강남구','최민용');
insert into 공급업체 values (3003,'동아','서울시 강서구','나문희');
insert into 공급업체 values (3004,'완성','서울시 강북구','정준하');
insert into 공급업체 values (3005,'하나','서울시 강남구','박해미');
insert into 공급업체 values (3006,'모모','서울시 서대문구','서민정');
insert into 공급업체 values (3007,'나나','서울시 마포구','이순재');
insert into 공급업체 values (3008,'번개','서울시 강북구','이윤호');
insert into 공급업체 values (3009,'행복','서울시 마포구','김범');
insert into 공급업체 values (3010,'행운','서울시 강북구','황찬성');

insert into 의료장비 values(1,'제세동기',1540000,202, '2019-04-21','2011-10-02',3001, 5004);       
insert into 의료장비 values(2,'인공호흡기',87000,104,'2016-04-11','2013-11-22',3002, 5002);  
insert into 의료장비 values(3,'xray',273000000,304,'2018-12-18','2009-10-02',3003, 5001);       
insert into 의료장비 values(4,'xray',254000000,305,'2019-04-11','2015-10-02',3004, 5005);       
insert into 의료장비 values(5,'인공호흡기',87000,101,'2018-12-01','2000-10-02',3002, 5006);       
insert into 의료장비 values(6,'ct',27300000,202,'2011-11-21','2004-10-02',3001, 5008);    
insert into 의료장비 values(7,'제세동기',1540000,202,'2017-04-11','2002-10-02',3009, 5010);       
insert into 의료장비 values(8,'휠체어',160000,102,'2013-05-15','2004-10-02',3008, 5003);       
insert into 의료장비 values(9,'휠체어',160000,102,'2016-11-11','2010-11-19',3010, 5012);       
insert into 의료장비 values(10,'휠체어',160000,302,'','2018-10-02',3005, 5002);  

INSERT INTO 공급업체번호 VALUES(3001, '010-3425-9123');
INSERT INTO 공급업체번호 VALUES(3001, '02-6412-3941');
INSERT INTO 공급업체번호 VALUES(3002, '010-6010-4911');
INSERT INTO 공급업체번호 VALUES(3003, '010-4131-1116');
INSERT INTO 공급업체번호 VALUES(3003, '016-2341-6231');
INSERT INTO 공급업체번호 VALUES(3004, '010-9734-9625');
INSERT INTO 공급업체번호 VALUES(3004, '010-5631-9134');
INSERT INTO 공급업체번호 VALUES(3005, '010-9456-1134');
INSERT INTO 공급업체번호 VALUES(3005, '02-2346-3451');
INSERT INTO 공급업체번호 VALUES(3006, '010-2782-6621');
INSERT INTO 공급업체번호 VALUES(3006, '010-8345-3411');
INSERT INTO 공급업체번호 VALUES(3006, '070-2677-3006');
INSERT INTO 공급업체번호 VALUES(3007, '010-0341-7923');
INSERT INTO 공급업체번호 VALUES(3007, '02-3900-5081');
INSERT INTO 공급업체번호 VALUES(3008, '02-9344-9934');
INSERT INTO 공급업체번호 VALUES(3009, '02-1259-8529');
INSERT INTO 공급업체번호 VALUES(3010, '010-7345-6921');
INSERT INTO 공급업체번호 VALUES(3010, '02-6632-3591');
INSERT INTO 공급업체번호 VALUES(3010, '070-7311-5913');

insert into 약 values(5001, 'cor12', '동아', 16000, '20-01-20', 38);
insert into 약 values(5002, 'aka23', '한화', 23000, '19-12-30', 12);
insert into 약 values(5003, 'kae31', '동일', 40000, '20-12-30', 3);
insert into 약 values(5004, 'moll3', '로운', 23000, '20-01-04', 50);
insert into 약 values(5005, 'zora11', '동아', 21000, '20-03-11', 60);
insert into 약 values(5006, 'aiwl01', '제일', 13000, '23-03-20', 6);
insert into 약 values(5007, 'lkid22', '러일', 23000, '20-01-04', 2);
insert into 약 values(5008, 'losop1', '국민', 13000, '21-12-04', 18);
insert into 약 values(5009, 'kakod0', '제일', 29000, '20-04-02', 10);
insert into 약 values(5010, 'sdfo2', '조양', 18000, '20-07-03', 18);

insert into 약처방 values(5004, 5006, '19/08/28');
insert into 약처방 values(5012, 5009, '19/08/28');
insert into 약처방 values(5007, 5004, '19/10/28');
insert into 약처방 values(5003, 5003, '19/10/28');
insert into 약처방 values(5008, 5007, '19/11/03');
insert into 약처방 values(5009, 5002, '19/09/04');
insert into 약처방 values(5010, 5002, '19/11/03');
insert into 약처방 values(5005, 5003, '19/11/24');
insert into 약처방 values(5001, 5008, '19/12/05');
insert into 약처방 values(5004, 5010, '19/12/10');