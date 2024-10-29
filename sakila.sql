select title from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name = 'Action';



-- NOMBRE Y APELLIDOS DE ACTORES QUE HAN TRABAJADO EN PELICULAS DE LA CATEGORIA ACTION
select distinct first_name,last_name from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id=c.category_id
where c.name='Action';

-- CLIENTES QUE HAYAN ALQUILADO PELICULAS DE ACTION EN ARGETINA

select distinct first_name, last_name from
country join city on country.country_id = city.country_id
join address on city.city_id = address.city_id
join customer on address.address_id = customer.address_id
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name='Action' and country.country='Argentina';