INSERT INTO playlist (idplaylist, nombre) VALUES
(1, 'Duki'),
(2, 'Saiko'),
(3, 'Pop Internacional'),
(4, 'Electrónica'),
(5, 'Anime');


alter table usuario modify usuario_idusuario varchar(45) null;

INSERT INTO usuario (idusuario, nombre, contraseña, subscripcion, seguidores, seguidos, usuario_idusuario, playlist_idplaylist) VALUES
(1, 'Juan Perez', 'pass1234', 'Premium', 100, 50, NULL, 1),
(2, 'Maria Lopez', 'pass5678', 'Gratis', 75, 30, NULL, 2),
(3, 'Carlos Sanchez', 'pass91011', 'Premium', 150, 90, NULL, 3),
(4, 'Ana Gomez', 'pass1213', 'Gratis', 120, 60, 4, 4),
(5, 'Luis Fernandez', 'pass1415', 'Premium', 200, 150, 5, 5),
(6, 'Duki','pass4000','Premium',1000000,10,6,1);

INSERT INTO artista (nombre, pais, nacimiento) VALUES
('Duki','Argentina', '1996'),
('Saiko','España','2002'),
('Shakira', 'Colombia', '1977'),
('Juanes', 'Colombia', '1972'),
('Luis Fonsi', 'Puerto Rico', '1978'),
('Thalía', 'México', '1971'),
('Ricky Martin', 'Puerto Rico', '1971');

INSERT INTO album (idalbum, nombre, artista_nombre) VALUES
(1, 'Pies Descalzos', 'Shakira'),
(2, 'Mis Planes Son Amarte', 'Juanes'),
(3, 'Vida', 'Luis Fonsi'),
(4, 'Amor a la Mexicana', 'Thalía'),
(5, 'A Medio Vivir', 'Ricky Martin'),
(6, 'Ameri','Duki'),
(7,'SSJ','Duki'),
(8,'Sakura','Saiko');

INSERT INTO contenido (id_contenido, nombre, duracion, usuario_idusuario) VALUES
(1, 'Goteo', '03:45', 6),
(2, 'Despacito', '04:20', 4),
(3, 'Supernova', '05:00', 5),
(4, 'Rockstar', '02:30', 6),
(5, 'Givenchy', '03:10', 6),
(6, 'The wild project Topuria', '2:00:00',4),
(7, '40 radio', '4:30:00','5');



INSERT INTO cancion (contenido_id_contenido, album_idalbum, playlist_idplaylist, artista_nombre) VALUES
(1, 7, 1, 'Duki'),
(5, 6, 1, 'Duki'),
(3, 8, 2, 'Saiko'),
(4, 7, 1, 'Duki'),
(2, 3, 3, 'Luis Fonsi');

INSERT INTO podcast (contenido_id_contenido) VALUES
(6);

INSERT INTO radio (contenido_id_contenido) VALUES
(7);

INSERT INTO novedades (contenido_id_contenido, album_idalbum) VALUES
(1, 6),
(2, 3),
(3, 8),
(4, 6),
(5, 7);

INSERT INTO favoritos (contenido_id_contenido, numero_favoritos) VALUES
(1, 1000000),
(2, 2000000),
(3, 3000000),
(4, 4000000),
(5, 5000000);

INSERT INTO estadistica (idestadistica,reproducciones,contenido_id_contenido,likes) VALUES
(1,10000000,1,932939),
(2,20302330,2,347548),
(3,5745754,3,48584855),
(4,8658685,4,43784248),
(5,458458,5,45784873);

DELIMITER !! 

create procedure insertar_usuario(in p_idusuario varchar(45), in p_nombre varchar(45), in p_contraseña varchar(45), in p_subscripcion varchar(45), in p_seguidores varchar(45), in p_seguidos varchar(45), in p_usuario_idusuario varchar(45), in p_playlist_idplaylist int)
begin
	insert into usuario(idusuario,nombre,contraseña,subscripcion,seguidores,seguidos,usuario_idusuario,playlist_idplaylist) values 
    (p_idusuario,p_nombre,p_contraseña,p_subscripcion,p_seguidores,p_seguidos,p_usuario_idusuario,p_playlist_idplaylist);
end !!

delimiter ;

DELIMITER !!

create procedure eliminar_usuario(in p_idusuario varchar(45))
begin
	delete from usuario where idusuario = (p_idusuario);
end !!

DELIMITER ;

DELIMITER !!

create function actualizar_nombre(p_idusuario varchar(45),p_nombre varchar(45))
returns varchar(200) deterministic
begin
	declare actualizacion varchar(200);
    update usuario set nombre = p_nombre where idusuario = p_idusuario;
    set actualizacion = "Usuario actualizado correctamente";
    return actualizacion;
end !!

DELIMITER ;

select actualizar_nombre(1,"Juan Lopez");

DELIMITER !!

create function actualizar_creador(p_idusuario varchar(45),p_usuario_idusuario varchar(45))
returns varchar(200) deterministic
begin
	declare actualizacion varchar(200);
    update usuario set usuario_idusuario = p_usuario_idusuario where idusuario = p_idusuario;
    set actualizacion = "Usuario actualizado correctamente";
    return actualizacion;
end !!

DELIMITER ;

-- LA FUNCION ANTERIOR ACTUALIZA SI UN USUARIO DE CONVIERTE EN CREADOR

DELIMITER !!

create trigger after_insert_contenido
after insert on contenido
for each row
begin
	insert into novedades(contenido_id_contenido, album_idalbum)
    values(contenido_id_contenido,null);
end !!
Delimiter ;


 

















