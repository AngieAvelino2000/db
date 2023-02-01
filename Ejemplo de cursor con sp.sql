-----CREAMOS PROCEDIMIENTO ALMACENADO -------
CREATE PROCEDURE sp_mi_cursor 
AS
BEGIN 
	----CREAMOS TABLA TEMPORAL----
	CREATE TABLE #productos_categoria(
	id INT PRIMARY KEY IDENTITY,
	ProductID INT,
	ProductName VARCHAR(50),
	CategoryID INT,
	CategoryName VARCHAR(100),
	UnitPrice REAL,
	UnitPriceNEW REAL
	)

----DECLARAMOS EL CURSOR---
	DECLARE mi_cursor CURSOR FOR SELECT ProductID, ProductName, Categories.CategoryID, Categories.CategoryName,UnitPrice
						FROM Products
						JOIN Categories ON Categories.CategoryID = Products.CategoryID
----ABRIMOS CURSOR----------
	OPEN mi_cursor
	Declare @ProductID INT, @ProductName Varchar(50),@CategoryID INT, @CategoryName VARCHAR(100), @UnitPrice REAL
-----LLAMAMOS A LAS VARIABLES-----------
	FETCH NEXT FROM mi_cursor INTO @ProductID, @ProductName, @CategoryID, @CategoryName, @UnitPrice
-----RECORREMOS REGISTROS------
	WHILE (@@FETCH_STATUS =0)
	BEGIN
		--Almacenamos valores dentro de la tabla temporal----
		INSERT INTO #productos_categoria(ProductID,ProductName,CategoryID,CategoryName,UnitPrice,UnitPriceNEW)
		---------------
			SELECT @ProductID,@ProductName,@CategoryID,@CategoryName,@UnitPrice, @UnitPrice+5
			FETCH NEXT FROM mi_cursor INTO @ProductID, @ProductName, @CategoryID, @CategoryName, @UnitPrice 
	END
---------CERRAMOS Y ELIMINAMOS CURSOR----
	CLOSE mi_cursor
	DEALLOCATE mi_cursor
-------HACEMOS UN SELECT A NUESTRA TABLA TEMPORAL------
	SELECT * FROM #productos_categoria

------CERRAMOS PROCEDIMIENTO ALMACENADO------
END