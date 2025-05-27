create or alter procedure spMultipleSelect 
as	
	select * from Alumno
	select * from Carrera
	select * from Campus
go

spMultipleSelect