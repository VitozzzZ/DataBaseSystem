/*****
1.等值与非等值连接查询,自然连接
2.自身连接
3.外连接
4.多表连接(3个表以上的连接)
*****/


/*1.等值与非等值连接查询的WHERE语句
[<表名1>.]<列名><比较运算符>[<表名2>.]<列名> =,>,<,>=,<=,!=;
[<表名1>.]<列名>BETWEEN[<表名2>.]<列名1>AND[<表名2>.]<列名2>
*/
/*查询每个学生及其选修课程的情况 
首先在表Student中找到第一个元组，然后从头开始扫描SC表，逐一查找与Student第一个元组的Sno相等的SC元组
找完之后就将Student中的第一个元组与该元组拼接起来，如果在SC表Sno上建立了索引，就不用每次全表扫描SC表了*/
SELECT Student.*,SC.*;
FROM Student,SC;
WHERE Student.Sno=SC.Sno;
/*若在等值连接中将目标列中重复的属性列去掉则为自然连接*/
SELECT Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade;
FROM Student,SC;
WHERE Student.Sno=SC.Sno;
/*查询选修2号课程且成绩在90分以上的所有学生的学号和姓名*/
SELECT Student.Sno,Sname;
FROM Student,SC;
WHERE Student.Sno=SC.Sno AND SC.Cno='2' AND SC.Grade>90;

/*2.自身连接*/
/*查询每一门课先修课的先修课*/
/*为Course表取二个别名 FIRST,SECOND*/
SELECT FIRST.Cno,SECOND.Cpno;
FROM Course FIRST,Course SECOND;
WHERE FIRST.Cpno=SECOND.Cno;

/*3.外连接 p102看书*/
SELECT Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade;
FROM Student LEFT OUTER JOIN SC ON(Student.Sno=SC.Sno);










