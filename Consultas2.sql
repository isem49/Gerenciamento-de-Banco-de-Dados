/*1 - Formata��o de Nomes: Selecione o nome e sobrenome dos funcion�rios e exiba-os em uma �nica coluna 
chamada NomeCompleto, em mai�sculas, no formato "SOBRENOME, NOME".*/
select UPPER(F.FirstName + ' '  + F.LastName) AS Nome_completo from Employees F

/*2 - Extra��o de Iniciais: Crie uma consulta que mostre os tr�s primeiros caracteres do nome de cada produto.*/
select LEFT(P.ProductName,3) from Products P

/*3 - Busca por Padr�o: Liste todos os clientes cujo nome do contato come�a com a letra 'A' e termina com a letra 'o'.*/
SELECT C.ContactName FROM Customers C WHERE C.ContactName LIKE 'A%O'

/*4 -  Comprimento do Nome: Encontre todos os produtos cujos nomes t�m mais de 20 caracteres. Ordene pelo nome do produto.*/
SELECT P.ProductName FROM Products P WHERE LEN(P.ProductName) > 20

/*5 - Substitui��o de Texto: Para todos os produtos da categoria 1,
mostre o nome do produto substituindo a palavra "Lager" por "Cerveja".*/
SELECT 
		REPLACE(P.ProductName,'Lager','Cerveja')  
FROM Products P WHERE P.CategoryID = 1

/*6 - Concatena��o com Convers�o: 
Exiba o ID e o nome do produto em uma �nica coluna formatada como "ID: [ProductID] - Nome: [ProductName]"?*/
select CONCAT(P.ProductID,' ','-' ,' ', P.ProductName) AS IdName from Products P

/*7 - Busca por M�ltiplos Padr�es: Liste os clientes cujo nome do pa�s comece com 'U' mas n�o seja 'USA'.*/
SELECT * FROM Customers C WHERE  C.Country != 'USA' AND C.Country LIKE 'U%'

/*8 - Verifica��o de Nulos com Texto: Selecione todos os clientes e mostre o nome da empresa. 
Se a regi�o for nula, exiba o texto 'N/A' no lugar do nulo.*/

SELECT 
	c.ContactName,
	c.CompanyName,
	c.Region
		

FROM Customers c


