/*****
CREATE TABLE<表名>(<列名><数据类型>[列级完整性约束条件]
                    <列名><数据类型>[列级完整性约束条件]
                    ...
                    [<表级完整性约束条件>]);
                    
ALTER TABLE<表名>
[ADD[COLUMN]<新列名><数据类型>[完整性约束]]
[ADD<表级完整性约束>]
[DROP[COLUMN]<列名>[CASCADE|RESTRICT]]
[DROP CONSTRAINT<完整性约束名>[CASCADE|RESTRICT]]
[ALTER COLUMN<列名><数据类型>];

DROP TABLE<表名>[RESTRICT|CASCADE];
*****/
CREATE TABLE Student
  (Sno CHAR(4) PRIMARY KEY, /*列级完整性约束*/
   Sname CHAR(20) UNIQUE,   /*Sname取唯一值*/
   Ssex CHAR(2),
   Sage SMALLINT,
   Sdept CHAR(20)
  );
CREATE TABLE Course
  (Cno CHAR(4) PRIMARY KEY,
   Cname CHAR(40) NOT NULL,
   Cpno CHAR(4),
   Ccredit SMALLINT,
   FOREIGN KEY(Cpno) REFERENCES Course（Cno）/*表级完整性约束条件，Cpno是外码，被参照表是Course，被参照列是Cno*/
  );
CREATE TABLE SC
  (Sno CHAR(9),
   Cno CHAR(4),
   Grade SMALLINT,
   PRIMARY KEY(Sno,Cno), /*表级完整性约束条件,主码由二个属性构成，必须作为表级完整性进行定义*/
   FOREIGN KEY(Sno) REFERENCES Student（Sno）
   FOREIGN KEY(Cno) REFERENCES Course（Cno）
  );
/*向Student表增加“入学时间”列，其数据类型为日期型*/
ALTER TABLE Student ADD S_entrance DATE;
/*将年龄的数据类型由字符型改为整数*/
ALTER TABLE Student ALTER COLUMN Sage INT;
/*增加课程名称必须取唯一值得约束条件*/
ALTER TABLE Course ADD UNIQUE(Cname);

DROP TABLE<表名>[RESTRICT|CASCADE]

   
   
   
