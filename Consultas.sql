

--1. Listagem Simples: Selecione o nome do contato (C: ContactName) e o telefone (C: Phone) de todos os clientes (T: Customers) que moram em Londres.
SELECT 
    c.ContactName, 
    c.Phone 
FROM 
    Customers c 
WHERE 
    c.City = 'London';


--2. Ordenação: Mostre todos os produtos (T: Products) que estão com o estoque (C: UnitsInStock) zerado, ordenados pelo nome do produto em ordem alfabética (C: ProductName).
select 
    P.ProductName 
FROM 
    Products P 
where 
    P.UnitsInStock = 0 
ORDER BY P.ProductName ASC;

--3. Filtro com Datas: Liste todos os pedidos (T: Orders) que foram feitos no mês de maio de 1997. Ordene os resultados pela data do pedido (C: OrderDate), do mais recente para o mais antigo.
SELECT * FROM Orders O WHERE CAST(O.OrderDate AS DATE) BETWEEN '1997-05-01' and '1997-05-31';

--4. Uso do TOP: Identifique os 5 produtos mais caros da loja. A consulta deve retornar o nome do produto (C: ProductName) e o seu preço (C: UnitPrice).
select TOP 5 P.ProductName,P.UnitPrice FROM Products P ORDER BY P.UnitPrice DESC ;

--5. Múltiplos Critérios: Encontre todos os funcionários (T: Employees) que foram contratados (C: HireDate) antes do ano de 1993 e que moram nos EUA (C: Country = 'USA').
SELECT * FROM Employees F WHERE F.HireDate < '1993-01-01' AND F.Country = 'USA';

--6. Contagem Simples (COUNT): Quantos produtos ao todo são fornecidos pelo fornecedor (T: Supplier) de ID = 1?
SELECT COUNT(*) FROM Products P WHERE P.SupplierID = 1;

--7. Média de Preços (AVG): Qual é o preço médio de todos os produtos cadastrados na tabela T: Products? Dê um nome (alias) para a coluna de resultado como PrecoMedio.
SELECT AVG(P.UnitPrice) AS precoMedio FROM Products P;


--8. Agrupamento (GROUP BY): Crie uma consulta que mostre a quantidade de clientes existentes em cada país (C: Country).
select COUNT(*), E.Country from Customers E GROUP BY E.Country;

--9. Soma (SUM) com Agrupamento: Calcule o valor total de itens em estoque (C: UnitsInStock) para cada categoria de produto (C: CategoryID). A consulta deve mostrar o C: CategoryID e a soma total.
SELECT SUM(P.UnitPrice),P.CategoryID FROM Products P GROUP BY P.CategoryID;

--10. Filtro de Grupos (HAVING): Liste todos os países que possuem mais de 7 clientes. A consulta deve mostrar o país e a contagem de clientes.
SELECT C.Country, COUNT(*) AS CLIENTES FROM Customers C GROUP BY C.Country HAVING COUNT(*) > 7

/*11. Consulta Complexa com Agregação: Mostre o C: ProductID e o valor total vendido (calculado como C: UnitPrice * C: Quantity) 
para cada produto na tabela T: Order Details. Liste apenas os produtos cujo valor total vendido ultrapasse $50.000 e ordene do maior para o menor valor.*/
SELECT 
    O.ProductID, 
    SUM(O.Quantity * O.UnitPrice) AS VALOR_TOTAL
FROM 
    [Order Details] O
GROUP BY 
    O.ProductID
HAVING  
    SUM(O.Quantity * O.UnitPrice) > 50000
ORDER BY  
    SUM(O.Quantity * O.UnitPrice) DESC

--12. Uso de DISTINCT: Crie uma consulta que retorne todas as cidades (C: City) únicas para as quais já foram enviados pedidos (T: Orders
SELECT DISTINCT O.ShipCity FROM Orders O


/*13. Subconsulta com IN: Liste o nome de todos os produtos (T: Products) que são da categoria 'Beverages'. 
(Dica: primeiro, use uma subconsulta para encontrar o C: CategoryID de 'Beverages' na tabela T: Categories).*/
SELECT * FROM Products P WHERE CategoryID IN (SELECT C.CategoryID FROM Categories C WHERE C.CategoryName = 'Beverages')

--14. Subconsulta com Agregação: Mostre todos os produtos cujo preço unitário (C: UnitPrice) é maior que o preço médio de todos os produtos.
SELECT P.ProductName, P.UnitPrice FROM Products P WHERE P.UnitPrice > (SELECT AVG(P2.UnitPrice) FROM Products P2)

/*15. Inserção (INSERT): Insira uma nova transportadora (T: Shipper) na sua tabela T: Shippers_Copia. O nome da empresa 
(C: CompanyName) deve ser "Loggi" e o telefone (C: Phone) "(11) 99999-9999".? */

SELECT *
INTO Shippers_Copia
FROM Shippers

SELECT*FROM Shippers_Copia

INSERT INTO Shippers_Copia VALUES ('Loggi','(11) 99999-9999')

/*16. Atualização (UPDATE): O telefone da "Loggi" mudou. Atualize o registro na tabela T: Shippers_Copia para o novo telefone "(11) 88888-8888".*/
UPDATE Shippers_Copia 
SET Phone = '(11) 88888-8888'
WHERE ShipperID = 4

--17. Exclusão (DELETE): Exclua a transportadora chamada "Speedy Express" da sua tabela T: Shippers_Copia.
DELETE FROM Shippers_Copia
WHERE ShipperID = 1

--18. Criação de Tabela (CREATE TABLE): Crie uma nova tabela chamada T: Auditoria com as seguintes colunas: C: LogID, C: NomeTabela, C: DataModificacao.
CREATE TABLE Auditoria(
        LogId int identity(1,1) primary key,
        NomeTabela Varchar(50),
        DataModificacao datetime

)

--19. Adição de Constraints: Recrie a tabela T: Auditoria adicionando as restrições: PRIMARY KEY, NOT NULL e DEFAULT.
DROP TABLE Auditoria

CREATE TABLE Auditoria(
        LogId int identity(1,1) primary key,
        NomeTabela Varchar(50) NOT NULL,
        DataModificacao datetime NOT NULL

        CONSTRAINT dataModificacao DEFAULT GETDATE()

);

SELECT*FROM Auditoria

--20. Alteração de Tabela (ALTER TABLE): Adicione uma nova coluna na tabela T: Auditoria chamada C: Usuario do tipo VARCHAR(50). Em seguida, remova esta mesma coluna da tabela.
ALTER TABLE Auditoria
ADD Usuario VARCHAR(50)

ALTER TABLE AUDITORIA
DROP COLUMN Usuario

