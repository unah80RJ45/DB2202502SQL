create or alter function dbo.fCostoProducto(@productoid int, @unidades int) returns float
as
	begin
		declare @cantidad int, @costo float, @costotal as float = 0
		declare crsCosto cursor scroll for select cantidad, costo from Detalle where ProductoID = @productoid --order by compraid desc
		open crsCosto; fetch last from crsCosto into @cantidad, @costo
		while @@FETCH_STATUS = 0 and @unidades > 0
			begin
				if @cantidad < @unidades
					select @costotal = @costotal + @cantidad * @costo, @unidades = @unidades - @cantidad
				else
					select @costotal = @costotal + @unidades * @costo, @unidades = 0				
				fetch prior from crsCosto into @cantidad, @costo
			end
		deallocate crsCosto; return @costotal
	end