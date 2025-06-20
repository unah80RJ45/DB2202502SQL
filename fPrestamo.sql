create or alter function dbo.fPrestamo(@capital float, @tiempo int, @tasa int) returns @cuotas table
(CuotaID int, Inicial float, Capital float, Interes float, Final float)
as
	begin
		declare @i int = 0, @interes float

		while @i < @tiempo
			begin
				select @i = @i + 1, @interes = @capital * (@tasa / @tiempo /100.0)
				insert into @cuotas values(@i, @capital, @capital / @tiempo, @interes, @capital - @capital / @tiempo * @i)
			end
		
		return
	end
go

select * from dbo.fPrestamo(12000, 12, 5)