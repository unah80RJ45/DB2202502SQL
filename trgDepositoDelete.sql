create or alter trigger trgDepositoDelete on Deposito for Delete
as
	declare @cuentaid int, @valor float

	select @cuentaid = CuentaID, @valor = Valor from deleted

	update Cuenta set Saldo = Saldo - @valor where CuentaID = @cuentaid
go
