-- Criação da tabela 'Autores' para armazenar informações sobre os autores de livros
CREATE TABLE Autores (
    ID INT PRIMARY KEY, -- ID único para identificar cada autor
    Nome VARCHAR(100) NOT NULL, -- Nome do autor, obrigatório
    Nacionalidade VARCHAR(50), -- Nacionalidade do autor, opcional
    Ano_Nascimento INT -- Ano de nascimento do autor
);

-- Criação da tabela 'Livros' para armazenar informações sobre os livros
CREATE TABLE Livros (
    ID INT PRIMARY KEY, -- ID único para cada livro
    Titulo VARCHAR(200) NOT NULL, -- Título do livro, obrigatório
    Autor_ID INT, -- ID do autor, relaciona com a tabela 'Autores'
    Genero VARCHAR(50), -- Gênero do livro
    Ano_Publicacao INT, -- Ano de publicação do livro
    FOREIGN KEY (Autor_ID) REFERENCES Autores(ID) -- Define a relação entre 'Livros' e 'Autores'
);

-- Criação da tabela 'Usuarios' para armazenar informações sobre os usuários da biblioteca
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY, -- ID único para cada usuário
    Nome VARCHAR(100) NOT NULL, -- Nome do usuário, obrigatório
    Data_Nascimento DATE, -- Data de nascimento do usuário
    Email VARCHAR(100) -- Email do usuário
);

-- Criação da tabela 'Emprestimos' para registrar os empréstimos de livros
CREATE TABLE Emprestimos (
    ID INT PRIMARY KEY, -- ID único para cada empréstimo
    Livro_ID INT, -- ID do livro emprestado, relaciona com a tabela 'Livros'
    Usuario_ID INT, -- ID do usuário que fez o empréstimo, relaciona com a tabela 'Usuarios'
    Data_Emprestimo DATE, -- Data em que o livro foi emprestado
    Data_Devolucao DATE, -- Data de devolução do livro
    FOREIGN KEY (Livro_ID) REFERENCES Livros(ID), -- Define a relação entre 'Emprestimos' e 'Livros'
    FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID) -- Define a relação entre 'Emprestimos' e 'Usuarios'
);
