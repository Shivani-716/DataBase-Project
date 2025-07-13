CREATE TABLE Temp_Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Temp_Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Temp_Customers(CustomerID)
);


INSERT INTO Temp_Customers (CustomerName, ContactNumber, Email) VALUES
('Alice Johnson', '123-456-7890', 'alice@example.com'),
('Bob Smith', '987-654-3210', 'bob@example.com'),
('Carol Lee', '555-123-4567', 'carol@example.com'),
('David Kumar', '444-222-1111', 'david@example.com'),
('Emma Watson', '333-555-6666', 'emma@example.com');

INSERT INTO Temp_Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1),
(5, '2022-10-14', 4, 5);

CALL CheckBooking('2022-10-10', 5);

CALL AddValidBooking(5, '2022-10-10', 5, 2);  

CALL AddBooking(6, 2, '2022-10-15', 3);

CALL UpdateBooking(3, '2022-11-20');

CALL CancelBooking(2);






