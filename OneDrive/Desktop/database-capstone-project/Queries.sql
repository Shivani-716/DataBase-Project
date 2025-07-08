# creating the view for virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table

CREATE VIEW OrdersView AS
SELECT Order_Id, Quantity, TotalCost
FROM orders
WHERE Quantity > 2;

#This will show all orders with quantity > 2 including just those three columns.

select * from OrdersView;

#5 tables to get customers with orders costing more than 150 dollars

select c.CustomerId,c.CustomerName ,o.Order_Id,o.TotalCost,m.Itemname,mi.Coursename 
from customer c,bookings b,Orders o, menu m,menuitem mi
where c.CustomerId=b.CustomerId
and b.BookingId= o.Booking_Id
and o.Mneu_Id=m.Men_Id
and m.MenuitemsId=mi.MenuitemsId
and o.TotalCost > 150
ORDER BY o.TotalCost ASC;

#
SELECT distinct m.ItemName
FROM menu m
WHERE m.Men_Id = ANY (
    SELECT o.Mneu_Id
    FROM orders o
    WHERE o.Quantity > 2
);

# caling stored procedure for maximum quantity

call GetMaxQuantity();

####Prepared statements#######

# creating a vairable
set @customerid='03-575-7094';
set @customerid=null;

# prepare statement
PREPARE GetOrderDetail FROM 
'SELECT o.Order_Id, o.Quantity, o.TotalCost 
 FROM orders o,bookings b,customer c
 where c.CustomerId=b.CustomerId
and b.BookingId= o.Booking_Id
and c.CustomerId = ?';

EXECUTE GetOrderDetail USING @customerid;

# cancel the order

call CancelOrder(17-146-9681)