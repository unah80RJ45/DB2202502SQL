create type tCliente as table
(
	ClienteID	int,
	Nombre		varchar(50)
)

create type tFactura as table
(
	FacturaID	int not null primary key,
	ClienteID	int not null,
	Fecha		datetime,
	SubTotal	float,
	Impuesto	float
)
