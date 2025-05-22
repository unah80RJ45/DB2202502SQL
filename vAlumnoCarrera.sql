create or alter view vAlumnoCarreraCampus
as
	select a.AlumnoID, a.Nombre nomAlumno, a.Civil, a.CarreraID, c.Nombre nomCarrera, c.CampusID 
	from Alumno a
	inner join Carrera as c on a.CarreraID = c.CarreraID
go

create or alter view vAlumnosCarrera
as
	select nomCarrera, count(*) as Alumnos
	from vAlumnoCarreraCampus
	group by nomCarrera
go



insert into ALumno values(5, 'Miguel', 'U', 1)
