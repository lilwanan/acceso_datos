select * from profesores; -- 1
select * from modulos; -- 2
select * from alumnos; -- 3
select nombre from profesores where telefono != ''; -- 4
select nombre from alumnos where numero_expediente = 10 or numero_expediente = 40 ; -- 5
select p.nombre from profesores p join modulos m on(p.id=m.profesores_id) where m.nombre = 'SI'; -- 6
select a.nombre, a.apellidos, m.alumnos_numero_expediente from modulos_has_alumnos m join alumnos a on (a.numero_expediente=m.alumnos_numero_expediente) where m.modulos_codigo = '200'; -- 7
select count(*) from alumnos a join modulos_has_alumnos m on (a.numero_expediente = m.alumnos_numero_expediente)  group by modulos_codigo;
