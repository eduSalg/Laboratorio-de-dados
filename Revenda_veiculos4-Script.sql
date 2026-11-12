
-- Banco de Dados: revenda_veiculos
CREATE DATABASE revenda_veiculos;
USE revenda_veiculos;

-- Tabela: vendedor
CREATE TABLE vendedor (
  id_vendedor INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  data_admissao DATE NOT NULL,
  PRIMARY KEY (id_vendedor)
);

-- Tabela: cliente
CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
  rg_ie VARCHAR(20) NULL DEFAULT NULL,
  endereco VARCHAR(150) NULL DEFAULT NULL,
  localidade VARCHAR(50) NULL DEFAULT NULL,
  telefone VARCHAR(20) NULL DEFAULT NULL,
  tipo_cliente ENUM('Regular', 'Frotista') NOT NULL DEFAULT 'Regular',
  id_vendedor_associado INT NULL DEFAULT NULL,
  PRIMARY KEY (id_cliente),
  FOREIGN KEY (id_vendedor_associado) REFERENCES vendedor (id_vendedor)
);

-- Tabela: marca
CREATE TABLE marca (
  id_marca INT NOT NULL AUTO_INCREMENT,
  nome ENUM('Toyota', 'Volkswagen', 'Ford', 'Chevrolet') NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_marca)
);

-- Tabela: tipo_veiculo
CREATE TABLE tipo_veiculo (
  id_tipo_veiculo INT NOT NULL AUTO_INCREMENT,
  descricao ENUM('esportivo', 'passeio', 'utilitário', 'transporte de mercadorias') NOT NULL UNIQUE,
  PRIMARY KEY (id_tipo_veiculo)
);

-- Tabela: cor
CREATE TABLE cor (
  id_cor INT NOT NULL AUTO_INCREMENT,
  nome ENUM('Branco', 'Preto', 'Prata') NOT NULL UNIQUE,
  PRIMARY KEY (id_cor)
);

-- Tabela: localizacao
CREATE TABLE localizacao (
  id_localizacao INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NOT NULL,
  tipo ENUM('Estande', 'Armazém', 'Oficina') NOT NULL,
  PRIMARY KEY (id_localizacao)
);

-- Tabela: veiculo
CREATE TABLE veiculo (
  matricula VARCHAR(10) NOT NULL,
  id_marca INT NOT NULL,
  id_tipo_veiculo INT NOT NULL,
  id_cor INT NOT NULL,
  id_localizacao INT NOT NULL,
  data_matricula DATE NOT NULL,
  data_entrada DATE NOT NULL,
  estado ENUM('Novo', 'Usado') NOT NULL,
  cilindrada INT NULL DEFAULT NULL,
  potencia INT NULL DEFAULT NULL,
  quilometragem INT NOT NULL DEFAULT '0',
  PRIMARY KEY (matricula),
  FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
  FOREIGN KEY (id_tipo_veiculo) REFERENCES tipo_veiculo (id_tipo_veiculo),
  FOREIGN KEY (id_cor) REFERENCES cor (id_cor),
  FOREIGN KEY (id_localizacao) REFERENCES localizacao (id_localizacao)
);

-- Tabela: fornecedor
CREATE TABLE fornecedor (
  id_fornecedor INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(20) NOT NULL UNIQUE,
  ie VARCHAR(20) NULL DEFAULT NULL,
  endereco VARCHAR(150) NULL DEFAULT NULL,
  localidade VARCHAR(50) NULL DEFAULT NULL,
  telefone VARCHAR(20) NULL DEFAULT NULL,
  fax VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (id_fornecedor)
);

-- Tabela: proprietario_anterior
CREATE TABLE proprietario_anterior (
  id_proprietario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) NOT NULL UNIQUE,
  rg VARCHAR(20) NULL DEFAULT NULL,
  endereco VARCHAR(150) NULL DEFAULT NULL,
  localidade VARCHAR(50) NULL DEFAULT NULL,
  telefone VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (id_proprietario)
);

-- Tabela: compra
CREATE TABLE compra (
  id_compra INT NOT NULL AUTO_INCREMENT,
  matricula VARCHAR(10) NOT NULL UNIQUE,
  id_fornecedor INT NULL DEFAULT NULL,
  id_proprietario INT NULL DEFAULT NULL,
  data_compra DATE NOT NULL,
  valor_compra DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_compra),
  FOREIGN KEY (matricula) REFERENCES veiculo (matricula),
  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor),
  FOREIGN KEY (id_proprietario) REFERENCES proprietario_anterior (id_proprietario)
);

-- Tabela: tipo_custo
CREATE TABLE tipo_custo (
  id_tipo_custo INT NOT NULL AUTO_INCREMENT,
  descricao ENUM('funilaria', 'pintura', 'eletricista', 'combustível', 'transporte', 'despesas de legalização', 'despesas de importação', 'manutenção') NOT NULL UNIQUE,
  PRIMARY KEY (id_tipo_custo)
);

-- Tabela: custo_veiculo
CREATE TABLE custo_veiculo (
  id_custo INT NOT NULL AUTO_INCREMENT,
  matricula VARCHAR(10) NOT NULL,
  id_tipo_custo INT NOT NULL,
  data_custo DATE NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_custo),
  FOREIGN KEY (matricula) REFERENCES veiculo (matricula),
  FOREIGN KEY (id_tipo_custo) REFERENCES tipo_custo (id_tipo_custo)
);

-- Tabela: venda
CREATE TABLE venda (
  id_venda INT NOT NULL AUTO_INCREMENT,
  matricula VARCHAR(10) NOT NULL UNIQUE,
  id_cliente INT NOT NULL,
  id_vendedor INT NOT NULL,
  data_venda DATE NOT NULL,
  valor_venda DECIMAL(10,2) NOT NULL,
  comissao_percentual DECIMAL(5,2) NOT NULL DEFAULT '0.00',
  forma_pagamento VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_venda),
  FOREIGN KEY (matricula) REFERENCES veiculo (matricula),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor)
);