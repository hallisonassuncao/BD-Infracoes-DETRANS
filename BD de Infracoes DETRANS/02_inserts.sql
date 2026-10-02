-- =====================================================================
-- Estudo de Caso 3 - Inserts (5 linhas por tabela)
-- =====================================================================

-->proprietario
insert into proprietario (cpf, nome, endereco, bairro, cidade, estado, sexo, data_nascimento) values
('11122233344', 'marcos vinicius lima',   'qnm 12 conjunto a, casa 5', 'ceilandia norte', 'brasilia', 'df', 'm', '1985-03-14'),
('22233344455', 'mariana souza rocha',    'rua 7, quadra 3',           'setor sul',       'goiania',  'go', 'f', '1990-07-22'),
('33344455566', 'carlos eduardo pereira', 'av. brasil, 450',           'centro',          'anapolis', 'go', 'm', '1978-11-02'),
('44455566677', 'marina alves batista',   'qr 305, casa 12',           'samambaia sul',   'brasilia', 'df', 'f', '1995-01-30'),
('55566677788', 'julia fernandes costa',  'rua das flores, 88',        'vila nova',       'luziania', 'go', 'f', '1982-09-10');

-->telefone
insert into telefone (numero, cpf_proprietario) values
('6199271001', '11122233344'),
('6199271002', '11122233344'),
('6299272001', '22233344455'),
('6399273001', '33344455566'),
('6199274001', '44455566677');

-->modelo
insert into modelo (codigo, descricao) values
('100001', 'gol mi'),
('100002', 'gol 1.8'),
('100003', 'uno cs'),
('100004', 'civic exl'),
('100005', 'cb 500 fa');

-->categoria
insert into categoria (codigo, descricao) values
('01', 'automovel'),
('02', 'motocicleta'),
('03', 'caminhao'),
('04', 'onibus'),
('05', 'camionete');

-->veiculo
insert into veiculo (placa, chassi, cor, ano_fabricacao, cpf_proprietario, cod_modelo, cod_categoria) values
('abc1d23', '9bwzzz377vt004251', 'prata',   2018, '11122233344', '100001', '01'),
('abc1d24', '9bwzzz377vt004252', 'branco',  2020, '11122233344', '100004', '01'),
('def5g67', '9bwzzz377vt004253', 'preto',   2019, '22233344455', '100002', '01'),
('ghi8j90', '9bwzzz377vt004254', 'vermelho',2021, '33344455566', '100005', '02'),
('jkl1m23', '9bwzzz377vt004255', 'azul',    2017, '44455566677', '100003', '01');

-->tipo_infracao
insert into tipo_infracao (codigo, descricao, valor) values
('avsv', 'avanco de sinal vermelho',        293.47),
('psfp', 'parada sobre a faixa de pedestres', 130.16),
('exvl', 'excesso de velocidade',           195.23),
('celm', 'uso de celular ao dirigir',       293.47),
('esti', 'estacionamento irregular',        195.23);

-->local
insert into local (codigo, posicao_geografica, velocidade_permitida) values
('loc001', 'eixo monumental, sentido leste, df',        80),
('loc002', 'eptg km 5, df',                             70),
('loc003', 'av. goias, centro, goiania-go',              60),
('loc004', 'br-060, km 12, go',                         100),
('loc005', 'via w3 sul, brasilia-df',                    60);

-->radar
insert into radar (id, nome, uf) values
('rad01', 'radar eixo monumental', 'df'),
('rad02', 'radar eptg',            'df'),
('rad03', 'radar av. goias',       'go'),
('rad04', 'radar br-060',          'go'),
('rad05', 'radar w3 sul',          'df');

-->agente
insert into agente (matricula, nome, data_contratacao) values
('ag01', 'roberto almeida silva',    '2010-02-15'),
('ag02', 'fernanda lima santos',     '2015-06-01'),
('ag03', 'paulo henrique souza',     '2018-09-20'),
('ag04', 'camila dias ferreira',     '2012-04-10'),
('ag05', 'eduardo martins oliveira', '2020-01-05');

-->infracao (radar ou agente, nunca os dois)
insert into infracao (placa_veiculo, data_hora, cod_tipo_infracao, uf, cod_local, velocidade_aferida, id_radar, matricula_agente) values
('abc1d23', '2026-08-01 08:15:00', 'exvl', 'df', 'loc001', 105, 'rad01', null),
('abc1d24', '2026-08-03 14:30:00', 'avsv', 'df', 'loc002', null, null, 'ag01'),
('def5g67', '2026-08-05 09:00:00', 'exvl', 'go', 'loc003',  85, 'rad03', null),
('ghi8j90', '2026-08-10 18:45:00', 'celm', 'go', 'loc004', null, null, 'ag03'),
('jkl1m23', '2026-08-12 11:20:00', 'exvl', 'df', 'loc005',  95, 'rad05', null);