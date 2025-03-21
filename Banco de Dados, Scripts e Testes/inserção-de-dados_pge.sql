USE bd_pge;

-- Inserindo dados na tabela Procurador
INSERT INTO procurador (oab, nome, tel, email) VALUES
('OAB12345', 'Ana Clara Souza', '(11) 98765-4321', 'ana.souza@adv.br'),
('OAB67890', 'Carlos Eduardo Lima', '(21) 91234-5678', 'carlos.lima@adv.br'),
('OAB54321', 'Fernanda Oliveira', '(31) 99876-5432', 'fernanda.oliveira@adv.br'),
('OAB98765', 'Rafael Mendes', '(41) 92345-6789', 'rafael.mendes@adv.br'),
('OAB11111', 'Juliana Martins', '(51) 93456-7890', 'juliana.martins@adv.br');

SELECT * FROM procurador;

-- Inserindo dados na tabela Clientes
INSERT INTO cliente (cpf, nome, tel, email) VALUES
('123.456.789-01', 'João da Silva', '(11) 91234-5678', 'joao.silva@exemplo.com'),
('234.567.890-12', 'Maria Oliveira', '(21) 92345-6789', 'maria.oliveira@exemplo.com'),
('345.678.901-23', 'Carlos Pereira', '(31) 93456-7890', 'carlos.pereira@exemplo.com'),
('456.789.012-34', 'Ana Souza', '(41) 94567-8901', 'ana.souza@exemplo.com'),
('567.890.123-45', 'Lucas Fernandes', '(51) 95678-9012', 'lucas.fernandes@exemplo.com');

SELECT * FROM cliente;

-- Inserindo dados na tabela Processos
INSERT INTO processo (numero_proc, orgao, assunto, status_proc, data_abertura, procurador_id) VALUES
('PROC2025001', 'TJSP', 'Ação de Cobrança', 'Em andamento', '2025-01-10', 1),
('PROC2025002', 'TRF4', 'Execução Fiscal', 'Concluído', '2024-11-15', 2),
('PROC2025003', 'TJMG', 'Indenização por Danos Morais', 'Em recurso', '2024-12-05', 2),
('PROC2025011', 'TJPE', 'Ação de Execução', 'Em tramitação', '2025-03-20', 3),
('PROC2025004', 'STJ', 'Habeas Corpus', 'Em análise', '2025-02-20', 4),
('PROC2025005', 'TJRS', 'Inventário', 'Aguardando decisão', '2025-03-01', 5);

SELECT * FROM processo;

-- Inserindo dados na tabela Documentos
INSERT INTO documento (nome, tipo, url_documento, data_envio, processo_id) VALUES
('Petição Inicial - Ação de Cobrança', 'Petição', 'http://docs.exemplo.com/doc1.pdf', '2025-01-12', 1),
('Sentença - Execução Fiscal', 'Sentença', 'http://docs.exemplo.com/doc2.pdf', '2024-11-20', 2),
('Recurso de Apelação - Danos Morais', 'Recurso', 'http://docs.exemplo.com/doc3.pdf', '2024-12-10', 3),
('Petição Inicial - Ação de Execução', 'Petição', 'http://docs.exemplo.com/doc11.pdf', '2025-03-21', 4),
('Despacho - Habeas Corpus', 'Despacho', 'http://docs.exemplo.com/doc4.pdf', '2025-02-22', 5),
('Certidão de Óbito - Inventário', 'Certidão', 'http://docs.exemplo.com/doc5.pdf', '2025-03-05', 6);

SELECT * FROM documento;

-- Inserindo dados na tabela Prazos
INSERT INTO prazo (tipo, data_vencimento, status_prazo, processo_id) VALUES
('Apelação', '2025-02-20', 'Cumprido', 1),
('Contestação', '2024-12-01', 'Vencido', 2),
('Manifestação', '2024-12-20', 'Cumprido', 3),
('Cumprimento de Sentença', '2025-04-15', 'Pendente', 3),
('Pedido de Liminar', '2025-02-25', 'Em andamento', 4),
('Inventário Judicial', '2025-03-20', 'Aguardando', 5);

SELECT * FROM prazo;

-- Inserindo dados na tabela de Associação Processo-Cliente
INSERT INTO processocliente (processo_id, cliente_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 5);

SELECT * FROM processocliente;
