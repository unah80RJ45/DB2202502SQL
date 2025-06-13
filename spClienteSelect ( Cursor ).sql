create or alter procedure spClienteSelect
as
	declare @ClienteID as int
	
	select * into #Cliente from cliente where Direccion = 'Tela' 
	
	declare crsCliente cursor for 
	select ClienteID from #Cliente order by ClienteID desc

	open crsCliente; fetch next from crsCliente into @ClienteID; 

	while @@FETCH_STATUS = 0
		begin
			select @ClienteID; fetch next from crsCliente into @ClienteID;
		end

	deallocate crsCliente
go

spClienteSelect
select ClienteID from cliente where Direccion = 'Tela'
