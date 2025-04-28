
/* This is sql for eCommerce webiste */
/* 
    Femi Oyinloye 
    Camille Asongtia 
*/



-- Drop table in case it exist in the database
DROP TABLE IF EXISTS Categories;

-- Table Structure
CREATE TABLE Categories (
    CategoryID INT NOT NULL,
    CategoryName VARCHAR(150),
    Description VARCHAR(250),
    Image LONGBLOB,
    PRIMARY KEY (CategoryID)
);

-- Inserting new records for table Categories
INSERT INTO Categories VALUES 
    (1, 'Electronics', 'Devices and gadgets including phones, laptops, and accessories', ''),
    (2, 'Home Appliances', 'Appliances and tools for household use such as refrigerators and washing machines', ''),
    (3, 'Clothing', 'Apparel for men, women, and children, including accessories', ''),
    (4, 'Books', 'A variety of books including fiction, non-fiction, and educational materials', ''),
    (5, 'Sports & Outdoors', 'Sporting goods and outdoor equipment for fitness and recreational activities', '');
----------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS Customers;

-- Table Structure
CREATE TABLE Customers (
    CustomerID INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Address TEXT,
    Country VARCHAR(100),
    PRIMARY KEY (CustomerID)
);

-- Inserting new records for table Customers
INSERT INTO Customers VALUES 
    (1, 'Femi',	'Adesola',	'femi.adesola@example.com',	'+35844204018',	'Kilkallion 3 C23, Esppo',	'Finland'),
    (2,	'Camille',	'Asongtia',	'Asongtia@example.com',	'+3584420409',	'kontulatie 4 A75, Helsinki',	'Finland'),
    (3, 'Jari', 'Laine', 'jari.laine@example.com', '+358501234567', 'Puistotie 9, Vantaa', 'Finland'),
    (4, 'Sari', 'Mäkinen', 'sari.makinen@example.com', '+358401987654', 'Rautatieasema 3, Tampere', 'Finland'),
    (5, 'Juha', 'Heikkinen', 'juha.heikkinen@example.com', '+358405432198', 'Satamakatu 15, Turku', 'Finland'),
    (6, 'Päivi', 'Nieminen', 'paivi.nieminen@example.com', '+358447654321', 'Kauppatori 7, Oulu', 'Finland'),
    (7, 'Timo', 'Koskinen', 'timo.koskinen@example.com', '+358503219876', 'Rantakatu 21, Jyväskylä', 'Finland'),
    (8, 'Laura', 'Salminen', 'laura.salminen@example.com', '+358401112233', 'Asemakatu 8, Kuopio', 'Finland'),
    (9, 'Antti', 'Rantanen', 'antti.rantanen@example.com', '+358403344556', 'Linnankatu 11, Lahti', 'Finland'),
    (10, 'Riitta', 'Lehtonen', 'riitta.lehtonen@example.com', '+358409876543', 'Vesijärvenkatu 14, Hämeenlinna', 'Finland'),
    (11, 'Mikko', 'Virtanen', 'mikko.virtanen@example.com', '+358401234567', 'Keskuskatu 12, Helsinki', 'Finland'),
    (12, 'Anna', 'Korhonen', 'anna.korhonen@example.com', '+358441234567', 'Esplanadi 5, Espoo', 'Finland');



----------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS Products;

