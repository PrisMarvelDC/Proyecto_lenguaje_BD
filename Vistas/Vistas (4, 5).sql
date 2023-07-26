ALTER SESSION SET CURRENT_SCHEMA = ENTRENADOR;

CREATE OR REPLACE VIEW Vista_Especifico AS
SELECT 
A.ID_Atleta,
E1.Ejercicio AS Ejecicio1,
E2.Ejercicio AS Ejecicio2,
E3.Ejercicio AS Ejecicio3,
E4.Ejercicio AS Ejecicio4,
E5.Ejercicio AS Ejecicio5,
E6.Ejercicio AS Ejecicio6,
E7.Ejercicio AS Ejecicio7,
E8.Ejercicio AS Ejecicio8,
E9.Ejercicio AS Ejecicio9,
E10.Ejercicio AS Ejecicio10
FROM 
Atleta A
LEFT JOIN Especifico E ON A.ID_CCR = E.ID_Especifico
LEFT JOIN EJERCICIOS E1 ON E.Ejercicio1 = E1.ID_Ejercicio
LEFT JOIN EJERCICIOS E2 ON E.Ejercicio2 = E2.ID_Ejercicio
LEFT JOIN EJERCICIOS E3 ON E.Ejercicio3 = E3.ID_Ejercicio
LEFT JOIN EJERCICIOS E4 ON E.Ejercicio4 = E4.ID_Ejercicio
LEFT JOIN EJERCICIOS E5 ON E.Ejercicio5 = E5.ID_Ejercicio
LEFT JOIN EJERCICIOS E6 ON E.Ejercicio6 = E6.ID_Ejercicio
LEFT JOIN EJERCICIOS E7 ON E.Ejercicio7 = E7.ID_Ejercicio
LEFT JOIN EJERCICIOS E8 ON E.Ejercicio8 = E8.ID_Ejercicio
LEFT JOIN EJERCICIOS E7 ON E.Ejercicio9 = E9.ID_Ejercicio
LEFT JOIN EJERCICIOS E8 ON E.Ejercicio10 = E10.ID_Ejercicio;

SELECT * FROM Vista_Especifico;


CREATE OR REPLACE VIEW Vista_Recuperacion AS
SELECT 
A.ID_Atleta,
E1.Ejercicio AS Ejecicio1,
E2.Ejercicio AS Ejecicio2,
E3.Ejercicio AS Ejecicio3,
E4.Ejercicio AS Ejecicio4,
E5.Ejercicio AS Ejecicio5,
E6.Ejercicio AS Ejecicio6
FROM 
Atleta A
LEFT JOIN Recuperacion R ON A.ID_CCR = R.ID_Recuperacion
LEFT JOIN EJERCICIOS E1 ON R.Ejercicio1 = E1.ID_Ejercicio
LEFT JOIN EJERCICIOS E2 ON R.Ejercicio2 = E2.ID_Ejercicio
LEFT JOIN EJERCICIOS E3 ON R.Ejercicio3 = E3.ID_Ejercicio
LEFT JOIN EJERCICIOS E4 ON R.Ejercicio4 = E4.ID_Ejercicio
LEFT JOIN EJERCICIOS E5 ON R.Ejercicio5 = E5.ID_Ejercicio
LEFT JOIN EJERCICIOS E6 ON R.Ejercicio6 = E6.ID_Ejercicio;

SELECT * FROM Recuperacion;


