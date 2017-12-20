SET NOCOUNT ON
SET DATEFORMAT YMD
USE master
GO
--创建数据库OrderDB
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME='OrderDB')
	DROP DATABASE OrderDB
GO
CREATE DATABASE OrderDB
GO
USE OrderDB
GO

--创建员工表Employee
PRINT 'create table Employee'
GO
CREATE TABLE Employee(
employeeNo	char(8)		PRIMARY KEY,	/*员工编号*/
employeeName varchar(10) NOT NULL,		/*员工姓名*/
sex			char(1)		NOT NULL,		/*员工性别*/
birthday	datetime	NULL,			/*出生日期*/
address		varchar(50)	NULL,			/*住址*/
telephone	varchar(20)	NULL,			/*电话*/
hireDate	datetime	NOT NULL,		/*雇佣日期*/
department	varchar(30)	NOT NULL,		/*所属部门*/
headShip	varchar(10) NULL,			/*职务*/
salary		numeric(8,2) NULL			/*薪水*/
)
GO
/*员工表（Employee）数据：*/
INSERT Employee VALUES('E2005001', '喻自强', 'M', '1965-4-15', '南京市青海路18号', '13817605008','1990-2-6','财务科','科长',5800.80)
INSERT Employee VALUES('E2005002', '张小梅', 'F', '1973-11-1', '上海市北京路8号', '13607405016','1991-3-28','业务科','职员',2400.00)
INSERT Employee VALUES('E2005003', '张小娟', 'F', '1973-3-6', '上海市南京路66号', '13707305025','1992-3-28','业务科','职员',2600.00)
INSERT Employee VALUES('E2005004', '张露',   'F', '1967-1-5', '南昌市八一大道130号', '15907205134','1990-3-28','业务科','部长',4100.00)
INSERT Employee VALUES('E2005005', '张小东', 'M', '1973-9-3', '南昌市阳明路99号', '15607105243','1992-3-28','业务科','职员',1800.00)
INSERT Employee VALUES('E2006001', '陈辉',   'M', '1965-11-1', '南昌市青山路100号', '13607705352','1990-3-28','办公室','主任',4000.00)
INSERT Employee VALUES('E2006002', '韩梅',   'F', '1973-12-11', '上海市浦东6号', '13807805461','1990-11-28','业务科','职员',2600.00)
INSERT Employee VALUES('E2006003', '刘风',   'F', '1973-5-21', '江西财经大学5栋1-101室', '15907805578','1991-2-28','业务科','职员',2500.00)
INSERT Employee VALUES('E2007001', '吴浮萍', 'M', '1973-9-12', '南昌市高新技术开发区12号', NULL,'1990-6-28','业务科','职员',2500.00)
INSERT Employee VALUES('E2007002', '高代鹏', 'M', '1973-1-2', '南昌市高新技术开发区56号', NULL,'1991-11-28','办公室','文员',2000.00)
INSERT Employee VALUES('E2008001', '陈诗杰', 'M', '1968-1-6', '江西财经大学12栋3-304室', NULL,'1990-12-6','财务科','出纳',3200.00)
INSERT Employee VALUES('E2008002', '张良',   'M', '1972-2-16','上海市福州路135号', NULL,'1992-2-28','业务科','职员',2700.00)
INSERT Employee VALUES('E2008003', '黄梅莹', 'F', '1972-5-15','上海市九江路88号', NULL,'1991-2-28','业务科','职员',3100.00)
INSERT Employee VALUES('E2008004', '李虹冰', 'F', '1972-10-13','南昌市中山路1号', NULL,'1990-5-28','业务科','职员',3400.00)
INSERT Employee VALUES('E2008005', '张小梅', 'F', '1970-11-6','深圳市阳关大道10号', NULL,'1990-11-18','财务科','会计',5000.00)
GO

