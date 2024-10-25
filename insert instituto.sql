insert into profesores(id,nombre,direccion,telefono)
values
(1,'Antonio','C/Perez', null),
(2,'Carmen','Plaza Nueva','91-222-44-45');

insert into modulos(codigo,nombre,profesores_id)
values
(100,'SI',1),
(200,'ED',2),
(300,'LM',1),
(400,'BD',2);

insert into alumnos(numero_expediente,nombre,apellidos,fecha_nacimiento,alumnos_numero_expediente)
values
(10,'Juan','Ribes',null,null),
(20,'Raul','Perez','1990-02-10',10),
(30,'Tomas','Gimenez',null,10),
(40,'Laura','Verdu','1985-10-25',null),
(50,'Sonia','Medina',null,40),
(60,'Juan','Gonzalez',null,40),
(70,'Alejandro','Pena',null,40);

alter table alumnos modify column alumnos_numero_expediente int null;

insert into modulos_has_alumnos (alumnos_numero_expediente,modulos_codigo)
values
(10,100),
(10,300),
(20,400),
(30,200),
(30,400),
(40,100),
(40,200),
(40,300),
(50,200),
(60,100),
(60,300),
(70,100),
(70,200),
(70,300),
(70,400);

alter table profesores modify column telefono varchar(45) null;

update profesores 
set telefono = null
where id = 1;