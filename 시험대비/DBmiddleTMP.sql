CREATE TABLE ��(
    ��ID VARCHAR(10) not null,
    ���̸� VARCHAR(20) not null,
    ���� INT,
    PRIMARY KEY(��ID)
);
CREATE TABLE ��(
    ��ID VARCHAR(10) not null,
    �̸� VARCHAR(20) not null,
    �ּ� VARCHAR(20) not null,
    PRIMARY KEY(��ID)
);
CREATE TABLE �ֹ�(
    �ֹ���ȣ VARCHAR(10) NOT NULL,
    ��ID VARCHAR(10) NOT NULL,
    ��ID VARCHAR(10) NOT NULL,
    ���� INT,
    �Ǹų�¥ VARCHAR(20) NOT NULL,
    FOREIGN KEY(��ID) REFERENCES ��(��ID),
    FOREIGN KEY(��ID) REFERENCES ��(��ID),
    PRIMARY KEY(�ֹ���ȣ)
);

insert into �� values('17', 'Spray Roses', 1900);
insert into �� values('32', 'Sunflower', 4400);
insert into �� values('43', 'Love''s First Bloom', 3500);

insert into �� values('1010', 'S.Brass', 'Pittsburgh, PA');
insert into �� values('3005', 'Romeo', 'Lexington, KY');
insert into �� values('2002', 'Juliet', 'Norman, OK');

insert into �ֹ� values('27010', '43', '1010', 45 , '2020-03-01');
insert into �ֹ� values('27011', '43', '3005', 30 , '2020-03-15');
insert into �ֹ� values('27012', '43', '1010', 16 , '2020-04-07');
insert into �ֹ� values('27013', '17', '1010', 33 , '2020-07-10');

create view new_table(�ֹ���ȣ, ���̸�, ���̸�, ���ּ�)
as select distinct �ֹ���ȣ, ���̸�, �̸�, �ּ�
from �ֹ�, ��, ��
where �ֹ�."��ID"=��."��ID" and �ֹ�."��ID"=��."��ID"

select * from new_table

drop view new_table;


select �ּ�
from �ֹ�, ��
where ��ID='43' and �ֹ�."��ID"=��."��ID"
group by �ּ�


select �̸�
from ��
where ��ID not in (
    select ��ID
    from �ֹ�
    group by ��ID HAVING COUNT(*) >= 2
);

select ���̸�, ���� * 15 as ���Ű���
from ��
where ���̸� like 'S%';

select ���̸�, ����
from �ֹ�, ��
where �ֹ�."�Ǹų�¥" >= '2020-03-15' and �ֹ�."��ID"=��."��ID"
group by ���̸�


SELECT ���̸�, SUM(����)
FROM (SELECT ���̸�, ����
        FROM �ֹ�,��
        WHERE �ֹ�.�Ǹų�¥ >= '2020-03-15' and �ֹ�.��ID=��.��ID)
GROUP BY ���̸�;

CREATE TABLE �л� (
    �й� VARCHAR(20) NOT NULL,
    �̸� VARCHAR(10),
    �а� VARCHAR(20),
    PRIMARY KEY(�й�)
);

CREATE TABLE ���� (
    ������ȣ CHAR(4) NOT NULL,
    �̸� VARCHAR(10),
    �а� VARCHAR(20),
    PRIMARY KEY(������ȣ)
);

CREATE TABLE ���� (
    �����ȣ CHAR(4) NOT NULL,
    ����� VARCHAR(20),
    ������ȣ CHAR(4) NOT NULL,
    ���� INT,
    PRIMARY KEY(�����ȣ,������ȣ),
    FOREIGN KEY(������ȣ) REFERENCES ����(������ȣ)
);

CREATE TABLE ���� (
    �й� VARCHAR(20) NOT NULL,
    �����ȣ CHAR(4) NOT NULL,
    ������ȣ CHAR(4) NOT NULL,
    ���� CHAR(2),
    FOREIGN KEY(�����ȣ,������ȣ) REFERENCES ����(�����ȣ,������ȣ),
    FOREIGN KEY(�й�) REFERENCES �л�(�й�),
    PRIMARY KEY(�й�,�����ȣ)
);

drop table ����;
drop table ����;
drop table ����;
drop table �л�;

insert into �л� values('20160001', '�达', '��ǻ�Ͱ��к�');
insert into �л� values('20170001', '�̾�', '��ǻ�Ͱ��к�');
insert into �л� values('20180001', '�ھ�', '��ǻ�Ͱ��к�');
insert into ���� values('1000', '�豳��', '��ǻ�Ͱ��к�');
insert into ���� values('2000', '�ֱ���', '��ǻ�Ͱ��к�');
insert into ���� values('3000', '������', '��ǻ�Ͱ��к�');
insert into ���� values('1111', 'C����', '1000', 2);
insert into ���� values('2222', '�ڹٱ���', '2000', 2);
insert into ���� values('3333', '�����ͺ��̽�', '3000', 3);
insert into ���� values('4444', 'ĸ���������', '3000', 1);
insert into ���� values('20160001', '3333', '3000', 'A+');
insert into ���� values('20160001', '2222', '2000', 'B');
insert into ���� values('20160001', '4444', '3000', 'A+');
insert into ���� values('20170001', '1111', '1000', 'C');
insert into ���� values('20180001', '2222', '2000', 'D');

select distinct �л�."�̸�" as �л��̸�, ����."�̸�" as �����̸�
from �л�, ����
where �л�."�̸�" like '��%' and ����."�̸�" like '��%'

select �̸�, �����, ����, ����
from �л�, ����, ����
where �л�."�̸�" like '��%' and �л�."�й�"=����."�й�" and ����."�����ȣ"=����."�����ȣ"


select *
from (
select �л�."�̸�", �а�, ����
from �л�, ����
where �л�."�й�"=����."�й�" and ����.����='A+'
)
where having count(����) >= 2

update ����
set ����=2
where ������ȣ in(
    select ������ȣ
    from ����
    group by ������ȣ HAVING COUNT(*)>=2
);
select * from ����;
