CREATE DATABASE HospitalCuraTodos;
USE HospitalCuraTodos;


CREATE TABLE TipoQuarto (
idTipoQuarto INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(50),
valorDiaria VARCHAR(20)
);

CREATE TABLE Quartos (
idQuartos INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero INT(9) NOT NULL,
idTipoQuarto INT(9),
FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuarto(idTipoQuarto)
);

CREATE TABLE Convenios (
idConvenios INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
CNPJ VARCHAR(20),
carencia VARCHAR(20)
);

CREATE TABLE Enfermeiros (
idEnfermeiros INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
CPF VARCHAR(20),
CRE VARCHAR(10)
);

CREATE TABLE Medicos (
idMedicos INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
nascimento DATE,
CPF VARCHAR(20),
CRM VARCHAR(10),
estado CHAR(20),
categoria CHAR(50),
especialidade CHAR(100),
telefone VARCHAR(20),
endereco VARCHAR(100)
);

CREATE TABLE Pacientes (
idPacientes INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
nascimento DATE,
endereco VARCHAR(100),
telefone VARCHAR(20),
email VARCHAR(100),
CPF VARCHAR(20),
RG VARCHAR(20),
carteiraConvenio VARCHAR(20),
convenio VARCHAR(20)
);

CREATE TABLE Consultas (
idConsultas INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
dataHora DATETIME,
idMedicos INT(9) NOT NULL,
idPacientes INT(9) NOT NULL,
valor VARCHAR(10),
idConvenios INT(9),
carteiraConvenio VARCHAR(20),
especialidade CHAR(50),
FOREIGN KEY (idMedicos) REFERENCES Medicos(idMedicos),
FOREIGN KEY (idPacientes) REFERENCES Pacientes(idPacientes),
FOREIGN KEY (idConvenios) REFERENCES Convenios(idConvenios)
);

CREATE TABLE Receitas (
idReceitas INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
dataHora DATETIME,
idConsultas INT(9) NOT NULL,
idMedicos INT(9) NOT NULL,
idPacientes INT(9) NOT NULL,
medicamento VARCHAR(100),
qntMedicamento VARCHAR(20),
usoMedicamento VARCHAR(50),
FOREIGN KEY (idConsultas) REFERENCES Consultas(idConsultas),
FOREIGN KEY (idMedicos) REFERENCES Medicos(idMedicos),
FOREIGN KEY (idPacientes) REFERENCES Pacientes(idPacientes)
);

CREATE TABLE Internacao (
idInternacao INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
dataEntrada DATE,
prevDataAlta DATE,
dataAlta DATE,
procedimento VARCHAR(100),
idEnfermeiros INT(9) NOT NULL,
idMedicos INT(9) NOT NULL,
idPacientes INT(9) NOT NULL,
idQuartos INT(9) NOT NULL,
FOREIGN KEY (idEnfermeiros) REFERENCES Enfermeiros(idEnfermeiros),
FOREIGN KEY (idMedicos) REFERENCES Medicos(idMedicos),
FOREIGN KEY (idPacientes) REFERENCES Pacientes(idPacientes),
FOREIGN KEY (idQuartos) REFERENCES Quartos(idQuartos)
);


INSERT INTO TipoQuarto
(descricao, valorDiaria) VALUES
('Enfermaria', '80'),
('Duplo', '140'),
('Apartamento', '200');

INSERT INTO Quartos
(numero, idTipoQuarto) VALUES
('101', '1'),
('102', '1'),
('103', '1'),
('104', '1'),
('105', '1'),
('201', '2'),
('202', '2'),
('203', '2'),
('204', '2'),
('205', '2'),
('301', '3'),
('302', '3'),
('303', '3'),
('304', '3'),
('305', '3');

INSERT INTO Convenios
(nome, CNPJ, carencia) VALUES
('MedMais', '19.547/9999-00', '6 meses'),
('ProHealth', '19.702/9999-98', '1 mes'),
('UniSaude', '19.503/9999-80', '3 meses'),
('Providencia', '77.345.914/0001-19', '2 meses'),
('SeguroSaude', '10.004.195/0001-00', '3 meses'),
('Cruz Azul', '75.966.332/0001-24', '1 mes'),
('União Médica', '24.411.770/0001-95', '6 meses'),
('Health Security', '03.354.940/0001-77', '4 meses'),
('Luz', '85.345.984/0001-03', '1 ano'),
('null', 'null', 'null');

