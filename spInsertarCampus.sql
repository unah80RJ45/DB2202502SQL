create or alter procedure spInsertarCampus @nombre varchar(50)
as
	declare @campusid int
	select @campusid = max(CampusID) + 1 from Campus

	insert into Campus values(@campusid, @nombre)

	select * from Campus where CampusID = @campusid
go

spInsertarCampus 'CURYO'

delete from Campus where CampusID = 6
select * from Campus
