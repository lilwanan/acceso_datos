-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `idplaylist` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idplaylist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`usuario` (
  `idusuario` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `subscripcion` VARCHAR(45) NOT NULL,
  `seguidores` VARCHAR(45) NOT NULL,
  `seguidos` VARCHAR(45) NOT NULL,
  `usuario_idusuario` VARCHAR(45) NOT NULL,
  `playlist_idplaylist` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_usuario_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `spotify`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `spotify`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`contenido` (
  `id_contenido` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NULL,
  `usuario_idusuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_contenido`),
  INDEX `fk_contenido_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_contenido_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `spotify`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `nombre` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nacimiento` VARCHAR(45) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `idalbum` VARCHAR(30) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `artista_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idalbum`),
  INDEX `fk_album_artista1_idx` (`artista_nombre` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_nombre`)
    REFERENCES `spotify`.`artista` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`cancion` (
  `contenido_id_contenido` INT NOT NULL,
  `album_idalbum` VARCHAR(30) NOT NULL,
  `playlist_idplaylist` INT NOT NULL,
  `artista_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contenido_id_contenido`, `artista_nombre`),
  INDEX `fk_cancion_album1_idx` (`album_idalbum` ASC) VISIBLE,
  INDEX `fk_cancion_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  INDEX `fk_cancion_artista1_idx` (`artista_nombre` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_contenido`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `spotify`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `spotify`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_artista1`
    FOREIGN KEY (`artista_nombre`)
    REFERENCES `spotify`.`artista` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`radio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`radio` (
  `contenido_id_contenido` INT NOT NULL,
  PRIMARY KEY (`contenido_id_contenido`),
  CONSTRAINT `fk_radio_contenido1`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`podcast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`podcast` (
  `contenido_id_contenido` INT NOT NULL,
  PRIMARY KEY (`contenido_id_contenido`),
  CONSTRAINT `fk_podcast_contenido1`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`estadistica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`estadistica` (
  `idestadistica` INT NOT NULL,
  `reproducciones` INT NULL,
  `contenido_id_contenido` INT NOT NULL,
  `likes` INT NULL,
  PRIMARY KEY (`idestadistica`),
  INDEX `fk_estadistica_contenido1_idx` (`contenido_id_contenido` ASC) VISIBLE,
  CONSTRAINT `fk_estadistica_contenido1`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`novedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`novedades` (
  `contenido_id_contenido` INT NOT NULL,
  `album_idalbum` VARCHAR(30) NOT NULL,
  INDEX `fk_novedades_contenido1_idx` (`contenido_id_contenido` ASC) VISIBLE,
  INDEX `fk_novedades_album1_idx` (`album_idalbum` ASC) VISIBLE,
  CONSTRAINT `fk_novedades_contenido1`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_novedades_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `spotify`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`favoritos` (
  `contenido_id_contenido` INT NOT NULL,
  `numero_favoritos` INT NOT NULL,
  INDEX `fk_favoritos_contenido1_idx` (`contenido_id_contenido` ASC) VISIBLE,
  PRIMARY KEY (`contenido_id_contenido`),
  CONSTRAINT `fk_favoritos_contenido1`
    FOREIGN KEY (`contenido_id_contenido`)
    REFERENCES `spotify`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
