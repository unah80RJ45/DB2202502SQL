create or alter trigger trgNotaInsert on Notas for insert
as
	declare @alumno int, @materia int
	declare crsInsert cursor for select alumnoid, materiaid from inserted; open crsInsert;
	fetch next from crsInsert into @alumno, @materia
	while @@FETCH_STATUS = 0
		begin
			update Notas set Nota = Tareas + Pruebas + Examen where AlumnoID = @alumno and MateriaID = @materia
			fetch next from crsInsert into @alumno, @materia
		end
	deallocate crsInsert
go

