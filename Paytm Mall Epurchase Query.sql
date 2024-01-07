/* Paytm Mall E-puchase Data Analysis using SQL */


/* Q1. What does the "Category_Grouped" column represent, and how many unique categories are there? */
select distinct(Category_Grouped) from epurchase_data;


/* Q2. Can you list the top 5 shipping cities in terms of the number of orders? */
select Shipping_city as Top_5_Shipping_cities,
Count(Quantity) as Number_of_Orders from epurchase_data 
Group by shipping_city
order by Number_of_orders desc limit 5;


/* Q3. Show me a table with all the data for products that belong to the "Electronics" category. */
select * from epurchase_data where category like "Electronics";


/* Q4. Filter the data to show only rows with a "Sale_Flag" of 'Yes'. */
select * from epurchase_data where sale_flag like "on sale";


/* Q5. Sort the data by "Item_Price" in descending order. What is the most expensive item? */
select Category,Item_NM,Brand,Brick,Color,Size,Sale_Flag,Item_Price
from epurchase_data 
order by Item_Price desc limit 1;


/* Q6.Apply conditional formatting to highlight all products with a "Special_Price_effective" value below $50 in red. */
select *,case when Special_Price_effective >50 then 'Below $50'else
'Above or Equal to $50' end as price from epurchase_data where 
Color like "Red"; 


/* Q7. Create a pivot table to find the total sales value for each category. */
select Category,sum(Item_price) as Total_sales_value 
from epurchase_data group by Category;


/* Q8. Create a pie chart to show the distribution of products in the "Family" category. */
select Family,count(*) as Total_distribution from epurchase_data 
group by Family;


/* Q9. Create a pie chart to show the distribution of products in the "Family" category. */
select Family,count(*) as Total_distribution from epurchase_data
group by Family;


/* Q10. Ensure that the "Payment_Method" column only contains valid payment methods (e.g.,Visa, MasterCard). */
select * from epurchase_data where Payment_Method 
in ("Cod","Prepaid","visa","MasterCard");


/* Q11. Calculate the average "Quantity" sold for products in the "Clothing" category, grouped by "Product_Gender." */
select count(Quantity) as Total_count,avg(Quantity) from 
epurchase_data where Category_Grouped like "Apparels" 
group by Product_Gender;


/* Q12. Find the top 5 products with the highest "Value_CM1" and "Value_CM2" ratios. Create a chart to visualize this data. */
select Item_NM as Top_5_Product,value_CM1,value_CM2,
Round((value_CM1/Value_CM2),2) as Ratio from epurchase_data 
order by Ratio desc limit 5;


/* Q13. Identify the top 3 "Class" categories with the highest total sales. Create a stacked bar chart to represent this data. */
select Category,Item_Price as Total_Sales from epurchase_data 
group by category,Item_Price 
order by Item_Price desc limit 3;


/* Q14. Use VLOOKUP or INDEX-MATCH to retrieve the "Color" of a product with a specific "Item_NM". */
select color,Item_NM from epurchase_data 
where Item_NM="Puma Sneakers Black";  
//=VLOOKUP([@[Item_NM]],A1:AB50847,14,0)//


/* Q15. Calculate the total "coupon_money_effective" and "Coupon_Percentage" for products in the "Electronics" category. */ 
select sum(coupon_money_effective) as total_coupon_money_effective,
sum(Coupon_percentage) as Coupon_percentage from epurchase_data
where category="Electronics";


/* Q16.Perform a time series analysis to identify the month with the highest total sales. */
select sum(Item_price) as Total_Price, Extract Month() as Monthly_sales
from epurchase_data group by Monthly_sales order by Total_Price;

 
/* Q17. Calculate the total sales for each "Segment" and create a scatter plot to visualize
the relationship between "Item_Price" and "Quantity" in this data. */
select segment,sum(Item_price) as Total_sales,sum(Quantity) as Total_quantity
from epurchase_data group by segment;


/* Q18. Use the AVERAGEIFS function to find the average "Item_Price" for products that have a "Sale_Flag" of 'Yes.' */
select avg(Item_Price) from epurchase_data where Sale_Flag="on sale";
//=AVERAGEIFS(V2:V50847, P2:P50847, “On Sale”)//


/* Q19.Identify products with a "Paid_pr" higher than the average in their respective "Family" and "Brand" groups. */
select * from epurchase_data a where paid_pr >(select avg(paid_pr) 
as avg_price_pr from epurchase_data b where a.Family=b.Family
and a.Brand=b.Brand);


/* Q20. Create a pivot table to show the total sales for each "Color" within the "Clothing".
Category and use conditional formatting to highlight the highest sales. */
select color,sum(Item_price) as Total_sales from epurchase_data where 
category_Grouped="Apparels" group by color; 


/*          END Query          */