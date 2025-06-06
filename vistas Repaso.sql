create or alter view vCuenta
as
	select b.BancoID, b.Nombre nomBanco, c.CuentaID, c.Nombre nomCuenta, c.Moneda
	from Cuenta as c
	inner join Banco b on c.BancoID = b.BancoID
go

create or alter view vVistasBanco
as
	select nomBanco, count(*) as Cuentas
	from vCuenta
	group by nomBanco
go

select * from vVistasBanco