INSERT INTO Enfermeiros
(nome, CPF, CRE) VALUES
('João Carlos Fagundes', '595.689.214-51', '65765'),
('Eduarda Fonseca', '251.538.515-08', '45862'),
('Claudia Suassuna', '511.759.868-79', '61762'),
('Augusto dos Anjos Lopes', '766.524.456-46', '23765'),
('Ricardo Rodrigues', '937.158.850-09', '9795'),
('Maria da Paz', '774.442.281-32', '15362'),
('Clara Coutinho', '782.576.214-20', '37072'),
('Marcelo Brandão', '444.427.369-01', '61362'),
('José Luís Soares', '002.430.191-49', '31141'),
('Maria Guerra', '468.126.273-05', '55940'),
('Joana dos Santos', '321.744.365-90', '79946'),
('Marcela Vasconcelos', '235.242.051-27', '88446'),
('Gerson Canhão Aldeia', '222.530.261-82', '45862'),
('Lisa Olaio Hernandes', '475.716.510-26', '36632');

INSERT INTO Medicos
(nome, nascimento, CPF, CRM, estado, categoria, especialidade, telefone, endereco) VALUES
('Anny Quintanilha', '1970-11-10', '861.324.730-09', '120935', 'RS', 'Especialista', 'Pediatria, Clínica Geral', 
'(69) 3752-5488', 'Rua Flores 10, apto 101'),
('Suéli Simão Pegado (Residente)', '1990-08-27', '628.769.780-67', '15891', 'SP', 'Generalista', 'Clínica Geral', 
'(97) 2810-2734', 'Avenida Japão 50'),
('Alisson Sacramento ', '1981-01-15', '808.142.790-23', '178105', 'MG', 'Especialista', 'Gastroenterologia', 
'(79) 2718-0264', 'Rua Albieri 480'),
('Lívia Veloso', '1972-03-22', '209.249.870-30', '17897', 'MG', 'Especialista', 'Pediatria, Gastroenterologia', 
'(61) 3019-1483', 'Travessa A 89'),
('Gael Milheiro Lemes', '1964-02-13', '386.037.370-61', '9826', 'RS', 'Especialista', 'Dermatologia', 
'(82) 2433-7762', 'Rua das Rosas, 80, apto 200'),
('Gisela Espinosa', '1980-09-12', '235.290.910-49', '34548', 'SP', 'Generalista', 'Clínica Geral', 
'(86) 3368-4812', 'Avenida Santos, 90'),
('Nelson Anjos Palmeira', '1980-10-14', '036.266.390-45', '344789', 'SP', 'Especialista', 'Pediatria', 
'(54) 3941-4795', 'Rua Álamo, 180, ap 90'),
('Ezequiel Pestana Henriques', '1979-06-30', '672.979.590-57', '9756', 'RS', 'Especialista', 'Pediatria', 
'(69) 2537-6076', 'Avenida Chateaubriand, 150'),
('Tito Carqueijeiro', '1973-05-19', '745.886.510-56', '14777', 'RS', 'Generalista', 'Clínica Geral', 
'(83) 3272-8326', 'Rua Flores 670'),
('Fabiano Gomide (residente)', '1989-08-31', '329.725.180-80', '65765', 'RS', 'Generalista', 'Clínica Geral', 
'(63) 3230-5071', 'Avenida das Águas 600'),
('Cristovão Xavier', '1979-12-12', '926.904.900-05', '67432', 'RS', 'Especialista', 'Dermatologia, Pediatria', 
'(24) 2448-9465', 'Rua da Luz, 80'),
('Alberto Veríssimo (residente)', '1986-06-26', '706.001.780-13', '13548', 'SP', 'Especialista', 'Pediatria', 
'(67) 3754-8886', 'Avenida  das aves, 9912, apto 60'),
('Júlia Camarinho', '1980-07-05', '744.925.960-54', '24654', 'MG', 'Generalista', 'Gastroenterologia, Clínica Geral', 
'(61) 2615-4776', 'Rua Albieri 590'),
('Juliano Costa e Filho', '1971-03-05', '541.739.318-59', '134954', 'SP', 'Especialista', 'Cardiologia', 
'(17) 2821-2277', 'Rua Brasil 120'),
('Cristiana Andrade', '1981-11-02', '048.211.880-66', '79172', 'RS', 'Especialista', 'Cirurgia', 
'(54) 3971-6312', 'Rua Princesa Isabel, 480'),
('Sebastião Fonseca da Silva', '1973-01-19', '445.526.719-01', '25176', 'SP', 'Especialista', 'Neurologia', 
'(11) 3739-1618', 'Avenida  Marques Branco, 2820, apto 1001'),
('Antônio Carlos Rogrigues da Silva', '1983-06-09', '676.242.776-62', '89251', 'SP', 'Especialista', 'Ortopedia', 
'(12) 3245-4537', 'Rua das Acácias 440'),
('Maria Clara Coutinho', '1988-04-20', '777.143.796-69', '39816', 'RJ', 'Especialista', 'Oftalmologia', 
'(21) 2656-2337', 'Avenida General Brigadeiro, 190'),
('Gabriela Duarte Menezes', '1982-08-30', '088.071.141-86', '21985', 'RJ', 'Especialista', 'Pneumologia', 
'(24) 3511-2136', 'Alameda Machado de Assis, 22'),
('Juliana Maria Araújo dos Santos', '1971-03-05', '802.840.408-19', '31354', 'MG', 'Especialista', 'Ortopedia', 
'(35) 2241-5956', 'Travessa Brasil 650'),
('Cristiano Gomez Filho', '1981-11-02', '048.211.880-66', '54087', 'MG', 'Especialista', 'Cirurgia', 
'(34) 2877-6004', 'Praça da Árvore, 410'),
('João Paulo Motta Sagaz', '1989-10-20', '286.392.557-17', '34460', 'SP', 'Especialista', 'Oftalmologia', 
'(19) 2438-8410', 'Rua Cruz Naval, 980'),
('Clóvis Santana Maciel', '1984-04-24', '527.130.344-69', '82033', 'PR', 'Especialista', 'Cardiologia', 
'(45) 3473-1804', 'Avenida  dos Coqueirais, 1120, apto 201'),
('Cristina Fonseca Vasconcelos', '1987-03-14', '612.466.653-79', '55853', 'SP', 'Especialista', 'Dermatologia', 
'(18) 3815-7428', 'Rua Dom João VI 220');

