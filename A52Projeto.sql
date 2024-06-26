
create database a52teste1;
use a52teste1;

create table funcionarios (
    id int primary key,
    nome varchar(50),
    sobrenome varchar(50)
);

insert into funcionarios (id, nome, sobrenome) values (1, 'Grigolo', 'Batista');
insert into funcionarios (id, nome, sobrenome) values (2, 'Geronimo', 'Souza');
insert into funcionarios (id, nome, sobrenome) values (3, 'Jo�o', 'Silva');
insert into funcionarios (id, nome, sobrenome) values (4, 'Maria', 'Santos');
insert into funcionarios (id, nome, sobrenome) values (5, 'Ana', 'Costa');
insert into funcionarios (id, nome, sobrenome) values (6, 'Carlos', 'Oliveira');

create database a52teste2;
use a52teste2;

create table projetos (
    projetoid int primary key,
    nome_projeto varchar(400),
    responsavelid int
);
insert into projetos (projetoid, nome_projeto, responsavelid) values (101, 'Analise de dados', 1);
insert into projetos (projetoid, nome_projeto, responsavelid) values (102, 'Rotas', 2);
insert into projetos (projetoid, nome_projeto, responsavelid) values (103, 'Gest�o do veiculo', 3);
insert into projetos (projetoid, nome_projeto, responsavelid) values (104, 'Registro de jornada', 4);
insert into projetos (projetoid, nome_projeto, responsavelid) values (105, 'Jornada Motorista', 5);
insert into projetos (projetoid, nome_projeto, responsavelid) values (106, 'Localizador Motorista', 6);


create procedure sp_linkarbancos
as
begin
    select 
        f.nome as nome_funcionario,
        f.sobrenome as sobrenome_funcionario,
        p.nome_projeto
    from 
        a52teste1.dbo.funcionarios as f
    INNER JOIN 
        a52teste2.dbo.projetos as p on f.id = p.responsavelid;
end;

create view vw_funcionarios_projetos 
as
select 
    f.nome as nome_funcionario,
    f.sobrenome as sobrenome_funcionario,
    p.nome_projeto
from 
    a52teste1.dbo.funcionarios as f
INNER JOIN 
    a52teste2.dbo.projetos as p on f.id = p.responsavelid;
	

select f.nome as nome_funcionario, f.sobrenome as sobrenome_funcionario, p.nome_projeto from a52teste1.dbo.funcionarios as f
INNER JOIN a52teste2.dbo.projetos as p on f.id = p.responsavelid;
select *from vw_funcionarios_projetos
select *from  funcionarios
select * from projetos