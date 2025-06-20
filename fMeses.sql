create or alter function dbo.fMeses() returns @meses table (MesID int, Nombre varchar(50))
as
	begin
		insert into @meses values(1, 'Enero'), (2, 'Febrero'), (3, 'Marzo'), (4, 'Abril')
		insert into @meses values(5, 'Mayo'), (6, 'Junio'), (7, 'Julio'), (8, 'Agosto')
		insert into @meses values(9, 'Septiembre'), (10, 'Octubre'), (11, 'Noviembre'), (12, 'Diciembre')
		
		update @meses set Nombre = upper(Nombre)

		return
	end
go

select * from dbo.fMeses() where MesID = 2

select *
from Factura f
inner join dbo.fMeses() m on month(fecha) = m.mesid