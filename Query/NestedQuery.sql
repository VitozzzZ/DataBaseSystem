/*
1.带有IN谓词的子查询
2.带有比较运算符的子查询
3.带有ANY(SOME)或ALL谓词的子查询
4.带有EXISTS谓词的子查询
*/


/*1.带有IN谓词的子查询*/

/*查询与“刘晨”在同一个系学习的学生*/
SELECT Sno,Sname,Sdept
FROM Student
WHERE Sdept IN  /*若一个学生只可能在一个系，可用=代替IN*/
     (SELECT Sdept
      FROM Student
      WHERE Sname='刘晨');
      
SELECT S1.Sno,S1.Sname,S1.Sdept   /*解法2 自身连接*/
FROM Student S1,StudentS2
WHERE S1.Sdept=S2.Sdept AND S2.Sname='刘晨';

/*查询选修了课程名为“信息系统”的学生学号和姓名*/
SELECT Sno,Sname
FROM Student
WHERE Sno IN
     (SELECT Sno
      FROM SC
      WHERE Cno IN
           (SELECT Cno
            FROM Course
            WHERE Cname='信息系统')
     );
     
SELECT Student.Sno,Sname  /*解法2*/
FROM Student,SC,Course
WHERE Student.Sno=SC.Sno AND SC.Cno=Course.Cno AND Course.Cname='信息系统';

/*2.带有比较运算符的子查询*/

/*找出每个学生超过他自己选修课程平均成绩的课程号*/
SELECT Sno,Cno
FROM SC x     /*元组变量，可以用来表示SC表的一个元组*/
WHERE Grade>=(SELECT AVG(Grade)
              FROM SC y
              WHERE y.Sno=x.Sno);/*相关子查询*/

/*3.带有ANY(SOME)或ALL谓词的子查询 >ANY大于子查询结果中的某个值 >ALL大于子查询中的所有值*/
/*查询非计算机科学系中比计算机科学系任意一个学生年龄小的学生姓名和年龄*/
SELECT Sname,Sage
FROM Student
WHERE Sage<ANY(SELECT Sage
               FROM Student
               WHERE Sdept='CS')
AND Sdept<>'CS';

SELECT Sname,Sage
FROM Student
WHERE Sage<(SELECT MAX(Sage) /*解法2*/
            FROM Student
            WHERE Sdept='CS')
AND Sdept<>'CS';

/*4.带有EXISTS谓词的子查询*/
/*查询所有选修了1号课程的学生姓名*/
SELECT Sname
FROM Student
WHERE EXISTS
     (SELECT *
      FROM SC
      WHERE Sno=Student.Sno AND Cno='1');
/*关于EXISTS看懂即可，依次从Student表中取出一个元组放入内层子查询，若WHERE返回为真则取外层的Sname放入结果表*/

/*查询选修了全部课程（没有一门课程不选修）的学生姓名*/
SELECT Sname
FROM Student
WHERE NOT EXISTS
     (SELECT*
      FROM Course
      WHERE NOT EXISTS
           (SELECT *
            FROM SC
            WHERE Sno=Student.Sno AND Cno=Course.Cno)
      );
/*最内部的 SELECT * FROM SC WHERE Sno=Student.Sno AND Cno=Course.Cno是查询出所有已经选择过课程的学生及相应课程，
SELECT* FROM Course WHERE NOT EXISTS则是所有没有被选择的课程，在这个基础上的 SELECT Sname FROM Student WHERE NOT EXISTS
则是选取所有没有没有选择课程的学生，即选择了所有课程的学员名称。*/
      

SELECT Sname 
FROM Student
WHERE Sno IN
     (SELECT Sno   /*解法二*/
      FROM SC
      GROUP BY Sno
      HAVING COUNT(*)=(SELECT COUNT(*)
                       FROM Course)
      );
      
/*查询至少选修了学生201215122选修的全部课程的学生号码*/
/*等价于 不存在这样的课程y，学生201215122选修了y，而学生x没有选*/
SELECT DISTINCT Sno
FROM SC SCX
WHERE NOT EXISTS
     (SELECT *
      FROM SC SCY
      WHERE SCY.Sno='201215122'AND
           NOT EXISTS
           (SELECT *
            FROM SC SCZ
            WHERE SCZ.Sno=SCX.Sno AND SCZ.Cno=SCY.Cno)
      );
                     

















              
