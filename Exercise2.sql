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
/*9.	查询出职务为“职员”或职务为“科长”的女员工的信息*/
SELECT *
FROM Employee
WHERE headShip IN('职员','科长') AND sex='F'
/*10.	查找销售金额高于4000的所有客户编号*/
SELECT customerNo
FROM OrderMaster
WHERE orderNo IN
             (SELECT orderNo
              FROM OrderDetail
              GROUP BY orderNo
              HAVING SUM(quantity*price)>4000)

/*11.	选取编号介于C20050001~C20050004的客户编号、客户名称、客户地址*/
/*12.	找出同一天进入公司服务的员工*/
SELECT hireDate,employeeName
FROM Employee
WHERE hireDate IN(
         SELECT hireDate
         FROM Employee
         GROUP BY hireDate
         HAVING COUNT(hireDate)>1)
ORDER BY hireDate     
/*13.	查找与“陈诗杰”在同一个单位工作的员工姓名、性别、部门和职务*/
/*14.	查询每种商品的商品编号、商品名称、订货数量和订货单价*/
/*15.	查询单价高于400元的商品编号、商品名称、订货数量和订货单价*/
/*16.	查找每个员工的销售记录，要求显示销售员的编号、姓名、性别、商品名称、数量、单价、金额和销售日期，其中性别使用“男”和“女”表示*/
/*17.	查询客户姓名为“五一商厦”所购货物的客户名称、订单金额、订货日期和电话号码*/

