USE master
GO


-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'PizzaDB'
)
CREATE DATABASE PizzaSlavaDB;
GO


USE PizzaSlavaDB;
GO



/*------------   Create tables   --------------*/

CREATE TABLE DrinkDescript
(
id INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
drinkName varchar (255),
drinkPrice INT NOT NULL,
);

CREATE TABLE ExtraDescripts (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    eName varchar(255),
    ePrice int NOT NULL,
);

CREATE TABLE PizzaSizes
 (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    price int NOT NULL,
    sizeName varchar(255),
);

CREATE TABLE Customers
 (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    phoneNo varchar(255) NOT NULL,
    customerName varchar(255) NOT NULL,
    adress varchar(255)
);

CREATE TABLE Orders
 (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    orderDate DATETIME NOT NULL DEFAULT GETDATE(),
    customerId int NOT NULL FOREIGN KEY REFERENCES Customers(id)
);

CREATE TABLE SoldPizzas
 (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sizeId int NOT NULL FOREIGN KEY REFERENCES PizzaSizes(id),
    orderId int NOT NULL FOREIGN KEY REFERENCES Orders(id)
);

CREATE TABLE SoldExtras (
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    pizzaId int FOREIGN KEY REFERENCES SoldPizzas(id),
    eId int FOREIGN KEY REFERENCES ExtraDescripts(id)
);

CREATE TABLE SoldDrinkables
(
id INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
pizzaId INT NOT NULL FOREIGN KEY REFERENCES SoldPizzas(id),
drinkDescriptId INT NOT NULL FOREIGN KEY REFERENCES DrinkDescript(id)
);
GO

/* ------------------------ Insert Data into Tables -------------------- */
INSERT INTO PizzaSizes VALUES (20, 'Small');
INSERT INTO PizzaSizes VALUES (30, 'Medium');
INSERT INTO PizzaSizes VALUES (40, 'Large');
GO

INSERT INTO ExtraDescripts VALUES ('Corn',3);
INSERT INTO ExtraDescripts VALUES ('Onion',4);
INSERT INTO ExtraDescripts VALUES ('Mashrooms',6);
INSERT INTO ExtraDescripts VALUES ('Olives',6);
INSERT INTO ExtraDescripts VALUES ('Tuna',6);
INSERT INTO ExtraDescripts VALUES ('Tommatoes',6);
GO

INSERT INTO Customers VALUES ('052-5432623','Lucy Mandes', '17 Eshel st, Haifa');
INSERT INTO Customers VALUES ('054-5432623','Claudia Reinnes', '35 Nof st, Haifa');
INSERT INTO Customers VALUES ('053-5432623','Chris Brook', '5 Limon st, Haifa');
INSERT INTO Customers VALUES ('052-5432623','Terry Black', '56 Orange st, Haifa');
INSERT INTO Customers VALUES ('054-5432623','Don Meisner', '111 Truman st, Haifa');
INSERT INTO Customers VALUES ('053-5432623','Bill Orion', '206 Bluman st, Haifa');
INSERT INTO Customers VALUES ('052-5432623','Flicity Dorfner', '64 Cherry st, Haifa');
GO

INSERT INTO DrinkDescript VALUES ('Coca Cola', 8);
INSERT INTO DrinkDescript VALUES ('Fanta', 8);
INSERT INTO DrinkDescript VALUES ('Sprite', 8);
INSERT INTO DrinkDescript VALUES ('Corona', 12);
INSERT INTO DrinkDescript VALUES ('Heineken', 12);
GO

/* --------------------------------------------------------- */
INSERT INTO Orders(customerId) VALUES (1);
INSERT INTO Orders(customerId) VALUES (1);
INSERT INTO Orders(customerId) VALUES (2);
INSERT INTO Orders(customerId) VALUES (2);
INSERT INTO Orders(customerId) VALUES (2);
INSERT INTO Orders(customerId) VALUES (3);
INSERT INTO Orders(customerId) VALUES (4);
INSERT INTO Orders(customerId) VALUES (4);
INSERT INTO Orders(customerId) VALUES (4);
INSERT INTO Orders(customerId) VALUES (4);
INSERT INTO Orders(customerId) VALUES (5);
INSERT INTO Orders(customerId) VALUES (6);
INSERT INTO Orders(customerId) VALUES (7);
INSERT INTO Orders(customerId) VALUES (7);
INSERT INTO Orders(customerId) VALUES (7);
INSERT INTO Orders(customerId) VALUES (7);
GO

