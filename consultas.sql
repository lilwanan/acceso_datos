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
select nombre from cliente where ciudad like 'B%a'; -- 14
select nombre from cliente where telefono like '8%'; -- 15
select id_producto from producto where descripcion like 'V%'; -- 16
select id_producto from producto where descripcion like '%a%'; -- 17 
select id_producto from producto where descripcion like '__r%' and precio < 2000; -- 18
select id_producto from producto where descripcion like 'C%' and precio != 3000; -- 19
select id_producto from producto where descripcion like 'V%' and precio between 4000 and 8000; -- 20
select c.nombre, v.cantidad from cliente c join venta v on (c.id_cliente = v.id_cliente); -- 21
select c.nombre, v.id_venta, v.cantidad from cliente c join venta v on (c.id_cliente = v.id_cliente); -- 22
select p.id_producto, p.descripcion, v.cantidad from producto p join venta v on (p.id_producto = v.id_producto); -- 23
select c.nombre, v.id_venta from cliente c join venta v on (c.id_cliente = v.id_cliente) where v.cantidad > 10; -- 24
select c.nombre from cliente c join venta v on (c.id_cliente=v.id_cliente) where v.cantidad < 10 and telefono like '8%'; -- 25
select p.id_producto, v.id_venta, p.descripcion from producto p join venta v on (p.id_producto = v.id_producto) where (p.descripcion like '%a%' or p.descripcion like '%e%') and v.cantidad < 10; -- 26
select c.id_cliente, c.nombre, v.cantidad, p.descripcion from cliente c join venta v on (c.id_cliente=v.id_cliente) join producto p on (p.id_producto = v.id_producto); -- 27
select c.id_cliente, c.nombre, v.cantidad, p.descripcion from cliente c join venta v on (c.id_cliente=v.id_cliente) join producto p on (p.id_producto = v.id_producto) where v.cantidad > 10; -- 28
select * from cliente group by id_cliente; -- 29
select * from producto group by id_producto; -- 30 
select * from venta group by id_venta; -- 31
select id_venta, count(id_producto) from venta group by id_venta; -- 33
select avg(cantidad), id_producto from venta group by id_producto; -- 34
select sum(cantidad), id_producto from venta group by id_producto; -- 35
select  id_cliente, avg(cantidad) from venta group by id_cliente having avg(cantidad) > 20  ; -- 36
select sum(cantidad), id_producto from venta group by id_producto having sum(cantidad) < 20; -- 37
select nombre from cliente where ciudad = (select ciudad where id_cliente = 123); -- 38
select descripcion from producto where precio > (select precio from producto where id_producto = 1); -- 39
select descripcion from producto p join venta v on (p.id_producto = v.id_producto) where cantidad > (select sum(cantidad) from venta where id_producto = 1); -- 40
select id_cliente,nombre from cliente where id_cliente not in (select id_cliente from venta); -- 41


-- CONSULTAS HR

select * from countries where country_name not like 'C%'; -- 1
select employee_id, last_name from employees where department_id != 10 and department_id != 30; -- 2
select * from employees where first_name like 'S%'; -- 3
select * from employees where first_name like 'S%a'; -- 4 
select * from employees where length(last_name) = 5 and last_name like 'S%'; -- 5
select * from employees where department_id = 20 and salary > 3000; -- 6
select manager_id, sum(salary) from employees group by manager_id having avg(salary) >3000; -- 7

