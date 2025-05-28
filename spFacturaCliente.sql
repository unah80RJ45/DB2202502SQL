create or alter procedure spFacturaCliente @clienteid int
as
	select * into #Factura from DemoDB.dbo.Factura where ClienteID = @clienteid
	select * into #cliente from DemoDB.dbo.Cliente where ClienteID = @clienteid
	select * into #facturadetalle from DemoDB.dbo.FacturaDetalle where FacturaID in(select FacturaID from #Factura)
	select * into #articulo from DemoDB.dbo.Articulo where ArticuloID in(select ArticuloID from #facturadetalle)

	select f.FacturaID, f.ClienteID, f.Fecha, f.Tipo, c.Nombre, fd.ArticuloID, a.Nombre, fd.Cantidad,
	cast(fd.Precio as numeric(11,0)) as Precio, fd.ISV, cast(fd.Cantidad * fd.Precio as numeric(11,2)) as SubTotal
	from #Factura f
	inner join #facturadetalle fd on f.FacturaID = fd.FacturaID
	inner join #cliente c on f.clienteid = c.clienteid
	inner join #articulo a on fd.articuloid = a.articuloid
go

exec spFacturaCliente 34
