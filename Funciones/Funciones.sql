--Funciones

--Información del atleta
CREATE OR REPLACE FUNCTION ConsultarInformacionAtleta(p_ID_Atleta INT) RETURN SYS_REFCURSOR AS
result_cursor SYS_REFCURSOR;
BEGIN
OPEN result_cursor FOR
SELECT *
FROM Atleta
WHERE ID_Atleta = p_ID_Atleta;
RETURN result_cursor;
END;
/

DECLARE
  atleta_info SYS_REFCURSOR;
  v_ID_Atleta INT := 1; 
  FN DATE;
  ID_Deporte INT;
  ID_PB INT;
  ID_Ciclo INT;
  ID_Antropometria INT;
  ID_Plan INT;
  ID_CCR INT;
BEGIN
  atleta_info := ConsultarInformacionAtleta(v_ID_Atleta);

  DBMS_OUTPUT.PUT_LINE('Información del Atleta:');
  DBMS_OUTPUT.PUT_LINE('ID_Atleta: ' || v_ID_Atleta);

  LOOP
    FETCH atleta_info INTO v_ID_Atleta, FN, ID_Deporte, ID_PB, ID_Ciclo, ID_Antropometria, ID_Plan, ID_CCR;
    EXIT WHEN atleta_info%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('FN: ' || FN);
    DBMS_OUTPUT.PUT_LINE('ID_Deporte: ' || ID_Deporte);
    DBMS_OUTPUT.PUT_LINE('ID_PB: ' || ID_PB);
    DBMS_OUTPUT.PUT_LINE('ID_Ciclo: ' || ID_Ciclo);
    DBMS_OUTPUT.PUT_LINE('ID_Antropometria: ' || ID_Antropometria);
    DBMS_OUTPUT.PUT_LINE('ID_Plan: ' || ID_Plan);
    DBMS_OUTPUT.PUT_LINE('ID_CCR: ' || ID_CCR);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
  END LOOP;

  CLOSE atleta_info;
END;
/

--Consultar registros de un atleta por fecha
CREATE OR REPLACE FUNCTION ConsultarRegistrosPorFecha(
p_ID_Atleta INT,
p_FechaInicio DATE,
p_FechaFin DATE
) RETURN SYS_REFCURSOR AS
result_cursor SYS_REFCURSOR;
BEGIN
OPEN result_cursor FOR
SELECT *
FROM Registro 
WHERE ID_Atleta = p_ID_Atleta AND Registro BETWEEN p_FechaInicio AND p_FechaFin;
RETURN result_cursor;
END;
/