-- Table Structure
CREATE TABLE Products (
    ProductID INT NOT NULL,
    ProductName VARCHAR(150),
    Description VARCHAR(250),
    Price DECIMAL,
    CategoryID INT,
    StockQuantity INT,
    Image LONGBLOB,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting new records for table Products
INSERT INTO Products VALUES 
    (1, 'Smartphone X200', 'High-performance smartphone with 128GB storage', 799.99, 1, 50, ''),
    (2, 'Wireless Earbuds Pro', 'Noise-cancelling wireless earbuds with long battery life', 199.99, 1, 100, ''),
    (3, 'Gaming Laptop Z15', '15-inch gaming laptop with RTX graphics', 1499.00, 1, 30, ''),
    (4, 'Smartwatch Active', 'Fitness-focused smartwatch with heart rate monitor', 299.00, 1, 75, ''),

    -- Home Appliances (CategoryID = 2)
    (5, 'Refrigerator CoolMax', 'Double-door refrigerator with energy-saving technology', 999.00, 2, 15, ''),
    (6, 'Microwave Oven 900W', 'Compact microwave oven with grill function', 150.00, 2, 40, ''),
    (7, 'Washing Machine ProClean', '7kg washing machine with quick wash feature', 599.00, 2, 20, ''),
    (8, 'Vacuum Cleaner Turbo', 'Bagless vacuum cleaner with HEPA filter', 199.00, 2, 35, ''),

    -- Clothing (CategoryID = 3)
    (9, 'Men\'s Winter Jacket', 'Waterproof winter jacket with insulation', 120.00, 3, 60, ''),
    (10, 'Women\'s Running Shoes', 'Lightweight running shoes for outdoor use', 89.99, 3, 80, ''),
    (11, 'Unisex Hoodie Classic', 'Comfortable cotton hoodie with front pocket', 59.99, 3, 90, ''),
    (12, 'Sports Leggings', 'Stretchable leggings for gym and yoga', 45.00, 3, 100, ''),

    -- Books (CategoryID = 4)
    (13, 'The Art of Programming', 'Comprehensive guide to algorithms and coding practices', 59.99, 4, 120, ''),
    (14, 'Business Mastery', 'Strategies for success in modern business', 45.00, 4, 85, ''),
    (15, 'Fiction: The Lost City', 'Adventure novel with an exciting plot', 25.00, 4, 150, ''),
    (16, 'History of Europe', 'Detailed account of European history from ancient times', 35.00, 4, 70, ''),

    -- Sports & Outdoors (CategoryID = 5)
    (17, 'Mountain Bike Pro', 'Durable mountain bike suitable for rough terrains', 850.00, 5, 10, ''),
    (18, 'Yoga Mat EcoGrip', 'Eco-friendly non-slip yoga mat for daily workouts', 45.00, 5, 200, '');

----------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS Orders;

-- Table Structure
CREATE TABLE Orders (
    OrderID INT NOT NULL,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL,
    ShippingAddress TEXT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting new records for table Orders
INSERT INTO Orders VALUES 
(1, 1, '2024-02-01 10:30:00', 450.00, 'Kilkallion 3 C23, Esppo'),
(2, 1, '2024-02-05 14:15:00', 120.50, 'Kilkallion 3 C23, Esppo'),

(3, 2, '2024-02-03 09:45:00', 300.00, 'kontulatie 4 A75, Helsinki'),
(4, 2, '2024-02-10 11:30:00', 85.99, 'kontulatie 4 A75, Helsinki'),

(5, 3, '2024-02-04 16:00:00', 600.00, 'Puistotie 9, Vantaa'),
(6, 3, '2024-02-08 13:45:00', 200.50, 'Puistotie 9, Vantaa'),

(7, 4, '2024-02-02 12:00:00', 150.00, 'Rautatieasema 3, Tampere'),

(8, 5, '2024-02-06 18:30:00', 75.25, 'Satamakatu 15, Turku'),
(9, 5, '2024-02-12 08:45:00', 320.75, 'Satamakatu 15, Turku'),

(10, 6, '2024-02-07 10:00:00', 99.99, 'Kauppatori 7, Oulu'),

(11, 7, '2024-02-03 14:15:00', 450.00, 'Rantakatu 21, Jyväskylä'),
(12, 7, '2024-02-09 09:30:00', 290.00, 'Rantakatu 21, Jyväskylä'),

(13, 8, '2024-02-05 11:45:00', 110.00, 'Asemakatu 8, Kuopio'),

(14, 9, '2024-02-04 13:00:00', 200.00, 'Linnankatu 11, Lahti'),
(15, 9, '2024-02-10 16:45:00', 180.50, 'Linnankatu 11, Lahti');


----------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS OrderDetails;

-- Table Structure
CREATE TABLE OrderDetails (
    OrderDetailID INT NOT NULL,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL,
    PRIMARY KEY (OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Inserting new records for table OrderDetails
INSERT INTO OrderDetails VALUES 
-- Order 1 (2 products)
(1, 1, 1, 1, 799.99),
(2, 1, 2, 2, 199.99),

-- Order 2 (2 products, same product as Order 1)
(3, 2, 1, 1, 799.99),
(4, 2, 3, 1, 1499.00),

-- Order 3 (2 products)
(5, 3, 5, 1, 999.00),
(6, 3, 6, 2, 150.00),

-- Order 4 (1 product)
(7, 4, 7, 1, 599.00),

-- Order 5 (2 products)
(8, 5, 9, 2, 120.00),
(9, 5, 10, 1, 89.99),

-- Order 6 (1 product)
(10, 6, 11, 3, 59.99),

-- Order 7 (2 products)
(11, 7, 13, 1, 59.99),
(12, 7, 14, 1, 45.00),

-- Order 8 (1 product)
(13, 8, 15, 4, 25.00),

-- Order 9 (2 products)
(14, 9, 16, 1, 35.00),
(15, 9, 17, 1, 850.00),

-- Order 10 (1 product)
(16, 10, 18, 3, 45.00),

-- Order 11 (2 products)
(17, 11, 1, 1, 799.99),
(18, 11, 4, 1, 299.00),

-- Order 12 (1 product)
(19, 12, 8, 2, 199.00),

-- Order 13 (1 product, same product as Order 9)
(20, 13, 16, 2, 35.00);


----------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS Reviews;

-- Table Structure
CREATE TABLE Reviews (
    ReviewID INT,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATETIME,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting new records for table Reviews
INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Excellent smartphone with great performance.', '2024-02-10 14:30:00'),
(2, 2, 1, 4, 'Good sound quality, but the battery could last longer.', '2024-02-12 11:00:00'),
(3, 1, 2, 5, 'Very satisfied with the smartphone, fast and reliable.', '2024-02-15 09:45:00'),
(4, 3, 2, 3, 'Powerful gaming laptop, but a bit expensive.', '2024-02-18 10:15:00'),
(5, 5, 3, 5, 'Spacious and energy-efficient refrigerator.', '2024-02-14 16:30:00'),
(6, 6, 3, 4, 'Good microwave, works well for daily use.', '2024-02-16 12:45:00'),
(7, 9, 3, 5, 'Warm and stylish winter jacket.', '2024-02-20 08:20:00'),
(8, 10, 3, 3, 'Comfortable shoes, but sizing runs small.', '2024-02-21 14:10:00'),
(9, 11, 3, 5, 'High-quality hoodie, very comfortable.', '2024-02-22 17:00:00'),
(10, 13, 4, 5, 'Great book for improving programming skills.', '2024-02-23 10:00:00'),
(11, 14, 4, 4, 'Helpful business book, but some parts are basic.', '2024-02-24 11:30:00'),
(12, 15, 5, 5, 'Exciting adventure story, couldn’t put it down.', '2024-02-25 13:15:00'),
(13, 16, 5, 4, 'Informative and detailed history book.', '2024-02-26 15:00:00'),
(14, 17, 9, 5, 'Excellent mountain bike, handles rough trails well.', '2024-02-27 09:00:00'),
(15, 18, 10, 3, ' Non-slip surface is great, but fair design yoga mat.', '2024-02-28 08:45:00');



/* Due to time constraints, we randomly selected a few queries for the presentation and recording.*/

/* The SQL query to retrieve all the records and columns from the table named categories, in order to update the images. */
select * from Categories;

--- -------------------------------------------------------------
-- The SQL query to retrieve all the records and columns from the table created.
select * from Products;
select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Reviews;

-- -----------------------------------------------------------------------------------------------------------------------------
/*Businesses often want to identify and filter out inactive customers—those who have never placed an order. 
They may also want to focus their email campaigns on existing customers or track and engage with active customers. 
To facilitate this, the following query retrieves the details of customers who have made at least one order.*/
SELECT CustomerID, FirstName, LastName, Email
From Customers
WHERE CustomerId IN (SELECT CustomerId From Orders);


SELECT CustomerID, FirstName, LastName, Email
From Customers
WHERE CustomerId NOT IN (SELECT CustomerId From Orders);
-- -----------------------------------------------------------------------------------------------------------------------------
/* In situations where it is important to identify customers with the highest number of orders or the least frequently ordered customers, 
this SQL query can assist businesses in analyzing customer purchase behavior and identifying frequent customers. 
This analysis is also valuable for customer loyalty programs, where businesses may reward customers with a high order count. 
Additionally, the query can be enhanced by adding "ORDER BY OrderId DESC" to sort customers by order frequency. 
This query retrieves the CustomerID from the orders table and counts the total number of orders associated with each customer. */
select 
	CustomerID, 
	COUNT(*) as 'Order Id'
from orders
GROUP BY CustomerID;

-- The SQL query to retrieve all the records and columns from the table named orders.
SELECT * from orders;
-- -----------------------------------------------------------------------------------------------------------------------------

/*In situations where businesses want to identify their Most Valuable Customers (MVCs) and reward those who show loyalty by placing the most orders, this query retrieves the customer who has made the highest number of orders. Additionally, it can help businesses analyze top customers to understand their buying patterns.*/

SELECT CustomerID, FirstName, LastName, TotalOrders
FROM (
   SELECT CustomerID, FirstName, LastName, Count(OrderID) AS TotalOrders
   FROM Customers
   JOIN Orders USING(CustomerID)
   GROUP BY CustomerID
   ORDER BY TotalOrders DESC
   LIMIT 1
) AS TopCustomer;
-- -----------------------------------------------------------------------------------------------------------------------------
/* In a scenario where businesses want to display product reviews on an e-commerce website, it is essential to show positive reviews (4★ and 5★) on product pages. 
This approach helps potential buyers make decisions based on real customer feedback. Additionally, businesses can track which products customers love, 
aiding in marketing and inventory management. It also allows businesses to identify customers who leave positive reviews and understand what aspects of a 
product customers appreciate. Furthermore, this information serves as a way to improve products based on customer feedback. 
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
/*In situations where businesses aim to identify high-value customers, they seek to discover VIP customers who contribute the most revenue or 
understand customer spending behavior. This query retrieves all customers who have spent over 500 in total orders.*/
SELECT *  FROM (
   SELECT CustomerID, FirstName, LastName, SUM(TotalAmount) AS TotalSpent
   FROM Customers
   JOIN Orders USING(CustomerID)
   GROUP BY CustomerID
) AS CustomerTotals

WHERE TotalSpent > 500;
-- -----------------------------------------------------------------------------------------------------------------------------

/* In scenarios where businesses aim to identify large orders that significantly contribute to revenue or to segment VIP customers, 
there are a few important factors to consider. For instance, in cases requiring fraud detection, 
orders exceeding a specified threshold may need to undergo manual review before approval. A
dditionally, sales and revenue analysis is essential for recognizing trends, such as determining how many orders over 1000 are received each month. 
Furthermore, customers who spend over 1000 on a single order might qualify for discounts, free shipping, or loyalty rewards. 
To help with this analysis, an SQL query can be used to calculate the total amount spent on each order, filtering results to display only 
those orders with a total amount greater than 1000. This query retrieves the OrderID and the total amount 
(calculated as Quantity multiplied by Price) for each order, including only those where the total exceeds 1000. */

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

-- -----------------------------------------------------------------------------------------------------------------------------
/* In situations where it's important to monitor inventory, this query proves valuable for inventory management. 
It enables store owners to track products with moderate stock levels—neither too low nor too high—allowing them to make informed 
decisions about restocking or sales strategies. */
Select * From Products
where StockQuantity between 10 and 20;
-- -----------------------------------------------------------------------------------------------------------------------------

/* In a situation where it is necessary to generate an invoice for a specific customer, it is essential to gather details about 
all products ordered, including their quantity, price, and total cost per product. Additionally, the customer's name, address, email, and phone number 
must be included for the invoice generation. For instance, consider a scenario where a business wants to send an invoice to Customer 3, 
listing all products they purchased along with the total order amount and their contact details. 
This process also helps businesses track which products a customer buys most frequently. 
To achieve this, an SQL query can be used to retrieve detailed order information for a specific customer (CustomerID = 3) 
by joining multiple tables, such as orders, order details, products, customers, and categories. 
The query provides valuable insights into the order details, product information, and customer data. */
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



/* The query which we are unable to implement due to time constraints. */
-- -----------------------------------------------------------------------------------------------------------------------------

/* In situations where it is important to identify customers with the highest number of orders or the least frequently ordered customers, 
this SQL query can assist businesses in analyzing customer purchase behavior and identifying frequent customers. 
This analysis is also valuable for customer loyalty programs, where businesses may reward customers with a high order count. 
Additionally, the query can be enhanced by adding "ORDER BY OrderId DESC" to sort customers by order frequency. T
his query retrieves the CustomerID from the orders table and counts the total number of orders associated with each customer. */
select 
	CustomerID, 
	COUNT(*) as 'Order Id'
from orders
GROUP BY CustomerID;

-- The SQL query to retrieve all the records and columns from the table named orders.
SELECT * from orders;

/* In situations where businesses want to analyze product distribution across categories and assess inventory management, 
it is important to identify which categories have the most or the least products. The following SQL query can be used to retrieve the 
CategoryID from the Products table, count the total number of products in each category, group the results by CategoryID, 
and order them in descending order based on the count. */
select 
	CategoryId,
    count(*) as count
from products
group by categoryId
order by count desc;

-- -----------------------------------------------------------------------------------------------------------------------------
/* In situations where a product is rebranded or renamed, adjustments to the product's price may be necessary due to factors 
such as inflation, discounts, supplier costs, or changes in market trends and competitor pricing. 
The following SQL command can be used to update an existing record in the products table by modifying the product name and price for a 
specific product with productId. For example,  This update the name and price of the product with productId 3 in the "products" table, 
setting the name to 'Gaming Laptop Z16' and the price to 1599. */
UPDATE 
	products  
SET  ProductName = 'Gaming Laptop Z17', Price = 1600
WHERE  productId = 3;

select * from products;

-- -----------------------------------------------------------------------------------------------------------------------------
/* In a scenario where businesses want to provide a list of orders along with customer details, it is essential to track 
both pending and completed orders. If a customer record is missing, the order should still be included in the list, 
but will show NULL for the customer details. This approach helps maintain data integrity. 

Additionally, logistics teams need to monitor shipping addresses for order fulfillment and analyze the total 
sales amount over time. Therefore, this query retrieves order details along with customer information, ensuring that 
all orders are included, even if some customers are missing.
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

-- -----------------------------------------------------------------------------------------------------------------------------
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