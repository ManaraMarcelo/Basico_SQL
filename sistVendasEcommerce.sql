-- Criação da tabela 'Clientes' para armazenar informações sobre os clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY, -- ID único para identificar cada cliente
    Nome VARCHAR(100) NOT NULL, -- Nome do cliente, obrigatório
    Email VARCHAR(100), -- Email do cliente
    Endereco VARCHAR(200) -- Endereço do cliente
);

-- Criação da tabela 'Produtos' para armazenar informações sobre os produtos da loja
CREATE TABLE Produtos (
    ID INT PRIMARY KEY, -- ID único para identificar cada produto
    Nome VARCHAR(100) NOT NULL, -- Nome do produto, obrigatório
    Categoria VARCHAR(50), -- Categoria do produto
    Preco DECIMAL(10, 2), -- Preço do produto com até 10 dígitos e 2 casas decimais
    Estoque INT -- Quantidade disponível em estoque
);

-- Criação da tabela 'Pedidos' para registrar os pedidos realizados pelos clientes
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY, -- ID único para cada pedido
    Cliente_ID INT, -- ID do cliente que fez o pedido, relaciona com a tabela 'Clientes'
    Data_Pedido DATE, -- Data em que o pedido foi realizado
    Status VARCHAR(20), -- Status do pedido (ex. "pendente", "enviado")
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID) -- Define a relação entre 'Pedidos' e 'Clientes'
);

-- Criação da tabela 'ItensPedido' para armazenar os produtos de cada pedido
CREATE TABLE ItensPedido (
    Pedido_ID INT, -- ID do pedido, relaciona com a tabela 'Pedidos'
    Produto_ID INT, -- ID do produto, relaciona com a tabela 'Produtos'
    Quantidade INT, -- Quantidade do produto no pedido
    PRIMARY KEY (Pedido_ID, Produto_ID), -- Define uma chave composta para identificar itens de pedidos
    FOREIGN KEY (Pedido_ID) REFERENCES Pedidos(ID), -- Define a relação entre 'ItensPedido' e 'Pedidos'
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(ID) -- Define a relação entre 'ItensPedido' e 'Produtos'
);
