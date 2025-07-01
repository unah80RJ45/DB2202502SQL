create or alter trigger trgDepositoUpdate on Deposito for update
as
	declare @cuentaid int, @valor float

	select @cuentaid = i.CuentaID, @valor = i.Valor - d.Valor
	from inserted i
	inner join deleted d on i.CuentaID = d.CuentaID and i.DepositoID = d.DepositoID

	update Cuenta set Saldo = Saldo + @valor where CuentaID = @cuentaid
go