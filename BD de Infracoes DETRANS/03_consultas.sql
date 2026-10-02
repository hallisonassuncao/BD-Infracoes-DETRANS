-- =====================================================================
-- Estudo de Caso 3 - Select/Consultas
-- =====================================================================

select * from proprietario;
select * from veiculo;
select * from infracao;
select * from telefone;
select * from modelo;
select * from categoria;
select * from tipo_infracao;
select * from local;
select * from radar;
select * from agente;

select p.nome as proprietario, count(v.placa) as qtd_veiculos
from proprietario p
join veiculo v on v.cpf_proprietario = p.cpf
group by p.nome
having count(v.placa) > 1;

select p.nome as proprietario, p.cpf, v.placa
from proprietario p
join veiculo v on v.cpf_proprietario = p.cpf
where p.nome like 'm%'
order by p.nome, v.placa;

select ti.descricao as tipo_infracao, sum(ti.valor) as valor_total_cobrado
from infracao i
join tipo_infracao ti on ti.codigo = i.cod_tipo_infracao
group by ti.descricao;

select i.placa_veiculo as placa, i.velocidade_aferida,
       l.velocidade_permitida, l.posicao_geografica as local
from infracao i
join local l on l.codigo = i.cod_local
where i.velocidade_aferida is not null
and i.velocidade_aferida > l.velocidade_permitida;

select i.placa_veiculo as placa, p.nome as proprietario,
       ti.descricao as tipo_infracao, i.data_hora, i.uf
from infracao i
join veiculo v on v.placa = i.placa_veiculo
join proprietario p on p.cpf = v.cpf_proprietario
join tipo_infracao ti on ti.codigo = i.cod_tipo_infracao
where i.uf = 'df';
