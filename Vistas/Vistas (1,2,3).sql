ALTER SESSION SET CURRENT_SCHEMA = ENTRENADOR;

--Vista para Registro y Atleta

CREATE OR REPLACE VIEW Vista_Atletas AS
SELECT
    R.ID_Registro,
    D.Disciplina1,
    D.Tiempo1,
    D.Disciplina2,
    D.Tiempo2,
    RD.Distancia,
    RD.Tiempo,
    RD.Fecha,
    C.Masociclo,
    C.Mesociclo,
    C.Microcilo
FROM
    Atleta A
    INNER JOIN Registro R ON A.ID_Atleta = R.ID_Atleta
    INNER JOIN Deporte D ON A.ID_Deporte = D.ID_Deporte
    LEFT JOIN Record RD ON A.ID_PB = RD.ID_Record
    LEFT JOIN Ciclo C ON A.ID_Ciclo = C.ID_Ciclo;

SELECT * FROM Vista_Atletas;

--Vista solo para ciclos
CREATE OR REPLACE VIEW Vista_Ciclos AS
SELECT 
A.ID_Atleta,
C.Masociclo,
C.Mesociclo,
C.Microcilo
FROM
Atleta A
INNER JOIN Ciclo C ON A.ID_Ciclo = C.ID_Ciclo; 

SELECT * FROM Vista_Ciclos;

--Vista para los ejercicios por atleta
CREATE OR REPLACE VIEW Vista_Calentamiento AS
SELECT 
A.ID_Atleta,
E1.Ejercicio AS Ejecicio1,
E2.Ejercicio AS Ejecicio2,
E3.Ejercicio AS Ejecicio3,
E4.Ejercicio AS Ejecicio4,
E5.Ejercicio AS Ejecicio5,
E6.Ejercicio AS Ejecicio6,
E7.Ejercicio AS Ejecicio7,
E8.Ejercicio AS Ejecicio8
FROM 
Atleta A
LEFT JOIN Calentamiento C ON A.ID_CCR = C.ID_Calentamiento
LEFT JOIN EJERCICIOS E1 ON C.Ejercicio1 = E1.ID_Ejercicio
LEFT JOIN EJERCICIOS E2 ON C.Ejercicio2 = E2.ID_Ejercicio
LEFT JOIN EJERCICIOS E3 ON C.Ejercicio3 = E3.ID_Ejercicio
LEFT JOIN EJERCICIOS E4 ON C.Ejercicio4 = E4.ID_Ejercicio
LEFT JOIN EJERCICIOS E5 ON C.Ejercicio5 = E5.ID_Ejercicio
LEFT JOIN EJERCICIOS E6 ON C.Ejercicio6 = E6.ID_Ejercicio
LEFT JOIN EJERCICIOS E7 ON C.Ejercicio7 = E7.ID_Ejercicio
LEFT JOIN EJERCICIOS E8 ON C.Ejercicio8 = E8.ID_Ejercicio;

SELECT * FROM Vista_Calentamiento;

--Atletas por deporte
CREATE VIEW Vista_Atletas_Deportes AS
SELECT
    A.ID_Atleta,
    A.FN,
    D.Disciplina1 AS Disciplina_Principal,
    D.Tiempo1 AS Tiempo_Disciplina_Principal,
    D.Disciplina2 AS Disciplina_Secundaria,
    D.Tiempo2 AS Tiempo_Disciplina_Secundaria
FROM Atleta A
JOIN Deporte D ON A.ID_Deporte = D.ID_Deporte;

SELECT * FROM Vista_Atletas_Deportes;

--Registros de antropometria
CREATE VIEW Vista_Registros_Antropometria AS
SELECT
    A.ID_Atleta,
    A.FN,
    C.BicepsRej,
    C.BicepsCont,
    P.Bicipital,
    P.Tricipital,
    M.Clasificacion
FROM Atleta A
JOIN Antropometria An ON A.ID_Antropometria = An.ID_Antropometria
JOIN CIRCUNFERENCIAS C ON An.ID_Circunferencias = C.ID_Circunferencias
JOIN Pliegues P ON An.ID_Pliegues = P.ID_Pliegues
JOIN Morfologia M ON An.ID_Morfologia = M.ID_Morfologia;

SELECT * FROM Vista_Registros_Antropometria;

--Vista de planes de entrenamiento
CREATE VIEW Vista_Planes_Entrenamiento AS
SELECT
    A.ID_Atleta,
    A.FN,
    P.Dia1,
    P.Dia2,
    P.Dia3,
    P.Dia4,
    P.Dia5,
    P.Dia6,
    P.Dia7
FROM Atleta A
JOIN Plan P ON A.ID_Plan = P.ID_Plan;

SELECT * FROM Vista_Planes_Entrenamiento;

--Vista de rendimiento deportivo
CREATE VIEW Vista_Rendimiento_Deportivo AS
SELECT
    A.ID_Atleta,
    A.FN,
    R.Distancia,
    R.Tiempo,
    R.Fecha,
    D.Disciplina1 AS Disciplina_Principal,
    D.Tiempo1 AS Tiempo_Disciplina_Principal,
    D.Disciplina2 AS Disciplina_Secundaria,
    D.Tiempo2 AS Tiempo_Disciplina_Secundaria
FROM Atleta A
JOIN Record R ON A.ID_PB = R.ID_Record
JOIN Deporte D ON A.ID_Deporte = D.ID_Deporte;

SELECT * FROM Vista_Rendimiento_Deportivo;

--Ciclos de entrenamiento
CREATE VIEW Vista_Resumen_Ciclos_Entrenamiento AS
SELECT
    A.ID_Atleta,
    A.FN,
    C.Masociclo,
    C.Mesociclo,
    C.Microcilo
FROM Atleta A
JOIN Ciclo C ON A.ID_Ciclo = C.ID_Ciclo;

SELECT * FROM Vista_Resumen_Ciclos_Entrenamiento;