VAR result_cursor REFCURSOR;
BEGIN
:result_cursor := ConsultarRegistrosPorFecha(1, TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY_MM_DD'));
END;
/

PRINT result_cursor;

--Consultar mejores registros
CREATE OR REPLACE FUNCTION ConsultarMejoresRegistros(
p_Distancia NUMBER
) RETURN SYS_REFCURSOR AS
result_cursor SYS_REFCURSOR;

BEGIN
OPEN result_cursor FOR
SELECT *
FROM Record
WHERE Distancia = p_Distancia
ORDER BY Tiempo ASC;
RETURN result_cursor;
END;
/

VAR result_cursor REFCURSOR;

BEGIN
:result_cursor := ConsultarMEjoresRegistros(10000);
END;
/

PRINT result_cursor;

--Calcular IMC con datos manuales
CREATE OR REPLACE FUNCTION CalcularIMC(
    p_Masa NUMBER,
    p_Altura NUMBER
) RETURN NUMBER AS
    v_IMC NUMBER;
BEGIN
    v_IMC := p_Masa / POWER(p_Altura / 100, 2); 
    RETURN v_IMC;
END;
/

VAR v_result NUMBER;

BEGIN
:v_result := ROUND(CalcularIMC(75, 175), 2);
END;
/

PRINT v_result;

--Consultar ejercicio calentamiento

CREATE OR REPLACE FUNCTION ConsultarEjerciciosCalentamiento(
    p_ID_Calentamiento INT
) RETURN SYS_REFCURSOR AS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT E.ID_Ejercicio, E.Ejercicio, E.Imagen, E.Video
    FROM EJERCICIOS E
    JOIN Calentamiento C ON E.ID_Ejercicio = C.Ejercicio1
                          OR E.ID_Ejercicio = C.Ejercicio2
                          OR E.ID_Ejercicio = C.Ejercicio3
                          OR E.ID_Ejercicio = C.Ejercicio4
                          OR E.ID_Ejercicio = C.Ejercicio5
                          OR E.ID_Ejercicio = C.Ejercicio6
                          OR E.ID_Ejercicio = C.Ejercicio7
                          OR E.ID_Ejercicio = C.Ejercicio8
    WHERE C.ID_Calentamiento = p_ID_Calentamiento;

    RETURN result_cursor;
END;
/

VAR result_cursor REFCURSOR;

BEGIN
:result_cursor := ConsultarEjerciciosCalentamiento(2);
END;
/
PRINT result_cursor;

--Consultar Ejercicios del trabajo específico
CREATE OR REPLACE FUNCTION ConsultarEjerciciosEspecificos(
    p_ID_Especifico INT
) RETURN SYS_REFCURSOR AS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT E.ID_Ejercicio, E.Ejercicio, E.Imagen, E.Video
    FROM EJERCICIOS E
    JOIN Especifico C ON E.ID_Ejercicio = C.Ejercicio1
                          OR E.ID_Ejercicio = C.Ejercicio2
                          OR E.ID_Ejercicio = C.Ejercicio3
                          OR E.ID_Ejercicio = C.Ejercicio4
                          OR E.ID_Ejercicio = C.Ejercicio5
                          OR E.ID_Ejercicio = C.Ejercicio6
                          OR E.ID_Ejercicio = C.Ejercicio7
                          OR E.ID_Ejercicio = C.Ejercicio8
                          OR E.ID_Ejercicio = C.Ejercicio9
                          OR E.ID_Ejercicio = C.Ejercicio10
    WHERE C.ID_Especifico = p_ID_Especifico;

    RETURN result_cursor;
END;
/

VAR result_cursor REFCURSOR;

BEGIN
:result_cursor := ConsultarEjerciciosEspecificos(2);
END;
/
PRINT result_cursor;

--Consultar Ejercicios del trabajo recuperativo
CREATE OR REPLACE FUNCTION ConsultarEjerciciosRecuperacion(
    p_ID_Recuperacion INT
) RETURN SYS_REFCURSOR AS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT E.ID_Ejercicio, E.Ejercicio, E.Imagen, E.Video
    FROM EJERCICIOS E
    JOIN Recuperacion C ON E.ID_Ejercicio = C.Ejercicio1
                          OR E.ID_Ejercicio = C.Ejercicio2
                          OR E.ID_Ejercicio = C.Ejercicio3
                          OR E.ID_Ejercicio = C.Ejercicio4
                          OR E.ID_Ejercicio = C.Ejercicio5
                          OR E.ID_Ejercicio = C.Ejercicio6
    WHERE C.ID_Recuperacion = p_ID_Recuperacion;

    RETURN result_cursor;
END;
/

VAR result_cursor REFCURSOR;

BEGIN
:result_cursor := ConsultarEjerciciosRecuperacion(2);
END;
/
PRINT result_cursor;

--Total de registros de un atleta en tabla registro
CREATE OR REPLACE FUNCTION ObtenerTotalRegistrosAtleta(p_ID_Atleta INT)
RETURN INT IS
  v_Total INT;
BEGIN
  SELECT COUNT(*) INTO v_Total FROM Registro WHERE ID_Atleta = p_ID_Atleta;
  RETURN v_Total;
END;
/

SELECT ObtenerTotalRegistrosAtleta(1) AS TotalRegistros FROM DUAL;


--Obtener el ejercicio de calentamiento más utilizado
CREATE OR REPLACE FUNCTION ObtenerEjercicioCalentamientoMasUsado
RETURN VARCHAR2 IS
v_Ejercicio VARCHAR2(100);
BEGIN
SELECT e.Ejercicio INTO v_Ejercicio
FROM Ejercicios e
JOIN Calentamiento c ON e.ID_Ejercicio = c.Ejercicio1
GROUP BY e.Ejercicio
ORDER BY COUNT(*) DESC
FETCH FIRST ROW ONLY;
RETURN v_Ejercicio;
END;
/

SELECT ObtenerEjercicioCalentamientoMasUsado() AS EjercicioCalentamiento FROM DUAL;

--Obtener el ejercicio de específico más utilizado
CREATE OR REPLACE FUNCTION ObtenerEjercicioEspecificoMasUsado
RETURN VARCHAR2 IS
v_Ejercicio VARCHAR2(100);
BEGIN
SELECT e.Ejercicio INTO v_Ejercicio
FROM Ejercicios e
JOIN Especifico c ON e.ID_Ejercicio = c.Ejercicio1
GROUP BY e.Ejercicio
ORDER BY COUNT(*) DESC
FETCH FIRST ROW ONLY;
RETURN v_Ejercicio;
END;
/

SELECT ObtenerEjercicioEspecificoMasUsado() AS EjercicioEspecifico FROM DUAL;

--Obtener el ejercicio de recuperación más utilizado
CREATE OR REPLACE FUNCTION ObtenerEjercicioRecuperacionMasUsado
RETURN VARCHAR2 IS
v_Ejercicio VARCHAR2(100);
BEGIN
SELECT e.Ejercicio INTO v_Ejercicio
FROM Ejercicios e
JOIN Recuperacion C ON e.ID_Ejercicio = c.Ejercicio1
GROUP BY e.Ejercicio
ORDER BY COUNT(*) DESC
FETCH FIRST ROW ONLY;
RETURN v_Ejercicio;
END;
/

SELECT ObtenerEjercicioRecuperacionMasUsado() AS EjercicioRecuperacion FROM DUAL;

--Calculo de pliegues
CREATE OR REPLACE FUNCTION ObtenerSumaPliegues(p_ID_Antropometria INT)
RETURN NUMBER IS
  v_SumaPliegues NUMBER;
BEGIN
  SELECT p.Bicipital + p.Tricipital + p.Subescapular + p.Abdominal INTO v_SumaPliegues
  FROM Pliegues p
  JOIN Antropometria a ON p.ID_Pliegues = a.ID_Pliegues
  WHERE a.ID_Antropometria = p_ID_Antropometria;
  RETURN v_SumaPliegues;
END;
/

SELECT ObtenerSumaPliegues(1) AS SumaPliiegues FROM DUAL;

--Cantidad de ejercicios de calentamiento
CREATE OR REPLACE FUNCTION ObtenerCantidadEjercioCalentamiento(
p_ID_Ejercicio INT
) RETURN INT IS
v_Cantidad INT;
BEGIN
SELECT COUNT(*) INTO v_Cantidad
FROM Calentamiento c
WHERE c.Ejercicio1 = p_ID_Ejercicio OR c.Ejercicio2 = p_ID_Ejercicio OR c.Ejercicio3 = p_ID_Ejercicio OR 
c.Ejercicio4 = p_ID_Ejercicio OR c.Ejercicio5 = p_ID_Ejercicio OR c.Ejercicio6 = p_ID_Ejercicio OR
c.Ejercicio7 = p_ID_Ejercicio OR c.Ejercicio8 = p_ID_Ejercicio;
RETURN v_Cantidad;
END;
/

SELECT ObtenerCantidadEjercioCalentamiento(1) AS CantidadEjercicioCalentamiento FROM DUAL;

--Cantidad de ejercicios de especifico
CREATE OR REPLACE FUNCTION ObtenerCantidadEjercioEspecifico(
p_ID_Ejercicio INT
) RETURN INT IS
v_Cantidad INT;
BEGIN
SELECT COUNT(*) INTO v_Cantidad
FROM Especifico c
WHERE c.Ejercicio1 = p_ID_Ejercicio OR c.Ejercicio2 = p_ID_Ejercicio OR c.Ejercicio3 = p_ID_Ejercicio OR 
c.Ejercicio4 = p_ID_Ejercicio OR c.Ejercicio5 = p_ID_Ejercicio OR c.Ejercicio6 = p_ID_Ejercicio OR
c.Ejercicio7 = p_ID_Ejercicio OR c.Ejercicio8 = p_ID_Ejercicio;
RETURN v_Cantidad;
END;
/

SELECT ObtenerCantidadEjercioEspecifico(1) AS CantidadEjercicioEspecifico FROM DUAL;

--Cantidad de ejercicios de recuperacion
CREATE OR REPLACE FUNCTION ObtenerCantidadEjercioRecuperacion(
p_ID_Ejercicio INT
) RETURN INT IS
v_Cantidad INT;
BEGIN
SELECT COUNT(*) INTO v_Cantidad
FROM Recuperacion c
WHERE c.Ejercicio1 = p_ID_Ejercicio OR c.Ejercicio2 = p_ID_Ejercicio OR c.Ejercicio3 = p_ID_Ejercicio OR 
c.Ejercicio4 = p_ID_Ejercicio OR c.Ejercicio5 = p_ID_Ejercicio OR c.Ejercicio6 = p_ID_Ejercicio;
RETURN v_Cantidad;
END;
/

SELECT ObtenerCantidadEjercioRecuperacion(2) AS CantidadEjercicioRecuperacion FROM DUAL;