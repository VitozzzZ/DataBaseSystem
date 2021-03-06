/*****
CREATE[UNIQUE][CLUSTER]INDEX<索引>
ON<表名>(<列名>[<次序>][,<列名>[<次序>]]...)
UNIQUE表示该索引的每一个索引值只对应唯一的数据记录
CLUSTER表示要建立的索引是聚簇索引
*****/
/*为S-T数据库中的三个表建立索引，其中Student表按学号升序建唯一索引，Course表按课程号升序建唯一索引，SC表按学号和课程号降序建唯一索引*/
CREATE UNIQUE INDEX Stusno ON Student(Sno);
CREATE UNIQUE INDEX Coucno ON Course(Cno);
CREATE UNIQUE INDEX SCno ON SC(Sno ASC,Cno DESC);
/*
ALTER INDEX<旧索引名>RENAME TO<新索引名>
*/
ALTER INDEX Scno RENAME TO SCSno;
/*
DROP INDEX<索引名>
*/
DROP INDEX Stusno；


