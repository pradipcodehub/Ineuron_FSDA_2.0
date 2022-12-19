/*
--------------------------------

---------Assignment_01----------

--------------------------------

Author :- Ineuron
Tool Used :- Snowflake

*/

# Create db With name Database_01
Create Database Database_01


# Command to use this db
Use Database_01


# 01. Load the given dataset into snowflake with a primary key to Order Date column.
use Database_01;
Create or replace Table Sales_Data_Final(
Order_id varchar(20),
Order_Date varchar primary key,
Ship_date varchar(20),
Ship_mode Varchar(20),
Customer_name Varchar(50),
Segment Varchar(20),
State Varchar(100),
Country Varchar(100),
Market Varchar(50),
Region Varchar(20),
Product_Id Varchar(50),
Category Varchar(50),
Sub_Category Varchar(50),
Product_name Varchar(500),
Sales number(20),
quantity number(10),
Discount number(10,2),
Profit number(10,2),
Shipping_Cost number(10,2),
Order_Priority Varchar(50));


# 02. Change the Primary key to Order Id Column.
Alter table Sales_Data_Final
Drop Primary Key;

Alter table sales_Data_Final
add  primary key (ORDER_ID);



# 03. Check the data type for Order date and Ship date and mention in what data type it should be?
Describe table Sales_data_final;
# Since its datatype is Varchar but its datatype should be 'DATE'


# 04 Create a new column called order_extract and extract the number after the last ‘–‘from Order ID column.;
Select *, split_part(order_id,'-',3) as order_extract From Sales_Data_Final;


# 05 Create a new column called Discount Flag and categorize it based on discount. Use ‘Yes’ if the discount is greater than zero else ‘No’.
Select *,
Case 
    When discount > 0 Then 'YES' 
    Else 'NO'
End as Discount_Flag
From Sales_Data_Final;


# 06 Create a new column called process days and calculate how many days it takes for each order id to process from the order to its shipment.
Select *, (ship_date-Order_Date) as Process_days From Sales_data_Final;


# 07 Create a new column called Rating and then based on the Process dates give rating like given below.
# a. If process days less than or equal to 3days then rating should be 5
# b. If process days are greater than 3 and less than or equal to 6 then rating should be 4
# c. If process days are greater than 6 and less than or equal to 10 then rating should be 3
# d. If process days are greater than 10 then the rating should be 2.

Select *,                
Case
    When (ship_date-Order_Date) <= 3 Then 5
    When (ship_date-Order_Date) > 3 and (ship_date-Order_Date) <=6  Then 4
    When (ship_date-Order_Date) > 6 and (ship_date-Order_Date) <=10  Then 3
    Else 2
End As Rating
From Sales_Data_Final;
