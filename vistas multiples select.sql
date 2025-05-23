create or alter view vFilas
as
	select CampusID, Nombre from Campus union
	select CarreraID, Nombre from Carrera union
	select AlumnoID, Nombre from Alumno
go
select * from vFilas
go
create or alter view vCarreraSinALumnos
as
	select * from Carrera where CarreraID not in(select CarreraID from ALumno)
go

update vFilas set Nombre = 'Prueba' where CampusID = 1

select * from vAlumnoCarrera

update vAlumnoCarrera set nombreCarrera = 'Prueba' where CarreraID = 2

select * from Carrera

select * from 
