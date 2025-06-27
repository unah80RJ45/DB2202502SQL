create table Notas
(
	AlumnoID	int not null,
	MateriaID	int not null,
	Tareas		int not null,
	Pruebas		int not null,
	Examen		int not null,
	Nota		int not null
)

alter table Notas add constraint chkNotas check (Nota between 0 and 100)

update notas set nota = 0
insert into Notas values(1, 1, 20, 10, 50, 85); insert into Notas values(1, 2, 15, 5, 45, 60)
insert into Notas values(2, 1, 10, 10, 10, 50); insert into Notas values(2, 2, 30, 30, 30, 90)
insert into Notas values(3, 1, 10, 20, 40, 0); 
insert into Notas values(4, 1, 15, 20, 45, 0), (4, 2, 20, 20, 20, 0), (4, 3, 30, 30, 30, 0)
insert into Notas values(5, 1, 15, 20, 45, 0), (5, 2, 20, 20, 20, 0), (5, 3, 30, 30, 30, 0)

select * from Notas