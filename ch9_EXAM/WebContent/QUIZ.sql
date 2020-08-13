-- Drop table QUIZ;
--  문제와 보기를 저장하기 위한 테이블 
Create Table QUIZ
(
  Q_NUM int primary key,
  Q_QUESTION varchar2(200) ,  -- 문제
  Q_TYPE varchar2(5) ,   
     -- TT (문제 T 보기 T ) , TI (문제 T 보기 I )  , IT (문제 I 보기 T )
  Q_IMAGE varchar2(50) , 
  Q_EX1 varchar2(100) ,     --  보기
  Q_EX2 varchar2(100) ,     --  보기
  Q_EX3 varchar2(100) ,     --  보기
  Q_EX4 varchar2(100) ,     --  보기
  Q_ANSWER varchar2(100)    --  정답
 );
 
 Create SEQUENCE auto_increase INCREMENT BY 1 START WITH 1 MINVALUE 1;
-- SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'auto_increase;


-- select * from QUIZ order by Q_NUM asc;
--  delete from QUIZ where Q_NUM=5;
    -- Drop table SCORE;
 

--[1] Create 문    점수 저장하기 위한 테이블
Create Table SCORE
(
  S_NUM varchar2(100)  primary key,   --  학번
  S_Name varchar2(100) ,              --  이름
  S_GRADE varchar2(10) ,              --  점수
  Q_INDATE   date default sysdate    -- 시험날짜
);

-- SELECT * FROM SCORE;
-- delete from score where S_NUM=201601594;
SELECT S_NUM FROM SCORE WHERE S_NUM=201601594
-- Drop table SCORE;


Insert into SCORE(S_NUM, S_NAME, S_GRADE, Q_INDATE) values()
 
DROP SEQUENCE auto_increase;
Create SEQUENCE auto_increase INCREMENT BY 1 START WITH 2 MINVALUE 1;
ALTER SEQUENCE auto_increase INCREMENT BY 1;
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(1, '1+1= ? ', 'TT', '1', '2', '3', '4', '2');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+2= ? ', 'TT', '1', '2', '3', '4', '3');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+3= ? ', 'TT', '1', '2', '3', '4', '4');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+4= ? ', 'TT', '5', '6', '7', '8', '5');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+5= ? ', 'TT', '5', '6', '7', '8', '6');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+6= ? ', 'TT', '5', '6', '7', '8', '7');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+7= ? ', 'TT', '5', '6', '7', '8', '8');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '1+8= ? ', 'TT', '6', '7', '8', '9', '9');
Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, '다음중 박명수는 ?', 'TI', 'pa.jpg','yu.jpg', 'so.jpg', 'ca.jpg', 'pa.jpg');
Insert into QUIZ Values(auto_increase.NEXTVAL, '다음 순서도 그림은 제어문 중에서 어느 것을 나타내는가 ?  <br> <img src="image/while.jpg" ', 'TT',NULL, 'for 문', 'do - while 문', 'while 문', 'if 문', 'while 문');
   
-- SELECT * FROM quiz;
-- DROP TABLE quiz;

commit