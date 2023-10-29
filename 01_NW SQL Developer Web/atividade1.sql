/* CREATE TABLE Region 
( 
  RegionID  NUMBER NOT NULL, 
  RegionDescription  CHAR(50) NOT NULL, 
CONSTRAINT PK_Region 
  PRIMARY KEY (RegionID)
) 
/ 

CREATE TABLE Territories 
( 
  TerritoryID  VARCHAR2(20) NOT NULL, 
  TerritoryDescription  CHAR(50) NOT NULL, 
  RegionID  NUMBER NOT NULL, 
CONSTRAINT PK_Territories 
  PRIMARY KEY (TerritoryID), 
CONSTRAINT FK_Territories_Region FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
) 
/ 

CREATE TABLE Categories 
( 
  CategoryID  NUMBER NOT NULL, 
  CategoryName  VARCHAR2(15) NOT NULL, 
  Description  VARCHAR2(300), 
  Picture  LONG RAW, 
CONSTRAINT PK_Categories 
  PRIMARY KEY (CategoryID)
) 
/ 

CREATE TABLE Suppliers 
( 
  SupplierID  NUMBER NOT NULL, 
  CompanyName  VARCHAR2(40) NOT NULL, 
  ContactName  VARCHAR2(30), 
  ContactTitle  VARCHAR2(30), 
  Address  VARCHAR2(60), 
  City  VARCHAR2(15), 
  Region  VARCHAR2(15), 
  PostalCode  VARCHAR2(10), 
  Country  VARCHAR2(15), 
  Phone  VARCHAR2(24), 
  Fax  VARCHAR2(24), 
  HomePage  VARCHAR2(200), 
CONSTRAINT PK_Suppliers 
  PRIMARY KEY (SupplierID)
) 
/ 

CREATE TABLE Products 
( 
  ProductID  NUMBER NOT NULL, 
  ProductName  VARCHAR2(40) NOT NULL, 
  SupplierID  NUMBER, 
  CategoryID  NUMBER, 
  QuantityPerUnit  VARCHAR2(20), 
  UnitPrice  NUMBER, 
  UnitsInStock  NUMBER, 
  UnitsOnOrder  NUMBER, 
  ReorderLevel  NUMBER, 
  Discontinued  NUMBER(1) NOT NULL, 
CONSTRAINT PK_Products 
  PRIMARY KEY (ProductID), 
CONSTRAINT CK_Products_UnitPrice   CHECK ((UnitPrice >= 0)), 
CONSTRAINT CK_ReorderLevel   CHECK ((ReorderLevel >= 0)), 
CONSTRAINT CK_UnitsInStock   CHECK ((UnitsInStock >= 0)), 
CONSTRAINT CK_UnitsOnOrder   CHECK ((UnitsOnOrder >= 0)), 
CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID), 
CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
) 
/ 

CREATE TABLE Shippers 
( 
  ShipperID  NUMBER NOT NULL, 
  CompanyName  VARCHAR2(40) NOT NULL, 
  Phone  VARCHAR2(24), 
CONSTRAINT PK_Shippers 
  PRIMARY KEY (ShipperID)
) 
/ 

CREATE TABLE Customers 
( 
  CustomerID  CHAR(5) NOT NULL, 
  CompanyName  VARCHAR2(40) NOT NULL, 
  ContactName  VARCHAR2(30), 
  ContactTitle  VARCHAR2(30), 
  Address  VARCHAR2(60), 
  City  VARCHAR2(15), 
  Region  VARCHAR2(15), 
  PostalCode  VARCHAR2(10), 
  Country  VARCHAR2(15), 
  Phone  VARCHAR2(24), 
  Fax  VARCHAR2(24), 
CONSTRAINT PK_Customers 
  PRIMARY KEY (CustomerID)
) 
/ 

CREATE TABLE Employees 
( 
  EmployeeID  NUMBER NOT NULL, 
  LastName  VARCHAR2(20) NOT NULL, 
  FirstName  VARCHAR2(10) NOT NULL, 
  Title  VARCHAR2(30), 
  TitleOfCourtesy  VARCHAR2(25), 
  BirthDate  DATE, 
  HireDate  DATE, 
  Address  VARCHAR2(60), 
  City  VARCHAR2(15), 
  Region  VARCHAR2(15), 
  PostalCode  VARCHAR2(10), 
  Country  VARCHAR2(15), 
  HomePhone  VARCHAR2(24), 
  Extension  VARCHAR2(4), 
  Photo  LONG RAW, 
  Notes  VARCHAR2(600), 
  ReportsTo  NUMBER, 
  PhotoPath  VARCHAR2(255), 
CONSTRAINT PK_Employees 
  PRIMARY KEY (EmployeeID), 
CONSTRAINT FK_Employees_Employees FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
) 
/ 

CREATE TABLE EmployeeTerritories 
( 
  EmployeeID  NUMBER NOT NULL, 
  TerritoryID  VARCHAR2(20) NOT NULL, 
CONSTRAINT PK_EmpTerritories 
  PRIMARY KEY (EmployeeID, TerritoryID), 
CONSTRAINT FK_EmpTerri_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID), 
CONSTRAINT FK_EmpTerri_Territories FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
) 
/ 

CREATE TABLE CustomerDemographics 
( 
  CustomerTypeID  CHAR(10) NOT NULL, 
  CustomerDesc  LONG, 
CONSTRAINT PK_CustomerDemographics 
  PRIMARY KEY (CustomerTypeID)
) 
/ 

CREATE TABLE CustomerCustomerDemo 
( 
  CustomerID  CHAR(5) NOT NULL, 
  CustomerTypeID  CHAR(10) NOT NULL, 
CONSTRAINT PK_CustomerDemo 
  PRIMARY KEY (CustomerID, CustomerTypeID), 
CONSTRAINT FK_CustomerDemo FOREIGN KEY (CustomerTypeID) REFERENCES CustomerDemographics(CustomerTypeID), 
CONSTRAINT FK_CustomerDemo_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
) 
/ 

CREATE TABLE Orders 
( 
  OrderID  NUMBER NOT NULL, 
  CustomerID  CHAR(5), 
  EmployeeID  NUMBER, 
  TerritoryID  VARCHAR2(20), 
  OrderDate  DATE, 
  RequiredDate  DATE, 
  ShippedDate  DATE, 
  ShipVia  NUMBER, 
  Freight  NUMBER, 
  ShipName  VARCHAR2(40), 
  ShipAddress  VARCHAR2(60), 
  ShipCity  VARCHAR2(15), 
  ShipRegion  VARCHAR2(15), 
  ShipPostalCode  VARCHAR2(10), 
  ShipCountry  VARCHAR2(15), 
CONSTRAINT PK_Orders 
  PRIMARY KEY (OrderID), 
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID), 
CONSTRAINT FK_Orders_Shippers FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID),
CONSTRAINT FK_Orders_Territories FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
) 
/ 

CREATE TABLE OrderDetails 
( 
  OrderID  NUMBER NOT NULL, 
  ProductID  NUMBER NOT NULL, 
  UnitPrice  NUMBER NOT NULL, 
  Quantity  NUMBER NOT NULL, 
  Discount  NUMBER NOT NULL, 
CONSTRAINT PK_Order_Details 
  PRIMARY KEY (OrderID, ProductID), 
CONSTRAINT CK_Discount   CHECK ((Discount >= 0 and Discount <= 1)), 
CONSTRAINT CK_Quantity   CHECK ((Quantity > 0)), 
CONSTRAINT CK_UnitPrice   CHECK ((UnitPrice >= 0)), 
CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
/

 */


 --Escreva o comando que selecione os produtos (id e nome) das categorias 2 ou 3, com preço unitário superior a 10, e cuja unidade é "bottles";
