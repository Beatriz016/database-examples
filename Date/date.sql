
/* Ex 1 */
SELECT DATEDIFF(DAY,'03/04/2020','05/06/2020')  AS 'Atraso de um fatura'

/* Ex 2*/
SELECT DATEDIFF(YEAR, '14/07/1981', GETDATE()) AS 'Idade'

/* Ex 3 
	Eu n�o entendi muito bem essa quest�o.
*/
SELECT DATEADD(DAY, 30, '05/06/2020') AS 'Data de vencimento'

/* Ex 4 */
SELECT DATEADD(DAY, 120, '05/06/2020') AS '2� Dose da Vacina'

/* Ex 5 */
SELECT DATEADD(MONTH,72,'2018') AS 'Presta��o do ve�culo'

/* Ex 6*/
SELECT DATEADD(YEAR, 75, '09/02/1986') AS 'Cometa Halley'
/*  OU */
SELECT DATEADD(YEAR, 76, '09/02/1986') AS 'Cometa Halley'

/* Ex 7*/
SELECT DATEDIFF(DAY, '03/01/2002', GETDATE()) AS Dias
SELECT DATEDIFF(MONTH, '03/01/2002', GETDATE()) AS M�ses
SELECT DATEDIFF(YEAR, '03/01/2002', GETDATE()) AS Anos