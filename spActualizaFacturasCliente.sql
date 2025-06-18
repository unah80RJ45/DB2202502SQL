create or alter procedure spActualizaFacturasCliente @cliente int
as
	declare @factura int 
	declare crsFacturas cursor for select FacturaID from Factura where clienteid = @cliente
	open crsFacturas; fetch next from crsFacturas into @factura
	
	while @@FETCH_STATUS = 0
		begin
			exec spFacturaTotal @factura; fetch next from crsFacturas into @factura
		end
	close crsFacturas; deallocate crsFacturas;
go
