```sql
/* Due to time constraints, we randomly selected a few queries for the presentation and recording.*/

/*The SQL query to retrieve all the records and columns from the table named categories, in order to update the images. */
select * from Categories;

--- -------------------------------------------------------------
-- The SQL query to retrieve all the records and columns from the table created.
select * from Products;
select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Reviews;

-- -----------------------------------------------------------------------------------------------------------------------------

/* In situations where it is important to identify customers with the highest number of orders or the least frequently ordered customers, this SQL query can assist businesses in analyzing customer purchase behavior and identifying frequent customers. This analysis is also valuable for customer loyalty programs, where businesses may reward customers with a high order count. Additionally, the query can be enhanced by adding "ORDER BY OrderId DESC" to sort customers by order frequency. This query retrieves the CustomerID from the orders table and counts the total number of orders associated with each customer. */
select 
	CustomerID, 
	COUNT(*) as 'Order Id'
from orders
GROUP BY CustomerID;

-- The SQL query to retrieve all the records and columns from the table named orders.
SELECT * from orders;

/* In situations where businesses want to analyze product distribution across categories and assess inventory management, it is important to identify which categories have the most or the least products. The following SQL query can be used to retrieve the CategoryID from the Products table, count the total number of products in each category, group the results by CategoryID, and order them in descending order based on the count. */
select 
	CategoryId,
    count(*) as count
from products
group by categoryId
order by count desc;

-- -----------------------------------------------------------------------------------------------------------------------------
/* In situations where a product is rebranded or renamed, adjustments to the product's price may be necessary due to factors such as inflation, discounts, supplier costs, or changes in market trends and competitor pricing. The following SQL command can be used to update an existing record in the products table by modifying the product name and price for a specific product with productId. For example,  This update the name and price of the product with productId 3 in the "products" table, setting the name to 'Gaming Laptop Z16' and the price to 1599. */
UPDATE 
	products  
SET  ProductName = 'Gaming Laptop Z17', Price = 1600
WHERE  productId = 3;

select * from products;

-- ------------------------------------------------------------------------------------------------------------------------------
/* In a scenario where businesses want to display product reviews on an e-commerce website, it is essential to show positive reviews (4★ and 5★) on product pages. This approach helps potential buyers make decisions based on real customer feedback. Additionally, businesses can track which products customers love, aiding in marketing and inventory management. It also allows businesses to identify customers who leave positive reviews and understand what aspects of a product customers appreciate. Furthermore, this information serves as a way to improve products based on customer feedback. 
This query retrieves customer reviews for products with a rating of 4 or higher, including the product name, customer name, rating, and comments. */

select 
	Products.productname as 'Product name', 
	concat(customers.LastName, ' ', customers.FirstName) as 'customer name',
	Rating, 
    Comment
from reviews
inner join products on reviews.productId = products.productID
inner join customers on reviews.CustomerID = customers.customerId 
where rating >=4
order by Products.productname;

-- For Counting Total Positive Reviews for Each Product

SELECT 
    Products.productname AS 'Product name', 
    COUNT(reviews.ReviewID) AS 'Total Positive Reviews'
FROM reviews
INNER JOIN products ON reviews.productId = products.productID
WHERE rating >= 4
GROUP BY Products.productname
ORDER BY COUNT(reviews.ReviewID) DESC;
-- -----------------------------------------------------------------------------------------------------------------------------
/* In a scenario where businesses want to provide a list of orders along with customer details, it is essential to track both pending and completed orders. If a customer record is missing, the order should still be included in the list, but will show NULL for the customer details. This approach helps maintain data integrity. 

Additionally, logistics teams need to monitor shipping addresses for order fulfillment and analyze the total sales amount over time. Therefore, this query retrieves order details along with customer information, ensuring that all orders are included, even if some customers are missing.
*/

select 
	orders.orderid as 'Id number of ordered item',
    customers.firstname  as Firstname, 
	customers.lastname  as Lastname, 
	orderdate, 
    totalamount as 'Total amount (€)',
    shippingAddress as 'Customer shipping address'
from orders
left join customers on orders.CustomerID = customers.customerId;


-- For filtering Orders for a Specific Date Range
SELECT 
    orders.orderid AS 'Id number of ordered item',
    customers.firstname AS Firstname, 
    customers.lastname AS Lastname, 
    customers.email AS 'Customer Email',
    customers.phone AS 'Customer Phone',
    orderdate, 
    totalamount AS 'Total amount (€)',
    shippingAddress AS 'Customer shipping address'
FROM orders
LEFT JOIN customers ON orders.CustomerID = customers.customerId
WHERE orderdate >= '2024-01-01' AND orderdate <= '2024-03-31';
-- -----------------------------------------------------------------------------------------------------------------------------

/* In scenarios where businesses want to identify customers who have not placed any orders, it is essential to find those customers with a NULL OrderID. This includes situations where businesses need to send follow-up messages to customers who signed up but never made a purchase. Additionally, there may be a need to encourage customers with no orders to take advantage of special promotions designed to stimulate purchases. To address these requirements, a query can be used to retrieve all customers along with their orders, ensuring that all customers, including those without any orders, are included in the results. */

SELECT 
	Orders.OrderID, 
    concat(customers.LastName, ' ', customers.FirstName) as 'customer name',
    Totalamount
FROM Orders
RIGHT JOIN customers ON Orders.customerId = customers.customerId
ORDER BY Orders.OrderID asc;

-- By adding Email & Phone for Follow-ups
SELECT 
    Orders.OrderID, 
    CONCAT(customers.LastName, ' ', customers.FirstName) AS CustomerName,
    Orders.TotalAmount,
    customers.Email,
    customers.Phone
FROM Orders
RIGHT JOIN customers ON Orders.customerId = customers.customerId
ORDER BY Orders.OrderID ASC;

-- For contacting inactive customers, by Counting Orders Per Customer
SELECT 
    customers.CustomerID,
    CONCAT(customers.LastName, ' ', customers.FirstName) AS CustomerName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM customers
LEFT JOIN Orders ON Orders.customerId = customers.customerId
GROUP BY customers.CustomerID, CustomerName
ORDER BY TotalOrders DESC;


-- ------------------------------------------------------------------------------------------------------------------------------
/* In situations where inventory management must identify products that require restocking or prevent stockouts, 
it is crucial to ensure that popular products remain available to avoid lost sales. Additionally, if a product consistently has low stock levels, 
it may indicate the need for increased production or improved supplier management to address slow-moving items.
Furthermore, integrating an automated reorder system into the inventory management process can help trigger automatic restocking when stock levels fall below a certain threshold. 
Therefore, this query retrieves products with low stock levels (fewer than 20 units) along with their category and description, sorted in ascending order by stock quantity.*/

Select 
	products.productName , 
	products.description, categories.categoryName as 'Product category', 
	products.StockQuantity as 'Stock quantity' 
from products
inner join categories on products.CategoryID = categories.CategoryID
where StockQuantity < 20
order by StockQuantity;

/* In situations where supply chain management requires better coordination with suppliers for timely restocking or 
aims to identify fast-selling products, effective sales forecasting is essential. 
This approach allows businesses to adjust production or procurement and prevent stockouts, thereby reducing the risk of losing sales due to unavailable products. 
Additionally, companies need to predict when to reorder stock before items run out. Also, for Predicting how many days stock will last based on sales trends.
For example,this query retrieves low-stock products and estimates the number of days before they run out based on average order quantity. */
SELECT 
    products.productName, 
    products.description, 
    categories.categoryName AS 'Product category', 
    products.StockQuantity AS 'Stock quantity', 
    ROUND(products.StockQuantity / AVG(orderdetails.Quantity), 2) AS 'Days Until Out of Stock'
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
INNER JOIN orderdetails ON products.productID = orderdetails.productID
WHERE StockQuantity < 20
GROUP BY products.productID
ORDER BY StockQuantity;

-- ---------------------------------------------------------------------------------------------------------------------

/* In situations where it's important to monitor inventory, this query proves valuable for inventory management. It enables store owners to track products with moderate stock levels—neither too low nor too high—allowing them to make informed decisions about restocking or sales strategies. */
Select * From Products
where StockQuantity between 10 and 20;

-- -----------------------------------------------------------------------------------------------------------------------------
/* In scenarios where businesses aim to identify large orders that significantly contribute to revenue or to segment VIP customers, there are a few important factors to consider. For instance, in cases requiring fraud detection, orders exceeding a specified threshold may need to undergo manual review before approval. Additionally, sales and revenue analysis is essential for recognizing trends, such as determining how many orders over 1000 are received each month. Furthermore, customers who spend over 1000 on a single order might qualify for discounts, free shipping, or loyalty rewards. To help with this analysis, an SQL query can be used to calculate the total amount spent on each order, filtering results to display only those orders with a total amount greater than 1000. This query retrieves the OrderID and the total amount (calculated as Quantity multiplied by Price) for each order, including only those where the total exceeds 1000. */

-- For quick enqury 
SELECT 
    OrderID, 
    SUM(Quantity * Price) AS 'Total Amount'
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity * Price) > 1000;

-- The SQL query to retrieve all the records and columns from the table named OrderDetails.
select * from OrderDetails;

-- For Including Customer Information
SELECT 
    orders.OrderID, 
	concat(customers.LastName, ' ', customers.FirstName) as CustomerName, 
    SUM(orderdetails.Quantity * orderdetails.Price) AS 'Total Amount'
FROM orders
INNER JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
GROUP BY orders.OrderID, CustomerName
HAVING SUM(orderdetails.Quantity * orderdetails.Price) > 1000;



-- For average
/* This query retrieves the OrderID and the average (calculated as Quantity multiplied by Price) for each order, including only those where the total exceeds 500.*/

SELECT 
    OrderID, 
    AVG(Quantity * Price) AS 'Average Amount'
FROM OrderDetails
GROUP BY OrderID
HAVING AVG(Quantity * Price) > 500;

select * from OrderDetails;


-- For both sum and avg
SELECT 
    OrderID, 
    SUM(Quantity * Price) AS 'Total Amount',
    AVG(Quantity * Price) AS 'Average Amount'
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity * Price) > 1000;

-- ------------------------------------------------------------------------------------------------------------------------------

/* If we need to retrieve either highly rated reviews or all reviews for a specific product, this SQL query extracts detailed review information from the Reviews table. It filters records based on specific conditions, such as where the Rating is 5 or where the ProductID is 2. */
SELECT 
    ReviewID, 
    ProductID, 
    CustomerID, 
    Rating, 
    Comment, 
    ReviewDate 
FROM Reviews
WHERE Rating = 5 OR ProductID = 2;

-- ------------------------------------------------------------------------------------------------------------------------------
-/* When it's important to quickly understand how customers rate and review a product in order to categorize them as promoters, passives, or detractors, you can use the following SQL query. This query retrieves reviews with a rating of less than 4 and a customer ID less than 5 from the reviews table. */

SELECT 
    ReviewID, 
    ProductID, 
	CustomerId,
    Rating, 
    Comment
FROM Reviews
WHERE CustomerId <= 5 and rating >= 4;
    


/* Another method to quickly understand how customers rate and review a product in order to categorize them as promoters, passives, or detractors by including customer's name. */
select 
	Products.productname as 'Product name', 
	concat(customers.firstname, ' ', customers.lastname)  as 'Customers name', 
	Rating, 
    Comment
from reviews
join products on reviews.productId = products.productID
join customers on reviews.CustomerID = customers.customerId 
where customers.customerId <= 5 and rating >= 4
order by Products.productname;
-- ------------------------------------------------------------------------------------------------------------------------------
```

