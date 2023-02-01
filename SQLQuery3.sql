CREATE TABLE Fabricantes (
Codigo int PRIMARY KEY identity(1,1) NOT NULL,
Nombre nvarchar (100)
);

CREATE TABLE Articulos (
Codigo int PRIMARY KEY identity(1,1) NOT NULL,
Nombre nvarchar (100),
Precio int,
Fabricante int FOREIGN KEY REFERENCES Fabricantes (Codigo)
);