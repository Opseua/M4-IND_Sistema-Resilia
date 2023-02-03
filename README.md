# Sendo Servido
![NPM](https://img.shields.io/npm/l/react)




# Sobre o projeto

A proposta do projeto foi criar um modelo de banco de dados fícticio para o sistema de acompanhamento da **Resilia**.

Nessa modelagem temos 3 entidades já existentes ('cursos', 'turmas' e 'alunos'). Além de planejar e eleborador o banco de dados, devemos responder algumas perguntas feitas pelo cliente do banco de dados:


**1 - Existem outras entidades além dessas três?** 

Sim!;

**2 - Quais são os principais campos e tipos?** 

_Principais campos_: 'cpf', 'nome', 'telefone', 'nascimento', 'email', 'endereco_logradouro', 'endereco_numero', 'endereco_complemento', 'endereco_bairro', 'endereco_municipio', 'endereco_uf' e 'endereco_cep';

_Principais tipos_: 'VARCHAR' e 'INT'.

**3 - Como essas entidades estão relacionadas?**

A 'instituicao' possui 'funcionarios', que por sua vez estão atrelados às 'turmas', que possuem 'cursos' que por fim têm 'alunos'.

Os 'funcionarios' possuem uma (FK) com a (PK) 'instituicao_cpnj' criando assim um vínculo entre as entidades.

Os 'cursos' também possuem uma (FK) com a (PK) 'instituicao_cpnj' para realizar a conexão.

As 'turmas' estão conectadas aos 'cursos' pela (FK) com a (PK) 'curso_id' e também aos 'alunos' com a (FK) da (PK) 'aluno_cpf'

# Entidades disponíveis

- 'instituicao'
- 'funcionarios'
- 'cursos'
- 'turmas'
- 'alunos'


# Apresentação da modelagem

 ![modelagem](https://raw.githubusercontent.com/Opseua/M4-IND_Sistema-Resilia/main/sistema_resilia-diagrama.png)!



# Comandos utilizados

_Criação das entidades_

```
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
	funcionario_cpf INT PRIMARY KEY NOT NULL,
	funcionario_nome VARCHAR(255) NOT NULL,
	funcionario_telefone INT NOT NULL,
	funcionario_nascimento INT NOT NULL,
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
	aluno_cpf INT PRIMARY KEY NOT NULL,
	aluno_nome VARCHAR(255) NOT NULL,
	aluno_telefone INT NOT NULL,
	aluno_nascimento INT NOT NULL,
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
	funcionario_cpf INT NOT NULL,
	aluno_cpf INT NOT NULL,
	FOREIGN KEY (curso_id) REFERENCES cursos (curso_id),
	FOREIGN KEY (funcionario_cpf) REFERENCES funcionarios (funcionario_cpf),
    FOREIGN KEY (aluno_cpf) REFERENCES alunos (aluno_cpf)
);

```

_Preenchimento dos dados_


```
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
    
	('7', 'Montagem e Manutenção', 'Informática', '7 meses', '07/07/2022', '17/07/2023', '7449596584864'),
    
	('8', 'Redes', 'Informática', '3 meses', '08/08/2022', '18/08/2023', '19628496486948');
```



_**Orlando:**_

<div>
<a href="https://www.linkedin.com/in/orlando-santana/" target="_blank"><img src="https://camo.githubusercontent.com/839a92c15fa7396af70ffceaa77f11ca3f1ee84e76c19d6d8ab1778466a9ded9/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e6b6564696e2d3332333333303f7374796c653d666f722d7468652d6261646765266c6f676f3d6c696e6b6564696e266c6f676f436f6c6f723d626c7565" target="_blank"></a><a href="https://github.com/Opseua" target="_blank"><img src="https://camo.githubusercontent.com/69a8eab46810b62de859aa2c16750ec4a73a027cfec48ad55419c8ad6ee62821/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6769746875622d2532333132313031312e7376673f6c6f676f3d676974687562266c6f676f436f6c6f723d7768697465267374796c653d666f722d7468652d6261646765" target="_blank"></a>
</div>