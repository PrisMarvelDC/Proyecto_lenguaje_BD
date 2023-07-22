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



