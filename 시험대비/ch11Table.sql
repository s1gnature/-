create view 우수고객(고객아이디,  고객이름, 나이)
as select 고객아이디, 고객이름, 나이
from 고객
where 등급='vip'
with check option;

select * from 우수고객;
drop view 우수고객;

create view 업체별제품수(제조업체명, 제품수)
as select 제조업체, COUNT(*)
from 제품
group by 제조업체
with check option;

select * from 업체별제품수;
select * from 제품;
drop view 업체별제품수

select 환자번호, 환자이름
from 환자
where 담당의사='D001' and 나이>=30;

create view 평균근무연수(소속,평균근무연수)
as select 소속,AVG(근무연수)
from 의사
group by 소속
with check option;
select * from 평균근무연수;



select 의사이름,소속,근무연수
from 의사
where 의사번호=(
    select 담당의사
    from 환자
    where 환자이름='김용욱'
)