SELECT ProductID, ProductName
FROM Products
WHERE CategoryID IN (2, 3)
AND UnitPrice > 10
AND QuantityPerUnit LIKE '%bottles%';

--Escreva o comando que selecione o título, o último nome, a data de nascimento e o país de todos os empregados existentes;
SELECT Title, LastName, BirthDate, Country
FROM Employees;

--Escreva o comando que selecione todos os produtos (id e nome) da categoria com o código é 8 e que têm na quantityperunit ‘200 g’, ‘250 g’ ou ‘500 g’; 
SELECT ProductID, ProductName
FROM Products
WHERE CategoryID = 8
AND QuantityPerUnit IN ('200 g', '250 g', '500 g');

SELECT ProductID, ProductName
FROM Products
WHERE CategoryID = 8 /* cond1 */
AND QuantityPerUnit LIKE '%200 g%' /* cond2 */
OR QuantityPerUnit LIKE '%250 g%' /* cond3 */
OR QuantityPerUnit LIKE '%500 g%'; /* cond4 */

--Escreva um comando que apresenta o id, nome, preço unitário e preço com IVA (23%), atribuindo-lhe o nome “FinalPrice”, dos produtos das categorias 2 e 5.
SELECT ProductID, ProductName, UnitPrice, UnitPrice * 1.23 AS FinalPrice
FROM Products
WHERE CategoryID IN (2, 5);

