create or alter procedure spClienteSelect @cli  tCliente readonly, @fac tFactura readonly
as
	select * 
	from @cli c
	left join @fac f on c.clienteid = f.clienteid
go
