create database carrental
use carrental 
CREATE TABLE Vehicle (
vehicleID INT PRIMARY KEY,
make VARCHAR(50),
model VARCHAR(50),
year INT,
dailyRate DECIMAL(10, 2),
status VARCHAR(20) CHECK (status IN ('available', 'notAvailable')),
passengerCapacity INT,
engineCapacity DECIMAL(5, 2)
)

CREATE TABLE Customer (
customerID INT PRIMARY KEY,
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(100),
phoneNumber VARCHAR(15)
)

CREATE TABLE Lease (
leaseID INT PRIMARY KEY,
vehicleID INT,
customerID INT,
startDate DATE,
endDate DATE,
type VARCHAR(20) CHECK (type IN ('DailyLease', 'MonthlyLease')),
FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
FOREIGN KEY (customerID) REFERENCES Customer(customerID)
)

CREATE TABLE Payment (
paymentID INT PRIMARY KEY,
leaseID INT,
paymentDate DATE,
amount DECIMAL(10, 2),
FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
)

INSERT INTO Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity) VALUES
(1, 'Toyota', 'Camry', 2020, 50.00, 'available', 5, 2.5),
(2, 'Honda', 'Civic', 2019, 45.00, 'available', 5, 2.0),
(3, 'Ford', 'Focus', 2018, 40.00, 'notAvailable', 5, 2.0),
(4, 'Chevrolet', 'Malibu', 2021, 55.00, 'available', 5, 2.0),
(5, 'Nissan', 'Altima', 2020, 52.00, 'available', 5, 2.5),
(6, 'Hyundai', 'Sonata', 2021, 54.00, 'notAvailable', 5, 2.5),
(7, 'Kia', 'Optima', 2022, 57.00, 'available', 5, 2.4),
(8, 'Volkswagen', 'Jetta', 2019, 49.00, 'available', 5, 1.4),
(9, 'Subaru', 'Impreza', 2020, 48.00, 'notAvailable', 5, 2.0),
(10, 'Mazda', '6', 2021, 53.00, 'available', 5, 2.5)

INSERT INTO Customer (customerID, firstName, lastName, email, phoneNumber) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2345678901'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '3456789012'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '4567890123'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '5678901234'),
(6, 'David', 'Wilson', 'david.wilson@example.com', '6789012345'),
(7, 'Eva', 'Garcia', 'eva.garcia@example.com', '7890123456'),
(8, 'Frank', 'Martinez', 'frank.martinez@example.com', '8901234567'),
(9, 'Grace', 'Anderson', 'grace.anderson@example.com', '9012345678'),
(10, 'Hannah', 'Thomas', 'hannah.thomas@example.com', '0123456789')

INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, type) VALUES
(1, 1, 1, '2024-09-01', '2024-09-07', 'DailyLease'),
(2, 2, 2, '2024-09-02', '2024-09-10', 'MonthlyLease'),
(3, 3, 3, '2024-09-03', '2024-09-05', 'DailyLease'),
(4, 4, 4, '2024-09-04', '2024-09-15', 'MonthlyLease'),
(5, 5, 5, '2024-09-05', '2024-09-12', 'DailyLease'),
(6, 6, 6, '2024-09-06', '2024-09-20', 'MonthlyLease'),
(7, 7, 7, '2024-09-07', '2024-09-10', 'DailyLease'),
(8, 8, 8, '2024-09-08', '2024-09-14', 'MonthlyLease'),
(9, 9, 9, '2024-09-09', '2024-09-11', 'DailyLease'),
(10, 10, 10, '2024-09-10', '2024-09-17', 'MonthlyLease')


INSERT INTO Payment (paymentID, leaseID, paymentDate, amount) VALUES
(1, 1, '2024-09-01', 350.00),
(2, 2, '2024-09-02', 1350.00),
(3, 3, '2024-09-03', 200.00),
(4, 4, '2024-09-04', 825.00),
(5, 5, '2024-09-05', 300.00),
(6, 6, '2024-09-06', 1200.00),
(7, 7, '2024-09-07', 350.00),
(8, 8, '2024-09-08', 950.00),
(9, 9, '2024-09-09', 200.00),
(10, 10, '2024-09-10', 1200.00)