create or alter procedure spFacturasCliente @cliente int
as
	declare @tCliente as tCliente -- table (ClienteID int, Nombre varchar(20))
	declare @tFactura as tFactura

	insert into @tCliente select ClienteID, Nombre from DemoDB.dbo.Cliente where ClienteID = @cliente
	insert into @tCliente values(35, 'Surtidora XYZ')

	select * into #factura from DemoDB.dbo.Factura where ClienteID = @cliente
	select * into #detalle from DemoDB.dbo.FacturaDetalle where FacturaID in(select FacturaID from #factura)

	insert into @tFactura
	select f.FacturaID, f.ClienteID, f.Fecha, sum(d.cantidad * d.precio), sum(d.cantidad * d.precio * d.isv)
	from #factura f
	inner join #detalle d on f.FacturaID = d.FacturaID
	group by f.FacturaID, f.ClienteID, f.Fecha

	exec spClienteSelect @tCliente, @tfactura
go

exec spFacturasCliente 34