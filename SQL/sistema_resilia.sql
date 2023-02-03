-- Apaga o banco de dados se ele existir
DROP DATABASE IF EXISTS sistema_resilia;

-- Cria o banco de dados usando UTF-8 e buscas case-insensitive.
CREATE DATABASE sistema_resilia CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE sistema_resilia;

-- Criar tabela (entidade)
CREATE TABLE instituicao (
	instituicao_cnpj VARCHAR(14) PRIMARY KEY NOT NULL,
	instituicao_nome VARCHAR(255) NOT NULL,
	instituicao_email VARCHAR(255) NOT NULL,
	instituicao_endereco_logradouro VARCHAR(255) NOT NULL,
	instituicao_endereco_numero VARCHAR(10) NOT NULL,
	instituicao_endereco_complemento VARCHAR(50) NOT NULL,
	instituicao_endereco_bairro VARCHAR(100) NOT NULL,
	instituicao_endereco_municipio VARCHAR(100) NOT NULL,
	instituicao_endereco_uf VARCHAR(2) NOT NULL,
	instituicao_endereco_cep VARCHAR(9) NOT NULL,
	instituicao_capacidade_alunos INT NOT NULL
);

-- Criar tabela (entidade)
CREATE TABLE cursos (
	curso_id INT PRIMARY KEY AUTO_INCREMENT,
	curso_nome VARCHAR(255) NOT NULL,
	curso_categoria VARCHAR(255) NOT NULL,
    curso_duracao VARCHAR(20) NOT NULL,
	curso_inicio VARCHAR(20) NOT NULL,
	curso_fim VARCHAR(20) NOT NULL,
	
    instituicao_cnpj VARCHAR(14) NOT NULL,
	FOREIGN KEY (instituicao_cnpj) REFERENCES instituicao (instituicao_cnpj)
);

-- Criar tabela (entidade)
CREATE TABLE funcionarios (
	funcionario_cpf VARCHAR(11) PRIMARY KEY NOT NULL,
	funcionario_nome VARCHAR(255) NOT NULL,
	funcionario_telefone VARCHAR(11) NOT NULL,
	funcionario_nascimento VARCHAR(11) NOT NULL,
	funcionario_email VARCHAR(255) NOT NULL,
	funcionario_endereco_logradouro VARCHAR(255) NOT NULL,
	funcionario_endereco_numero VARCHAR(10) NOT NULL,
	funcionario_endereco_complemento VARCHAR(50) NOT NULL,
	funcionario_endereco_bairro VARCHAR(100) NOT NULL,
	funcionario_endereco_municipio VARCHAR(100) NOT NULL,
	funcionario_endereco_uf VARCHAR(2) NOT NULL,
	funcionario_endereco_cep VARCHAR(9) NOT NULL,

	instituicao_cnpj VARCHAR(14) NOT NULL,
	FOREIGN KEY (instituicao_cnpj) REFERENCES instituicao (instituicao_cnpj)
);

-- Criar tabela (entidade)
CREATE TABLE alunos (
	aluno_cpf VARCHAR(11) PRIMARY KEY NOT NULL,
	aluno_nome VARCHAR(255) NOT NULL,
	aluno_telefone VARCHAR(11) NOT NULL,
	aluno_nascimento VARCHAR(11) NOT NULL,
	aluno_email VARCHAR(255) NOT NULL,
	aluno_endereco_logradouro VARCHAR(255) NOT NULL,
	aluno_endereco_numero VARCHAR(10) NOT NULL,
	aluno_endereco_complemento VARCHAR(50) NOT NULL,
	aluno_endereco_bairro VARCHAR(100) NOT NULL,
	aluno_endereco_municipio VARCHAR(100) NOT NULL,
	aluno_endereco_uf VARCHAR(2) NOT NULL,
	aluno_endereco_cep VARCHAR(9) NOT NULL
);

-- Criar tabela (entidade)
CREATE TABLE turmas (
	turma_id INT PRIMARY KEY AUTO_INCREMENT,
	turma_turno VARCHAR(15) NOT NULL,
	turma_sala VARCHAR(15) NOT NULL,
	turma_andar INT NOT NULL,
	turma_vagas INT NOT NULL,
	turma_metodo VARCHAR(50) NOT NULL,
	
	curso_id INT NOT NULL,
	funcionario_cpf VARCHAR(11) NOT NULL,
	aluno_cpf VARCHAR(11) NOT NULL,
	FOREIGN KEY (curso_id) REFERENCES cursos (curso_id),
	FOREIGN KEY (funcionario_cpf) REFERENCES funcionarios (funcionario_cpf),
    FOREIGN KEY (aluno_cpf) REFERENCES alunos (aluno_cpf)
);

-- ################################# Inserir dados #################################

