USE revenda_veiculos;

-- =====================================================================
-- PARTE 1: INSERTS (ordem respeita as chaves estrangeiras)
-- =====================================================================

-- vendedor
INSERT INTO vendedor (nome, data_admissao) VALUES
('Carlos Mendes',   '2019-03-12'),
('Fernanda Lima',   '2020-08-01'),
('Rafael Souza',    '2021-05-17'),
('Juliana Prado',   '2022-11-03');

-- cliente
INSERT INTO cliente (nome, cpf_cnpj, rg_ie, endereco, localidade, telefone, tipo_cliente, id_vendedor_associado) VALUES
('Marcos Oliveira',            '123.456.789-01',     '12.345.678-9', 'Rua das Flores, 120',        'São Paulo',     '(11) 98765-4321', 'Regular',  1),
('Patrícia Santos',            '234.567.890-12',     '23.456.789-0', 'Av. Brasil, 450',            'Campinas',      '(19) 99876-5432', 'Regular',  1),
('Ricardo Almeida',            '345.678.901-23',     '34.567.890-1', 'Rua do Comércio, 78',        'Santos',        '(13) 97654-3210', 'Regular',  3),
('Transportes Rápido Ltda',    '12.345.678/0001-90', '110.042.490.114', 'Av. Industrial, 1500',    'Guarulhos',     '(11) 3456-7890',  'Frotista', 2),
('Luciana Ferreira',           '456.789.012-34',     '45.678.901-2', 'Rua Augusta, 900',           'São Paulo',     '(11) 96543-2109', 'Regular',  2),
('Logística Norte S.A.',       '98.765.432/0001-10', '110.042.490.115', 'Rod. Anhanguera, km 20',  'Jundiaí',       '(11) 4567-8901',  'Frotista', 4),
('Bruno Carvalho',             '567.890.123-45',     '56.789.012-3', 'Rua XV de Novembro, 33',     'Sorocaba',      '(15) 98432-1098', 'Regular',  3),
('Aline Rocha',                '678.901.234-56',     '67.890.123-4', 'Av. Paulista, 1800',         'São Paulo',     '(11) 95321-0987', 'Regular',  4),
('Thiago Barbosa',             '789.012.345-67',     '78.901.234-5', 'Rua Sete de Setembro, 15',   'Ribeirão Preto','(16) 94210-9876', 'Regular',  NULL),
('Distribuidora Sul Ltda',     '11.222.333/0001-44', '110.042.490.116', 'Rua das Indústrias, 300', 'Campinas',      '(19) 3222-3344',  'Frotista', 1);

-- marca (nome limitado ao ENUM; modelo livre)
INSERT INTO marca (nome, modelo) VALUES
('Toyota',     'Corolla'),   -- 1
('Toyota',     'Hilux'),     -- 2
('Volkswagen', 'Golf'),      -- 3
('Volkswagen', 'Gol'),       -- 4
('Ford',       'Mustang'),   -- 5
('Ford',       'Ranger'),    -- 6
('Chevrolet',  'Camaro'),    -- 7
('Chevrolet',  'S10');       -- 8

-- tipo_veiculo
INSERT INTO tipo_veiculo (descricao) VALUES
('esportivo'),                 -- 1
('passeio'),                   -- 2
('utilitário'),                -- 3
('transporte de mercadorias'); -- 4

-- cor
INSERT INTO cor (nome) VALUES
('Branco'),  -- 1
('Preto'),   -- 2
('Prata');   -- 3

-- localizacao
INSERT INTO localizacao (descricao, tipo) VALUES
('Estande Principal', 'Estande'),   -- 1
('Estande Norte',     'Estande'),   -- 2
('Armazém Central',   'Armazém'),   -- 3
('Oficina Interna',   'Oficina'),   -- 4
('Armazém Sul',       'Armazém');   -- 5

