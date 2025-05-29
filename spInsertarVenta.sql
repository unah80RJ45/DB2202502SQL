--create table Ventas
--(
--	FacturaID	int not null,
--	ClienteID	int not null,
--	Fecha		datetime not null,
--	SubTotal	float not null,
--	Impuesto	float not null
--)

create or alter procedure spInsertarVenta @fac int, @cli int, @fec datetime = null, @sub float, @imp float = 0
as
	insert into Ventas values(@fac, @cli, isnull(@fec, getdate()), @sub, @imp)
	select * from Ventas where FacturaID = @fac
go

exec spInsertarVenta @fac = 3, @cli = 1, @sub = 300, @fec = '2025-05-24'

