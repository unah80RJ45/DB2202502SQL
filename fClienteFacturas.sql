create or alter function dbo.fClienteFacturas(@cliente int) returns float
as
	begin
		declare @saldo float 

		select @saldo = sum(isnull(cantidad, 1) * isnull(precio, 1) * (1 + isnull(isv, 0)))
		from Factura f
		inner join FacturaDetalle fd on f.facturaid = fd.facturaid
		where clienteid = @cliente

		return @saldo
	end
go
print dbo.fClienteFacturas(34)