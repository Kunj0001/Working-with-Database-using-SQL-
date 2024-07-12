CREATE TABLE Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    ContactDate DATE NOT NULL,
    Description VARCHAR(255)
);
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15)
    );
    CREATE TABLE ContactEmployee (
    ContactEmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ContactID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
);
UPDATE Employee
SET PhoneNumber = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';
DELETE FROM ContactEmployee
WHERE EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Dianne' AND LastName = 'Connor')
AND ContactID = (SELECT ContactID FROM Contact WHERE Description LIKE '%Jack Lee%');
SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';
