create table 학생 (
    학번 int not null,
    이름 varchar(20),
    학년 int,
    primary key (학번)
)
create table 과목 (
    과목번호 varchar(10) not null,
    과목이름 varchar(20),
    primary key (과목번호)
)
create table 수강 (
    학번 int not null,
    과목번호 varchar(10) not null,
    중간성적 int,
    기말성적 int,
    학점 varchar(10),
    foreign key (학번) references 학생(학번),
    foreign key (과목번호) references 과목(과목번호)
)
insert into 과목 values('L001', '데이터베이스');
insert into 과목 values('L005', '웹프로그래밍');
insert into 과목 values('L041', '데이터통신');
insert into 과목 values('J099', '자바기초');
insert into 과목 values('J022', 'C언어기초');
insert into 학생 values(20200001, '둘리', 1);
insert into 학생 values(20190002, '하니', 2);
insert into 학생 values(20180003, '고길동', 3);
insert into 학생 values(20170004, '뽀로로', 4);
insert into 학생 values(20160005, '슛돌이', 3);
insert into 수강 values(20160005, 'L001', 91, 25, 'B');
insert into 수강 values(20170004, 'L005', 95, 95, 'A+');
insert into 수강 values(20180003, 'L041', 90, 93, 'A');
insert into 수강 values(20190002, 'J099', 80, 80, 'B');
insert into 수강 values(20200001, 'J022', 71, 25, 'C');
insert into 수강 values(20160005, 'L005', 99, 99, 'A+');

drop table 수강;
drop table 학생;
drop table 과목;

delete 수강;
delete 학생;
delete 과목;

create view L기말
as select 학생.이름,수강.기말성적
from 학생,수강
where 학생.학번=수강.학번 and 과목번호 like 'L%' and 중간성적>=90
with check option;

select * from L기말 order by "이름" ASC, "기말성적" DESC;

drop view L기말;

create view S_avg(학생수, 성적평균)
as select count(중간성적), avg(중간성적)
from 수강
group by 과목번호
with check option;

select * from S_avg where 학생수 >= 2;
drop view S_avg;

select count(*) from (select 과목번호 from 수강 group by 과목번호);

select 학생."이름", 학생."학년", 과목번호
from 학생, 수강
where exists (
    select * from 수강
    where 과목번호 != 'L001'
) and 학생.학번 = 수강.학번

select 학생."이름", 학생."학년"
from 학생, 수강
where 과목번호 != 'L001' and exists (
    select 과목번호 from 수강
) and 학생.학번 = 수강.학번
