/*
1.  计算出一共销售了几种商品，输出商品数量
2.	在订单明细表中查询订单金额最高的订单，输出订单编号和订单金额。
3.	显示OrderDetail表中每种商品和对应的销售金额，并且按由大到小排序输出。
4.	查找销售总额大于1000元的销售员编号、姓名和销售额。
5.	查找有销售记录的客户编号、名称和订单总额。
6.	查询没有订购商品的客户编号和客户名称。
7.	找出至少被订购3次的商品编号、订单编号、订货数量和订货金额，并按订货数量的降序排序输出。
8.	查找32M DRAM的销售情况，要求显示相应的销售员的姓名、性别，销售日期、销售数量和金额，其中性别用“男”、“女”表示。
9.	找出目前业绩未超过5000元的员工，并按销售业绩的降序排序输出。
10.	计算每一种商品的销售数量、平均销售单价和总销售金额。
11.	查找至少有3次销售的业务员名单和销售日期。
12.	查询订单中所订购的商品数量没有超过10个的客户编号和客户名称。
13.	在销售明细表中按商品编号进行汇总，统计每种商品的销售数量和金额。
14.	按客户编号统计每个客户2008年2月的订单总金额。
15.	显示每种商品的销售金额总和，并依销售金额由大到小输出。
16.	求每种商品的总销售数量及总销售金额，要求显示出商品编号、商品名称、总数
*/

--1

SELECT COUNT(DISTINCT productNo )
FROM OrderDetail

--2
SELECT TOP 1 orderNo,SUM(quantity*price) MONEY
FROM OrderDetail
GROUP BY orderNo
ORDER BY MONEY DESC

--3

SELECT productNo,SUM(quantity*price) MONEY
FROM OrderDetail
GROUP BY productNo
ORDER BY MONEY DESC

--4

SELECT Employee.employeeNo,Employee.employeeName,B.MONEY
FROM(SELECT salerNo,SUM(money) MONEY
FROM OrderMaster,(SELECT orderNo,SUM(price*quantity) money
FROM OrderDetail
GROUP BY orderNo) AS A
WHERE A.orderNo=OrderMaster.orderNo AND MONEY>1000
GROUP BY salerNo) AS B,Employee
WHERE B.salerNo=Employee.employeeNo

--5
SELECT customerName,Customer.customerNo,A.MONEY
FROM Customer,(SELECT customerNo,SUM(quantity*price) MONEY
FROM OrderMaster,OrderDetail
WHERE OrderMaster.orderNo=OrderDetail.orderNo 
GROUP BY customerNo) AS A
WHERE Customer.customerNo=A.customerNo

--6
SELECT customerNo,customerName
FROM Customer
WHERE Customer.customerNo NOT IN (SELECT B.customerNo
FROM(SELECT customerName,Customer.customerNo,A.MONEY
FROM Customer,(SELECT customerNo,SUM(quantity*price) MONEY
FROM OrderMaster,OrderDetail
WHERE OrderMaster.orderNo=OrderDetail.orderNo 
GROUP BY customerNo) AS A
WHERE Customer.customerNo=A.customerNo) AS B)

--7
SELECT productNo,orderNo,quantity,quantity*price 订货金额
FROM OrderDetail
WHERE productNo IN(
SELECT productNo
FROM OrderDetail
GROUP BY productNo
HAVING COUNT(productNo)>=3)
ORDER BY productNo,quantity
