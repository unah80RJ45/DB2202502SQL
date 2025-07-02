create trigger trgCompraUpdate on Compra for update
as
	declare @proveedorid int, @valor float
	select @proveedorid = ProveedorID, @valor = valor from inserted
	update Proveedor set Saldo = Saldo + @valor where ProveedorID = @proveedorID
go

create trigger trgDetalleInsert on Detalle for insert
as
	declare @producto int, @compra int, @cantidad int, @costo float
	select @compra = compraid, @producto = productoid, @cantidad = cantidad, @costo = costo from inserted

	update producto set existencia = existencia + @cantidad where productoid = @producto
	update compra set valor = valor + @cantidad * @costo where compraid = @compra
go
