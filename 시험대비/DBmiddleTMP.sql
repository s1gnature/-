CREATE TABLE 꽃(
    꽃ID VARCHAR(10) not null,
    꽃이름 VARCHAR(20) not null,
    가격 INT,
    PRIMARY KEY(꽃ID)
);
CREATE TABLE 고객(
    고객ID VARCHAR(10) not null,
    이름 VARCHAR(20) not null,
    주소 VARCHAR(20) not null,
    PRIMARY KEY(고객ID)
);
CREATE TABLE 주문(
    주문번호 VARCHAR(10) NOT NULL,
    꽃ID VARCHAR(10) NOT NULL,
    고객ID VARCHAR(10) NOT NULL,
    수량 INT,
    판매날짜 VARCHAR(20) NOT NULL,
    FOREIGN KEY(꽃ID) REFERENCES 꽃(꽃ID),
    FOREIGN KEY(고객ID) REFERENCES 고객(고객ID),
    PRIMARY KEY(주문번호)
);

insert into 꽃 values('17', 'Spray Roses', 1900);
insert into 꽃 values('32', 'Sunflower', 4400);
insert into 꽃 values('43', 'Love''s First Bloom', 3500);

insert into 고객 values('1010', 'S.Brass', 'Pittsburgh, PA');
insert into 고객 values('3005', 'Romeo', 'Lexington, KY');
insert into 고객 values('2002', 'Juliet', 'Norman, OK');

insert into 주문 values('27010', '43', '1010', 45 , '2020-03-01');
insert into 주문 values('27011', '43', '3005', 30 , '2020-03-15');
insert into 주문 values('27012', '43', '1010', 16 , '2020-04-07');
insert into 주문 values('27013', '17', '1010', 33 , '2020-07-10');

create view new_table(주문번호, 꽃이름, 고객이름, 고객주소)
as select distinct 주문번호, 꽃이름, 이름, 주소
from 주문, 꽃, 고객
where 주문."꽃ID"=꽃."꽃ID" and 주문."고객ID"=고객."고객ID"

select * from new_table

drop view new_table;


select 주소
from 주문, 고객
where 꽃ID='43' and 주문."고객ID"=고객."고객ID"
group by 주소


select 이름
from 고객
where 고객ID not in (
    select 고객ID
    from 주문
    group by 고객ID HAVING COUNT(*) >= 2
);

select 꽃이름, 가격 * 15 as 구매가격
from 꽃
where 꽃이름 like 'S%';

select 꽃이름, 수량
from 주문, 꽃
where 주문."판매날짜" >= '2020-03-15' and 주문."꽃ID"=꽃."꽃ID"
group by 꽃이름


SELECT 꽃이름, SUM(수량)
FROM (SELECT 꽃이름, 수량
        FROM 주문,꽃
        WHERE 주문.판매날짜 >= '2020-03-15' and 주문.꽃ID=꽃.꽃ID)
GROUP BY 꽃이름;

CREATE TABLE 학생 (
    학번 VARCHAR(20) NOT NULL,
    이름 VARCHAR(10),
    학과 VARCHAR(20),
    PRIMARY KEY(학번)
);

CREATE TABLE 교수 (
    교수번호 CHAR(4) NOT NULL,
    이름 VARCHAR(10),
    학과 VARCHAR(20),
    PRIMARY KEY(교수번호)
);

CREATE TABLE 과목 (
    과목번호 CHAR(4) NOT NULL,
    과목명 VARCHAR(20),
    교수번호 CHAR(4) NOT NULL,
    학점 INT,
    PRIMARY KEY(과목번호,교수번호),
    FOREIGN KEY(교수번호) REFERENCES 교수(교수번호)
);

CREATE TABLE 수강 (
    학번 VARCHAR(20) NOT NULL,
    과목번호 CHAR(4) NOT NULL,
    교수번호 CHAR(4) NOT NULL,
    성적 CHAR(2),
    FOREIGN KEY(과목번호,교수번호) REFERENCES 과목(과목번호,교수번호),
    FOREIGN KEY(학번) REFERENCES 학생(학번),
    PRIMARY KEY(학번,과목번호)
);

drop table 수강;
drop table 과목;
drop table 교수;
drop table 학생;

insert into 학생 values('20160001', '김씨', '컴퓨터공학부');
insert into 학생 values('20170001', '이씨', '컴퓨터공학부');
insert into 학생 values('20180001', '박씨', '컴퓨터공학부');
insert into 교수 values('1000', '김교수', '컴퓨터공학부');
insert into 교수 values('2000', '최교수', '컴퓨터공학부');
insert into 교수 values('3000', '오교수', '컴퓨터공학부');
insert into 과목 values('1111', 'C기초', '1000', 2);
insert into 과목 values('2222', '자바기초', '2000', 2);
insert into 과목 values('3333', '데이터베이스', '3000', 3);
insert into 과목 values('4444', '캡스톤디자인', '3000', 1);
insert into 수강 values('20160001', '3333', '3000', 'A+');
insert into 수강 values('20160001', '2222', '2000', 'B');
insert into 수강 values('20160001', '4444', '3000', 'A+');
insert into 수강 values('20170001', '1111', '1000', 'C');
insert into 수강 values('20180001', '2222', '2000', 'D');

select distinct 학생."이름" as 학생이름, 교수."이름" as 교수이름
from 학생, 교수
where 학생."이름" like '김%' and 교수."이름" like '김%'

select 이름, 과목명, 학점, 성적
from 학생, 수강, 과목
where 학생."이름" like '김%' and 학생."학번"=수강."학번" and 수강."과목번호"=과목."과목번호"


select *
from (
select 학생."이름", 학과, 성적
from 학생, 수강
where 학생."학번"=수강."학번" and 수강.성적='A+'
)
where having count(성적) >= 2

update 과목
set 학점=2
where 교수번호 in(
    select 교수번호
    from 과목
    group by 교수번호 HAVING COUNT(*)>=2
);
select * from 과목;
