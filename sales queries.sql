
use sales_dashboard;
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM orders;
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders;
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM orders;
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
MONTHNAME(`Order Date`) AS Month,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY MONTH(`Order Date`), MONTHNAME(`Order Date`)
ORDER BY MONTH(`Order Date`);
SELECT `Order Date`
FROM orders
LIMIT 5;
SELECT
MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'));
SELECT
MONTHNAME(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS Month,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY
MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y')),
MONTHNAME(STR_TO_DATE(`Order Date`, '%d/%m/%Y'))
ORDER BY
MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y'));
SELECT
YEAR(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS Year,
MONTHNAME(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS Month,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY
YEAR(STR_TO_DATE(`Order Date`, '%d/%m/%Y')),
MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y'))
ORDER BY
YEAR(STR_TO_DATE(`Order Date`, '%d/%m/%Y')),
MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y'));
SELECT
`Product Name`,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 5;
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales,
RANK() OVER(ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM orders
GROUP BY Region;
CREATE VIEW region_sales AS
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Region;
SELECT * FROM region_sales;
SELECT VERSION();