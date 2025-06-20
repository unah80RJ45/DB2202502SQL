create or alter function dbo.fFactuasCliente(@cliente int) returns @facturas table 
(FacturaID int, Fecha datetime, Valor float)
as
	begin
		declare @factura table (FacturaID int, Fecha datetime)
		declare @fDetalle table (FacturaID int, Cantidad int, Precio float, ISV float)

		insert into @factura select facturaid, fecha from Factura where ClienteID = @cliente
		insert into @fDetalle select facturaid, cantidad, precio, isv from FacturaDetalle 
		where FacturaID in(select FacturaID from @factura)

		insert into @facturas
		select f.facturaid, f.fecha, sum(fd.cantidad * fd.precio * (1 + fd.isv))
		from @factura as f
		left join @fDetalle fd on f.FacturaID = fd.FacturaID
		group by f.facturaid, f.fecha
		
		return
	end
go
select * from dbo.ffactuasCliente(34)
