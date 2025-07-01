create or alter trigger trgDepositoInsert on Deposito for insert
as
	declare @cuentaid int, @valor float

	select @cuentaid = cuentaid, @valor = valor from inserted

	update cuenta set saldo = saldo + @valor where CuentaID = @cuentaid
go

