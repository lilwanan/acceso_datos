select * from producto;
select * from venta;

select nombre, direccion
from cliente
where nombre like 'S%';

select descripcion, cantidad
from venta v join producto p on(p.id_producto = v.id_producto);

select descripcion, cantidad
from producto p left join venta v on(p.id_producto = v.id_producto);

select descripcion, cantidad
from producto p right join venta v on(p.id_producto = v.id_producto);

select round(AVG(cantidad),2) Calcula
from venta
group by id_cliente
having Calcula > 10;

select * from cliente; -- 1
select * from producto; -- 2
select id_cliente, nombre from cliente where ciudad ="Cadiz"; -- 3
select descripcion, precio from producto; -- 4
select id_producto, descripcion from producto where precio < 1500; -- 5
select direccion, nombre from cliente where ciudad != ('Malaga') order by nombre; -- 6
select direccion, nombre from cliente where ciudad = ('Malaga') or ciudad = ('Toledo'); -- 7
select direccion, nombre from cliente where ciudad = ('Barcelona') or ciudad = ('Cadiz'); -- 8
select descripcion, precio from producto where precio > 1500 and precio < 3000 order by id_producto; -- 9
select descripcion, precio from producto where precio between 1500 and 3000; -- 10
select direccion, nombre from cliente where nombre like 'L%'; -- 11
select direccion, nombre from cliente where nombre like '%e'; -- 12
select direccion, nombre from cliente where nombre like '_a%'; -- 13
select nombre from cliente where ciudad like 'B%a';