/* --------------------------------------------------------- */
INSERT INTO SoldPizzas VALUES (1, 1);
INSERT INTO SoldPizzas VALUES (2, 1);
INSERT INTO SoldPizzas VALUES (1, 2);
INSERT INTO SoldPizzas VALUES (2, 2);
INSERT INTO SoldPizzas VALUES (3, 2);
INSERT INTO SoldPizzas VALUES (3, 3);
INSERT INTO SoldPizzas VALUES (1, 3);
INSERT INTO SoldPizzas VALUES (1, 3);
INSERT INTO SoldPizzas VALUES (1, 4);
INSERT INTO SoldPizzas VALUES (1, 4);
INSERT INTO SoldPizzas VALUES (3, 4);
INSERT INTO SoldPizzas VALUES (1, 5);
INSERT INTO SoldPizzas VALUES (2, 6);
INSERT INTO SoldPizzas VALUES (3, 7);
INSERT INTO SoldPizzas VALUES (2, 8);
INSERT INTO SoldPizzas VALUES (3, 8);
INSERT INTO SoldPizzas VALUES (1, 9);
INSERT INTO SoldPizzas VALUES (2, 9);
INSERT INTO SoldPizzas VALUES (1, 10);
INSERT INTO SoldPizzas VALUES (2, 11);
INSERT INTO SoldPizzas VALUES (3, 11);
INSERT INTO SoldPizzas VALUES (3, 12);
INSERT INTO SoldPizzas VALUES (1, 12);
INSERT INTO SoldPizzas VALUES (1, 13);
INSERT INTO SoldPizzas VALUES (1, 14);
INSERT INTO SoldPizzas VALUES (1, 14);
INSERT INTO SoldPizzas VALUES (3, 15);
INSERT INTO SoldPizzas VALUES (1, 16);
INSERT INTO SoldPizzas VALUES (2, 16);
INSERT INTO SoldPizzas VALUES (3, 16);
INSERT INTO SoldPizzas VALUES (2, 16);
INSERT INTO SoldPizzas VALUES (3, 16);
GO

/* --------------------------------------------------------- */
INSERT INTO SoldExtras VALUES (1, 1);
INSERT INTO SoldExtras VALUES (1, 2);
INSERT INTO SoldExtras VALUES (1, 3);
INSERT INTO SoldExtras VALUES (2, 1);
INSERT INTO SoldExtras VALUES (2, 4);
INSERT INTO SoldExtras VALUES (3, 1);
INSERT INTO SoldExtras VALUES (3, 4);
INSERT INTO SoldExtras VALUES (3, 3);
INSERT INTO SoldExtras VALUES (4, 2);
INSERT INTO SoldExtras VALUES (4, 3);
INSERT INTO SoldExtras VALUES (4, 4);
INSERT INTO SoldExtras VALUES (5, 1);
INSERT INTO SoldExtras VALUES (5, 3);
INSERT INTO SoldExtras VALUES (5, 4);
INSERT INTO SoldExtras VALUES (6, 1);
INSERT INTO SoldExtras VALUES (7, 3);
INSERT INTO SoldExtras VALUES (7, 4);
INSERT INTO SoldExtras VALUES (8, 2);
INSERT INTO SoldExtras VALUES (8, 3);
INSERT INTO SoldExtras VALUES (8, 4);
INSERT INTO SoldExtras VALUES (9, 1);
INSERT INTO SoldExtras VALUES (9, 3);
INSERT INTO SoldExtras VALUES (9, 4);
INSERT INTO SoldExtras VALUES (10, 1);
INSERT INTO SoldExtras VALUES (10, 2);
INSERT INTO SoldExtras VALUES (10, 3);
INSERT INTO SoldExtras VALUES (10, 4);
INSERT INTO SoldExtras VALUES (11, 1);
INSERT INTO SoldExtras VALUES (11, 2);
INSERT INTO SoldExtras VALUES (11, 3);
INSERT INTO SoldExtras VALUES (11, 4);
INSERT INTO SoldExtras VALUES (12, 1);
INSERT INTO SoldExtras VALUES (12, 2);
INSERT INTO SoldExtras VALUES (12, 3);
INSERT INTO SoldExtras VALUES (13, 1);
INSERT INTO SoldExtras VALUES (13, 2);
INSERT INTO SoldExtras VALUES (13, 3);
INSERT INTO SoldExtras VALUES (13, 4);
INSERT INTO SoldExtras VALUES (14, 3);
INSERT INTO SoldExtras VALUES (14, 4);
INSERT INTO SoldExtras VALUES (15, 2);
INSERT INTO SoldExtras VALUES (15, 3);
INSERT INTO SoldExtras VALUES (16, 1);
INSERT INTO SoldExtras VALUES (16, 3);
INSERT INTO SoldExtras VALUES (17, 1);
INSERT INTO SoldExtras VALUES (17, 3);
INSERT INTO SoldExtras VALUES (18, 1);
INSERT INTO SoldExtras VALUES (18, 4);
INSERT INTO SoldExtras VALUES (19, 1);
INSERT INTO SoldExtras VALUES (19, 3);
INSERT INTO SoldExtras VALUES (20, 2);
INSERT INTO SoldExtras VALUES (21, 1);
INSERT INTO SoldExtras VALUES (22, 3);
INSERT INTO SoldExtras VALUES (23, 4);
INSERT INTO SoldExtras VALUES (24, 1);
INSERT INTO SoldExtras VALUES (24, 2);
INSERT INTO SoldExtras VALUES (24, 3);
INSERT INTO SoldExtras VALUES (24, 4);
INSERT INTO SoldExtras VALUES (25, 3);
INSERT INTO SoldExtras VALUES (26, 3);
INSERT INTO SoldExtras VALUES (27, 3);
INSERT INTO SoldExtras VALUES (28, 1);
INSERT INTO SoldExtras VALUES (29, 3);
INSERT INTO SoldExtras VALUES (30, 1);
INSERT INTO SoldExtras VALUES (30, 3);
INSERT INTO SoldExtras VALUES (31, 3);
GO