--创建客户表Customer
PRINT 'create table Customer'
GO
CREATE TABLE Customer(
customerNo	char(9)		PRIMARY KEY,	/*客户号*/
customerName varchar(40) NOT NULL,		/*客户名称*/
address		varchar(40)	NULL,			/*客户地址*/
telephone	varchar(20)	NULL,			/*客户电话*/
zip			char(6)		NULL			/*邮政编码*/
)
GO
/*客户表（Customer）数据：*/
INSERT Customer VALUES('C20050001','统一股份有限公司',   '天津市',   '022-3566021','220012')
INSERT Customer VALUES('C20050002','兴隆股份有限公司',   '天津市',   '022-3562452','220301')
INSERT Customer VALUES('C20050003','上海生物研究室',     '北京市',   '010-2121000','108001')
INSERT Customer VALUES('C20050004','五一商厦',           '上海市',   '021-4532187','210100')
INSERT Customer VALUES('C20060001','大地商城',           '北京市',   '010-1165152','100803')
INSERT Customer VALUES('C20060002','联合股份有限公司',   '上海市',   '021-4568451','210100')
INSERT Customer VALUES('C20070001','南昌市电脑研制中心', '南昌市',   '0791-4412152','330046')
INSERT Customer VALUES('C20070002','世界技术开发公司',   '上海市',   '021-4564512','210230')
INSERT Customer VALUES('C20070003','万事达股份有限公司', '天津市',   '022-4533141','220400')
INSERT Customer VALUES('C20080001','红度股份有限公司',   '北京市',   '010-5421585','100800')
GO

--创建商品基本信息表Product
PRINT 'create table Product'
GO
CREATE TABLE Product(
productNo	char(9)		PRIMARY KEY,	/*商品编号*/
productName	varchar(40)	NOT NULL,		/*商品名称*/
productClass varchar(20) NOT NULL,		/*商品类别*/
)
GO
/*商品基本信息表（Product）数据：*/
INSERT Product VALUES('P20050001','32M DRAM','内存')
INSERT Product VALUES('P20050002','17寸显示器','显示器')
INSERT Product VALUES('P20050003','120GB硬盘','存储器')
INSERT Product VALUES('P20050004','3.5寸软驱','设备')
INSERT Product VALUES('P20050005','键盘','设备')
INSERT Product VALUES('P20060001','VGA显示卡','显示器')
INSERT Product VALUES('P20060002','网卡','设备')
INSERT Product VALUES('P20060003','Pentium100CPU','处理器')
INSERT Product VALUES('P20070001','1G DDR','内存')
INSERT Product VALUES('P20070002','52倍速光驱','设备')
INSERT Product VALUES('P20070003','计算机字典','图书')
INSERT Product VALUES('P20070004','9600bits/s调制解调','设备')
INSERT Product VALUES('P20080001','Pentium主板','主板')
INSERT Product VALUES('P20080002','硕泰克SL—K8AN-RL主板','主板')
INSERT Product VALUES('P20080003','龙基777FT纯平显示器','显示器')
GO

--创建主表OrderMaster
PRINT 'create table OrderMaster'
GO
CREATE TABLE OrderMaster(
orderNo		char(12)	PRIMARY KEY,	/*订单编号*/
customerNo	char(9)		NOT NULL		/*客户号*/
						FOREIGN KEY REFERENCES Customer(customerNo),
salerNo		char(8)		NOT NULL		/*业务员编号*/
						FOREIGN KEY REFERENCES Employee(employeeNo),
orderDate	datetime	NOT NULL,		/*订单日期*/
orderSum	numeric(9,2) NULL,			/*订单金额*/
invoiceNo	char(10)	NOT NULL		/*发票号码*/
)
GO
/*销售主表（OrderMaster）数据：*/
INSERT OrderMaster VALUES('200801090001','C20050001','E2005002','2008-1-9','0.00','I000000001')
INSERT OrderMaster VALUES('200801090002','C20050004','E2005003','2008-1-9','0.00','I000000002')
INSERT OrderMaster VALUES('200801090003','C20080001','E2005002','2008-1-9','0.00','I000000003')
INSERT OrderMaster VALUES('200802190001','C20050001','E2005003','2008-2-19','0.00','I000000004')
INSERT OrderMaster VALUES('200802190002','C20070002','E2008002','2008-2-19','0.00','I000000005')
INSERT OrderMaster VALUES('200803010001','C20070002','E2008001','2008-3-1','0.00','I000000006')
INSERT OrderMaster VALUES('200803020001','C20050004','E2008003','2008-3-2','0.00','I000000007')
INSERT OrderMaster VALUES('200803090001','C20070003','E2008004','2008-3-9','0.00','I000000008')
INSERT OrderMaster VALUES('200805090001','C20060002','E2008002','2008-5-9','0.00','I000000009')
INSERT OrderMaster VALUES('200806120001','C20050001','E2005002','2008-6-12','0.00','I000000010')
GO

