/*1.	查询所有业务部门的员工姓名、职务、薪水*/
SELECT employeeName,headShip,salary
FROM Employee

/*2.	查询名字中含有“有限”的客户姓名和所在地*/
SELECT customerName,address
FROM Customer
WHERE customerName LIKE'%有限%'

/*3.	查询出姓“张”并且姓名的第二个字为“小”的所有员工信息*/
SELECT *
FROM Employee
WHERE employName LIKE'_小%'

/*4.	查询住址中含有上海或南昌的女员工，并显示其姓名、所属部门、职称、住址，其中性别用“男”和“女”显示*/
SELECT employeeName ,department ,headShip ,address,
CASE sex 
         WHEN 'M' THEN '男'
         WHEN 'F' THEN '女'
END AS 性别
FROM Employee 
WHERE (address  like '%上海%' OR address  like '%南昌%') and sex ='F'

/*5.	在表OrderDetail中挑出销售金额大于等于5000元的订单编号和销售金额*/
SELECT orderNo,price*quantity AS SaleNumber
FROM OrderDetail
WHERE price*quantity>=5000

/*6.	选取销售金额排行前3的订单编号和销售金额*/
SELECT top 3 orderNo,price*quantity AS SaleNumber
FROM OrderDetail
ORDER BY price*quantity DESC

/*7.	找出公司男业务员所接且订单金额超过2000元的订单号及订单金额*/
SELECT orderNo,quantity*price SaleNumber
FROM OrderDetail,Employee,OrderMaster
WHERE OrderDetail.price*OrderDetail.quantity>2000 AND Employee.sex='M' 
      AND Employee.employeeNo=OrderMaster.salerNo AND OrderMaster.orderNo=OrderDetail.orderNo	

/*8.	查找在2008年3月中有销售记录的客户编号、名称和订单总额*/
SELECT customerNo,customerName,quantity*price AS SaleNumber
FROM Customer,OrderMaster,OrderDetail
WHERE Customer.customerNo=OrderMaster.customerNo AND OrderMaster.orderNo=OrderDetail.orderNo
      AND MONTH(orderDate)=3


