create trigger trgProductoDelete on Producto for delete
as
	delete from Detalle where ProductoID in(select ProductoID from deleted)
go

select * from Producto 
select * from Detalle

delete from Producto where ProductoID = 2

