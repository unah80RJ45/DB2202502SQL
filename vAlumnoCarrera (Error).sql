create or alter view vAlumnoCarrera
as
	select a.AlumnoID, a.Nombre, a.Sexo, a.Civil, 
	nomCivil = case Civil when 'C' then 'Casado' when 'S' then 'Soltero' else 'Union Libre' end,
	c.nombre as NombreCarrera
	from Alumno a
	inner join Carrera c on a.carreraid = c.carreraid
go

select * from vAlumnoCarrera

alter table Alumno add Sexo varchar null
alter table Alumno add Telefono varchar(20)