-- Escreva um comando que apresenta o id, nome, preço unitário, quantidade em stock e valor total do stock (preço unitário * quantidade), atribuindo-lhe o nome “StockValue”, de todos os produtos das categorias 2 e 5.
SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS StockValue
FROM Products
WHERE CategoryID IN (2, 5);

--Escreva um comando que apresente o nome dos fornecedores, a cidade e uma coluna com o título do contacto seguido pelo seu nome, atribuindo-lhe o nome “ContactTitleAndName”, dos fornecedores dos Estados Unidos. Apresente os fornecedores ordenados por cidade.
SELECT CompanyName AS SupplierName, City, ContactTitle || ' ' || ContactName AS ContactTitleAndName
FROM Suppliers
WHERE Country = 'USA'
ORDER BY City;

-- Determine o número de produtos existentes; 
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- Determine quantos produtos são fornecidos por cada fornecedor (supplierid). Ordene os resultados de forma decrescente por número de produtos. 
SELECT Suppliers.SupplierID, Suppliers.CompanyName, COUNT(Products.ProductID) AS NumProducts -- Count the number of products for each supplier
FROM Suppliers
JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
ORDER BY NumProducts DESC; -- Sort from most to least number of products

--Determine quais as categorias (categoryid) que têm 10 ou mais produtos associados;
SELECT CategoryID, CategoryName 
FROM Categories
WHERE CategoryID IN (SELECT CategoryID
                     FROM Products
                     GROUP BY CategoryID
                     HAVING COUNT(*) >= 10);

-- Determine os Ids das ordens de compra que têm mais de 5 produtos diferentes associados
SELECT OrderID, NumProducts
FROM (
  SELECT OrderID, COUNT(DISTINCT ProductID) AS NumProducts
  FROM OrderDetails
  GROUP BY OrderID
  HAVING COUNT(DISTINCT ProductID) > 5
) subquery;


--Apresente os nomes dos produtos, o nome da categoria e o nome e a cidade das empresas fornecedoras da França ordenando os resultados por cidade e por nome de empresa.
SELECT Products.ProductName, Categories.CategoryName, Suppliers.CompanyName, Suppliers.City
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.Country = 'France'
ORDER BY Suppliers.City, Suppliers.CompanyName;

-- Apresente uma listagem com a quantidade de produtos diferentes presentes em cada ordem de compra realizadas para clientes da Noruega (Norway).
SELECT Orders.OrderID, COUNT(DISTINCT ProductID) AS NumProducts, Customers.Country
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Customers.Country = 'Norway'
GROUP BY Orders.OrderID, Customers.Country;


--Quantos empregados existem em cada país/cidade? Ordene os resultados por país e cidade
SELECT Country, City, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY Country, City
ORDER BY Country, City;

--Liste os produtos (id e nome), cuja quantidade média de encomenda em 1997 é superior a 30 unidades. 
--Mostre no resultado o valor da média e o número de vezes que o produto foi encomendado. Ordene por ordem decrescente do valor da média de unidades encomendadas

SELECT Products.ProductID, Products.ProductName, AVG(OrderDetails.Quantity) AS AvgQuantity, COUNT(OrderDetails.OrderID) AS NumOrders
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Orders.OrderDate BETWEEN TO_DATE('1997-01-01', 'YYYY-MM-DD') AND TO_DATE('1997-12-31', 'YYYY-MM-DD')
GROUP BY Products.ProductID, Products.ProductName
HAVING AVG(OrderDetails.Quantity) > 30
ORDER BY AvgQuantity DESC;


--Quantas vezes é que um produto foi vendido sendo que comprador, vendedor e fornecedor eram do mesmo país? 
SELECT COUNT(*) AS NumSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Shippers s ON o.ShipVia = s.ShipperID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Suppliers sup ON p.SupplierID = sup.SupplierID
WHERE c.Country = e.Country
AND c.Country = sup.Country
AND e.Country = sup.Country

--Quais os clientes que ainda não fizeram encomendas?
SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID
                         FROM Orders);
                        
