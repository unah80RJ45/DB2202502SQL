create or alter procedure spActualizaFacturasCiudad @ciudad varchar(20)
as
	declare @factura int, @cliente int, @sub float, @isv float
	declare crsClientes cursor for select ClienteID from Cliente where Direccion = @ciudad
	open crsClientes; fetch next from crsClientes into @cliente
	while @@FETCH_STATUS = 0
		begin
			declare crsFacturas cursor for select facturaid from Factura where ClienteID = @cliente
			open crsFacturas; fetch next from crsfacturas into @factura

			while @@FETCH_STATUS = 0
				begin
					select @sub = isnull(sum(cantidad * precio), 0), @isv = isnull(sum(cantidad * precio * isv), 0)
					from FacturaDetalle where FacturaID = @factura
					update Factura set SubTotal = @sub, Impuesto = @isv, Total = @sub + @isv
					where FacturaID = @factura					
					fetch next from crsFacturas into @factura
				end
			close crsFacturas; deallocate crsFacturas;
		end
	close crsClientes; deallocate crsClientes;
go

exec spActualizaFacturasCiudad 'Tela'