-- veiculo
INSERT INTO veiculo (matricula, id_marca, id_tipo_veiculo, id_cor, id_localizacao, data_matricula, data_entrada, estado, cilindrada, potencia, quilometragem) VALUES
('ABC1D23', 1, 2, 1, 1, '2022-03-10', '2024-01-15', 'Usado', 1800, 140, 32000),
('BRA2E19', 2, 3, 3, 1, '2021-07-20', '2024-02-10', 'Usado', 2800, 204, 58000),
('DEF4G56', 3, 2, 2, 2, '2023-05-05', '2024-03-01', 'Usado', 1400, 150, 15000),
('GHI7J89', 4, 2, 1, 2, '2024-01-10', '2024-01-20', 'Novo',  1000,  84,     0),
('JKL0M12', 5, 1, 2, 1, '2023-09-15', '2024-04-05', 'Usado', 5000, 450,  8000),
('MNO3P45', 6, 3, 3, 3, '2020-11-30', '2024-02-25', 'Usado', 3200, 200, 92000),
('PQR6S78', 7, 1, 2, 4, '2019-06-18', '2024-05-12', 'Usado', 6200, 461, 41000),
('STU9V01', 8, 4, 1, 3, '2024-02-01', '2024-02-05', 'Novo',  2800, 200,     0),
('VWX2Y34', 1, 2, 3, 5, '2022-08-22', '2024-06-01', 'Usado', 1800, 140, 27000),
('YZA5B67', 3, 2, 1, 1, '2024-03-01', '2024-03-10', 'Novo',  1400, 150,     0),
('BCD8E90', 6, 4, 2, 5, '2021-04-14', '2024-06-20', 'Usado', 3200, 200, 76000),
('EFG1H23', 4, 2, 3, 4, '2018-12-03', '2024-07-02', 'Usado', 1600, 104,118000);

-- fornecedor
INSERT INTO fornecedor (nome, cnpj, ie, endereco, localidade, telefone, fax) VALUES
('AutoPrime Distribuidora',  '10.111.222/0001-33', '111.222.333.444', 'Av. das Nações, 1000',    'São Paulo',  '(11) 3000-1000', '(11) 3000-1001'),
('Importadora Veículos BR',  '20.333.444/0001-55', '222.333.444.555', 'Rua do Porto, 250',       'Santos',     '(13) 3200-2000', NULL),
('Concessionária Central',   '30.555.666/0001-77', '333.444.555.666', 'Av. Getúlio Vargas, 800', 'Campinas',   '(19) 3300-3000', '(19) 3300-3001');

-- proprietario_anterior
INSERT INTO proprietario_anterior (nome, cpf, rg, endereco, localidade, telefone) VALUES
('Antônio Ribeiro',  '890.123.456-78', '89.012.345-6', 'Rua das Palmeiras, 45',   'São Paulo', '(11) 91234-5678'),
('Beatriz Nogueira', '901.234.567-89', '90.123.456-7', 'Rua Rio Branco, 210',     'Osasco',    '(11) 92345-6789'),
('Cláudio Teixeira', '012.345.678-90', '01.234.567-8', 'Av. Santos Dumont, 99',   'Campinas',  '(19) 93456-7890'),
('Daniela Vieira',   '135.791.357-91', '13.579.135-7', 'Rua da Paz, 12',          'Santo André','(11) 94567-8901');

-- compra
INSERT INTO compra (matricula, id_fornecedor, id_proprietario, data_compra, valor_compra) VALUES
('ABC1D23', NULL, 1, '2024-01-15',  68000.00),
('BRA2E19', 1,    NULL, '2024-02-10', 145000.00),
('DEF4G56', NULL, 2, '2024-03-01',  82000.00),
('GHI7J89', 2,    NULL, '2024-01-20',  52000.00),
('JKL0M12', 1,    NULL, '2024-04-05', 310000.00),
('MNO3P45', NULL, 3, '2024-02-25', 105000.00),
('PQR6S78', 3,    NULL, '2024-05-12', 280000.00),
('STU9V01', 2,    NULL, '2024-02-05', 165000.00),
('VWX2Y34', NULL, 4, '2024-06-01',  72000.00),
('YZA5B67', 3,    NULL, '2024-03-10',  91000.00),
('BCD8E90', 1,    NULL, '2024-06-20',  98000.00),
('EFG1H23', NULL, 1, '2024-07-02',  28000.00);

