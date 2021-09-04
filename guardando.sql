create table Personas(
	codper integer primary key,
	nombre varchar(60),
	ap varchar(40) not null,
	am varchar(40) not null,
	genero varchar(1),
	estado integer,
	tipoper varchar(1),
	foto varchar(40) not null
);
create table datos(
	ci integer primary key,
	codper integer,
	FOREIGN KEY (codper) REFERENCES Personas(codper)
);

create table telefonos(
	numero varchar(20),
	codper integer primary key,
	FOREIGN KEY (codper) REFERENCES Personas(codper)
);

create table areas(
	coda integer primary key,
	nombre varchar(40),
	estado integer
);
 create table tipos(
	 codtipo integer primary key,
	 nombre varchar(40),
	 estado integer,
	 sw integer default 0
 );
 create table editoriales(
	 code integer primary key,
	 nombre varchar(40),
	 estado integer
 );
 create table textos(
	 codt integer primary key,
	 titulo varchar(150),
	 resumen varchar(1000) not null,
	 isbn varchar(20) not null,
	 edicion integer not null,
	 fechapub date not null,
	 coda integer,
	 foreign key (coda) references areas(coda),
	 code integer,
	 foreign key (code) references editoriales(code)
	 
 );
 create table tipotex(
	 codt integer,
	 docum varchar(200) not null,
	 codtipo integer,
	 foreign key (codt) references textos(codt),
	 foreign key (codtipo) references tipos(codtipo),
	 primary key (codt, codtipo)
 );
 create table autores(
	 coda integer primary key,
	 nombre varchar(60),
	 ap varchar(40) not null,
	 am varchar(40) not null,
	 genero varchar(1) not null,
	 estado integer
	  
 );
 create table escriben(
	 coda integer,
	 codt integer,
	 foreign key (coda) references autores(coda),
	 foreign key (codt) references textos(codt),
	 primary key (coda, codt)
 );
create table usuarios(
	 login varchar(15) primary key,
	 passwd varchar(200),
	 estado integer,
	 codper integer,
	 foreign key (codper) references personas(codper)
 );
 create table ejemplares(
	 codinv integer primary key,
	 disponible integer,
	 estado integer,
	 codt integer,
	 foreign key (codt) references textos (codt),
	 per_resp varchar(20),
	 foreign key (per_resp) references usuarios(login),
	 per_anula varchar(20) not null,
	 foreign key (per_anula) references usuarios(login)
 );
 create table mprestamo(
	 codp int primary key,
	 fecha varchar(8),
	 fini varchar(8),
	 ffin varchar(8),
	 tipopres int,
	 estado int,
	 ci int,
	 login varchar(15),
	 foreign key(ci) references datos(ci),
	 foreign key(login) references usuarios(login)
 );
 create table dprestamo(
	 codp int primary key,
	 foreign key (codp) references mprestamo(codp),
	 codinv int,
	 foreign key(codinv) references ejemplares(codinv),
	 estado int
 );
 create table mdevol(
	 codd int primary key,
	 fecha date,
	 estado int,
	 login varchar(15),
	 foreign key (login) references usuarios (login),
	 codp int,
	 foreign key (codp) references mprestamo (codp)
 );
 create table ddevol(
	 codd int,
	 foreign key (codd) references mdevol (codd),
	 codinv int,
	 foreign key (codinv) references ejemplares(codinv)
	 
 );
 create table roles(
	 codr int primary key,
	 nombre varchar(20),
	 estado int
 );
 create table rolusu(
	 codr int,
	 login varchar (30),
	 foreign key (codr) references roles(codr),
	 foreign key (login) references usuarios(login),
	 primary key(codr, login)
 );
 create table menus(
	 codm int primary key,
	 nombre varchar (40),
	 estado int
 );
 create table rolme(
	 codr int,
	 codm int,
	 foreign key (codr) references roles(codr),
	 foreign key (codm) references menus(codm)
 );
 create table procesos(
	 codp int primary key,
	 nombre varchar(40),
	 enlace varchar(60),
	 estado int
 );
 create table mepro(
	 codm int,
	 codp int,
	 foreign key (codm) references menus(codm),
	 foreign key (codp) references procesos(codp)
 );
 
 
 
 











