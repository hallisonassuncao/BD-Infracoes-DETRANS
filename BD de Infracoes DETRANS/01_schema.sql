
-->Estudo de caso 3 - BD-infracoes (detran)
-->Esquema relacional 

create table proprietario (
    cpf              char(11)     not null,
    nome             varchar(100) not null,
    endereco         varchar(150),
    bairro           varchar(60),
    cidade           varchar(60),
    estado           char(2),
    sexo             char(1)      check (sexo in ('m', 'f')),
    data_nascimento  date         not null,
    constraint pk_proprietario primary key (cpf)
);

create table telefone (
    numero            varchar(15) not null,
    cpf_proprietario  char(11)    not null,
    constraint pk_telefone primary key (numero, cpf_proprietario),
    constraint fk_telefone_proprietario foreign key (cpf_proprietario)
        references proprietario (cpf)
        on delete cascade
);

create table modelo (
    codigo     char(6)     not null,
    descricao  varchar(60) not null,
    constraint pk_modelo primary key (codigo)
);

create table categoria (
    codigo     char(2)     not null,
    descricao  varchar(40) not null,
    constraint pk_categoria primary key (codigo)
);

create table veiculo (
    placa             char(7)     not null,
    chassi            varchar(30) not null,
    cor               varchar(30),
    ano_fabricacao    smallint,
    cpf_proprietario  char(11)    not null,
    cod_modelo        char(6)     not null,
    cod_categoria     char(2)     not null,
    constraint pk_veiculo primary key (placa),
    constraint uq_veiculo_chassi unique (chassi),
    constraint fk_veiculo_proprietario foreign key (cpf_proprietario)
        references proprietario (cpf),
    constraint fk_veiculo_modelo foreign key (cod_modelo)
        references modelo (codigo),
    constraint fk_veiculo_categoria foreign key (cod_categoria)
        references categoria (codigo)
);

create table tipo_infracao (
    codigo     varchar(10)     not null,
    descricao  varchar(100)    not null,
    valor      decimal(10, 2)  not null check (valor >= 0),
    constraint pk_tipo_infracao primary key (codigo)
);

create table local (
    codigo                 varchar(10)  not null,
    posicao_geografica     varchar(100) not null,
    velocidade_permitida   smallint     not null,
    constraint pk_local primary key (codigo)
);

create table radar (
    id     varchar(10) not null,
    nome   varchar(60) not null,
    uf     char(2)     not null,
    constraint pk_radar primary key (id)
);

create table agente (
    matricula          varchar(15) not null,
    nome               varchar(100) not null,
    data_contratacao   date         not null,
    constraint pk_agente primary key (matricula)
);

create table infracao (
    placa_veiculo        char(7)     not null,
    data_hora            timestamp   not null,
    cod_tipo_infracao    varchar(10) not null,
    uf                   char(2)     not null,
    cod_local            varchar(10) not null,
    velocidade_aferida   smallint,
    id_radar             varchar(10),
    matricula_agente     varchar(15),
    constraint pk_infracao primary key (placa_veiculo, data_hora, cod_tipo_infracao),
    constraint fk_infracao_veiculo foreign key (placa_veiculo)
        references veiculo (placa),
    constraint fk_infracao_tipo foreign key (cod_tipo_infracao)
        references tipo_infracao (codigo),
    constraint fk_infracao_local foreign key (cod_local)
        references local (codigo),
    constraint fk_infracao_radar foreign key (id_radar)
        references radar (id),
    constraint fk_infracao_agente foreign key (matricula_agente)
        references agente (matricula),
    constraint ck_infracao_registro_exclusivo check (
        (id_radar is not null and matricula_agente is null)
        or
        (id_radar is null and matricula_agente is not null)
    )
);

-->indices auxiliares para consultas frequentes

create index idx_veiculo_proprietario on veiculo (cpf_proprietario);
create index idx_infracao_local      on infracao (cod_local);
create index idx_infracao_radar      on infracao (id_radar);
create index idx_infracao_agente     on infracao (matricula_agente);