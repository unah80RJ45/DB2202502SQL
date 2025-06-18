create or alter procedure spFacturaTotal @factura int
as
	declare @sub float, @isv float

	select @sub = isnull(sum(cantidad * precio), 0), @isv = isnull(sum(cantidad * precio * isv), 0)
	from FacturaDetalle where FacturaID = @factura

	update Factura set SubTotal = @sub, Impuesto = @isv, Total = @sub + @isv
	where FacturaID = @factura
go

select * from Factura where FacturaID = 22901
exec spFacturaTotal 22901
--update Factura set SubTotal = 0, Impuesto = 0, Total = 0
