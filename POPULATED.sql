USE mydb;

-- FUNÇÃO PARA CRIAR USUÁRIO
CREATE FUNCTION CREATE_USER(
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
EMAIL_USER VARCHAR(100),
PASSWORD VARCHAR(100)) RETURNS BOOLEAN
DETERMINISTIC
BEGIN

    INSERT INTO usuario(Nome, Sobrenome, Email, Senha) VALUES (
                                                               FIRST_NAME,
                                                               LAST_NAME,
                                                               EMAIL_USER,
                                                               PASSWORD
                                                               );


    RETURN TRUE;

END;

-- FUNÇÃO PARA CRIAR CARTEIRA
CREATE FUNCTION CREATE_WALLET(
ID_USER INT,
NAME_WALLET VARCHAR(100)) RETURNS BOOLEAN
DETERMINISTIC
BEGIN

    INSERT INTO carteira (idUsuario,Nome) VALUES (ID_USER,NAME_WALLET);

    RETURN TRUE;
END;

-- FUNÇÃO PARA CRIAR RECEBIDOS
CREATE FUNCTION CREATE_RECEIVE(
DESCRIPTION VARCHAR(100),
VALUE_VALUE DECIMAL,
IS_RECEIVE BOOLEAN,
DATE_VALUE DATETIME,
CATEGORY VARCHAR(100),
ID_USER INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    INSERT INTO receber(Descricao, Valor, Recebido, Data, Categoria, idUsuario) VALUES (DESCRIPTION,
                                                                                        VALUE_VALUE,
                                                                                        IS_RECEIVE,
                                                                                        DATE_VALUE,
                                                                                        CATEGORY,
                                                                                        ID_USER
                                                                                        );
    RETURN TRUE;
END;

-- FUNÇÃO PARA CRIAR PAGAMENTO
CREATE FUNCTION CREATE_PAY(
DESCRIPTION VARCHAR(100),
VALUE_VALUE DECIMAL,
IS_PAID BOOLEAN,
DATE_VALUE DATETIME,
CATEGORY VARCHAR(100),
ID_USER INT,
ID_PAYMENT INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    INSERT INTO pagar(Descricao, Data, Pago, Valor, Categoria, idMeioPagamento, idUsuario) VALUES (DESCRIPTION,
                                                                                                   DATE_VALUE,
                                                                                                   IS_PAID,
                                                                                                   VALUE_VALUE,
                                                                                                   CATEGORY,
                                                                                                   ID_PAYMENT,
                                                                                                   ID_USER
                                                                                                   );
    RETURN TRUE;
END;

-- CREATE MIDDLE PAYMENT
CREATE FUNCTION CREATE_PAY(NAME VARCHAR(100)) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    INSERT INTO meiopagamento(Nome) VALUES (NAME);
    RETURN TRUE;
END;

-- CREATE INVESTIMENT
CREATE FUNCTION CREATE_INVESTIMENT(
DESCRIPTION VARCHAR(100),
ID_CARTEIRA INT,
NAME_INVESTIMENT VARCHAR(100)
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    INSERT INTO investimentos(Descricao, NomeTipoInvestimento, idCarteira) VALUES (DESCRIPTION,NAME_INVESTIMENT,ID_CARTEIRA);
    RETURN TRUE;
END;

-- CRIANDO RENDA VARIAVEL
CREATE FUNCTION CREATE_VARIABLE_INCOME(
PAPER VARCHAR(100),
APPLIED_VALUE VARCHAR(100),
UNITS INT,
ID_INVESTIMENT INT,
DATE_APPLIED DATETIME) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    INSERT INTO rendavariavel(Papel, ValorAplicado, Unidades, idInvestimentos, DataAplicacao) VALUES (PAPER,APPLIED_VALUE,UNITS,ID_INVESTIMENT,DATE_APPLIED);
    RETURN TRUE;
END;


CREATE PROCEDURE  POPULATED_BD(
IN FIRST_NAME VARCHAR(100),
IN LAST_NAME VARCHAR(100),
IN EMAIL VARCHAR(100),
IN PASSWORD VARCHAR(100),
IN NAME_WALLET VARCHAR(100))

BEGIN

    DECLARE ID_USER INT;
    DECLARE ID_WALLET INT;
    DECLARE IS_SUCESS BOOLEAN;

    -- CRIANDO USUÁRIO
    SET IS_SUCESS = (SELECT CREATE_USER(FIRST_NAME,LAST_NAME,EMAIL,PASSWORD));
    -- BUSCANDO ID DO USUÁRIO
    SET ID_USER = (SELECT idUsuario
    FROM usuario AS USS
    WHERE USS.Email = Email
      AND USS.Senha =  PASSWORD);

    -- CRIANDO CARTEIRA
    SET IS_SUCESS = (SELECT CREATE_WALLET(ID_USER,NAME_WALLET));
    -- BUSCANDO ID DA CARTEIRA
    SET ID_WALLET = (SELECT CC.CARTEIRACOL FROM carteira AS CC WHERE CC.idUsuario = ID_USER AND CC.Nome = NAME_WALLET);

END;






