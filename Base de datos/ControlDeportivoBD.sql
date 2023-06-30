CREATE TABLE CIRCUNFERENCIAS (
ID_Circunferencias INT PRIMARY KEY,
  BicepsRej NUMBER,
  BicepsCont NUMBER,
  Muneca NUMBER,
  Antebrazo NUMBER,
  Pecho NUMBER,
  Cintura NUMBER,
  Cadera NUMBER,
  MusloRej NUMBER,
  MusloCont NUMBER,
  Pantorrilla NUMBER,
  Tobillo NUMBER
  );
  
  CREATE TABLE Pliegues (
  ID_Pliegues INT PRIMARY KEY,
  Bicipital NUMBER,
  Tricipital NUMBER,
  Subescapular NUMBER,
  Abdominal NUMBER,
  Supraespinal NUMBER,
  Suprailiaco NUMBER,
  Cuadricipal NUMBER,
  Peroneal NUMBER
  );
  
  CREATE TABLE Morfologia (
  ID_Morfologia INT PRIMARY KEY,
  Clasificacion VARCHAR2(50)
  );
  
  CREATE TABLE Lateralidad (
  ID_Lateralidad INT PRIMARY KEY,
  Lateralidad VARCHAR2(50)
  );
  
  CREATE TABLE EJERCICIOS (
  ID_Ejercicio INT PRIMARY KEY,
  Ejercicio VARCHAR2(100),
  Imagen VARCHAR2(500),
  Video VARCHAR(500)
  );
  
  CREATE TABLE Calentamiento (
  ID_Calentamiento INT PRIMARY KEY,
  Ejercicio1 INT,
  Ejercicio2 INT,
  Ejercicio3 INT,
  Ejercicio4 INT,
  Ejercicio5 INT,
  Ejercicio6 INT,
  Ejercicio7 INT,
  Ejercicio8 INT,
  FOREIGN KEY (Ejercicio1) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio2) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio3) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio4) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio5) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio6) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio7) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio8) REFERENCES EJERCICIOS (ID_Ejercicio)
  );
  
CREATE TABLE Especifico (
  ID_Especifico INT PRIMARY KEY,
  Ejercicio1 INT,
  Ejercicio2 INT,
  Ejercicio3 INT,
  Ejercicio4 INT,
  Ejercicio5 INT,
  Ejercicio6 INT,
  Ejercicio7 INT,
  Ejercicio8 INT,
  Ejercicio9 INT,
  Ejercicio10 INT,
  FOREIGN KEY (Ejercicio1) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio2) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio3) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio4) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio5) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio6) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio7) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio8) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio9) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio10) REFERENCES EJERCICIOS (ID_Ejercicio)
  );
  
  
    CREATE TABLE Recuperacion (
  ID_Recuperacion INT PRIMARY KEY,
  Ejercicio1 INT,
  Ejercicio2 INT,
  Ejercicio3 INT,
  Ejercicio4 INT,
  Ejercicio5 INT,
  Ejercicio6 INT,
  FOREIGN KEY (Ejercicio1) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio2) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio3) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio4) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio5) REFERENCES EJERCICIOS (ID_Ejercicio),
  FOREIGN KEY (Ejercicio6) REFERENCES EJERCICIOS (ID_Ejercicio)
  );
  
  CREATE TABLE Deporte (
  ID_Deporte INT PRIMARY KEY,
  Disciplina1 VARCHAR2(50),
  Tiempo1 INT,
  Disciplina2 VARCHAR(50),
  Tiempo2 INT
  );
  
  CREATE TABLE Record (
  ID_Record INT PRIMARY KEY,
  Distancia NUMBER,
  Tiempo NUMBER,
  Fecha TIMESTAMP
  );
  
  CREATE TABLE Ciclo (
  ID_Ciclo INT PRIMARY KEY,
  Masociclo VARCHAR2(50),
  Mesociclo VARCHAR2(50),
  Microcilo VARCHAR2(50)
  );
  
  CREATE TABLE Antropometria (
  ID_Antropometria INT PRIMARY KEY,
  Masa NUMBER,
  Altura NUMBER,
  Observaciones VARCHAR(500),
  ID_Circunferencias INT,
  ID_Pliegues INT,
  ID_Morfologia INT,
  FOREIGN KEY (ID_Circunferencias) REFERENCES CIRCUNFERENCIAS (ID_Circunferencias),
  FOREIGN KEY (ID_Pliegues) REFERENCES Pliegues (ID_Pliegues),
  FOREIGN KEY (ID_Morfologia) REFERENCES Morfologia (ID_Morfologia)
  );
  
  CREATE TABLE Plan (
  ID_Plan INT PRIMARY KEY,
  Dia1 VARCHAR(300),
  Dia2 VARCHAR(300),
  Dia3 VARCHAR(300),
  Dia4 VARCHAR(300),
  Dia5 VARCHAR(300),
  Dia6 VARCHAR(300),
  Dia7 VARCHAR(300)
  );
  
  CREATE TABLE CCR (
  ID_CCR INT PRIMARY KEY,
  ID_Lateralidad INT,
  ID_Calentamiento INT,
  ID_Especifico INT,
  ID_Recuperacion INT,
  FOREIGN KEY (ID_Lateralidad) REFERENCES Lateralidad (ID_Lateralidad),
  FOREIGN KEY (ID_Calentamiento) REFERENCES Calentamiento (ID_Calentamiento),
  FOREIGN KEY (ID_Especifico) REFERENCES Especifico (ID_Especifico),
  FOREIGN KEY (ID_Recuperacion) REFERENCES Recuperacion (ID_Recuperacion)
  );
  
CREATE TABLE Atleta (
  ID_Atleta INT PRIMARY KEY,
  FN DATE,
  ID_Deporte INT,
  ID_PB INT,
  ID_Ciclo INT,
  ID_Antropometria INT,
  ID_Plan INT,
  ID_CCR INT,
  FOREIGN KEY (ID_Deporte) REFERENCES Deporte (ID_Deporte),
  FOREIGN KEY (ID_PB) REFERENCES Record (ID_Record),
  FOREIGN KEY (ID_Antropometria) REFERENCES Antropometria (ID_Antropometria),
  FOREIGN KEY (ID_Plan) REFERENCES Plan (ID_Plan),
  FOREIGN KEY (ID_CCR) REFERENCES CCR (ID_CCR)
);

CREATE TABLE Registro (
ID_Registro INT PRIMARY KEY,
Registro TIMESTAMP,
ID_Atleta INT,
FOREIGN KEY (ID_Atleta) REFERENCES Atleta (ID_Atleta)
);
