create or alter procedure spInsertarCuenta 
@bco varchar(50), @nom varchar(50), @mon varchar(10), @est varchar, @che int, @val float
as
	begin transaction
		declare @bcoID as int, @ctaID int, @err int = 0
		select @bcoID = max(BancoID) from Banco where Nombre = @bco; 
		select @ctaID = max(CuentaID) + 1 from Cuenta 
		if @bcoID is null
			begin
				select @bcoID = max(BancoID) + 1 from Banco; insert into Banco values(@bcoID, @bco);
				if @@ERROR <> 0 and @err = 0 select @err = 1
			end
		insert into Cuenta values(@bcoID, @ctaID, @nom, @mon, @est); 	
		if @@ERROR <> 0 and @err = 0 select @err = 1
		insert into Cheque values(@bcoID, @ctaID, @che, @val)
		if @@ERROR <> 0 and @err = 0 select @err = 1
		if @err = 0 
			commit;
		else
			rollback;
go
