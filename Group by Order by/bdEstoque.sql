create database bdEstoque;

use bdEstoque;

create table tbFornecedor(
	codFornecedor int primary key identity(1,1)
	,nomeFornecedor varchar(20) not null
	,contatoFornecedor varchar(30) not null
) 

create table tbCliente(
	codCliente int primary key identity(1,1)
	,nomeCliente varchar(30) not null
	,cpfCliente char(11) not null
	,emailCliente varchar(30) not null
	,sexoCliente char(1) not null
	,dataNacsimentoCliente smalldatetime not null
)

create table tbFabricante(
	codFabricante int primary key identity(1,1)
	,nomeFabricante varchar(30) not null
)

create table tbVenda(
	codVenda int primary key identity(1,1)
	,dataVenda char(10) not null
	,valorTotalVenda int not null
	,codCliente int foreign key references tbCliente(codCliente)
)


create table tbProduto(
	codProduto int primary key identity(1,1)
	,descricaoProduto varchar(60) not null
	,valorProduto smallmoney not null
	,quantidadeProduto smallint not null
	,codFabricante int foreign key references tbFabricante(codFabricante)
	,codFornecedor int foreign key references tbFornecedor(codFornecedor)
)

create table tbItensVenda(
	codItensVenda int primary key identity(1,1)
	,codVenda int foreign key references tbVenda(codVenda)
	,codProduto int foreign key references tbProduto(codProduto)
	,quantidadeItensVenda smallint not null
	,subTotalItensVenda  smallmoney not null
)


insert into tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNacsimentoCliente)
values ('Amando Jos� Santana',	'12345678900'	,'amandojsantana@outlook.com','m',1905-04-23),
       ('Shela Carvalho Leal', '45678909823','scarvalho@g.com.br','f',1978-09-13),
	   ('Carlos Henrique Souza', '76598278299','chenrique@ig.com.br','m',1981-09-08),
	   ('Maria Aparecida Souza', '87365309899','mapdasouza@outlook.com','f',1962-07-07),
	   ('Adriana Nogueira Silva', '76354309388','drica1977@ig.com.br','f',1977-04-09),
	   ('Paulo Henrique Silva', '87390123111','phsilva80@hotmail.com','m',1987-02-02)


insert into tbFabricante(nomeFabricante)
values('Unilever'),('P&G'),('Bunge')


insert into tbFornecedor(nomeFornecedor, contatoFornecedor)
values('Atacad�o','Carlos'),('Assai', 'Maria Stella'),('Rold�o', 'Paulo C�sar')


insert into tbProduto(descricaoProduto, valorProduto, quantidadeProduto,codFabricante, codFornecedor)
values ('Amaciante Downy', 5.76, 1500, 2, 1),
       ('Amaciante Comfort', 5.45, 2300, 1, 1),
	   ('Sab�o em p� OMO', 5.99, 1280, 1, 2),
	   ('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2),
	   ('Hamburger Sadia', 9.89, 1600, 3, 1),
	   ('Fralda Pampers', 36.00, 340, 2, 3),
	   ('Xampu Seda', 5.89, 800, 1, 2),
	   ('Condicionador Seda', 4.76, 2500, 3, 1)


insert into tbVenda(dataVenda,valorTotalVenda, codCliente)
values('01/02/2014', 4500.00, 1),
	  ('03/02/2014', 3400.00, 1),
	  ('10/02/2014', 2100.00, 2),
	  ('15/02/2014', 2700.00, 3),
	  ('17/03/2014', 560.00, 5),
	  ('09/04/2014', 1200.00, 4),
	  ('07/05/2014', 3500.00, 1),
	  ('07/05/2014', 3400.00, 1),
	  ('05/05/2014', 4000.00, 2)


insert into tbItensVenda(codVenda, codProduto,quantidadeItensVenda, subTotalItensVenda)
values(1,1,200,1500.00),
	  (1,2,300,3000.00),
	  (2,4,120,1400.00),
	  (2,2,200,1000.00),
	  (2,3,130,1000.00),
	  (3,5,200,2100.00),
	  (4,4,120,1000.00),
	  (4,5,450,700.00),
	  (5,5,200,560.00),
	  (6,7,200,600.00),
	  (6,6,300,600.00),
	  (7,1,300,2500.00),/* tem um erro por aqui, comparar com a tabela do professor*/
	  (7,2,200,1000.00),			/*comparar com a tabela do professor*/
	  (8,6,200,1700.00),
	  (8,5,200,1700.00),
	  (9,4,1000,4000.00)



select * from tbItensVenda



-- ex 01
-- Listar a soma das quantidades dos produtos agrupadas pelo nome do fabricante;

SELECT nomeFabricante, sum(quantidadeProduto) FROM tbProduto
INNER JOIN tbFabricante 
ON tbFabricante.codFabricante = tbProduto.codFabricante
GROUP BY nomeFabricante
ORDER BY sum(quantidadeProduto) DESC


-- ex 02
-- Listar a m�dia dos pre�os dos produtos agrupados pelo nome do fornecedor;
SELECT nomeFabricante, AVG(valorProduto) from tbProduto
INNER JOIN tbFabricante
ON tbFabricante.codFabricante = tbProduto.codFabricante
GROUP BY nomeFabricante
ORDER BY AVG(valorProduto) DESC

-- ex 03
-- Listar todas a soma das vendas agrupadas pelo nome do cliente em ordem alfab�tica;
SELECT nomeCliente, SUM(valorTotalVenda) as 'soma das vendas' FROM tbVenda
INNER JOIN tbCliente
ON tbCliente.codCliente = tbVenda.codCliente
GROUP BY nomeCliente
ORDER BY nomeCliente


-- ex 04
-- Listar a soma dos pre�os dos produtos agrupados pelo nome do fabricante;
select nomeFabricante, SUM(valorProduto) FROM tbProduto
inner join tbFabricante
on tbFabricante.codFabricante = tbProduto.codFabricante
group by nomeFabricante


-- ex 05
-- Listar a m�dia dos pre�os dos produtos agrupados pelo nome do fornecedor
select nomeFornecedor, AVG(valorProduto) FROM tbProduto
inner join tbFornecedor
on tbFornecedor.codFornecedor = tbProduto.codFabricante
group by nomeFornecedor


-- ex 06
-- Listar a soma das vendas agrupadas pelo nome do produto
SELECT descricaoProduto, SUM(valorTotalVenda) as 'soma das vendas' FROM tbVenda
inner join tbItensVenda
on tbItensVenda.codVenda = tbItensVenda.codVenda
inner join tbProduto
on tbProduto.codProduto = tbItensVenda.codProduto
group by descricaoProduto

-- ex 07 
-- Listar a soma das vendas pelo nome do cliente somente das vendas realizadas em fevereiro de 2014
SELECT nomeCliente, SUM(valorTotalVenda) as 'soma das vendas', dataVenda FROM tbVenda
INNER JOIN tbCliente
ON tbCliente.codCliente = tbVenda.codCliente
where DATEPART(MONTH, dataVenda) = 2 and DATEPART(YEAR, dataVenda) = 2014 
GROUP BY nomeCliente, dataVenda


-- N�o sei se est� certo... eu sou bom com banco de dados mais ruim em interpretar texto 


-- kkkkk piadinha de leve s� para alegrar o dia e ganhar MB