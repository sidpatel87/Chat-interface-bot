/* What are the top 10 customers by number of orders placed? */

SELECT 
	customers.cno AS CustomerNumber,
	COUNT (sales_orders.order_no) AS 'NumberofOrders', 
	sum(sales_orders.amount) AS 'Total amount Spent', 
	customers.balance, 
	customers.cr_limit

FROM
	customers 
Inner JOIN 
	sales_orders
ON
	customers.cno =  sales_orders .cno
group by 
	customers.cno
Order By	
	NumberofOrders DESC
LIMIT 10