INSERT INTO Pacientes
(nome, nascimento, endereco, telefone, email, CPF, RG, carteiraConvenio, convenio) VALUES
('Armindo Moreira Azeredo', '1986-11-11', 'Rua Maria Araújo de Lima 279', '(11) 43604-1981', 'armindo@hotmail.com', 
'184.313.134-04', '34.7651-7', '11234214124', '1'),
('Cármen Mata Camargo', '1973-02-09', 'Rua Rio Claro 253', '(11) 23541-3385', 'carment0209@hotmail.com', 
'777.625.368-50', '37.3043-9', '837493', '1'),
('César Sítima Faria', '1977-03-23', 'Rua Lajeado 109', '(31) 86945-2694', 'faria@gmail.com', 
'048.802.244-48', '18.4003-6', 'null', 'null'),
('Evandro Trindade Bouça', '1953-12-04', 'Praça Pedro Américo 70 apt 203', '(21) 82588-5786', 'evandrobouca@yahoo.com', 
'116.063.614-14', '41.5992-4', 'null', 'null'),
('Fabrício Norões Xavier', '1965-11-18', 'Rua Trezentos e Doze 501', '(11) 12743-3237', 'fabxavier@hotmail.com', 
'245.296.673-83', '15.5197-1', '226672634', '3'),
('Francisca Parracho Caneira', '2006-08-09', 'Rua Nova Ibiá 999', '(21) 33316-5468', 'caneira0809@gmail.com', 
'286.929.423-91', '25.5596-2', '12525312531', '3'),
('Giovanni Arouca Mata', '1985-05-01', 'Travessa José de Dom 222', '(11) 16312-4723', 'giovannimata@yahoo.com', 
'949.469.178-45', '47.5603-7', 'null', 'null'),
('Helton Espinosa', '1984-12-08', 'Rua 74 624', '(11) 13551-2981', 'espinosa@hotmail.com', 
'907.712.432-27', '37.2363-3', '2446354', '3'),
('Ivo Brandão Palos', '2001-08-29', 'Rua Olivia de Lima 250', '(11) 85495-5599', 'ivopalos@yahoo.com', 
'524.693.183-86', '21.9246-6', '12342342', '2'),
('Karine Macena Porciúncula', '1979-02-14', 'Travessa Militar 180', '(41) 84045-0606', 'karinemacena@gmail.com', 
'566.151.363-17', '39.6695-6', '4548643', '3'),
('Mark Festas Santana', '1967-01-04', 'Rua Carlos Horongozo Junior 413', '(41) 26038-1962', 'santana@aol.com', 
'976.642.011-44', '17.9217-2', '4351315', '3'),
('Pablo Atilano Flores', '1977-08-23', 'Residencial Jardim dos Buritis 480', '(31) 74681-1039', 'pabloflores@hotmail.com', 
'335.874.909-61', '46.4616-2', '2354641656', '3'),
('Silvana Fartaria Nazário', '1967-01-19', 'Avenida Parma 779', '(11) 88393-4576', 'nazario67@yahoo.com', 
'783.676.373-05', '50.5941-4', '213455', '2'),
('Zilda Gomide Osório', '1952-10-31', 'Rua Moura Carvalho 568', '(31) 32115-1236', 'osorio@gmail.com', 
'526.857.645-34', '11.7478-6', '324324321', '1'),
('Pablo Gadelha Galindo', '1954-10-15', 'Rua São Francisco 8544 apt 10', '(92) 2267-3296', 'pgalindo@gmail.com', 
'850.175.555-95', '88.5165-1', '378270908', '5'),
('Kelson Marcondes Quintão', '1955-02-24', 'Travessa Quinze de Novembro 409', '(87) 3560-9945', 'quintao55@yahoo.com', 
'850.575.285-64', '35.3863-5', '551497026', '9'),
('Dafne Paredes Albernaz', '1959-01-23', 'Rua Tiradentes 797', '(35) 3491-4419', 'dpalbernaz@hotmail.com', 
'369.576.768-54', '11.7852-1', '528002958', '9'),
('Emily Leme Lisboa', '2012-01-06', 'Rua Santos Dumont 260', '(92) 2233-8435', 'lisboaemily@yahoo.com', 
'428.477.565-07', '72.7140-8', '272964048', '4'),
('Djayson Carqueijeiro Furtado', '2008-06-16', 'Travessa São Jorge 80', '(35) 3894-1136', 'djaydjay@gmail.com', 
'728.881.584-69', '87.5066-8', '801990378', '7'),
('Lídia Toledo Roriz', '2003-06-24', 'Rua Dom Pedro II 413 bloco 2', '(27) 2546-5424', 'roriz0624@aol.com', 
'733.279.867-03', '33.0238-5', '726490777', '5'),
('Olivia Carvalhosa Boaventura', '1992-12-15', 'Residencial São Luiz 580', '(79) 3538-5869', 'olivia.boaventura@hotmail.com', 
'971.076.605-86', '65.6734-2', '616131998', '8'),
('Marco Cedro Escobar', '1970-01-01', 'Avenida José Bonifácio 779 apt 101', '(87) 3683-3352', 'mcescobar@yahoo.com', 
'578.672.809-95', '26.6857-6', '747652046', '6'),
('Stefany Taveira Simão', '1982-03-24', 'Rua Brasil  1568', '(63) 3165-6254', 'stesimao@gmail.com', 
'527.303.308-01', '43.2534-5', '726175384', '2'),
('Miriam Castro Brião', '1983-06-17', 'Rua Dezessete de Agosto 1279 apt 303', '(63) 3242-1721', 'castrobriao@hotmail.com', 
'671.734.221-83', '66.5264-3', '228703458', '1'),
('Micael Cantanhede Condorcet', '1964-06-30', 'Rua São Sebastião 553', '(61) 3442-1899', 'condorcet64@hotmail.com', 
'462.642.895-90', '82.2846-61', '873688586', '7'),
('Edwin Mendonça Eiró', '1977-03-16', 'Rua Primeiro de Maio 19', '(79) 3358-0442', 'edwineiro@gmail.com', 
'998.558.434-10', '63.7675-3', 'null', 'null'),
('Matilde Sacadura Cobra', '1989-10-19', 'Praça Duque de Caxias 187 apt 603', '(65) 2002-4186', 'matildecobra@yahoo.com', 
'125.531.322-63', '74.8743-8', '730455943', '6'),
('Uriel Boga Rodrigues', '1999-04-28', 'Rua Sete de Setembro 551', '(84) 2364-4378', 'uriel99@hotmail.com', 
'684.865.723-98', '38.5061-2', '233797413', '4'),
('Osvaldo Domingues Carneiro', '1988-09-02', 'Rua Bela Vista 999', '(32) 2318-4384', 'odcarneiro@gmail.com', 
'123.077.746-61', '36.8412-6', '268182843', '8'),
('Andreia Freitas Simão', '1986-02-10', 'Travessa Vinte e Um 222', '(84) 3442-0315', 'simao86@yahoo.com', 
'864.382.944-70', '11.9838-7', '840059003', '7'),
('Roberta Infante Veiga', '1963-11-08', 'Rua Bela Vista 553 casa 2', '(96) 3136-3725', 'condorcet64@hotmail.com', 
'171.479.557-81', '63.6715-9', '788947299', '4'),
('Luis Frois Boaventura', '1970-01-14', 'Rua das Flores 29 apt 202', '(94) 2855-1234', 'edwineiro@gmail.com', 
'534.453.361-64', '93.3237-8', 'null', 'null'),
('Delia Lindim Souto Maior', '1991-10-29', 'Praça Santa Maria 187', '(11) 2165-1889', 'matildecobra@yahoo.com', 
'594.415.436-59', '67.8615-9', '278170254', '8'),
('Alisha Godoi Colaço', '1986-09-23', 'Rua Rio de Janeiro 951', '(85) 3742-1682', 'uriel99@hotmail.com', 
'497.214.838-18', '78.7747-5', '216653862', '1'),
('Lukas Lobo Toledo', '1988-10-02', 'Rua Principal 919', '(63) 3544-3541', 'odcarneiro@gmail.com', 
'844.446.725-10', '47.4785-3', '416666776', '6'),
('Luana Paulos Barreiros', '1974-11-07', 'Travessa da Vitória 222', '(67) 3383-9345', 'simao86@yahoo.com', 
'778.223.875-70', '41.8661-4', '151798439', '7');

