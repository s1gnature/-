create view �����(�����̵�,  ���̸�, ����)
as select �����̵�, ���̸�, ����
from ��
where ���='vip'
with check option;

select * from �����;
drop view �����;

create view ��ü����ǰ��(������ü��, ��ǰ��)
as select ������ü, COUNT(*)
from ��ǰ
group by ������ü
with check option;

select * from ��ü����ǰ��;
select * from ��ǰ;
drop view ��ü����ǰ��

select ȯ�ڹ�ȣ, ȯ���̸�
from ȯ��
where ����ǻ�='D001' and ����>=30;

create view ��ձٹ�����(�Ҽ�,��ձٹ�����)
as select �Ҽ�,AVG(�ٹ�����)
from �ǻ�
group by �Ҽ�
with check option;
select * from ��ձٹ�����;



select �ǻ��̸�,�Ҽ�,�ٹ�����
from �ǻ�
where �ǻ��ȣ=(
    select ����ǻ�
    from ȯ��
    where ȯ���̸�='����'
)









