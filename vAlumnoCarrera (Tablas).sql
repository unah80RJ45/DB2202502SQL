create table Campus
(
	CampusID	int not null,
	Nombre		varchar(50) not null,
	constraint  pkCampus primary key (CampusID)
)

create table Carrera 
(
	CarreraID	int not null,
	Nombre		varchar(50) not null,
	CampusID	int not null,
	constraint pkCarreraID primary key (CarreraID),
	constraint fkCarreraCampus foreign key (CampusID) references Campus
)

create table Alumno
(
	AlumnoID	int not null,
	Nombre		varchar(50) not null,
	Civil		varchar not null,
	CarreraID	int not null,
	constraint pkAlumno primary key (AlumnoID),
	constraint fkAlumnoCarrera foreign key (CarreraID) references Carrera
)

insert into Campus values(1, 'SPS'), (2, 'CU'), (3, 'CUROC')
insert into Carrera values(1, 'Sistemas', 1), (2, 'Periodismo', 1), (3, 'Medicina', 2)
insert into Alumno values (1, 'Juan', 'C', 2), (2, 'Jose', 'C', 3), (3, 'Maria', 'S', 2), (4, 'Pedro', 'U', 1)

--drop table Alumno 
--drop table Carrera
--drop table Campus