INSERT INTO Consultas
(dataHora, idMedicos, idPacientes, valor, idConvenios, carteiraConvenio, especialidade) VALUES
('2015-11-27 11:10:00', '2', '26', '140,00', '10', 'null', 'Clínica Geral'),
('2015-05-28 13:20:00', '14', '31', '250,00', '4', '788947299', 'Cardiologia'),
('2016-02-22 10:40:00', '16', '20', '270,00', '5', '726490777', 'Neurologia'),
('2016-02-25 13:20:00', '17', '23', '70,00', '2', '726175384', 'Ortopedia'),
('2016-07-20 08:10:00', '24', '31', '80,00', '4', '788947299', 'Dermatologia'),
('2016-11-22 08:20:00', '22', '34', '170,00', '1', '216653862', 'Oftalmologia'),
('2017-02-16 10:10:00', '20', '18', '130,00', '4', '272964048', 'Ortopedia'),
('2017-02-22 13:20:00', '18', '25', '180,00', '7', '873688586', 'Oftalmologia'),
('2017-03-20 15:10:00', '14', '29', '120,00', '8', '268182843', 'Cardiologia'),
('2017-07-31 11:10:00', '19', '17', '190,00', '9', '528002958', 'Pneumologia'),
('2017-09-06 13:20:00', '16', '22', '180,00', '6', '747652046', 'Neurologia'),
('2017-09-18 10:40:00', '9', '32', '170,00', '10', 'null', 'Geral'),
('2017-11-28 10:10:00', '14', '34', '240,00', '1', '216653862', 'Cardiologia'),
('2018-01-24 10:10:00', '10', '15', '130,00', '5', '378270908', 'Geral'),
('2018-02-25 10:10:00', '20', '16', '90,00', '9', '551497026', 'Ortopedia'),
('2018-04-11 08:10:00', '22', '36', '100,00', '7', '151798439', 'Oftalmologia'),
('2018-05-22 08:10:00', '24', '17', '60,00', '9', '528002958', 'Dermatologia'),
('2018-06-04 08:20:00', '16', '26', '130,00', '9', '551497026', 'Neurologia'),
('2018-12-27 12:10:00', '9', '24', '280,00', '1', '228703458', 'Geral'),
('2019-04-10 13:20:00', '7', '31', '220,00', '4', '788947299', 'Pediatria'),
('2019-08-07 08:20:00', '23', '35', '150,00', '6', '416666776', 'Cardiologia'),
('2019-08-13 15:10:00', '17', '19', '90,00', '7', '801990378', 'Ortopedia'),
('2019-10-29 12:10:00', '9', '22', '180,00', '6', '747652046', 'Geral'),
('2019-12-20 11:10:00', '24', '26', '140,00', '10', 'null', 'Dermatologia'),
('2019-02-06 09:20:00','13', '10', '110,00', '10', 'null', 'Geral'),
('2019-02-16 09:10:00', '3', '14', '110,00', '1', '55643215', 'Gastroenterologia'),
('2019-03-01 09:20:00', '12', '10', '110,00', '10', 'null', 'Pediatria'),
('2019-04-04 09:20:00', '13', '5', '180,00', '1', '21484234', 'Gastroenterologia'),
('2019-05-24 11:10:00', '3', '5', '150,00', '10', 'null', 'Gastroenterologia'),
('2019-07-02 16:10:00', '2', '3', '110,00', '10', 'null', 'Geral'),
('2019-07-20 12:10:00', '5', '13', '180,00', '10', 'null', 'Dermatologia'),
('2019-08-03 15:20:00', '9', '4', '150,00', '10', 'null', 'Geral'),
('2019-08-05 16:10:00', '3', '10', '110,00', '3', '12341234', 'Gastroenterologia'),
('2019-10-14 09:20:00', '8', '9', '75,00', '2', '12342342', 'Pediatria'),
('2019-11-01 08:10:00', '1', '1', '150,00', '10', 'null', 'Geral'),
('2019-11-05 15:10:00', '3', '14', '100,00', '10', 'null', 'Gastroenterologia'),
('2019-11-27 13:10:00', '4', '11', '100,00', '3', '4351315', 'Pediatria'),
('2020-02-17 10:10:00', '8', '1', '75,00', '10', 'null', 'Pediatria'),
('2020-03-01 08:10:00', '8', '11', '75,00', '10', 'null', 'Pediatria'),
('2020-03-07 08:20:00', '9', '1', '150,00', '1', '11234214124', 'Geral'),
('2020-05-16 11:20:00', '2', '8', '150,00', '3', '2446354', 'Geral'),
('2020-05-18 09:10:00', '10', '5', '100,00', '3', '226672634', 'Geral'),
('2020-06-25 14:20:00', '10', '7', '100,00', '10', 'null', 'Geral'),
('2020-07-16 08:10:00', '11', '2', '110,00', '2', '542315', 'Dermatologia'),
('2020-08-06 08:20:00', '13', '10', '180,00', '3', '4548643', 'Gastroenterologia'),
('2020-08-24 13:20:00', '8', '5', '180,00', '10', 'null', 'Pediatria'),
('2020-09-07 15:10:00', '1', '13', '180,00', '2', '213455', 'Pediatria'),
('2020-09-20 11:10:00', '7', '12', '110,00', '3', '2354641656', 'Pediatria'),
('2020-09-22 13:20:00', '1', '2', '110,00', '1', '837493', 'Pediatria'),
('2020-10-12 12:10:00', '9', '4', '100,00', '10', 'null', 'Geral'),
('2020-10-18 10:10:00', '9', '14', '180,00', '1', '324324321', 'Geral'),
('2020-10-23 15:20:00', '10', '6', '110,00', '3', '12525312531', 'Geral'),
('2020-11-05 08:10:00', '4', '9', '100,00', '2', '21341244', 'Gastroenterologia'),
('2020-11-15 12:10:00', '5', '4', '150,00', '10', 'null', 'Dermatologia');

