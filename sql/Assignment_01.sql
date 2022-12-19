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


#Create Table With name Sales_Data_Final
Create or replace Table Sales_Data_Final(
Order_id varchar(20),
Order_Date date,
Ship_date date,
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


Select * From Sales_Data_Final;


# 01. Set Primary Key
Alter table sales_Data_Final
add  primary key (ORDER_ID);


# 02. CHECK THE ORDER DATE AND SHIP DATE TYPE AND THINK IN WHICH DATA TYPE YOU HAVE TO CHANGE.
# Before Uploading the file I changed the date format in Excel Workbook


# 03 EXTACT THE LAST NUMBER AFTER THE - AND CREATE OTHER COLUMN AND UPDATE IT.
Select *, split_part(order_id,'-',3) as Last_order_ID From Sales_Data_Final;


# 04 FLAG ,IF DISCOUNT IS GREATER THEN 0 THEN  YES ELSE FALSE AND PUT IT IN NEW COLUMN FRO EVERY ORDER ID.
Select *,
Case 
    When discount > 0 Then 'YES' 
    Else 'NO'
End as FRO
From Sales_Data_Final;


# 05 FIND OUT THE FINAL PROFIT AND PUT IT IN COLUMN FOR EVERY ORDER ID.
Select *, (profit - Shipping_cost) as Final_Profit From sales_data_final;


# 06 FIND OUT HOW MUCH DAYS TAKEN FOR EACH ORDER TO PROCESS FOR THE SHIPMENT FOR EVERY ORDER ID.
Select *, (ship_date-Order_Date) as Day_taken From Sales_data_Final;



# 07 FLAG THE PROCESS DAY AS BY RATING IF IT TAKES LESS OR EQUAL 3  DAYS MAKE 5,LESS OR EQUAL 
# THAN 6 DAYS BUT MORE THAN 3 MAKE 4,LESS THAN 10 BUT MORE THAN 6 MAKE 3,MORE THAN 10 MAKE IT 2 FOR EVERY ORDER ID.
Select *,                
Case
    When (ship_date-Order_Date) <= 3 Then '*****'
    When (ship_date-Order_Date) <=6 and (ship_date-Order_Date) > 3 Then '****'
    When (ship_date-Order_Date) <10 and (ship_date-Order_Date) > 6 Then '***'
    Else '**'
End As Rating
From Sales_Data_Final;
