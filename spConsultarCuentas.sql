create or alter procedure spConsultarCuentas @banco int
as
	declare @tBanco table (BancoID int, Nombre varchar(50))

	insert into @tBanco  select BancoID, Nombre from Banco where BancoID = @banco
	select * into #cuenta from Cuenta where BancoID = @banco

	select *
	from #cuenta c 
	inner join @tBanco b on c.BancoID = b.BancoID
go
exec spConsultarCuentas 1
