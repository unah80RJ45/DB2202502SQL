create table Cuenta
(
	CuentaID		int not null,	Banco	varchar(50) not null,
	Codigo			varchar(20) not null,
	Saldo			float not null, constraint pkCuentaID primary key (CuentaID)
)
create table Deposito
(
	CuentaID	int not null,		DepositoID	int not null,
	Fecha		datetime not null,	Observacion	varchar(50) not null,
	Valor		float not null,
	constraint pkDeposito primary key (CuentaID, DepositoID),
	constraint fkDepositoCuenta foreign key (CuentaID) references Cuenta
)
insert into Cuenta values(1, 'Banco Popular', '201-102030', 0), (2, 'Banco Norte', '750-203-170', 0)
