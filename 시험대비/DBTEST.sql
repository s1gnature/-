create table �л� (
    �й� int not null,
    �̸� varchar(20),
    �г� int,
    primary key (�й�)
)
create table ���� (
    �����ȣ varchar(10) not null,
    �����̸� varchar(20),
    primary key (�����ȣ)
)
create table ���� (
    �й� int not null,
    �����ȣ varchar(10) not null,
    �߰����� int,
    �⸻���� int,
    ���� varchar(10),
    foreign key (�й�) references �л�(�й�),
    foreign key (�����ȣ) references ����(�����ȣ)
)
insert into ���� values('L001', '�����ͺ��̽�');
insert into ���� values('L005', '�����α׷���');
insert into ���� values('L041', '���������');
insert into ���� values('J099', '�ڹٱ���');
insert into ���� values('J022', 'C������');
insert into �л� values(20200001, '�Ѹ�', 1);
insert into �л� values(20190002, '�ϴ�', 2);
insert into �л� values(20180003, '��浿', 3);
insert into �л� values(20170004, '�Ƿη�', 4);
insert into �л� values(20160005, '������', 3);
insert into ���� values(20160005, 'L001', 91, 25, 'B');
insert into ���� values(20170004, 'L005', 95, 95, 'A+');
insert into ���� values(20180003, 'L041', 90, 93, 'A');
insert into ���� values(20190002, 'J099', 80, 80, 'B');
insert into ���� values(20200001, 'J022', 71, 25, 'C');
insert into ���� values(20160005, 'L005', 99, 99, 'A+');

drop table ����;
drop table �л�;
drop table ����;

delete ����;
delete �л�;
delete ����;

create view L�⸻
as select �л�.�̸�,����.�⸻����
from �л�,����
where �л�.�й�=����.�й� and �����ȣ like 'L%' and �߰�����>=90
with check option;

select * from L�⸻ order by "�̸�" ASC, "�⸻����" DESC;

drop view L�⸻;

create view S_avg(�л���, �������)
as select count(�߰�����), avg(�߰�����)
from ����
group by �����ȣ
with check option;

select * from S_avg where �л��� >= 2;
drop view S_avg;

select count(*) from (select �����ȣ from ���� group by �����ȣ);

select �л�."�̸�", �л�."�г�", �����ȣ
from �л�, ����
where exists (
    select * from ����
    where �����ȣ != 'L001'
) and �л�.�й� = ����.�й�

select �л�."�̸�", �л�."�г�"
from �л�, ����
where �����ȣ != 'L001' and exists (
    select �����ȣ from ����
) and �л�.�й� = ����.�й�
