
delimiter $$
create procedure insertar_alumno(in p_numero_expediente int, in p_nombre varchar(45), in p_apellidos varchar(45), in p_fecha_nacimiento varchar(45), in p_alumnos_numero_expediente int)
begin
insert into alumnos(numero_expediente,nombre,apellidos,fecha_nacimiento,alumnos_numero_expediente) values (p_numero_expediente,p_nombre,p_apellidos, p_fecha_nacimiento, p_alumnos_numero_expediente);
end $$

call insertar_alumno(

