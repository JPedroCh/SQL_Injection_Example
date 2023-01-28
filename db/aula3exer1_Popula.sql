USE aula3exer1;

INSERT INTO SETOR (nome) VALUES 
('Emergência'),
('Neurologia'),
('Cardiologia'),
('Pós-Operatório');

INSERT INTO PLANTONISTA (nomeCompleto, sexo) VALUES 
('José Xavier', 'M'),
('Carla Antunes', 'F'),
('Ana Gonçalves', 'F'),
('Antônio Fernandes', 'M');

INSERT INTO TURNO (hrInicio, hrFim, dtInicio, dtFim) VALUES 
('12:00:00', '12:00:00', '2021-03-12','2021-03-13'),
('05:00:00', '17:00:00', '2021-03-13','2021-03-13'),
('18:00:00', '06:00:00', '2021-03-14','2021-03-15'),
('20:00:00', '08:00:00', '2021-03-15','2021-03-16');

INSERT INTO ESPECIALIDADE (nome) VALUES 
('Enfermeiro Geral'),
('Cuidados Paliativos'),
('Cardiologia'),
('Home Care');

INSERT INTO trabalha (idTurno, matricula) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO pertence (idTurno, idSetor) VALUES 
(1, 2),
(2, 1),
(3, 4),
(4, 3);

INSERT INTO possui (idEspecialidade, matricula) VALUES 
(1, 4),
(2, 4),
(3, 3),
(4, 1);
