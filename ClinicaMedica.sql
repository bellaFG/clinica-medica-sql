CREATE TABLE Paciente (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Rua VARCHAR(100),
    Numero INT,
    Complemento VARCHAR(50),
    Bairro VARCHAR(50),
    CEP VARCHAR(10),
    Cidade VARCHAR(50),
    Estado VARCHAR(2)
);


CREATE TABLE Convenio (
    ID_Convenio INT PRIMARY KEY AUTO_INCREMENT,
    Empresa VARCHAR(100),
    Tipo VARCHAR(50),
    Vencimento DATE,
    Percentual_Coparticipacao DECIMAL(5, 2)
);


CREATE TABLE Medico (
    CRM VARCHAR(10) PRIMARY KEY,
    Especialidade VARCHAR(50),
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Rua VARCHAR(100),
    Numero INT,
    Complemento VARCHAR(50),
    Bairro VARCHAR(50),
    CEP VARCHAR(10),
    Cidade VARCHAR(50),
    Estado VARCHAR(2)
);


CREATE TABLE Consulta (
    ID_Consulta INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE,
    Horario TIME,
    CRM_Medico VARCHAR(10),
    CPF_Paciente VARCHAR(11),
    FOREIGN KEY (CRM_Medico) REFERENCES Medico(CRM),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF)
);


CREATE TABLE Paciente_Convenio (
    CPF_Paciente VARCHAR(11),
    ID_Convenio INT,
    PRIMARY KEY (CPF_Paciente, ID_Convenio),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF),
    FOREIGN KEY (ID_Convenio) REFERENCES Convenio(ID_Convenio)
);



CREATE TABLE Medico_Convenio (
    CRM_Medico VARCHAR(10),
    ID_Convenio INT,
    PRIMARY KEY (CRM_Medico, ID_Convenio),
    FOREIGN KEY (CRM_Medico) REFERENCES Medico(CRM),
    FOREIGN KEY (ID_Convenio) REFERENCES Convenio(ID_Convenio)
);