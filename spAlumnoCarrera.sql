create or alter procedure spAlumnoCarrera @carrera int, @civil varchar
as
	select * 
	from alumno as a
	inner join Carrera as c on a.CarreraID = c.CarreraID
	where (c.CarreraID = @carrera or @carrera = 0) and (a.Civil = @civil or @civil = '')
go

spALumnoCarrera 0, ''