INSERT INTO SoldDrinkables VALUES (1, 1);
INSERT INTO SoldDrinkables VALUES (1, 2);
INSERT INTO SoldDrinkables VALUES (1, 3);
INSERT INTO SoldDrinkables VALUES (2, 1);
INSERT INTO SoldDrinkables VALUES (2, 4);
INSERT INTO SoldDrinkables VALUES (3, 1);
INSERT INTO SoldDrinkables VALUES (3, 5);
INSERT INTO SoldDrinkables VALUES (3, 3);
INSERT INTO SoldDrinkables VALUES (4, 2);
INSERT INTO SoldDrinkables VALUES (4, 3);
INSERT INTO SoldDrinkables VALUES (4, 4);
INSERT INTO SoldDrinkables VALUES (5, 2);
INSERT INTO SoldDrinkables VALUES (5, 1);
INSERT INTO SoldDrinkables VALUES (5, 4);
INSERT INTO SoldDrinkables VALUES (6, 1);
INSERT INTO SoldDrinkables VALUES (7, 3);
INSERT INTO SoldDrinkables VALUES (7, 4);
INSERT INTO SoldDrinkables VALUES (8, 2);
INSERT INTO SoldDrinkables VALUES (8, 3);
INSERT INTO SoldDrinkables VALUES (8, 4);
INSERT INTO SoldDrinkables VALUES (9, 1);
INSERT INTO SoldDrinkables VALUES (9, 5);
INSERT INTO SoldDrinkables VALUES (9, 4);
INSERT INTO SoldDrinkables VALUES (10, 1);
INSERT INTO SoldDrinkables VALUES (10, 2);
INSERT INTO SoldDrinkables VALUES (10, 3);
INSERT INTO SoldDrinkables VALUES (10, 4);
INSERT INTO SoldDrinkables VALUES (11, 1);
INSERT INTO SoldDrinkables VALUES (11, 3);
INSERT INTO SoldDrinkables VALUES (11, 3);
INSERT INTO SoldDrinkables VALUES (11, 4);
INSERT INTO SoldDrinkables VALUES (12, 1);
INSERT INTO SoldDrinkables VALUES (12, 2);
INSERT INTO SoldDrinkables VALUES (12, 5);
INSERT INTO SoldDrinkables VALUES (13, 1);
INSERT INTO SoldDrinkables VALUES (13, 2);
INSERT INTO SoldDrinkables VALUES (13, 3);
INSERT INTO SoldDrinkables VALUES (13, 4);
INSERT INTO SoldDrinkables VALUES (14, 4);
INSERT INTO SoldDrinkables VALUES (14, 4);
INSERT INTO SoldDrinkables VALUES (15, 2);
INSERT INTO SoldDrinkables VALUES (15, 3);
INSERT INTO SoldDrinkables VALUES (16, 1);
INSERT INTO SoldDrinkables VALUES (16, 5);
INSERT INTO SoldDrinkables VALUES (17, 1);
INSERT INTO SoldDrinkables VALUES (17, 3);
INSERT INTO SoldDrinkables VALUES (18, 1);
INSERT INTO SoldDrinkables VALUES (18, 4);
INSERT INTO SoldDrinkables VALUES (19, 2);
INSERT INTO SoldDrinkables VALUES (19, 3);
INSERT INTO SoldDrinkables VALUES (20, 2);
INSERT INTO SoldDrinkables VALUES (21, 5);
INSERT INTO SoldDrinkables VALUES (22, 3);
INSERT INTO SoldDrinkables VALUES (23, 4);
INSERT INTO SoldDrinkables VALUES (24, 1);
INSERT INTO SoldDrinkables VALUES (24, 2);
INSERT INTO SoldDrinkables VALUES (24, 3);
INSERT INTO SoldDrinkables VALUES (24, 1);
INSERT INTO SoldDrinkables VALUES (25, 3);
INSERT INTO SoldDrinkables VALUES (26, 3);
INSERT INTO SoldDrinkables VALUES (27, 5);
INSERT INTO SoldDrinkables VALUES (28, 1);
INSERT INTO SoldDrinkables VALUES (29, 3);
INSERT INTO SoldDrinkables VALUES (30, 3);
INSERT INTO SoldDrinkables VALUES (30, 3);
INSERT INTO SoldDrinkables VALUES (31, 3);
GO