INSERT INTO Receitas
(dataHora, idConsultas, idMedicos, idPacientes, medicamento, qntMedicamento, usoMedicamento) VALUES

('2015-11-27 11:10:00', '1', '2', '26', 'Addera D3','1x / dia', '3 meses'),
('2015-05-28 13:20:00', '2', '14', '31', 'Losartana', '1x / dia', 'permanente'),
('2016-02-22 10:40:00', '3', '16', '20', 'Puran T4', '1x / dia', '6 meses'),
('2016-02-25 13:20:00', '4', '17', '23', 'Torsilax', '2x / dia', '2 semanas'),
('2016-07-20 08:10:00', '5', '24', '31', 'Xarelto', '1x / dia', '3 meses'),
('2016-07-20 08:10:00', '5', '24', '31', 'Felodipino', '1x / dia', '3 meses'),
('2016-11-22 08:20:00', '6', '22', '34', 'Xarelto', '1x / dia', '3 meses'),
('2017-02-16 10:10:00', '7', '20', '18', 'Torsilax', '2x / dia', '2 semanas'),
('2017-02-16 10:10:00', '7', '20', '18', 'Novalgina', '2x / dia', '2 dias'),
('2017-02-22 13:20:00', '8', '18', '25', 'Victoza', '3x / semana', '2 meses'),
('2017-03-20 15:10:00', '9', '14', '29', 'Addera D3', '1x / dia', '3 meses'),
('2017-07-31 11:10:00', '10', '19', '17', 'Xarelto', '2x / semana', '2 meses'),
('2017-07-31 11:10:00', '10', '19', '17', 'Givosirana', '2x / semana', '2 meses'),
('2017-09-06 13:20:00', '11', '16', '22', 'Novolax', '1x / semana', 'permamente'),
('2017-09-18 10:40:00', '12', '9', '32', 'Novalgina', '2x / dia', '2 dias'),
('2017-11-28 10:10:00', '13', '14', '34', 'Losartana', '1x / dia', 'permanente'),
('2018-01-24 10:10:00', '14', '10', '15', 'Lufital', '2x / dia', '2 semanas'),
('2018-01-24 10:10:00', '14', '10', '15', 'Lisinopril', '2x / dia', '2 semanas'),
('2018-02-25 10:10:00', '15', '20', '16', 'Atorvastatina', '1x / dia', '1 semana'),
('2018-04-11 08:10:00', '16', '22', '36', 'Ciclizina', '3x / semana', '1 mês'),
('2018-05-22 08:10:00', '17', '24', '17', 'Puran T4', '1x / dia', '6 meses'),
('2018-05-22 08:10:00', '17', '24', '17', 'Delavirdina', '1x / dia', '6 meses'),
('2018-06-04 08:20:00', '18', '16', '26', 'Prolopa', '1x / dia', '2 meses'),
('2018-12-27 12:10:00', '19', '9', '24', 'Paracetamol', '2x / dia', '4 dias'),
('2018-12-27 12:10:00', '19', '9', '24', 'Mitomicina', '2x / dia', '4 dias'),
('2019-04-10 13:20:00', '20', '7', '31', 'Prolopa', '1x / dia', '2 meses'),
('2019-04-10 13:20:00', '20', '7', '31', 'Ergotamina', '1x / dia', '2 meses'),
('2019-08-07 08:20:00', '21', '23', '35', 'Puran T4', '1x / dia', '6 meses'),
('2019-08-13 15:10:00', '22', '17', '19', 'Paracetamol', '3x / dia', '3 dias'),
('2019-10-29 12:10:00', '23', '9', '22', 'Aradois', '3x / semana', '1 mês'),
('2019-10-29 12:10:00', '23', '9', '22', 'Nadolol', '3x / semana', '1 mês'),
('2019-12-20 11:10:00', '24', '24', '26', 'Addera D3','1x / dia', '3 meses'),
('2019-02-06 09:20:00', '25', '13', '10', 'Paracetamol', '3x / dia', '3 dias'),
('2019-02-16 09:10:00', '26', '3', '14', 'Puran T4', '1x / dia', '6 meses'),
('2019-03-01 09:20:00', '27', '12', '10', 'Torsilax', '2x / dia', '2 semanas'),
('2019-04-04 09:20:00', '28', '13', '5', 'Xarelto', '1x / dia', '3 meses'),
('2019-05-24 11:10:00', '29', '3', '5', 'Addera D3','1x / dia', '3 meses'),
('2019-07-02 16:10:00', '30', '2', '3', 'Prolopa', '1x / dia', '2 meses'),
('2019-07-20 12:10:00', '31', '5', '13', 'Aradois', '3x / semana', '1 mês'),
('2019-08-03 15:20:00', '32', '9', '4', 'Novalgina', '2x / dia', '2 dias'),
('2019-08-05 16:10:00', '33', '3', '10', 'Victoza', '3x / semana', '3 meses'),
('2019-10-14 09:20:00', '34', '8', '9', 'null', 'null', 'null'),
('2019-11-01 08:10:00', '35', '1', '1', 'Xarelto', '1x / dia', '3 meses'),
('2019-11-05 15:10:00', '36', '3', '14', 'Paracetamol', '3x / dia', '3 dias'),
('2019-11-27 13:10:00', '37', '4', '11', 'Novalgina', '2x / dia', '2 dias'),
('2020-02-17 10:10:00', '38', '8', '1', 'Aradois', '3x / semana', '1 mês'),
('2020-03-01 08:10:00', '39', '8', '11', 'Xarelto', '1x / dia', '3 meses'),
('2020-03-07 08:20:00', '40', '9', '1', 'Puran T4', '1x / dia', '6 meses'),
('2020-05-16 11:20:00', '41', '2', '8', 'Paracetamol', '3x / dia', '3 dias'),
('2020-05-18 09:10:00', '42', '10', '5', 'Addera D3', '3x / semana', '3 meses'),
('2020-06-25 14:20:00', '43', '10', '7', 'Novalgina', '2x / dia', '2 dias'),
('2020-07-16 08:10:00', '44', '11', '2', 'null', 'null', 'null'),
('2020-08-06 08:20:00', '45', '13', '10', 'Torsilax', '2x / dia', '2 semanas'),
('2020-08-24 13:20:00', '46', '8', '5', 'Aradois', '3x / semana', '1 mês'),
('2020-09-07 15:10:00', '47', '1', '13', 'Xarelto', '2x / semana', '2 meses'),
('2020-09-20 11:10:00', '48', '7', '12', 'Paracetamol', '3x / dia', '3 dias'),
('2020-09-22 13:20:00', '49', '1', '2', 'Novalgina', '2x / dia', '2 dias'),
('2020-10-12 12:10:00', '50', '9', '4', 'Paracetamol', '3x / dia', '3 dias'),
('2020-10-18 10:10:00', '51', '9', '14', 'Torsilax', '2x / dia', '2 semanas'),
('2020-10-23 15:20:00', '52', '10', '6', 'Addera D3', '1x / dia', '3 meses'),
('2020-11-05 08:10:00', '53', '4', '9', 'Puran T4', '1x / dia', '6 meses'),
('2020-11-15 12:10:00', '54', '5', '4', 'Addera D3', '1x / dia', '3 meses');

