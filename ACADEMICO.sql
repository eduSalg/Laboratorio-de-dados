-- crinado um banco de dados DB_ACADEMICO
create database DB_ACADEMICO;

-- PARA CRIARMOS TABELAS DE DADOS, SERÁ NESCESSARIO INSTANCIAR O DB-ACADEMICO
use DB_ACADEMICO;

-- CRIANDO A TABELA CURSO
create table CURSO
(
	CO_CURSO 	int 	not null, 
    nome 	varchar(40) 	null
    );
-- alternado a tabela curso para incluir uma restrição (contraint) de primary key
alter table CURSO add constraint PK_CURSO primary key (CO_CURSO);

-- criando a tabela TURMA e relacionado ela com a tabela CURSO
create table TURMA 
(
CO_TURMA char(11) 	not null,
ANO 	char(4) 	null,
PERIODO 	char(1) 	null,
DESCRIÇÃO 	char(50) 	null,
DT_INICIAL 	datetime 	null,
DT_FINAL 	datetime 	null,
NUM_PROVAS 	int 	null,
CO_CURSO 	int 	null

);
-- alternado a tabela TURMA para incluir uma restrição (contraint) de primary key
alter table TURMA add constraint PK_TURMA primary key (CO_TURMA);

-- alterando esta tabela TURMNA incluindo uma 
-- restrição de integridade de relacionamento com a tabela curso
alter table TURMA add constraint FK_TURMA_CURSO foreign key (CO_CURSO)
references CURSO(CO_CURSO);

-- criando a tabela ALUNO 
create table ALUNO
(
CO_ALUNO	int	not null,
DT_NASCIMENTO	datetime 	null,
SG_SEXO 	char(1) 	NULL,
NOME 	varchar(20) 	null,
CO_ESTADOCIVIL 	char(1) 	null,
NO_PAI 	varchar(70) 	null,
NO_MAE 	varchar(70) 	null

);
-- alternado a tabela ALUNO para incluir uma restrição (contraint) de primary keY
alter table ALUNO add constraint PK_ALUNO primary key (CO_ALUNO);

-- criando a tabela ALUNO_TURMA e relacionado ela com a tabela ALUNO
create table ALUNO_TURMA
(
CO_ALUNO 	int 	not null,
CO_TURMA 	char(11) 	not null,
DT_MATRICULA 	datetime 	null,
DT_CANCELAMENTO 	datetime 	null
);

-- alternado a tabela ALUNO_TURMA para incluir uma restrição (contraint) de primary keY
alter table ALUNO_TURMA add constraint PK_ALUNO_TURMA primary key (CO_ALUNO, CO_TURMA);

-- alterando esta tabela ALUNO_TURMA incluindo uma 
-- restrição de integridade de relacionamento com a tabela TURMA e ALUNO
alter table ALUNO_TURMA add constraint FK_ALUNO foreign key (CO_ALUNO)
references ALUNO(CO_ALUNO);

alter table ALUNO_TURMA add constraint FK_TURMA foreign key (CO_TURMA)
references TURMA(CO_TURMA);

-- criando a tabela DISCIPLINA 
create table DISCIPLINA
(
CO_DISCIPLINA 	char(2) 	not null,
NO_DISCIPLINA 	varchar(30) 	null
);

-- alternado a tabela DISCIPLINA para incluir uma restrição (contraint) de primary keY
alter table DISCIPLINA add constraint PK_DISCIPLINA primary key (CO_DISCIPLINA);

-- criando a tabela PROVA
create table PROVA
(
CO_PROVA 	CHAR(3) 	not null,
DS_PROVA 	varchar(20) 	null
);

-- alternado a tabela PROVA para incluir uma restrição (contraint) de primary keY
alter table PROVA add constraint PK_PROVA primary key (CO_PROVA);


