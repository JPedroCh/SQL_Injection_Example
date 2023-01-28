CREATE DATABASE
    IF NOT EXISTS aula3exer1;
    
USE aula3exer1;

-- TABELAS

CREATE TABLE SETOR (
    idSetor int not null auto_increment,
    nome varchar(50) not null,
    CONSTRAINT SETOR_PK PRIMARY KEY(idSetor)
) ENGINE = InnoDB auto_increment = 1;

CREATE TABLE PLANTONISTA (
    matricula int not null auto_increment,
    nomeCompleto varchar(50) not null,
    sexo enum('M', 'F') not null,
    CONSTRAINT PLANTONISTA_PK PRIMARY KEY(matricula)
) ENGINE = InnoDB auto_increment = 1;

CREATE TABLE TURNO (
    idTurno int not null auto_increment,
    hrInicio time not null,
    hrFim time not null,
    dtInicio date not null,
    dtFim date not null,
    CONSTRAINT TURNO_PK PRIMARY KEY(idTurno)
) ENGINE = InnoDB auto_increment = 1;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade int not null auto_increment,
    nome varchar(50) not null,
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade)
) ENGINE = InnoDB auto_increment = 1;

CREATE TABLE trabalha (
    idTurno int not null,
    matricula int not null,
    CONSTRAINT trabalhar_TURNO_FK FOREIGN KEY (idTurno) REFERENCES TURNO (idTurno),
    CONSTRAINT trabalha_PLANTONISTA_FK FOREIGN KEY (matricula) REFERENCES PLANTONISTA (matricula)
) ENGINE = InnoDB;

CREATE TABLE pertence (
    idTurno int not null,
    idSetor int not null,
    CONSTRAINT pertence_TURNO_FK FOREIGN KEY (idTurno) REFERENCES TURNO (idTurno),
    CONSTRAINT pertence_SETOR_FK FOREIGN KEY (idSetor) REFERENCES SETOR (idSetor)
) ENGINE = InnoDB;

CREATE TABLE possui (
    idEspecialidade int not null,
    matricula int not null,
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE (idEspecialidade),
    CONSTRAINT possui_PLANTONISTA_FK FOREIGN KEY (matricula) REFERENCES PLANTONISTA (matricula)
) ENGINE = InnoDB;