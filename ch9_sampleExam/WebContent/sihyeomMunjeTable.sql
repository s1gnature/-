Create Table sihyeomMunje
(
  munje_num int  primary key,
  munje varchar2(200) ,  -- ����
  munje_type varchar2(5) ,   
     -- TT (���� T ���� T ) , TI (���� T ���� I )  , IT (���� I ���� T )
  munje_image varchar2(50) , 
  bogi1 varchar2(100) ,   --  ���� 1
  bogi2 varchar2(100) ,    --  ���� 2
  bogi3 varchar2(100) ,   --  ���� 3
  bogi4 varchar2(100) ,   --  ���� 4
  dap varchar2(100)    --  ����
   ); 
-- select * from sihyeomMunje  

    Insert  into sihyeomMunje(munje_num, munje, munje_type, bogi1, bogi2, bogi3, bogi4, dap) Values
(1, '���� �� 1 + 1��   ?', 'TT', '��<br>', '��<br>', '��<br>','��<br>','��<br>');
Insert  into sihyeomMunje(munje_num, munje, munje_type, bogi1, bogi2, bogi3, bogi4, dap) Values
(2, '���� �� 1 + 2��   ?', 'TT', '��<br>', '��<br>', '��<br>','��<br>','��<br>');
Insert  into sihyeomMunje(munje_num, munje, munje_type, bogi1, bogi2, bogi3, bogi4, dap) Values
(3, '���� �� 1 + 3�� ?', 'TT', '��<br>', '��<br>', '��<br>','��<br>','��<br>');
Insert  into sihyeomMunje(munje_num, munje, munje_type, bogi1, bogi2, bogi3, bogi4, dap) Values
(4, '���� �� 1 + 4�� ?', 'TT', '��<br>', '��<br>', '��<br>','��<br>','��<br>');
Insert  into sihyeomMunje(munje_num, munje, munje_type, bogi1, bogi2, bogi3, bogi4, dap) Values
(5, '���� �� 1 + 5�� ?', 'TT', '��<br>', '��<br>', '��<br>','��<br>','��<br>');
