-- con las tablas factura, facturadetalle cree una funcion que devuelva una tabla
-- con las ventas totalizadas x cliente. Luego use esa funcion para hacer una vista
-- que muestre clienteid, nombre, total ventas

create or alter function dbo.fVentasCliente() returns @ventas table 
(ClienteID int, Valor float)
as
	begin
		declare @factura table (FacturaID int, Valor float)

		insert into @factura
		select FacturaID, sum(cantidad * precio * (1 + isv))
		from FacturaDetalle group by FacturaID

		insert into @ventas
		select f.ClienteID, cast(sum(Valor) as numeric(11,2))
		from Factura f
		inner join @factura fa on f.FacturaID = fa.FacturaID
		group by f.ClienteID
	
		return
	end
go

select * from dbo.fventasCliente()