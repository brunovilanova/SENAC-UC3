USE HospitalCuraTodos;

# [OK] Crie uma coluna “em atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

ALTER TABLE Medicos ADD Atividade VARCHAR(50) DEFAULT 'Ativo';

# [OK] Crie script para atualizar ao menos dois médicos como inativos e os demais em atividade.

UPDATE Medicos
SET Atividade = 'Inativo'
WHERE idMedicos = '3';

UPDATE Medicos
SET Atividade = 'Inativo'
WHERE idMedicos = '20';

UPDATE Medicos
SET Atividade = 'Inativo'
WHERE idMedicos = '29';

# [OK] Crie script para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada.

SELECT * FROM Internacao;
    UPDATE Internacao
    SET dataAlta = DATE_ADD(dataEntrada, INTERVAL 3 DAY);
    
# [OK] Crie script para excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio.

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Consultas 
WHERE idConvenios = 9
ORDER BY idConsultas DESC;
DELETE FROM Convenios 
WHERE idConvenios = 9
ORDER BY idConvenios DESC;
SET FOREIGN_KEY_CHECKS=1;

