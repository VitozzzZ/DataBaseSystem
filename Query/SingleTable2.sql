/*3.ORDER BY 所有属性均可用，即使没有被SELECT包含*/
/*查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列*/
SELECT *
FROM Student;
ORDER BY Sdept,Sage DESC;

/*4.聚集函数  只可用于SELECT语句和GROUP BY中的HAVING语句,WHERE语句不能用聚集函数*/
/*
COUNT(*)                      统计元组个数
COUNT([DISTINCT|ALL]<列名>)    统计一列中值的个数
SUM([DISTINCT|ALL]<列名>)      计算一列值的总和（数值型）
AVG([DISTINCT|ALL]<列名>)      计算一列值的平均值（数值型）
MAX([DISTINCT|ALL]<列名>)      求一列值的最大值
MIN([DISTINCT|ALL]<列名>)      求一列值的最小值
*/
/*查询选修了课程的学生人数*/
SELECT COUNT(DISTINCT Sno);
FROM SC;
/*查询学生201502040222选修课程的总学分数*/
SELECT SUM(Ccredit);
FROM SC,Course;
WHERE Sno='201502040222' AND SC.Cno=Course.Cno;

/*5.GROUP BY 按一列或多列的值分组，值相等的位一组*/
/*求各个课程号及相应的选课人数*/
SELECT COUNT(Sno);
FROM SC;
GROUP BY Cno;

  
