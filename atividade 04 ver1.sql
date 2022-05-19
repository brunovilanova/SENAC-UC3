USE HospitalCuraTodos;
SELECT * FROM Internacao;

# [OK] Todos os dados e o valor médio das consultas do ano de 2020 

SELECT * FROM Consultas
WHERE dataHora BETWEEN '2020-01-01' AND '2020-12-31';
SELECT AVG(valor)
FROM Consultas
WHERE dataHora BETWEEN '2020-01-01' AND '2020-12-31';

# [OK] Todos os dados e o valor médio das consultas que foram feitas sob convênio

SELECT * FROM Consultas
WHERE idConvenios BETWEEN '1' AND '9';
SELECT AVG(valor)
FROM Consultas
WHERE idConvenios BETWEEN '1' AND '9';

# [OK] Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta

SELECT * FROM Internacao
WHERE dataAlta > prevDataAlta;

# [OK] Receituário completo da primeira consulta registrada com receituário associado

SELECT * FROM Consultas JOIN Receitas
ON Consultas.idConsultas=Receitas.idConsultas
WHERE Consultas.idConsultas = '1';

# [OK] Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)

SELECT * FROM Consultas
WHERE valor = (SELECT MAX(valor)
				FROM Consultas) AND
				valor = (SELECT MIN(valor)
				FROM Consultas);

# [OK] Todos os dados das internações em seus respectivos quartos, 
#      calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta

SELECT * FROM Internacao JOIN Quartos JOIN TipoQuarto
ON Internacao.idQuartos=Quartos.idQuartos AND Quartos.idTipoQuarto=TipoQuarto.idTipoQuarto
UNION ALL
(SELECT valorDiaria FROM TipoQuarto AS (DATEDIFF(dataEntrada, dataAlta) * TipoQuarto.valorDiaria));

# [OK] Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”

SELECT I.dataEntrada, I.procedimento, Q.numero 
FROM Internacao AS I JOIN Quartos AS Q JOIN TipoQuarto AS TQ
ON Internacao.idQuartos = Quartos.idQuartos AND Quartos.idTipoQuarto = TipoQuarto.idTipoQuarto
WHERE Q.idTipoQuarto = '3';

# Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta 
		# e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta

SELECT Pacientes.nome, Consultas.dataHora, Consultas.especialidade
FROM Pacientes JOIN Consultas
ON Pacientes.idPacientes = Consultas.idPacientes
ORDER BY Consultas.dataHora ASC
WHERE TIMESTAMPDIFF(YEAR, Pacientes.nascimento, DATE(Consultas.dataHora)) > 18 AND Consultas.especialidade NOT LIKE 'Pediatria';

# [OK] Nome do paciente, nome do médico, data da internação e procedimentos das internações 
#      realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”
  
SELECT P.nome, M.nome, I.dataEntrada, I.procedimento 
FROM Pacientes AS P JOIN Medicos AS M JOIN Internacao AS I JOIN Quartos AS Q JOIN TipoQuarto AS TQ
ON P.idPacientes = I.idPacientes AND M.idMedicos = I.idMedicos AND I.idQuartos=Q.idQuartos AND Q.idTipoQuarto=TQ.idTipoQuarto
WHERE M.especialidade = 'Gastroenterologia' AND Q.idTipoQuarto = '1';

# [OK] Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou

SELECT Medicos.nome, Medicos.CRM, Consultas.idConsultas
FROM Medicos JOIN Consultas
ON Medicos.idMedicos = Consultas.idMedicos
UNION ALL
(SELECT Medicos.nome, COUNT(*) AS times, IF (COUNT(*)>1,"duplicated", "not duplicated") AS duplicated FROM Medicos GROUP BY nome);

# Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação

SELECT Enfermeiros.nome, Enfermeiros.CRE, Internacao.idInternacao
FROM Enfermeiros JOIN Internacao
ON Enfermeiros.idEnfermeiros = Internacao.idEnfermeiros
UNION ALL
(SELECT Enfermeiros.nome, COUNT(*) AS times, IF (COUNT(*)>1,"duplicated", "not duplicated") AS duplicated FROM Enfermeiros GROUP BY nome);

# FIM

