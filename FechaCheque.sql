create or alter function dbo.FechaCheque(@fecha datetime) returns varchar(50)
as
	begin
		declare @mes varchar(50), @ret varchar(50) 
		select @mes = case month(@fecha)
							when 1 then 'Enero'	when 2 then 'Febrero' when 3 then 'Marzo'
							when 4 then 'Abril' when 5 then 'Mayo' when 6 then 'Junio'
							when 7 then 'Julio'
						end
		select @ret = concat(day(@fecha), ' de ', @mes, ' ', year(@fecha))
		return @ret
	end
go
print dbo.fechaCheque(getdate())
