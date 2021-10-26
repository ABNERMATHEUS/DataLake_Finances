-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Ativo` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MeioPagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MeioPagamento` (
  `idMeioPagamento` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMeioPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carteira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carteira` (
  `idUsuario` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  INDEX `fk_Carteiras_Usuario_idx` (`idUsuario` ASC) VISIBLE,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Carteiras_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagar` (
  `idPagar` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Data` DATETIME NOT NULL,
  `Pago` TINYINT NOT NULL,
  `Valor` DECIMAL(100) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `idMeioPagamento` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPagar`),
  INDEX `fk_Pagar_MeioPagamento1_idx` (`idMeioPagamento` ASC) VISIBLE,
  INDEX `fk_Pagar_Carteira1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Pagar_MeioPagamento1`
    FOREIGN KEY (`idMeioPagamento`)
    REFERENCES `mydb`.`MeioPagamento` (`idMeioPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagar_Carteira1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Carteira` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Receber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receber` (
  `idReceber` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Valor` VARCHAR(45) NOT NULL,
  `Recebido` TINYINT NOT NULL,
  `Data` DATETIME NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idReceber`),
  INDEX `fk_Receber_Carteira1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Receber_Carteira1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Carteira` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Investimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Investimentos` (
  `idInvestimentos` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `idCarteira` INT NOT NULL,
  `NomeTipoInvestimento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInvestimentos`),
  INDEX `fk_Investimentos_Carteira1_idx` (`idCarteira` ASC) VISIBLE,
  CONSTRAINT `fk_Investimentos_Carteira1`
    FOREIGN KEY (`idCarteira`)
    REFERENCES `mydb`.`Carteira` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RendaVariavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RendaVariavel` (
  `idRendaVariavel` INT NOT NULL,
  `Papel` VARCHAR(45) NOT NULL,
  `ValorAplicado` VARCHAR(45) NOT NULL,
  `Unidades` INT NOT NULL,
  `idInvestimentos` INT NOT NULL,
  `DataAplicacao` DATETIME NOT NULL,
  PRIMARY KEY (`idRendaVariavel`, `idInvestimentos`),
  INDEX `fk_RendaVariavel_Investimentos1_idx` (`idInvestimentos` ASC) VISIBLE,
  CONSTRAINT `fk_RendaVariavel_Investimentos1`
    FOREIGN KEY (`idInvestimentos`)
    REFERENCES `mydb`.`Investimentos` (`idInvestimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PrividenciaPrivada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PrividenciaPrivada` (
  `idPoupança` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `DataAplicacao` DATETIME NOT NULL,
  `Valor` DECIMAL NULL,
  `IdInvestimentos` INT NOT NULL,
  PRIMARY KEY (`idPoupança`),
  INDEX `fk_PrividenciaPrivada_Investimentos1_idx` (`IdInvestimentos` ASC) VISIBLE,
  CONSTRAINT `fk_PrividenciaPrivada_Investimentos1`
    FOREIGN KEY (`IdInvestimentos`)
    REFERENCES `mydb`.`Investimentos` (`idInvestimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Poupanca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Poupanca` (
  `idPoupanca` INT NOT NULL,
  `ValorAplicado` DECIMAL NOT NULL,
  `IdInvestimentos` INT NOT NULL,
  PRIMARY KEY (`idPoupanca`),
  INDEX `fk_Poupanca_Investimentos1_idx` (`IdInvestimentos` ASC) VISIBLE,
  CONSTRAINT `fk_Poupanca_Investimentos1`
    FOREIGN KEY (`IdInvestimentos`)
    REFERENCES `mydb`.`Investimentos` (`idInvestimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relatorios` (
  `idLog` INT NOT NULL,
  `TipoRelatorio` VARCHAR(45) NOT NULL,
  `DataGeracao` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idLog`),
  INDEX `fk_Relatorios_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Relatorios_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
