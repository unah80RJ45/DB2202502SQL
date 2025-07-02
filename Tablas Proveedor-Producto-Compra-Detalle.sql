create table Proveedor(
	ProveedorID int not null, Nombre varchar(50), Saldo float )

create table Producto(
	ProductoID	int not null, Nombre varchar(50), Existencia int)

create table Compra(
	CompraID	int not null, ProveedorID int, Valor float)

create table Detalle(
	CompraID	int not null, ProductoID int not null, Cantidad int not null, Costo float not null)

insert into Proveedor values(1, 'Abarroteria ABC', 0), (2, 'Supermercado XYZ', 0)
insert into Producto values(1, 'Arroz', 0), (2, 'Maiz', 0), (3, 'Azucar', 0)
insert into Compra values(1, 1, 0), (2, 1, 0), (3, 2, 0)