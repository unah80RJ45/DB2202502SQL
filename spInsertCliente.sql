--create table Cliente
--(
--	ClienteID	int not null,
--	Nombre		varchar(50) not null
--)
 create or alter procedure spInsertCliente @Nombre varchar(50)
 as
	declare @id int

	if not exists(select * from cliente where nombre = @Nombre)
		begin
			select @id = isnull(max(ClienteID), 0) + 1 from Cliente 
			insert into Cliente values(@id, @Nombre)
		end
go

spInsertCliente 'Jose Lopez'

select * from cliente
