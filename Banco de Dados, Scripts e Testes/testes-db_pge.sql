USE bd_pge;

-- Listar todos os processos e seus procuradores:
SELECT p.numero_proc, p.orgao, p.assunto, pr.nome AS procurador_nome
FROM processo p
JOIN procurador pr ON p.procurador_id = pr.id_procurador;

-- Consultar os clientes e os processos em que estão envolvidos:
SELECT c.nome AS cliente_nome, p.numero_proc, p.assunto
FROM cliente c
JOIN processocliente pc ON c.id_cliente = pc.cliente_id
JOIN processo p ON pc.processo_id = p.id_processo;

-- Buscar todos os documentos de um processo específico:
SELECT d.processo_id, d.nome, d.tipo, d.data_envio, d.url_documento
FROM documento d
WHERE d.processo_id = 3;

-- Consultar os procuradores e os processos que estão acompanhando de acordo com seu status:
SELECT pr.nome AS procurador_nome, p.numero_proc, p.assunto, p.status_proc
FROM procurador pr
JOIN processo p ON pr.id_procurador = p.procurador_id
WHERE p.status_proc = 'Em andamento';

-- Verificar os prazos e os processos associados:
SELECT p.numero_proc, pr.tipo, pr.data_vencimento, pr.status_prazo
FROM prazo pr
JOIN processo p ON pr.processo_id = p.id_processo
WHERE pr.status_prazo = 'Pendente';

-- Listar os clientes que estão associados a mais de um processo:
SELECT c.nome AS cliente_nome, COUNT(pc.processo_id) AS num_processos
FROM cliente c
JOIN processocliente pc ON c.id_cliente = pc.cliente_id
GROUP BY c.id_cliente
HAVING COUNT(pc.processo_id) > 1;

-- Consultar documentos enviados após uma data específica para um procurador:
SELECT pr.id_procurador, d.nome, d.tipo, d.data_envio
FROM documento d
JOIN processo p ON d.processo_id = p.id_processo
JOIN procurador pr ON p.procurador_id = pr.id_procurador
WHERE pr.nome = 'Carlos Eduardo Lima' AND d.data_envio > '2025-01-01';

-- Consultar documentos enviados antes de uma data específica para um procurador:
SELECT pr.id_procurador, d.nome, d.tipo, d.data_envio
FROM documento d
JOIN processo p ON d.processo_id = p.id_processo
JOIN procurador pr ON p.procurador_id = pr.id_procurador
WHERE pr.nome = 'Carlos Eduardo Lima' AND d.data_envio < '2025-01-01';

-- Obter os processos de um cliente com status de prazo "Cumprido":
SELECT c.nome AS cliente_nome, p.numero_proc, p.assunto, pr.tipo, pr.status_prazo
FROM cliente c
JOIN processocliente pc ON c.id_cliente = pc.cliente_id
JOIN processo p ON pc.processo_id = p.id_processo
JOIN prazo pr ON p.id_processo = pr.processo_id
WHERE pr.status_prazo = 'Cumprido';

-- Consultar os processos de um determinado órgão e status:
SELECT p.numero_proc, p.assunto, p.status_proc
FROM processo p
WHERE p.orgao = 'TJSP' AND p.status_proc = 'Em andamento';

-- Listar os documentos associados a um prazo vencido:
SELECT d.nome, d.tipo, d.data_envio, pr.tipo AS prazo_tipo, pr.data_vencimento
FROM documento d
JOIN processo p ON d.processo_id = p.id_processo
JOIN prazo pr ON p.id_processo = pr.processo_id
WHERE pr.status_prazo = 'Vencido';