INSERT INTO Internacao
(dataEntrada, prevDataAlta, dataAlta, Procedimento, idEnfermeiros, idMedicos, idPacientes, idQuartos) VALUES
('2016-02-18', '2016-02-23', '2016-02-21', 'ombro deslocado', '3', '17', '20', '1'),
('2017-10-02', '2017-10-15', '2017-10-20', 'gastrite cronica', '12', '4', '14', '11'),
('2018-04-04', '2018-05-04', '2019-05-08', 'marcapasso', '2', '14', '12', '6'),
('2018-11-03', '2018-11-15', '2018-11-16', 'gastrite cronica', '12', '4', '14', '5'),
('2019-04-16', '2019-05-03', '2019-05-04', 'cirurgia de estômago', '3', '3', '10', '12'),
('2019-06-01', '2019-06-24', '2019-06-24', 'recuperação de acidente automobilistico', '6', '10', '9', '1'),
('2020-01-10', '2020-01-21', '2020-01-31', 'cirurgia de joelho', '9', '6', '14', '2'),
('2020-05-22', '2020-06-11', '2020-06-13', 'transplante de rim', '1', '15', '18', '9'),
('2020-06-26', '2020-06-30', '2020-07-01', 'cirurgia catarata', '2', '5', '2', '14'),
('2020-09-25', '2020-10-01', '2020-10-01', 'cirurgia catarata', '2', '5', '2', '7'),
('2020-10-02', '2020-10-16', '2020-10-23', 'cirurgia de estômago', '5', '3', '12', '3'),
('2020-10-02', '2020-10-02', '2020-10-02', 'cirurgia catarata', '8', '16', '21', '6'),
('2021-02-10', '2021-02-21', '2021-02-21', 'cirurgia de joelho', '9', '6', '14', '4'),
('2021-03-12', '2021-03-29', '2021-04-01', 'pneumonia', '1', '9', '4', '2'),
('2021-11-24', '2021-12-10', '2021-12-09', 'transplante de rim', '6', '13', '2', '9');