-- Inserir dados na tabela (entidade)
INSERT INTO instituicao (instituicao_cnpj, instituicao_nome, instituicao_email, instituicao_endereco_logradouro, 
instituicao_endereco_numero, instituicao_endereco_complemento, instituicao_endereco_bairro, instituicao_endereco_municipio,
instituicao_endereco_uf, instituicao_endereco_cep, instituicao_capacidade_alunos) VALUES

	('33014556000196', 'SENAC CAMPO GRANDE', 'campo_grande@senac.com', 'Rua Mario da Silva', '80', '',
	'Campo Grande', 'Rio de Janeiro', 'RJ', '23013-852', '150'),

	('33518548485451', 'SENAC BANGU', 'bangu@senac.com', 'Rua Dona Marta', '123', '',
	'Bangu', 'Rio de Janeiro', 'RJ', '24655-614', '231'),

	('21564984521498', 'ESTACIO MADUREIRA', 'madureira@estacio.com', 'Rua Operário', '74', '',
	'Madureira', 'Rio de Janeiro', 'RJ', '23129-529', '450'),

	('11989587965484', 'SENAC IRAJÁ', 'iraja@senac.com', 'Rua Marquês Franco', '526', 'LJ 4',
	'Irajá', 'Rio de Janeiro', 'RJ', '24969592', '230'),

	('36498148549611', 'SENAC ENGENHO DE DENTRO', 'engenho_de_dentro@senac.com', 'Rua Nilopolitana', '21', '',
	'Engenho de Dentro', 'Rio de Janeiro', 'RJ', '21894189', '600'),

	('11848796958789', 'SENAC PENHA', 'penha@senac.com', 'Rua Oswaldo Lima', '23', '',
	'Penha', 'Rio de Janeiro', 'RJ', '23556956', '100'),

	('74495965848640', 'SENAC CENTRO', 'centro@senac.com', 'Av Sambodrómo', '42', '',
	'Centro', 'Rio de Janeiro', 'RJ', '21265962', '85'),

	('19628496486948', 'SENAC BARRA DA TIJUCA', 'barra_da_tijuca@senac.com', 'Estr Limeira', '1825', 'SL 26',
	'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '22656585', '40');

-- Inserir dados na tabela (entidade)
INSERT INTO cursos (curso_id, curso_nome, curso_categoria, curso_duracao, curso_inicio, curso_fim, instituicao_cnpj) VALUES

	('1', 'Desenvolvedor Junior', 'Informática', '6 meses', '01/01/2022', '11/01/2023', '33014556000196'),
    
	('2', 'Desenvolvedor Pleno', 'Informática', '2 meses', '02/02/2022', '12/02/2023', '33518548485451'),
    
	('3', 'Desenvolvedor Senior', 'Informática', '1 mês', '03/03/2022', '13/03/2023', '21564984521498'),
    
	('4', 'Front-End', 'Informática', '1 ano', '04/04/2022', '14/04/2023', '11989587965484'),
    
	('5', 'Back-End', 'Informática', '2 anos', '05/05/2022', '15/05/2023', '36498148549611'),
    
	('6', 'Informática básica', 'Informática', '5 meses', '06/06/2022', '16/06/2023', '11848796958789'),
    
    ('7', 'Informática básica', 'Informática', '5 meses', '07/07/2022', '17/07/2023', '74495965848640'),
    
    ('8', 'Montagem e Manutenção', 'Informática', '6 meses', '08/08/2022', '18/08/2023', '19628496486948');
    
-- Inserir dados na tabela (entidade)
INSERT INTO funcionarios (funcionario_cpf, funcionario_nome, funcionario_telefone, funcionario_nascimento, funcionario_email, 
funcionario_endereco_logradouro, funcionario_endereco_numero, funcionario_endereco_complemento, funcionario_endereco_bairro, 
funcionario_endereco_municipio, funcionario_endereco_uf, funcionario_endereco_cep, instituicao_cnpj) VALUES 
    
	('14458245685', 'Jéssica Cardoso', '21975242566', '01/01/1981', 'jessica_cardoso@gmail.com', 'Rua Doutor Ramos', '235', 'AP 235',
    'Jardim Guanabara', 'Rio de Janeiro', 'RJ', '23585999', '33014556000196'),
    
    ('29694949499', 'Marlene Braz', '21987426551', '02/02/1982', 'marlene_braz@gmail.com', 'Rua Lima Duarte', '16', 'AP 135',
    'Tauá', 'Nova Iguaçu', 'RJ', '21815415', '33518548485451'),
    
    ('20528841848', 'Poliana Medina', '21966463821', '03/03/1983', 'poliana_medina@gmail.com', 'Av dos Democáticos', '936', 'CS 9',
    'Bancários', 'Rio de Janeiro', 'RJ', '23485418', '21564984521498'),
    
    ('26294848488', 'Raquel Boaventura', '21977561512', '04/04/1984', 'raquel_boaventura@gmail.com', 'Av Lima Freire', '216', '',
    'Freguesia', 'Rio de Janeiro', 'RJ', '25596459', '11989587965484'),
    
    ('82564848541', 'Clara Moura', '21996181584', '05/05/1985', 'clara_moura@gmail.com', 'Rua Romeu Silva', '62', '',
    'Palmeira', 'São Gonçalo', 'RJ', '29652964', '36498148549611'),
    
    ('92924848484', 'Lúcia Ito', '21974441511', '06/06/1986', 'lucia_ito@gmail.com', 'Rua Os Sinos', '4', 'SOBRADO',
    'Galeão', 'Rio de Janeiro', 'RJ', '27296559', '11848796958789'),
    
    ('58584848484', 'Henrique Justino', '21965181564', '07/07/1987', 'henrique_justino@gmail.com', 'Rua Cambaúba', '39', '',
    'Itaóca', 'São Gonçalo', 'RJ', '23569595', '74495965848640'),
    
    ('28484848421', 'Manoel Rezende', '21996184155', '08/08/1998', 'manoel_rezende@gmail.com', 'Rua Garcez', '1584', 'AP 102',
    'Irajá', 'Rio de Janeiro', 'RJ', '28216512', '19628496486948');
    
-- Inserir dados na tabela (entidade)
INSERT INTO alunos (aluno_cpf, aluno_nome, aluno_telefone, aluno_nascimento, aluno_email, aluno_endereco_logradouro, aluno_endereco_numero, 
aluno_endereco_complemento, aluno_endereco_bairro, aluno_endereco_municipio, aluno_endereco_uf, aluno_endereco_cep) VALUES 

	('14458774588', 'Benício Cordeiro', '21992456899', '01/01/1991', 'benicio_cordeiro@gmail.com', 'Rua Maria Joaquina', '20', 'AP 101',
	'Bangu', 'Rio de Janeiro', 'RJ', '23013852'),

	('51561541562', 'Michel Araújo', '21962964165', '02/02/1992', 'michael_araujo@gmail.com', 'Av Brasil', '6526', 'AP 101',
	'Campo Grande', 'Rio de Janeiro', 'RJ', '24655614'),

	('96525612568', 'Ivo Justo', '21999612845', '03/03/1993', 'ivo_justo@gmail.com', 'Av das Américas', '26512', '',
	'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '23129529'),

	('29626365652', 'Marcelo Fontes', '21971854185', '04/04/1994', 'marcelo_fontes@gmail.com', 'Av Atlântica', '23', 'CS 2',
	'Ipanema', 'Rio de Janeiro', 'RJ', '24969592'),

	('39659659565', 'César Canto', '21996204964', '06/06/1996', 'cesar_canto@gmail.com', 'Rua Pedro Silva', '12', '',
	'Centro', 'Duque de Caxias', 'RJ', '21894189'),

	('92641256125', 'Cleiton Leitão', '21994856848', '01/01/1991', 'cleiton_leitao@gmail.com', 'Rua dos Amigos', '469', '',
	'Itaipú', 'Niterói', 'RJ', '23556956'),

	('62655969654', 'Virgínia Leal', '21997248666', '07/07/1997', 'virginia_leal@gmail.com', 'Travessa Tavares', '25', 'AP 808',
	'São Vicente', 'São Gonçalo', 'RJ', '21265962'),

	('71654165128', 'Clarice Melo', '21999744524', '08/08/1998', 'clarice_melo@gmail.com', 'Rua Dom Joaquim', '358', 'SOBRADO',
	'Leme', 'Rio de Janeiro', 'RJ', '22656585');

-- Inserir dados na tabela (entidade)
INSERT INTO turmas (turma_id, turma_turno, turma_sala, turma_andar, turma_vagas, turma_metodo, curso_id, funcionario_cpf, aluno_cpf) VALUES 

	('1', 'MANHÃ', '105', '1', '20', 'Presencial', '1', '14458245685', '14458774588'),
    
    ('2', 'NOITE', '305', '3', '25', 'Distância', '2', '29694949499', '51561541562'),
    
    ('3', 'NOITE', '604', '6', '30', 'Presencial', '3', '20528841848', '96525612568'),
    
    ('4', 'MANHÃ', '102', '1', '15', 'Distância', '4', '26294848488', '29626365652'),

	('5', 'TARDE', '804', '8', '20', 'Presencial', '5', '82564848541', '39659659565'),
    
    ('6', 'TARDE', '220', '2', '30', 'Presencial', '6', '92924848484', '92641256125'),
    
    ('7', 'NOITE', '206', '2', '20', 'Presencial', '7', '58584848484', '62655969654'),
    
    ('8', 'MANHÃ', '109', '1', '30', 'Distância', '8', '28484848421', '71654165128');

    
    
    
    
    
    
    
    


