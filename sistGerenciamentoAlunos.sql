-- Criação da tabela 'Alunos' para armazenar informações dos alunos
CREATE TABLE Alunos (
    ID INT PRIMARY KEY, -- ID único para identificar cada aluno
    Nome VARCHAR(100) NOT NULL, -- Nome do aluno, obrigatório
    Data_Nascimento DATE, -- Data de nascimento do aluno
    Email VARCHAR(100) -- Email do aluno
);

-- Criação da tabela 'Cursos' para armazenar informações sobre os cursos oferecidos
CREATE TABLE Cursos (
    ID INT PRIMARY KEY, -- ID único para identificar cada curso
    Nome VARCHAR(100) NOT NULL, -- Nome do curso, obrigatório
    Descricao TEXT -- Descrição do curso
);

-- Criação da tabela 'Matriculas' para registrar as matrículas de alunos em cursos
CREATE TABLE Matriculas (
    ID INT PRIMARY KEY, -- ID único para cada matrícula
    Aluno_ID INT, -- ID do aluno matriculado, relaciona com a tabela 'Alunos'
    Curso_ID INT, -- ID do curso em que o aluno está matriculado, relaciona com a tabela 'Cursos'
    Data_Matricula DATE, -- Data de matrícula
    FOREIGN KEY (Aluno_ID) REFERENCES Alunos(ID), -- Define a relação entre 'Matriculas' e 'Alunos'
    FOREIGN KEY (Curso_ID) REFERENCES Cursos(ID) -- Define a relação entre 'Matriculas' e 'Cursos'
);

-- Criação da tabela 'Notas' para armazenar as notas dos alunos nos cursos
CREATE TABLE Notas (
    Aluno_ID INT, -- ID do aluno, relaciona com a tabela 'Alunos'
    Curso_ID INT, -- ID do curso, relaciona com a tabela 'Cursos'
    Nota DECIMAL(5, 2), -- Nota do aluno no curso, com até 5 dígitos e 2 casas decimais
    Data DATE, -- Data em que a nota foi registrada
    PRIMARY KEY (Aluno_ID, Curso_ID), -- Define uma chave composta para identificar notas de um aluno em um curso específico
    FOREIGN KEY (Aluno_ID) REFERENCES Alunos(ID), -- Define a relação entre 'Notas' e 'Alunos'
    FOREIGN KEY (Curso_ID) REFERENCES Cursos(ID) -- Define a relação entre 'Notas' e 'Cursos'
);