-- tipo_custo
INSERT INTO tipo_custo (descricao) VALUES
('funilaria'),                -- 1
('pintura'),                  -- 2
('eletricista'),              -- 3
('combustível'),              -- 4
('transporte'),               -- 5
('despesas de legalização'),  -- 6
('despesas de importação'),   -- 7
('manutenção');               -- 8

-- custo_veiculo
INSERT INTO custo_veiculo (matricula, id_tipo_custo, data_custo, valor) VALUES
('ABC1D23', 2, '2024-01-25',  1800.00),
('ABC1D23', 8, '2024-01-30',   950.00),
('ABC1D23', 6, '2024-02-05',   600.00),
('BRA2E19', 1, '2024-02-15',  2500.00),
('BRA2E19', 4, '2024-02-12',   300.00),
('DEF4G56', 3, '2024-03-05',   700.00),
('GHI7J89', 5, '2024-01-22',   400.00),
('JKL0M12', 7, '2024-04-08', 12000.00),
('JKL0M12', 5, '2024-04-10',  1500.00),
('MNO3P45', 1, '2024-03-05',  3200.00),
('MNO3P45', 2, '2024-03-12',  2800.00),
('PQR6S78', 8, '2024-05-20',  4500.00),
('PQR6S78', 3, '2024-05-25',  1200.00),
('STU9V01', 5, '2024-02-07',   800.00),
('VWX2Y34', 8, '2024-06-10',  1100.00),
('BCD8E90', 2, '2024-06-25',  2000.00),
('EFG1H23', 1, '2024-07-10',  3500.00),
('EFG1H23', 4, '2024-07-12',   250.00);

-- venda (8 veículos vendidos; 6, 7, 11 e 12 permanecem em estoque)
INSERT INTO venda (matricula, id_cliente, id_vendedor, data_venda, valor_venda, comissao_percentual, forma_pagamento) VALUES
('ABC1D23', 1, 1, '2024-02-20',  79000.00, 3.00, 'Financiamento'),
('BRA2E19', 4, 2, '2024-03-15', 168000.00, 2.50, 'À vista'),
('DEF4G56', 2, 1, '2024-04-10',  94000.00, 3.00, 'Cartão de crédito'),
('GHI7J89', 3, 3, '2024-02-28',  61000.00, 3.50, 'Financiamento'),
('JKL0M12', 5, 2, '2024-06-05', 355000.00, 2.00, 'Transferência bancária'),
('STU9V01', 6, 4, '2024-03-20', 189000.00, 2.50, 'Boleto'),
('VWX2Y34', 7, 3, '2024-07-18',  84500.00, 3.00, 'Financiamento'),
('YZA5B67', 8, 4, '2024-04-30', 105000.00, 3.00, 'À vista');


-- =====================================================================
-- PARTE 2: SELECTs (20 consultas)
-- =====================================================================

-- 01. Listar todos os veículos com marca, modelo, tipo, cor e localização
SELECT v.matricula, m.nome AS marca, m.modelo, t.descricao AS tipo,
       c.nome AS cor, l.descricao AS localizacao, v.estado, v.quilometragem
FROM veiculo v
JOIN marca m         ON m.id_marca = v.id_marca
JOIN tipo_veiculo t  ON t.id_tipo_veiculo = v.id_tipo_veiculo
JOIN cor c           ON c.id_cor = v.id_cor
JOIN localizacao l   ON l.id_localizacao = v.id_localizacao
ORDER BY m.nome, m.modelo;

-- 02. Veículos em estoque (ainda não vendidos)
SELECT v.matricula, m.nome AS marca, m.modelo, v.estado, l.descricao AS localizacao
FROM veiculo v
JOIN marca m       ON m.id_marca = v.id_marca
JOIN localizacao l ON l.id_localizacao = v.id_localizacao
WHERE v.matricula NOT IN (SELECT matricula FROM venda);

-- 03. Vendas detalhadas: cliente, vendedor, veículo e valor
SELECT ve.id_venda, ve.data_venda, cl.nome AS cliente, vd.nome AS vendedor,
       m.nome AS marca, m.modelo, ve.valor_venda, ve.forma_pagamento
