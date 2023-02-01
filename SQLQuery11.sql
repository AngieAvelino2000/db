CREATE TABLE Departamentos(
Codigo int PRIMARY KEY IDENTITY(1,1),
Nombre nvarchar(100),
Presupuesto int
);


CREATE TABLE Empleados (
DNI Varchar(8) PRIMARY KEY  NOT NULL,
Nombres nvarchar(100) Not NUll,
Apellidos nvarchar (255) not null,
Departamento int FOREIGN KEY REFERENCES Departamentos(Codigo) ,
)

