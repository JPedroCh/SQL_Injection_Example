USE aula3exer1;

-- Cria papel de admin

CREATE ROLE 'administrador';
GRANT ALL PRIVILEGES ON aula3exer1.* TO 'administrador';

-- Cria papel de usuário

CREATE ROLE 'usuario';
GRANT SELECT ON aula3exer1.* TO 'usuario';

-- Cria papel de gestor

CREATE ROLE 'gestor';
GRANT SELECT ON aula3exer1.* TO 'gestor';
GRANT INSERT, UPDATE ON aula3exer1.PLANTONISTA TO 'gestor';
GRANT INSERT, UPDATE ON aula3exer1.SETOR TO 'gestor';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Jp0711199923';


