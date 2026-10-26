-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bibloteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bibloteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bibloteca` DEFAULT CHARACTER SET utf8 ;
USE `bibloteca` ;

-- -----------------------------------------------------
-- Table `bibloteca`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`libros` (
  `id_libro` INT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `editorial` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_libro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`ejemplares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`ejemplares` (
  `id_ejemplar` INT NOT NULL,
  `estado` VARCHAR(45) BINARY NULL,
  `cantidad` INT NULL,
  `libros_id_libro` INT NOT NULL,
  PRIMARY KEY (`id_ejemplar`, `libros_id_libro`),
  INDEX `fk_ejemplares_libros1_idx` (`libros_id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_ejemplares_libros1`
    FOREIGN KEY (`libros_id_libro`)
    REFERENCES `bibloteca`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`clientes` (
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`prestamos` (
  `id_prestamo` INT NULL,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_devolucion` DATE NULL,
  `ejemplares_id_ejemplar` INT NOT NULL,
  `ejemplares_libros_id_libro` INT NOT NULL,
  `clientes_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_prestamo`, `ejemplares_id_ejemplar`, `ejemplares_libros_id_libro`, `clientes_id_cliente`),
  INDEX `fk_prestamos_ejemplares1_idx` (`ejemplares_id_ejemplar` ASC, `ejemplares_libros_id_libro` ASC) VISIBLE,
  INDEX `fk_prestamos_clientes1_idx` (`clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_ejemplares1`
    FOREIGN KEY (`ejemplares_id_ejemplar` , `ejemplares_libros_id_libro`)
    REFERENCES `bibloteca`.`ejemplares` (`id_ejemplar` , `libros_id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamos_clientes1`
    FOREIGN KEY (`clientes_id_cliente`)
    REFERENCES `bibloteca`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`autores` (
  `id_autor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`editorial` (
  `id_editorial` INT NOT NULL,
  `libros_id_libro` INT NOT NULL,
  `nombre_editorial` VARCHAR(45) NULL,
  `fecha_emision` VARCHAR(45) NULL,
  PRIMARY KEY (`id_editorial`, `libros_id_libro`),
  INDEX `fk_editorial_libros1_idx` (`libros_id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_editorial_libros1`
    FOREIGN KEY (`libros_id_libro`)
    REFERENCES `bibloteca`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`autores_has_libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`autores_has_libros` (
  `autores_id_autor` INT NOT NULL,
  `libros_id_libro` INT NOT NULL,
  PRIMARY KEY (`autores_id_autor`, `libros_id_libro`),
  INDEX `fk_autores_has_libros_libros1_idx` (`libros_id_libro` ASC) VISIBLE,
  INDEX `fk_autores_has_libros_autores_idx` (`autores_id_autor` ASC) VISIBLE,
  CONSTRAINT `fk_autores_has_libros_autores`
    FOREIGN KEY (`autores_id_autor`)
    REFERENCES `bibloteca`.`autores` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autores_has_libros_libros1`
    FOREIGN KEY (`libros_id_libro`)
    REFERENCES `bibloteca`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