/* -------------------------PROCEDURE-------------------------- */

CREATE PROCEDURE getAllOrders
AS
BEGIN
SELECT 
    C.id AS id,
    C.customerName AS name,
    C.phoneNo AS phone,
    C.adress AS adress,
    COUNT(O.id) AS orders,
    SUM(PS.price) + COALESCE(SUM(DE.ePrice), 0) + COALESCE(SUM(DD.drinkPrice), 0) AS totalOrderAmount
FROM 
    Customers C
LEFT JOIN 
    Orders O ON C.id = O.customerId
LEFT JOIN 
    SoldPizzas SP ON O.id = SP.orderId
LEFT JOIN 
    PizzaSizes PS ON SP.sizeId = PS.id
LEFT JOIN 
    SoldExtras SE ON SP.id = SE.pizzaId
LEFT JOIN 
    ExtraDescripts DE ON SE.eId = DE.id
LEFT JOIN 
    SoldDrinkables SD ON SP.id = SD.pizzaId
LEFT JOIN 
    DrinkDescript DD ON SD.drinkDescriptId = DD.id
GROUP BY 
    C.id, C.customerName, C.phoneNo, C.adress
ORDER BY 
    C.id;
END





CREATE PROCEDURE [dbo].[getOrderDetailsByCustomerId]
    @CustomerId INT
AS
BEGIN
    SELECT 
        Customers.id,
        Customers.phoneNo,
        Customers.customerName,
        Customers.adress,
        Orders.id AS OrderId,
        Orders.orderDate,
        PizzaSizes.sizeName,
        PizzaSizes.price AS PizzaPrice,
        ExtraDescripts.eName,
        ExtraDescripts.ePrice,
        DrinkDescript.drinkName,
        DrinkDescript.drinkPrice
    FROM 
        Customers
    LEFT JOIN 
        Orders ON Customers.id = Orders.customerId
    LEFT JOIN 
        SoldPizzas ON Orders.id = SoldPizzas.orderId
    LEFT JOIN 
        PizzaSizes ON SoldPizzas.sizeId = PizzaSizes.id
    LEFT JOIN 
        SoldExtras ON SoldPizzas.id = SoldExtras.pizzaId
    LEFT JOIN 
        ExtraDescripts ON SoldExtras.eId = ExtraDescripts.id
    LEFT JOIN 
        SoldDrinkables ON SoldPizzas.id = SoldDrinkables.pizzaId
    LEFT JOIN 
        DrinkDescript ON SoldDrinkables.drinkDescriptId = DrinkDescript.id
    WHERE 
        Customers.id = @CustomerId
END
GO

CREATE PROCEDURE deleteOrderById
    @OrderId INT
