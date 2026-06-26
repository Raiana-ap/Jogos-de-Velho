CREATE DATABASE IF NOT EXISTS Jogos_de_Velho;

USE Jogos_de_Velho;

CREATE TABLE Jogo (
    id_jogo     INT          NOT NULL AUTO_INCREMENT,
    titulo      VARCHAR(100) NOT NULL,
    descricao   TEXT,
    regras      TEXT,
    dificuldade VARCHAR(50),
    id_adm      INT          NOT NULL, 
    PRIMARY KEY (id_jogo)
);

CREATE TABLE Usuario (
    id_usuario      INT         NOT NULL AUTO_INCREMENT,
    nome            VARCHAR(100) NOT NULL,
    senha           VARCHAR(255) NOT NULL,
    foto_perfil     VARCHAR(255),
    data_nascimento DATE,
    data_cadastro   DATE         NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id_usuario)
);


CREATE TABLE Comum (
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_usuario),
    CONSTRAINT fk_comum_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Adm (
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_usuario),
    CONSTRAINT fk_adm_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Partida (
    id_partida  INT  NOT NULL AUTO_INCREMENT,
    data_inicio DATE NOT NULL,
    data_fim    DATE,
    resultado   VARCHAR(100),
    pontuacao   DECIMAL(10, 2),
    id_jogo     INT  NOT NULL,
    PRIMARY KEY (id_partida),
    CONSTRAINT fk_partida_jogo
        FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
);


CREATE TABLE Usuario_Partida (
    id_usuario INT NOT NULL,
    id_partida INT NOT NULL,
    PRIMARY KEY (id_usuario, id_partida),
    CONSTRAINT fk_up_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),

    CONSTRAINT fk_up_partida
        FOREIGN KEY (id_partida) REFERENCES Partida(id_partida)
);

CREATE TABLE Avaliacao (
    id_avaliacao INT  NOT NULL AUTO_INCREMENT,
    data         DATE NOT NULL,
    nota         DECIMAL(3, 1) NOT NULL,
    texto        TEXT,
    id_usuario   INT  NOT NULL,
    id_jogo      INT  NOT NULL,
    PRIMARY KEY (id_avaliacao),
    CONSTRAINT fk_avaliacao_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_avaliacao_jogo
        FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
);

CREATE TABLE Comentario (
    id_comentario INT  NOT NULL AUTO_INCREMENT,
    data          DATE NOT NULL,
    texto         TEXT NOT NULL,
    id_usuario    INT  NOT NULL,
    id_jogo       INT  NOT NULL,
    PRIMARY KEY (id_comentario),
    CONSTRAINT fk_comentario_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_comentario_jogo
        FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
);


ALTER TABLE Jogo
    ADD CONSTRAINT fk_jogo_adm
        FOREIGN KEY (id_adm) REFERENCES Adm(id_usuario);