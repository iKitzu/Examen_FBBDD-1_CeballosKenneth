CREATE TABLE ComplejoDeportivo (
    ID_Complejo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Localización VARCHAR(255) NOT NULL,
    Jefe_Organizacion VARCHAR(255) NOT NULL,
    Area_Total FLOAT NOT NULL
);

--  Tabla ComplejoPolideportivo
CREATE TABLE ComplejoPolideportivo (
    ID_Complejo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Localización VARCHAR(255) NOT NULL,
    Jefe_Organizacion VARCHAR(255) NOT NULL,
    Area_Total FLOAT NOT NULL
);

--  Tabla Evento
CREATE TABLE Evento (
    ID_Evento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Fecha DATE NOT NULL,
    Duración INT NOT NULL,
    Numero_Participantes INT NOT NULL,
    Numero_Comisarios INT NOT NULL,
    ID_Complejo INT,
    FOREIGN KEY (ID_Complejo) REFERENCES ComplejoDeportivo(ID_Complejo)
);

--  Tabla Comisario
CREATE TABLE Comisario (
    ID_Comisario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Rol VARCHAR(50) NOT NULL
);

--  Tabla Evento_Comisario
CREATE TABLE Evento_Comisario (
    ID_Evento INT,
    ID_Comisario INT,
    PRIMARY KEY (ID_Evento, ID_Comisario),
    FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Comisario) REFERENCES Comisario(ID_Comisario)
);

--  Tabla Equipamiento
CREATE TABLE Equipamiento (
    ID_Equipamiento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50) NOT NULL
);

--  Tabla Evento_Equipamiento
CREATE TABLE Evento_Equipamiento (
    ID_Evento INT,
    ID_Equipamiento INT,
    PRIMARY KEY (ID_Evento, ID_Equipamiento),
    FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Equipamiento) REFERENCES Equipamiento(ID_Equipamiento)
);

--  Tabla Mantenimiento
CREATE TABLE Mantenimiento (
    ID_Mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Equipamiento INT,
    ID_Complejo INT,
    FOREIGN KEY (ID_Equipamiento) REFERENCES Equipamiento(ID_Equipamiento)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Complejo) REFERENCES ComplejoDeportivo(ID_Complejo)
);