AS
BEGIN
    
    DELETE FROM SoldDrinkables WHERE pizzaId IN (SELECT id FROM SoldPizzas WHERE orderId = @OrderId);
    DELETE FROM SoldExtras WHERE pizzaId IN (SELECT id FROM SoldPizzas WHERE orderId = @OrderId);
    DELETE FROM SoldPizzas WHERE orderId = @OrderId;
    DELETE FROM Orders WHERE id = @OrderId;
END
GO

CREATE PROCEDURE getAllpizzaDescription
AS
BEGIN
    SELECT
        'pizzaSize' AS pizzaDescriptionType,
        sizeName AS pizzaDescription,
        price AS pizzaPrice
    FROM PizzaSizes

END;
GO

CREATE PROCEDURE getAllExtraDescription
AS
BEGIN
 SELECT
        'Extra' AS ExtraDescriptionType,
        eName AS ExtraDescription,
        ePrice AS ExtraPrice
    FROM ExtraDescripts

END;
GO

CREATE PROCEDURE getAlldrinkDescription
AS
BEGIN
       SELECT
        'Drink' AS drinkDescriptionType,
        drinkName AS drinkDescription,
        drinkPrice AS drinkPrice
    FROM DrinkDescript

END;
GO


CREATE PROCEDURE postOrder
    @selectPizza VARCHAR(255),
    @pizzaPrice INT,
    @selectExtras VARCHAR(255),
    @extraPrice INT,
    @selectDrinks VARCHAR(255),
    @drinkPrice INT,
    @customerName VARCHAR(255),
    @phoneNo VARCHAR(255),
    @adress VARCHAR(255)
AS
BEGIN
 
    DECLARE @customerId INT;

    IF NOT EXISTS (SELECT 1 FROM Customers WHERE phoneNo = @phoneNo)
    BEGIN
        INSERT INTO Customers (phoneNo, customerName, adress)
        VALUES (@phoneNo, @customerName, @adress);
        SET @customerId = SCOPE_IDENTITY();
    END
    ELSE
    BEGIN
        SELECT @customerId = id FROM Customers WHERE phoneNo = @phoneNo;
    END


    DECLARE @orderId INT;
    INSERT INTO Orders (customerId)
    VALUES (@customerId);
    SET @orderId = SCOPE_IDENTITY();


    DECLARE @pizzaId INT;
    INSERT INTO SoldPizzas (sizeId, orderId)
    VALUES ((SELECT id FROM PizzaSizes WHERE sizeName = @selectPizza), @orderId);
    SET @pizzaId = SCOPE_IDENTITY();


    IF @selectExtras IS NOT NULL AND @extraPrice IS NOT NULL
    BEGIN
        INSERT INTO SoldExtras (pizzaId, eId)
        SELECT @pizzaId, id FROM ExtraDescripts WHERE eName = @selectExtras;
    END

 
    IF @selectDrinks IS NOT NULL AND @drinkPrice IS NOT NULL
    BEGIN
        INSERT INTO SoldDrinkables (pizzaId, drinkDescriptId)
        SELECT @pizzaId, id FROM DrinkDescript WHERE drinkName = @selectDrinks;
    END

   
    SELECT @orderId AS OrderId;
END
GO

------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
-- HOW TO DROP DB, 
--  IN CASE YOU WANT TO COMPLETELY DELETE IT
-- 1) JUST DROP IT
use master
GO
DROP DATABASE PizzaSlavaDB

-- OR:
-- 2) CLOSE ALL CONNECTIONS AND THEN DROP IT
USE master;
GO
ALTER DATABASE PizzaSlavaDB 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE PizzaSlavaDB;

/*------------   Drop all tables   --------------*/


IF OBJECT_ID('[dbo].[SoldExtras]', 'U') IS NOT NULL
DROP TABLE [dbo].[SoldExtras]
GO

IF OBJECT_ID('[dbo].[ExtraDescripts]', 'U') IS NOT NULL
DROP TABLE [dbo].[ExtraDescripts]
GO

IF OBJECT_ID('[dbo].[SoldPizzas]', 'U') IS NOT NULL
DROP TABLE [dbo].[SoldPizzas]
GO  

IF OBJECT_ID('[dbo].[Orders]', 'U') IS NOT NULL
DROP TABLE [dbo].[Orders]
GO

IF OBJECT_ID('[dbo].[Customers]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customers]
GO

IF OBJECT_ID('[dbo].[PizzaSizes]', 'U') IS NOT NULL
DROP TABLE [dbo].[PizzaSizes]
GO
