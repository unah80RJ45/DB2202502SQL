create or alter view vVentasCliente
as
	select c.ClienteID, c.Nombre, isnull(vc.valor, 0) Ventas
	from Cliente c
	left join dbo.fVentasCliente() vc on c.ClienteID = vc.ClienteID
go

select * from vVentasCliente