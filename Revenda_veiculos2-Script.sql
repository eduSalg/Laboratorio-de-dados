
DROP DATABASE IF EXISTS revenda_veiculos;
CREATE DATABASE revenda_veiculos;
USE revenda_veiculos;

-- 1. TABELAS DE DOMÍNIO
CREATE TABLE marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE tipo_veiculo (
    id_tipo_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE cor (
    id_cor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE localizacao (
    id_localizacao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    tipo ENUM('Estande', 'Armazém', 'Oficina') NOT NULL
);

-- 2. TABELAS DE PESSOAS (RH, CLIENTES, FORNECEDORES)
CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    rg_ie VARCHAR(20),
    endereco VARCHAR(150),
    localidade VARCHAR(50),
    telefone VARCHAR(20),
    tipo_cliente ENUM('Regular', 'Frotista') NOT NULL DEFAULT 'Regular',
    id_vendedor_associado INT,
    FOREIGN KEY (id_vendedor_associado) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    ie VARCHAR(20),
    endereco VARCHAR(150),
    localidade VARCHAR(50),
    telefone VARCHAR(20),
    fax VARCHAR(20)
);

CREATE TABLE proprietario_anterior (
    id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    rg VARCHAR(20),
    endereco VARCHAR(150),
    localidade VARCHAR(50),
    telefone VARCHAR(20)
);

-- 3. TABELA PRINCIPAL: VEÍCULO
CREATE TABLE veiculo (
    matricula VARCHAR(10) PRIMARY KEY,
    id_modelo INT NOT NULL,
    id_tipo_veiculo INT NOT NULL,
    id_cor INT NOT NULL,
    id_localizacao INT NOT NULL,
    data_matricula DATE NOT NULL,
    data_entrada DATE NOT NULL,
    estado ENUM('Novo', 'Usado') NOT NULL,
    cilindrada INT CHECK (cilindrada > 0),
    potencia INT CHECK (potencia > 0),
    quilometragem INT NOT NULL DEFAULT 0 CHECK (quilometragem >= 0),
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo),
    FOREIGN KEY (id_tipo_veiculo) REFERENCES tipo_veiculo(id_tipo_veiculo),
    FOREIGN KEY (id_cor) REFERENCES cor(id_cor),
    FOREIGN KEY (id_localizacao) REFERENCES localizacao(id_localizacao)
);

-- 4. TABELAS DE MOVIMENTAÇÃO: COMPRA, CUSTOS E VENDA
CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10) NOT NULL UNIQUE,
    id_fornecedor INT,
    id_proprietario INT,
    data_compra DATE NOT NULL,
    valor_compra DECIMAL(10,2) NOT NULL CHECK (valor_compra > 0),
    FOREIGN KEY (matricula) REFERENCES veiculo(matricula),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    FOREIGN KEY (id_proprietario) REFERENCES proprietario_anterior(id_proprietario)
);
