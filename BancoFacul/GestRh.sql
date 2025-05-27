CREATE DATABASE GestRh;
USE GestRh;

CREATE TABLE tb_departamentos (
    iddepartamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE tb_funcionarios (
    idfuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(256) NOT NULL,
    cargo VARCHAR(100),
    cpf VARCHAR(20) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    telefone VARCHAR(11),
    data_admissao DATE,
    id_departamento INT,
    vlsalario DECIMAL(10,2),
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(iddepartamento)
);

-- inserindo alguns departamentos pra referenciar
INSERT INTO tb_departamentos(nome) VALUES
('Recursos Humanos'), ('Departamento Pessoal'), ('Financeiro');            

-- inserindo funcionários
INSERT INTO tb_funcionarios(nome, cargo, cpf, email, telefone, data_admissao, id_departamento, vlsalario) VALUES
('Cleiton Rhasta', 'RH', '068.500.782-65', 'cleitinRH@gmail.com', '6185545047', '2024-03-03', 1, 1855.73),
('Joao Tavares', 'Departamento Pessoal', '038.570.752-65', 'jaoDP@gmail.com', '6199645037', '2024-04-03', 2, 2505.44),
('Josilane fara', 'Financeiro', '288.579.802-90', 'josilanefinancas@gmail.com', '6190045047', '2024-05-03', 3, 3000.52);

-- atualização de salário
UPDATE tb_funcionarios 
SET vlsalario = 5000.33 
WHERE cargo = 'RH';

-- deletando funcionário
DELETE FROM tb_funcionarios 
WHERE idfuncionario = 1;

-- inner join: ver funcionário e departamento
SELECT f.nome AS funcionario, f.cargo, d.nome AS departamento 
FROM tb_funcionarios f 
INNER JOIN tb_departamentos d ON f.id_departamento = d.iddepartamento;

-- left join: mostrar todos os departamentos, com ou sem funcionário
SELECT d.nome AS departamento, f.nome AS funcionario, f.cargo 
FROM tb_departamentos d 
LEFT JOIN tb_funcionarios f ON f.id_departamento = d.iddepartamento;

-- group by com agregações
SELECT d.nome AS departamento, 
    SUM(f.vlsalario) AS total_salarios,
    AVG(f.vlsalario) AS media_salarial,
    COUNT(f.idfuncionario) AS qtd_funcionarios
FROM tb_funcionarios f 
INNER JOIN tb_departamentos d ON f.id_departamento = d.iddepartamento
GROUP BY d.nome;

-- having: filtrar departamentos com média salarial maior que 2600
SELECT d.nome AS departamento, 
    AVG(f.vlsalario) AS media_salarial
FROM tb_funcionarios f
INNER JOIN tb_departamentos d ON f.id_departamento = d.iddepartamento
GROUP BY d.nome
HAVING AVG(f.vlsalario) > 2600;

