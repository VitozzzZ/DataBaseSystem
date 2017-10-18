/*****
SELECT[ALL|DISTINCT]<目标列表达式>[,<目标列表达式>]...
FROM<表名或视图名>[,<表名或视图名>...]|(<SELECT语句>)[AS]<别名>
[WHERE<条件表达式>]
[GROUP BY<列名1>[HAVING<条件表达式>]]
[ORDER BY<列名2>[ASC|DESC]];
*****/
/*
1.选择表中的若干列
  (1)查询指定列
  (2)查询全部列
  (3)查询经过计算的值
2.选择表中的若干元组
  (1)消除取值重复的行
  (2)查询满足条件的元组
     ①比较大小
     ②确定范围
     ③确定集合
     ④字符匹配
     ⑤涉及空值的查询
     ⑥多重条件查询
3.ORDER BY
4.聚集函数
5.GROUP BY
*/
/*1.(1)*/
SELECT Sname,Sno,Sdept
FROM Student
/*1.(2)*/
SELECT *
FROM Student
/*1.(3)*/
SELECT Sname,2014-Sage
FROM Student

SELECT Sname NAME,'Year of Birth:' BIRTH,2017-Sage BIRTHDAY,LOWER(Sdept)DEPARTMENT;
FROM STUDENT;   /*P91下面表*/
/*2.(1)*/
SELECT DISTINCT Sno;
FROM SC;
/*2.(2).①比较大小*/
/*查询考试成绩不及格的学生的学号*/
SELECT DISTINCT Sno;
FROM SC;
WHERE Grade<60;
/*2.(2).②确定范围*/
/*查询年龄在20~23岁（包括20岁和23岁）之间的学生的姓名，系别和年龄*/
SELECT Sname,Sdept,Sage;
FROM Student;
WHERE Sage BETWEEN 20 AND 23;
/*查询年龄不在20~23岁（包括20岁和23岁）之间的学生的姓名，系别和年龄*/
SELECT Sname,Sdept,Sage;
FROM Student;
WHERE Sage NOT BETWEEN 20 AND 23;
/*2.(2).③确定集合*/
/*查询CS,MA,IS系学生的姓名和性别*/
SELECT Sname,Ssex;
FROM Sdudent;
WHERE Sdept IN('CS','MA','IS');
/*查询不是CS,MA,IS系学生的姓名和性别*/
SELECT Sname,Ssex;
FROM Sdudent;
WHERE Sdept NOT IN('CS','MA','IS');
/*2.(2).④字符匹配*/
/****[NOT]LIKE'<匹配串>'[ESCAPE'<换码字符>']
关键字 %，_ , \  ****/
/*查询性欧阳且全名为三个汉字的学生的姓名*/
SELECT Sname;
FROM Student;
WHERE Sname LIKE'欧阳_';
/*查询名字中第二个字为阳的学生的姓名*/
SELECT Sname;
FROM Student;
WHERE Sname LIKE'_阳%';
/*查询DB_Design课程的课程号与学分*/
SELECT Cno,Ccredit;
FROM Course;
WHERE Cname LIKE'DB\_Design' ESCAPE'\';
/*2.(2). ⑤涉及空值的查询*/
IS NULL,IS NOT NULL
/*2.(2).⑥多重条件查询*/
OR AND