FROM venda ve
JOIN cliente cl  ON cl.id_cliente = ve.id_cliente
JOIN vendedor vd ON vd.id_vendedor = ve.id_vendedor
JOIN veiculo v   ON v.matricula = ve.matricula
JOIN marca m     ON m.id_marca = v.id_marca
ORDER BY ve.data_venda;

-- 04. Lucro por veículo vendido (venda - compra - custos)
SELECT ve.matricula, m.modelo,
       co.valor_compra,
       COALESCE(cu.total_custos, 0) AS total_custos,
       ve.valor_venda,
       ve.valor_venda - co.valor_compra - COALESCE(cu.total_custos, 0) AS lucro
FROM venda ve
JOIN compra co ON co.matricula = ve.matricula
JOIN veiculo v ON v.matricula = ve.matricula
JOIN marca m   ON m.id_marca = v.id_marca
LEFT JOIN (SELECT matricula, SUM(valor) AS total_custos
           FROM custo_veiculo GROUP BY matricula) cu ON cu.matricula = ve.matricula
ORDER BY lucro DESC;

-- 05. Total vendido, quantidade de vendas e comissão por vendedor
SELECT vd.nome AS vendedor,
       COUNT(*) AS qtd_vendas,
       SUM(ve.valor_venda) AS total_vendido,
       ROUND(SUM(ve.valor_venda * ve.comissao_percentual / 100), 2) AS total_comissao
FROM venda ve
JOIN vendedor vd ON vd.id_vendedor = ve.id_vendedor
GROUP BY vd.id_vendedor, vd.nome
ORDER BY total_vendido DESC;

-- 06. Ranking de vendedores por valor vendido (função de janela - MySQL 8+)
SELECT vd.nome AS vendedor,
       SUM(ve.valor_venda) AS total_vendido,
       RANK() OVER (ORDER BY SUM(ve.valor_venda) DESC) AS posicao
FROM venda ve
JOIN vendedor vd ON vd.id_vendedor = ve.id_vendedor
GROUP BY vd.id_vendedor, vd.nome;

-- 07. Faturamento mensal
SELECT DATE_FORMAT(data_venda, '%Y-%m') AS mes,
       COUNT(*) AS qtd_vendas,
       SUM(valor_venda) AS faturamento
FROM venda
GROUP BY DATE_FORMAT(data_venda, '%Y-%m')
ORDER BY mes;

-- 08. Clientes frotistas e o total gasto
SELECT cl.nome, cl.cpf_cnpj, cl.localidade,
       COALESCE(SUM(ve.valor_venda), 0) AS total_comprado
FROM cliente cl
LEFT JOIN venda ve ON ve.id_cliente = cl.id_cliente
WHERE cl.tipo_cliente = 'Frotista'
GROUP BY cl.id_cliente, cl.nome, cl.cpf_cnpj, cl.localidade;

-- 09. Clientes que nunca compraram
SELECT cl.id_cliente, cl.nome, cl.tipo_cliente, cl.localidade
FROM cliente cl
LEFT JOIN venda ve ON ve.id_cliente = cl.id_cliente
WHERE ve.id_venda IS NULL;

-- 10. Quantidade de veículos por marca
SELECT m.nome AS marca, COUNT(*) AS qtd_veiculos
FROM veiculo v
JOIN marca m ON m.id_marca = v.id_marca
GROUP BY m.nome
ORDER BY qtd_veiculos DESC;

-- 11. Custos totais por tipo de custo
SELECT tc.descricao AS tipo_custo,
       COUNT(*) AS qtd_lancamentos,
       SUM(cv.valor) AS total_gasto,
       ROUND(AVG(cv.valor), 2) AS media
FROM custo_veiculo cv
JOIN tipo_custo tc ON tc.id_tipo_custo = cv.id_tipo_custo
GROUP BY tc.descricao
ORDER BY total_gasto DESC;

-- 12. Top 5 veículos com maior gasto em custos de preparação
SELECT cv.matricula, m.modelo, SUM(cv.valor) AS total_custos
FROM custo_veiculo cv
JOIN veiculo v ON v.matricula = cv.matricula
JOIN marca m   ON m.id_marca = v.id_marca
GROUP BY cv.matricula, m.modelo
ORDER BY total_custos DESC
LIMIT 5;

