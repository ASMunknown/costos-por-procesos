-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema costos_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `costos_db` ;

-- -----------------------------------------------------
-- Schema costos_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `costos_db` DEFAULT CHARACTER SET utf8 ;
USE `costos_db` ;

-- -----------------------------------------------------
-- Table `costos_db`.`Fecha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`Fecha` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`Fecha` (
  `idFecha` INT NOT NULL AUTO_INCREMENT,
  `mes` VARCHAR(45) NOT NULL,
  `anio` INT NOT NULL,
  PRIMARY KEY (`idFecha`),
  UNIQUE INDEX `idFecha_UNIQUE` (`idFecha` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`tipo_proceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`tipo_proceso` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`tipo_proceso` (
  `idtipo_proceso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_proceso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`Producto` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`almacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`almacen` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`almacen` (
  `idalmacen` INT NOT NULL AUTO_INCREMENT,
  `Fecha_idFecha` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `unidades` INT NOT NULL,
  PRIMARY KEY (`idalmacen`),
  INDEX `fk_almacen_Fecha1_idx` (`Fecha_idFecha` ASC) VISIBLE,
  INDEX `fk_almacen_Producto1_idx` (`Producto_idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_almacen_Fecha1`
    FOREIGN KEY (`Fecha_idFecha`)
    REFERENCES `costos_db`.`Fecha` (`idFecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_almacen_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `costos_db`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`proceso_fecha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`proceso_fecha` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`proceso_fecha` (
  `Fecha_idFecha` INT NOT NULL,
  `tipo_proceso_idtipo_proceso` INT NOT NULL,
  `uiipp` INT NOT NULL,
  `uprod` INT NOT NULL,
  `UAg` INT NOT NULL,
  `UTT` INT NOT NULL,
  `UTNT` INT NOT NULL,
  `UIFPP` INT NOT NULL,
  `UPERDIDAS` INT NOT NULL,
  `MD_inicio` DECIMAL(10) NOT NULL,
  `MO_inicio` DECIMAL(10) NOT NULL,
  `CIF_inicio` DECIMAL(10) NOT NULL,
  `porcentaje_MD_inicial` DECIMAL(5) NOT NULL,
  `porcentaje_costos_de_conversion_inicial` DECIMAL(5) NOT NULL,
  `porcentaje_MD_final` DECIMAL(5) NOT NULL,
  `porcentaje_Costos_de_conversion_final` DECIMAL(5) NOT NULL,
  `inv_inicial_recibido` INT NOT NULL,
  INDEX `fk_proceso_fecha_Fecha_idx` (`Fecha_idFecha` ASC) VISIBLE,
  INDEX `fk_proceso_fecha_tipo_proceso1_idx` (`tipo_proceso_idtipo_proceso` ASC) VISIBLE,
  CONSTRAINT `fk_proceso_fecha_Fecha`
    FOREIGN KEY (`Fecha_idFecha`)
    REFERENCES `costos_db`.`Fecha` (`idFecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_fecha_tipo_proceso1`
    FOREIGN KEY (`tipo_proceso_idtipo_proceso`)
    REFERENCES `costos_db`.`tipo_proceso` (`idtipo_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`Costo_Material_Directo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`Costo_Material_Directo` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`Costo_Material_Directo` (
  `idCosto_Material_Directo` INT NOT NULL AUTO_INCREMENT,
  `Fecha_idFecha` INT NOT NULL,
  `idtipo_proceso` INT NOT NULL,
  `costo` DECIMAL(10) NOT NULL,
  `concepto` VARCHAR(100) NOT NULL,
  `fecha_op` DATETIME NULL,
  PRIMARY KEY (`idCosto_Material_Directo`),
  INDEX `fk_Costo_Material_Directo_Fecha1_idx` (`Fecha_idFecha` ASC) VISIBLE,
  INDEX `fk_Costo_Material_Directo_tipo_proceso1_idx` (`idtipo_proceso` ASC) VISIBLE,
  CONSTRAINT `fk_Costo_Material_Directo_Fecha1`
    FOREIGN KEY (`Fecha_idFecha`)
    REFERENCES `costos_db`.`Fecha` (`idFecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Costo_Material_Directo_tipo_proceso1`
    FOREIGN KEY (`idtipo_proceso`)
    REFERENCES `costos_db`.`tipo_proceso` (`idtipo_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`Mano_de_Obra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`Mano_de_Obra` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`Mano_de_Obra` (
  `idMano_de_Obra` INT NOT NULL AUTO_INCREMENT,
  `Fecha_idFecha` INT NOT NULL,
  `idtipo_proceso` INT NOT NULL,
  `costo` DECIMAL(10) NOT NULL,
  `concepto` VARCHAR(100) NOT NULL,
  `fecha_op` DATETIME NULL,
  PRIMARY KEY (`idMano_de_Obra`),
  INDEX `fk_Mano_de_Obra_Fecha1_idx` (`Fecha_idFecha` ASC) VISIBLE,
  INDEX `fk_Mano_de_Obra_tipo_proceso1_idx` (`idtipo_proceso` ASC) VISIBLE,
  CONSTRAINT `fk_Mano_de_Obra_Fecha1`
    FOREIGN KEY (`Fecha_idFecha`)
    REFERENCES `costos_db`.`Fecha` (`idFecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mano_de_Obra_tipo_proceso1`
    FOREIGN KEY (`idtipo_proceso`)
    REFERENCES `costos_db`.`tipo_proceso` (`idtipo_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `costos_db`.`CIF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `costos_db`.`CIF` ;

CREATE TABLE IF NOT EXISTS `costos_db`.`CIF` (
  `idCIF` INT NOT NULL AUTO_INCREMENT,
  `Fecha_idFecha` INT NOT NULL,
  `idtipo_proceso` INT NOT NULL,
  `costo` DECIMAL(10) NOT NULL,
  `concepto` VARCHAR(100) NOT NULL,
  `fecha_op` DATETIME NULL,
  PRIMARY KEY (`idCIF`),
  INDEX `fk_CIF_Fecha1_idx` (`Fecha_idFecha` ASC) VISIBLE,
  INDEX `fk_CIF_tipo_proceso1_idx` (`idtipo_proceso` ASC) VISIBLE,
  CONSTRAINT `fk_CIF_Fecha1`
    FOREIGN KEY (`Fecha_idFecha`)
    REFERENCES `costos_db`.`Fecha` (`idFecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CIF_tipo_proceso1`
    FOREIGN KEY (`idtipo_proceso`)
    REFERENCES `costos_db`.`tipo_proceso` (`idtipo_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;






-- Tests
USE `costos_db` ;

-- Insertando los productos
INSERT INTO producto (NOMBRE) VALUES
 ("Pilsen");

-- INSERTANDO LOS PROCESOS PARA ELABORAR CERVEZA
INSERT INTO TIPO_PROCESO (NOMBRE) VALUES
 ("MOLIENDA"),
 ("MACERACIÓN"),
 ("RECIRCULACIÓN"),
 ("COCCIÓN"),
 ("LUPULIZACIÓN"),
 ("ENFRIAMIENTO"),
 ("INOCULACIÓN"),
 ("FERMENTACIÓN"),
 ("CARBONATACIÓN"),
 ("EMBAZADO Y EMBOTELLADO");
 
-- INSERTANDO FECHAS

INSERT INTO FECHA (MES,ANIO) VALUES
 ("JULIO",2020),
 ("AGOSTO",2020),
 ("SETIEMBRE",2020),
 ("OCTUBRE",2020);
 
-- INSERTANDO CANTIDAD RESULTANTE EN ALMACEN (JULIO)
INSERT INTO ALMACEN (Fecha_idFecha,Producto_idProducto,unidades) VALUES
 (1,1,193200);
 
-- INSERTANDO UNIDADES MOVIDAS POR CADA PROCESO EN EL MES DE JULIO
INSERT INTO PROCESO_FECHA (Fecha_idFecha,tipo_proceso_idtipo_proceso,uiipp,uprod,UAg,UTT,UTNT,UIFPP,UPERDIDAS,MD_inicio,MO_inicio,CIF_inicio,porcentaje_MD_inicial,porcentaje_costos_de_conversion_inicial,porcentaje_MD_final,porcentaje_Costos_de_conversion_final,inv_inicial_recibido) VALUES
 (1,1,46000,138000,0,115000,23000,46000,0,5000,6000,7000,100,80,100,40,0),
 (1,2,23000,115000,69000,115000,46000,46000,0,6780,7850,5900,100,75,80,20,12920),
 (1,3,36800,115000,46000,92000,23000,82800,0,7500,7600,5800,60,80,50,40,33750),
 (1,4,32200,92000,13800,69000,23000,36800,9200,7000,8500,6700,100,70,60,50,80400),
 (1,5,41400,69000,27600,92000,23000,23000,0,10000,15000,6750,80,60,70,80,53500),
 (1,6,46000,92000,46000,138000,23000,23000,0,13000,15000,17000,100,70,60,50,88500),
 (1,7,92000,138000,0,115000,46000,69000,0,15000,23500,17500,100,70,75,60,185000),
 (1,8,69000,92000,0,115000,36800,32200,0,3200,3100,2600,80,20,40,55,158000),
 (1,9,36800,115000,55200,138000,46000,13800,9200,6000,7500,2600,60,55,70,65,10500),
 (1,10,69000,138000,9200,193200,9200,13800,0,18000,17000,16500,60,55,70,65,164350);
 
-- Insertando mano_de_obra - molienda
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,1,2500,"Pago a operario A","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario B","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario C","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario D","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario E","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario F","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario G","2020-07-05 12:00:00"),
 (1,1,2500,"Pago a operario H","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - maceración 
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,2,2500,"Pago a operario 1","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 2","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 3","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 4","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 5","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 6","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 7","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 8","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 9","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 10","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 11","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 12","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 13","2020-07-05 12:00:00"),
 (1,2,2500,"Pago a operario 14","2020-07-05 12:00:00"),
 (1,2,1500,"Pago a operario 15","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - recirculación - 7600
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,3,2500,"Pago a operario 1 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 2 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 3 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 4 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 5 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 6 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 7 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 8 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 9 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 10 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 11 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 12 proceso Recirculacion","2020-07-05 12:00:00"),
 (1,3,2500,"Pago a operario 13 proceso Recirculacion","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - lupulizacion 
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,4,3500,"Pago a operario 1 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 2 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 3 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 4 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 5 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 6 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 7 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 8 proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,2500,"Pago a operario 9 proceso Lupulización","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - coccion 
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,5,3100,"Pago a operario 1 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 2 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 3 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 4 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 5 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 6 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 7 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 8 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 9 proceso Cocción","2020-07-05 12:00:00"),
 (1,5,2500,"Pago a operario 10 proceso Cocción","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - enfriamiento
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,6,3000,"Pago a operario 1 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 2 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 3 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 4 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 5 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 6 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 7 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 8 proceso enfriamiento","2020-07-05 12:00:00"),
 (1,6,2500,"Pago a operario 9 proceso enfriamiento","2020-07-05 12:00:00");
 
-- Insertando mano_de_obra - inaculacion
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,7,3750,"Pago a operario 1 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 2 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 3 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 4 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 5 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 6 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 7 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 8 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 9 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 10 proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,3000,"Pago a operario 11 proceso Inaculación","2020-07-05 12:00:00");

-- Insertando mano_de_obra - fermentacion
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,8,2930,"Pago a operario 1 proceso Fermentacion","2020-07-05 12:00:00"),
 (1,8,2500,"Pago a operario 2 proceso Fermentación","2020-07-05 12:00:00");

-- Insertando mano_de_obra - carbonantacion
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,9,4500,"Pago a operario 1 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 2 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 3 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 4 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 5 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 6 proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,2500,"Pago a operario 7 proceso Carbonatación","2020-07-05 12:00:00");

-- Insertando mano_de_obra - embazado
INSERT INTO mano_de_obra (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,10,3750,"Pago a operario 1 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 2 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 3 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 4 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 5 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 6 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 7 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 8 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 9 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 10 proceso Embazado","2020-07-05 12:00:00"),
 (1,10,2600,"Pago a operario 11 proceso Embazado","2020-07-05 12:00:00");

-- Insertando datos para Costo_material_directo - Molienda
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,1,11000,"Uso de material 1 en el proceso Molienda","2020-07-05 12:00:00"),
 (1,1,6000,"Uso de material 2 en el proceso Molienda","2020-07-05 12:00:00");

-- Insertando datos para Costo_material_directo - Maceración
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,2,8000,"Uso de material 1 en el proceso Maceración","2020-07-05 12:00:00"),
 (1,2,8000,"Uso de material 2 en el proceso Maceración","2020-07-05 12:00:00"),
 (1,2,8000,"Uso de material 3 en el proceso Maceración","2020-07-05 12:00:00"),
 (1,2,8000,"Uso de material 4 en el proceso Maceración","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Recirculación
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,3,3025,"Uso de material 1 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 2 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 3 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 4 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 5 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 6 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 7 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 8 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 9 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,3025,"Uso de material 10 en el proceso Recirculación","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Lupulización
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,4,6000,"Uso de material 1 en el proceso Lupulización","2020-07-05 12:00:00"),
 (1,4,7500,"Uso de material 2 en el proceso Lupulización","2020-07-05 12:00:00");
 
 
-- Insertando datos para Costo_material_directo - Cocción
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,5,10500,"Uso de material 1 en el proceso Cocción","2020-07-05 12:00:00"),
 (1,5,6000,"Uso de material 2 en el proceso Cocción","2020-07-05 12:00:00"),
 (1,5,6000,"Uso de material 3 en el proceso Cocción","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Enfriamiento
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,6,10000,"Uso de material 1 en el proceso Enfriamiento","2020-07-05 12:00:00"),
 (1,6,10000,"Uso de material 2 en el proceso Enfriamiento","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Inaculación
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,7,10000,"Uso de material 1 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,10000,"Uso de material 2 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,10000,"Uso de material 3 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,10000,"Uso de material 4 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,2500,"Uso de material 5 en el proceso Inaculación","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Fermentación
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,8,5400,"Uso de material 1 en el proceso Fermentación","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Carbonatación
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,9,9000,"Uso de material 1 en el proceso Carbonatación","2020-07-05 12:00:00"),
 (1,9,9000,"Uso de material 2 en el proceso Carbonatación","2020-07-05 12:00:00");
 
-- Insertando datos para Costo_material_directo - Embazado
INSERT INTO costo_material_directo (Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,10,30000,"Uso de material 1 en el proceso Embazado","2020-07-05 12:00:00"),
 (1,10,4000,"Uso de material 2 en el proceso Embazado","2020-07-05 12:00:00");
 

-- Insertando datos para CIF - Molienda
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,1,10000,"Uso de CIF 1 en el proceso Molienda","2020-07-05 12:00:00"),
 (1,1,12000,"Uso de CIF 2 en el proceso Molienda","2020-07-05 12:00:00");

-- Insertando datos para CIF - Maceración.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,2,10000,"Uso de CIF 1 en el proceso Maceración","2020-07-05 12:00:00"),
 (1,2,13500,"Uso de CIF 2 en el proceso Maceración","2020-07-05 12:00:00");
 
-- Insertando datos para CIF - Recirculación.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,3,10000,"Uso de CIF 1 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,4800,"Uso de CIF 2 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,3,5000,"Uso de CIF 3 en el proceso Recirculación","2020-07-05 12:00:00");
 
-- Insertando datos para CIF - Lupulización.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,4,9500,"Uso de CIF 1 en el proceso Recirculación","2020-07-05 12:00:00"),
 (1,4,300,"Uso de CIF 2 en el proceso Recirculación","2020-07-05 12:00:00");

-- Insertando datos para CIF - Cocción.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,5,10000,"Uso de CIF 1 en el proceso Cocción","2020-07-05 12:00:00"),
 (1,5,7500,"Uso de CIF 2 en el proceso Cocción","2020-07-05 12:00:00");

-- Insertando datos para CIF - Enfriamiento.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,6,10000,"Uso de CIF 1 en el proceso Enfriamiento","2020-07-05 12:00:00"),
 (1,6,8000,"Uso de CIF 2 en el proceso Enfriamiento","2020-07-05 12:00:00"),
 (1,6,6500,"Uso de CIF 3 en el proceso Enfriamiento","2020-07-05 12:00:00");
 

-- Insertando datos para CIF - Inaculación.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,7,10000,"Uso de CIF 1 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,8000,"Uso de CIF 2 en el proceso Inaculación","2020-07-05 12:00:00"),
 (1,7,8500,"Uso de CIF 3 en el proceso Inaculación","2020-07-05 12:00:00");
 
-- Insertando datos para CIF - Fermentación.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,8,5010,"Uso de CIF 1 en el proceso Fermentación","2020-07-05 12:00:00");

-- Insertando datos para CIF - Carbonatación.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,9,7850,"Uso de CIF 1 en el proceso Carbonatación","2020-07-05 12:00:00");
 
-- Insertando datos para CIF - Embazado.
INSERT INTO  cif(Fecha_idFecha,idtipo_proceso,costo,concepto,fecha_op) VALUES
 (1,10,10000,"Uso de CIF 1 en el proceso Embazado","2020-07-05 12:00:00"),
 (1,10,8000,"Uso de CIF 1 en el proceso Embazado","2020-07-05 12:00:00"),
 (1,10,11000,"Uso de CIF 1 en el proceso Embazado","2020-07-05 12:00:00");
 
-- Pruebas SELECT
SELECT * FROM mano_de_obra; 