```sql
-- ------------------------------------------------------------------------------------------------------------------------------
/* In a situation where it is necessary to generate an invoice for a specific customer, it is essential to gather details about all products ordered, including their quantity, price, and total cost per product. Additionally, the customer's name, address, email, and phone number must be included for the invoice generation. For instance, consider a scenario where a business wants to send an invoice to Customer 3, listing all products they purchased along with the total order amount and their contact details. This process also helps businesses track which products a customer buys most frequently. To achieve this, an SQL query can be used to retrieve detailed order information for a specific customer (CustomerID = 3) by joining multiple tables, such as orders, order details, products, customers, and categories. The query provides valuable insights into the order details, product information, and customer data. */
SELECT 
	orders.orderid as 'Order Id',
	orders.TotalAmount as 'Total orders',
    products.price as 'price (€)',
    orderdetails.Quantity as 'Quantity',
    orderdetails.Quantity * products.price as 'Total price for the product (€)',
    products.productName  as 'Product Name',
	categories.categoryName as 'Products category',
    products.description as 'Product Description',
    CONCAT(customers.FirstName, ' ', customers.LastName) as 'Customer name',
    CONCAT(customers.Address,  ', ', customers.Country) as 'Customer address',
    customers.Email as 'Customer email',
    customers.Phone as 'Customer phone number'
FROM orders 
inner JOIN orderdetails 
    ON orders.orderid = orderdetails.orderid
inner JOIN products 
    ON orderdetails.productid = products.productid
inner JOIN customers 
    ON orders.customerid = customers.customerid
inner JOIN categories
    ON products.categoryid = categories.categoryid   
where customers.customerid = 3;
-- -----------------------------------------------------------------------------------------------------------------------------
```



```sql
/* In situations where it is essential to quickly determine the quantity ordered by a customer in order to process the order efficiently, you can use the following SQL query. This query retrieves data from the OrderDetails table by selecting the OrderID and the Quantity columns. It utilizes a CASE statement to categorize the Quantity values into descriptive labels. The results are then sorted in ascending order by Quantity. */
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 2 THEN 'The quantity is greater than 2'
    WHEN Quantity = 2 THEN 'The quantity is 2'
    ELSE 'The quantity is under 2'
END
FROM OrderDetails
order by Quantity;
-- ------------------------------------------------------------------------------------------------------------------------------
```