-- 13. Origem das compras: fornecedor ou proprietário anterior
SELECT co.matricula, co.data_compra, co.valor_compra,
       CASE WHEN co.id_fornecedor IS NOT NULL THEN 'Fornecedor'
            ELSE 'Proprietário anterior' END AS origem,
       COALESCE(f.nome, p.nome) AS nome_origem
FROM compra co
LEFT JOIN fornecedor f            ON f.id_fornecedor = co.id_fornecedor
LEFT JOIN proprietario_anterior p ON p.id_proprietario = co.id_proprietario
ORDER BY co.data_compra;

-- 14. Total comprado por fornecedor
SELECT f.nome AS fornecedor, COUNT(*) AS qtd_veiculos, SUM(co.valor_compra) AS total_comprado
FROM compra co
JOIN fornecedor f ON f.id_fornecedor = co.id_fornecedor
GROUP BY f.id_fornecedor, f.nome
ORDER BY total_comprado DESC;

-- 15. Tempo médio (em dias) entre entrada no estoque e venda, por marca
SELECT m.nome AS marca,
       ROUND(AVG(DATEDIFF(ve.data_venda, v.data_entrada)), 1) AS dias_medios_ate_venda
FROM venda ve
JOIN veiculo v ON v.matricula = ve.matricula
JOIN marca m   ON m.id_marca = v.id_marca
GROUP BY m.nome
ORDER BY dias_medios_ate_venda;

-- 16. Veículos em estoque há mais de 90 dias
SELECT v.matricula, m.modelo, v.data_entrada,
       DATEDIFF(CURDATE(), v.data_entrada) AS dias_em_estoque
FROM veiculo v
JOIN marca m ON m.id_marca = v.id_marca
WHERE v.matricula NOT IN (SELECT matricula FROM venda)
  AND DATEDIFF(CURDATE(), v.data_entrada) > 90
ORDER BY dias_em_estoque DESC;

-- 17. Usados com quilometragem acima da média dos usados (subquery)
SELECT v.matricula, m.modelo, v.quilometragem
FROM veiculo v
JOIN marca m ON m.id_marca = v.id_marca
WHERE v.estado = 'Usado'
  AND v.quilometragem > (SELECT AVG(quilometragem) FROM veiculo WHERE estado = 'Usado')
ORDER BY v.quilometragem DESC;

-- 18. Ticket médio de venda por tipo de veículo
SELECT t.descricao AS tipo_veiculo,
       COUNT(*) AS qtd_vendas,
       ROUND(AVG(ve.valor_venda), 2) AS ticket_medio
FROM venda ve
JOIN veiculo v      ON v.matricula = ve.matricula
JOIN tipo_veiculo t ON t.id_tipo_veiculo = v.id_tipo_veiculo
GROUP BY t.descricao
ORDER BY ticket_medio DESC;

-- 19. Vendas por forma de pagamento (somente formas com 2+ vendas)
SELECT forma_pagamento, COUNT(*) AS qtd, SUM(valor_venda) AS total
FROM venda
GROUP BY forma_pagamento
HAVING COUNT(*) >= 2
ORDER BY total DESC;

-- 20. Investimento (compra + custos) dos veículos ainda em estoque e veículos por localização
SELECT l.tipo AS tipo_localizacao, l.descricao AS localizacao, v.matricula, m.modelo,
       co.valor_compra + COALESCE(cu.total_custos, 0) AS investimento_total
FROM veiculo v
JOIN marca m        ON m.id_marca = v.id_marca
JOIN localizacao l  ON l.id_localizacao = v.id_localizacao
JOIN compra co      ON co.matricula = v.matricula
LEFT JOIN (SELECT matricula, SUM(valor) AS total_custos
           FROM custo_veiculo GROUP BY matricula) cu ON cu.matricula = v.matricula
WHERE v.matricula NOT IN (SELECT matricula FROM venda)
ORDER BY l.tipo, investimento_total DESC;
