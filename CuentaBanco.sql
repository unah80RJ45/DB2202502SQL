create table Cuenta
(
	BancoID		int not null,
	CuentaID	int not null,
	Nombre		varchar(50) not null,
	Moneda		varchar(10) not null,
	Estado		varchar not null
)

create table Cheque
(
	BancoID		int,
	CuentaID	int,
	ChequeID	int,
	Valor		float
)
