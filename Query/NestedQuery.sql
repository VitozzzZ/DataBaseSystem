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
WHERE Sdept IN
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