--创建明细表OrderDetail
PRINT 'create table OrderDetail'
GO
CREATE TABLE OrderDetail(
orderNo		char(12)	NOT NULL,		/*订单编号*/
productNo	char(9)		NOT NULL,		/*商品编号*/
quantity	int			NOT NULL,		/*销售数量*/
price		numeric(7,2) NOT NULL,		/*成交单价*/
FOREIGN KEY(orderNo) REFERENCES OrderMaster(orderNo),
FOREIGN KEY(productNo) REFERENCES Product(productNo),
PRIMARY KEY(orderNo,productNo)
)
GO

/*销售明细表（OrderDetail）数据：*/
INSERT OrderDetail VALUES('200801090001','P20050001',5,500.00)
INSERT OrderDetail VALUES('200801090001','P20050002',3,500.00)
INSERT OrderDetail VALUES('200801090001','P20050003',2,300.00)
INSERT OrderDetail VALUES('200801090002','P20060002',5,250.00)
INSERT OrderDetail VALUES('200801090002','P20080001',5,280.00)
INSERT OrderDetail VALUES('200801090002','P20080002',4,270.00)
INSERT OrderDetail VALUES('200801090002','P20080003',2,158.00)
INSERT OrderDetail VALUES('200801090003','P20050001',5,130.00)
INSERT OrderDetail VALUES('200801090003','P20060001',3,350.00)
INSERT OrderDetail VALUES('200802190001','P20060003',4,270.00)
INSERT OrderDetail VALUES('200802190001','P20070001',2,158.00)
INSERT OrderDetail VALUES('200802190001','P20070002',5,250.00)
INSERT OrderDetail VALUES('200802190001','P20070003',3,350.00)
INSERT OrderDetail VALUES('200802190001','P20070004',2,330.00)
INSERT OrderDetail VALUES('200802190001','P20080001',2,160.00)
INSERT OrderDetail VALUES('200802190001','P20080002',3,260.00)
INSERT OrderDetail VALUES('200802190001','P20080003',1,330.00)
INSERT OrderDetail VALUES('200802190002','P20050001',2,160.00)
INSERT OrderDetail VALUES('200802190002','P20050005',3,150.00)
INSERT OrderDetail VALUES('200802190002','P20070001',3,500.00)
INSERT OrderDetail VALUES('200803010001','P20050001',8,150.00)
INSERT OrderDetail VALUES('200803010001','P20070001',4,150.00)
INSERT OrderDetail VALUES('200803020001','P20050001',2,100.00)
INSERT OrderDetail VALUES('200803020001','P20050002',1,200.00)
INSERT OrderDetail VALUES('200803020001','P20070003',3,200.00)
INSERT OrderDetail VALUES('200803090001','P20050003',4,200.00)
INSERT OrderDetail VALUES('200803090001','P20050004',5,250.00)
INSERT OrderDetail VALUES('200803090001','P20070001',2,158.00)
INSERT OrderDetail VALUES('200803090001','P20070002',5,380.00)
INSERT OrderDetail VALUES('200803090001','P20070004',3,350.00)
INSERT OrderDetail VALUES('200805090001','P20060003',8,300.00)
INSERT OrderDetail VALUES('200805090001','P20070001',4,500.00)
INSERT OrderDetail VALUES('200805090001','P20070002',2,600.00)
INSERT OrderDetail VALUES('200805090001','P20070003',5,300.00)
INSERT OrderDetail VALUES('200806120001','P20050004',2,600.00)
INSERT OrderDetail VALUES('200806120001','P20050005',3,600.00)
INSERT OrderDetail VALUES('200806120001','P20060001',1,300.00)
INSERT OrderDetail VALUES('200806120001','P20060002',2,280.00)
GO