-- criando a tabela AVALIAÇÃO e relacionado ela com outras tabelas
create table AVALIACAO
(
CO_ALUNO	int	not null,
CO_TURMA char(11) 	not null,
CO_DISCIPLINA 	char(2) 	not null,
CO_PROVA 	CHAR(3) 	not null,
DT_AVALIACAO 	datetime 	null,
NT_AVALIACAO 	float(53) 	null
);

-- alternado a tabela AVALIACAO para incluir uma restrição (contraint) de primary keY
alter table AVALIACAO add constraint PK_AVALIACAO primary key (CO_ALUNO, CO_TURMA, CO_DISCIPLINA, CO_PROVA);

-- alterando esta tabela AVALIACAO incluindo uma 
-- restrição de integridade de relacionamento 
alter table AVALIACAO add constraint FK_ALUNO_TURMA_TURMA foreign key (CO_TURMA)
references ALUNO_TURMA(CO_TURMA);

alter table AVALIACAO add constraint FK_ALUNO_TURMA_ALUNO foreign key (CO_ALUNO)
references ALUNO_TURMA(CO_ALUNO);

alter table AVALIACAO add constraint FK_DISCIPLINA foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

alter table AVALIACAO add constraint FK_PROVA foreign key (CO_PROVA)
references PROVA(CO_PROVA);

-- criando a tabela PROFESSOR 
create table PROFESSOR
(
CO_PROFESSOR 	int 	not null,
SG_SEXO 	char(1) 	NULL,
NOME 	varchar(20) 	null,
DT_NASCIMENTO	datetime 	null
);
-- alternado a tabela PROFESSOR para incluir uma restrição (contraint) de primary keY
alter table PROFESSOR add constraint PK_PROFESSOR primary key (CO_PROFESSOR);

-- criando a tabela PROF_TURM-DISC 
create table PROF_TURM_DISC 
(
CO_PROFESSOR 	int 	not null,
CO_TURMA char(11) 	not null,
CO_DISCIPLINA 	char(2) 	not null
);

-- alternado a tabela PROF_TURM_DISC para incluir uma restrição (contraint) de primary keY
alter table PROF_TURM_DISC  add constraint PK_PROF_TURM_DISC  primary key (CO_PROFESSOR, CO_TURMA, CO_DISCIPLINA);

-- alterando esta tabela PROF_TURM_DISC incluindo uma 
-- restrição de integridade de relacionamento 
alter table PROF_TURM_DISC add constraint FK_PROFESSOR foreign key (CO_PROFESSOR)
references PROFESSOR(CO_PROFESSOR);

alter table PROF_TURM_DISC add constraint FK_TURMA_PROFESSOR foreign key (CO_TURMA)
references TURMA(CO_TURMA);

alter table PROF_TURM_DISC add constraint FK_DISCIPLINA_PROFESSOR foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

-- criando a tabela FREQUENCIA
create table FREQUENCIA
(
CO_ALUNO	int	not null,
CO_TURMA char(11) 	not null,
CO_DISCIPLINA 	char(2) 	not null,
DT_FREQUENCIA 	datetime 	not null,
FREQUENCIA 	CHAR(1) 	NULL
);

-- alternado a tabela FREQUENCIA para incluir uma restrição (contraint) de primary keY
alter table FREQUENCIA  add constraint PK_FREQUENCIA  primary key (CO_ALUNO, CO_TURMA, CO_DISCIPLINA, DT_FREQUENCIA);

-- alterando esta tabela FREQUENCIA incluindo uma 
-- restrição de integridade de relacionamento 
alter table FREQUENCIA add constraint FK_ALUNO_FREQUENCIA foreign key (CO_ALUNO)
references ALUNO_TURMA(CO_ALUNO);

alter table FREQUENCIA add constraint FK_TURMA_FREQUENCIA foreign key (CO_TURMA)
references ALUNO_TURMA(CO_TURMA);

alter table FREQUENCIA add constraint FK_DISCIPLINA_FREQUENCIA foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

