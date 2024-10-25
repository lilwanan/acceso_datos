-- Procedimiento que modifica nombre del alumno segun numero expediente
CREATE PROCEDURE `modifica_nombre_alumno` (in num_exp int,in nombre_alumno varchar(50))
BEGIN
	update alumnos
    set nombre = nombre_alumno
    where numero_expediente = num_exp;
END;

-- Funcion que devuelve el numero de expediente dado el nombre del alumno
CREATE FUNCTION `expediente_alumno` (nombre varchar(50))
	RETURNS INT 
BEGIN
	declare numexp INT;
    set numexp = (
		select numero_expediente from alumnos 
		where nombre_alumno =  nombre);
RETURN numexp;
END;

-- Trigger
-- Trigger que al insertar un profesor comprueba si el telefono a insertar es nulo, en ese
-- caso inserta el del colegio
DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_telefono_before_insert$$
CREATE TRIGGER trigger_check_telefono_before_insert
BEFORE INSERT
ON profesores FOR EACH ROW
BEGIN
  IF NEW.telefono is null THEN
    set new.telefono = '9112345678';
  END IF;
END