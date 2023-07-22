ALTER SESSION SET CURRENT_SCHEMA = ENTRENADOR;

--NOTA: primero se muestra el procedimiento y luego el codigo para ejecutarlo y probarlo

--CRUD Registro

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarRegistro(
    p_ID_Registro IN Registro.ID_Registro%TYPE,
    p_Registro IN Registro.Registro%TYPE,
    p_ID_Atleta IN Registro.ID_Atleta%TYPE
) AS
BEGIN
    INSERT INTO Registro (ID_Registro, Registro, ID_Atleta)
    VALUES (p_ID_Registro, p_Registro, p_ID_Atleta);
    COMMIT;
END;
/

EXECUTE sp_InsertarRegistro(51, SYSTIMESTAMP, 1);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarRegistro (
    p_id_registro IN registro.id_registro%TYPE,
    p_registro    OUT registro.registro%TYPE,
    p_id_atleta   OUT registro.id_atleta%TYPE
) AS
BEGIN
SELECT Registro, ID_Atleta
INTO p_Registro, p_ID_Atleta
FROM Registro
WHERE ID_Registro = p_ID_Registro;
END;
/

DECLARE
    v_registro  registro.registro%TYPE;
    v_id_atleta registro.ID_atleta%TYPE;
BEGIN
    sp_ConsultarRegistro(51, v_registro, v_id_atleta);
    dbms_output.put_line('Registro: ' || v_registro);
    dbms_output.put_line('ID_Atleta: ' || v_id_atleta);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_actualizarregistro (
    p_id_registro IN registro.id_registro%TYPE,
    p_registro    IN registro.registro%TYPE,
    p_id_atleta   IN registro.id_atleta%TYPE
) AS
BEGIN
UPDATE Registro 
SET Registro = p_Registro,
ID_Atleta = p_ID_Atleta
WHERE ID_Registro = p_ID_Registro;
COMMIT;
END;
/

EXECUTE sp_ActualizarRegistro(51, SYSTIMESTAMP, 3);

--Eliminar
CREATE OR REPLACE PROCEDURE sp_eliminarregistro (
    p_id_registro IN registro.id_registro%TYPE
) AS
BEGIN
DELETE FROM Registro
WHERE ID_Registro = p_ID_Registro;
COMMIT;
END;
/

EXECUTE sp_EliminarRegistro(51);

--CRUD Atleta

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarAtleta(
    p_ID_Atleta IN Atleta.ID_Atleta%TYPE,
    p_FN IN Atleta.FN%TYPE,
    p_ID_Deporte IN Atleta.ID_Deporte%TYPE,
    p_ID_PB IN Atleta.ID_PB%TYPE,
    p_ID_Ciclo IN Atleta.ID_Ciclo%TYPE,
    p_ID_Antropometria IN Atleta.ID_Antropometria%TYPE,
    p_ID_Plan IN Atleta.ID_Plan%TYPE,
    p_ID_CCR IN Atleta.ID_CCR%TYPE
) AS
BEGIN
    INSERT INTO Atleta (ID_Atleta, FN, ID_Deporte, ID_PB, ID_Ciclo, ID_Antropometria, ID_Plan, ID_CCR)
    VALUES (p_ID_Atleta, p_FN, p_ID_Deporte, p_ID_PB, p_ID_Ciclo, p_ID_Antropometria, p_ID_Plan, p_ID_CCR);
    COMMIT;
END;
/

EXECUTE sp_InsertarAtleta(51, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 16, 1, 5, 12, 3, 13);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarAtleta(
    p_ID_Atleta IN Atleta.ID_Atleta%TYPE,
    p_FN OUT Atleta.FN%TYPE,
    p_ID_Deporte OUT Atleta.ID_Deporte%TYPE,
    p_ID_PB OUT Atleta.ID_PB%TYPE,
    p_ID_Ciclo OUT Atleta.ID_Ciclo%TYPE,
    p_ID_Antropometria OUT Atleta.ID_Antropometria%TYPE,
    p_ID_Plan OUT Atleta.ID_Plan%TYPE,
    p_ID_CCR OUT Atleta.ID_CCR%TYPE
) AS
BEGIN
    SELECT FN, ID_Deporte, ID_PB, ID_Ciclo, ID_Antropometria, ID_Plan, ID_CCR
    INTO p_FN, p_ID_Deporte, p_ID_PB, p_ID_Ciclo, p_ID_Antropometria, p_ID_Plan, p_ID_CCR
    FROM Atleta
    WHERE ID_Atleta = p_ID_Atleta;
END;
/

DECLARE 
v_FN Atleta.FN%TYPE;
v_ID_Deporte Atleta.ID_Deporte%TYPE;
v_ID_PB Atleta.ID_PB%TYPE;
v_ID_Ciclo Atleta.ID_Ciclo%TYPE;
v_ID_Antropometria Atleta.ID_Antropometria%TYPE;
v_ID_Plan Atleta.ID_Plan%TYPE;
v_ID_CCR Atleta.ID_CCR%TYPE;
BEGIN

sp_ConsultarAtleta(51, v_FN, v_ID_Deporte, v_ID_PB, v_ID_Ciclo, v_ID_Antropometria, v_ID_Plan, v_ID_CCR);

DBMS_OUTPUT.PUT_LINE('FN: ' || v_FN);
DBMS_OUTPUT.PUT_LINE('ID_Deporte: ' || v_ID_Deporte);
DBMS_OUTPUT.PUT_LINE('ID_PB: ' || v_ID_PB);
DBMS_OUTPUT.PUT_LINE('ID_Ciclo: ' || v_ID_Ciclo);
DBMS_OUTPUT.PUT_LINE('ID_Antropometria: ' || v_ID_Antropometria);
DBMS_OUTPUT.PUT_LINE('ID_Plan: ' || v_ID_Plan);
DBMS_OUTPUT.PUT_LINE('ID_CCR' || v_ID_CCR);

END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarAtleta(
    p_ID_Atleta IN Atleta.ID_Atleta%TYPE,
    p_FN IN Atleta.FN%TYPE,
    p_ID_Deporte IN Atleta.ID_Deporte%TYPE,
    p_ID_PB IN Atleta.ID_PB%TYPE,
    p_ID_Ciclo IN Atleta.ID_Ciclo%TYPE,
    p_ID_Antropometria IN Atleta.ID_Antropometria%TYPE,
    p_ID_Plan IN Atleta.ID_Plan%TYPE,
    p_ID_CCR IN Atleta.ID_CCR%TYPE
) AS
BEGIN
    UPDATE Atleta
    SET FN = p_FN,
        ID_Deporte = p_ID_Deporte,
        ID_PB = p_ID_PB,
        ID_Ciclo = p_ID_Ciclo,
        ID_Antropometria = p_ID_Antropometria,
        ID_Plan = p_ID_Plan,
        ID_CCR = p_ID_CCR
    WHERE ID_Atleta = p_ID_Atleta;
    COMMIT;
END;
/

EXECUTE sp_ActualizarAtleta(51, TO_DATE('2021-05-14', 'YYYY-MM-DD'),15, 1, 9, 3, 1, 43);

--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarAtleta(
p_ID_Atleta IN Atleta.ID_Atleta%TYPE
) AS
BEGIN 
DELETE FROM Atleta
WHERE ID_Atleta = p_ID_Atleta;
COMMIT;
END;
/

EXECUTE sp_EliminarAtleta(51);

--CRUD Record

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarRecord(
    p_ID_Record IN Record.ID_Record%TYPE,
    p_Distancia IN Record.Distancia%TYPE,
    p_Tiempo IN Record.Tiempo%TYPE,
    p_Fecha IN Record.Fecha%TYPE
) AS
BEGIN
    INSERT INTO Record (ID_Record, Distancia, Tiempo, Fecha)
    VALUES (p_ID_Record, p_Distancia, p_Tiempo, p_Fecha);
    COMMIT;
END;
/

EXECUTE sp_InsertarRecord(20, 10000, 2015, SYSTIMESTAMP);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarRecord(
    p_ID_Record IN Record.ID_Record%TYPE,
    p_Distancia OUT Record.Distancia%TYPE,
    p_Tiempo OUT Record.Tiempo%TYPE,
    p_Fecha OUT Record.Fecha%TYPE
) AS
BEGIN
    SELECT Distancia, Tiempo, Fecha
    INTO p_Distancia, p_Tiempo, p_Fecha
    FROM Record
    WHERE ID_Record = p_ID_Record;
END;
/

DECLARE 
v_Distancia Record.Distancia%TYPE;
v_Tiempo Record.Tiempo%TYPE;
v_Fecha Record.Fecha%TYPE;

BEGIN

sp_ConsultarRecord(20, v_Distancia, v_Tiempo, v_fecha);

DBMS_OUTPUT.PUT_LINE('Distancia: ' || v_Distancia);
DBMS_OUTPUT.PUT_LINE('Tiempo: ' || v_Tiempo);
DBMS_OUTPUT.PUT_Line('Fecha: ' || v_Fecha);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarRecord(
    p_ID_Record IN Record.ID_Record%TYPE,
    p_Distancia IN Record.Distancia%TYPE,
    p_Tiempo IN Record.Tiempo%TYPE,
    p_Fecha IN Record.Fecha%TYPE
) AS
BEGIN
    UPDATE Record
    SET Distancia = p_Distancia,
        Tiempo = p_Tiempo,
        Fecha = p_Fecha
    WHERE ID_Record = p_ID_Record;
    COMMIT;
END;
/


EXECUTE sp_ActualizarRecord(20, 10000, 2019, SYSTIMESTAMP);


--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarRecord(
p_ID_Record IN Record.ID_Record%TYPE 
) AS
BEGIN 
DELETE FROM Record
WHERE ID_Record = p_ID_Record;
COMMIT;
END;
/

EXECUTE sp_EliminarRecord(20);

--CRUD Deporte

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarDeporte(
p_ID_Deporte IN Deporte.ID_Deporte%TYPE,
p_Disciplina1 IN Deporte.Disciplina1%Type,
p_Tiempo1 IN Deporte.Tiempo1%TYPE,
p_Disciplina2 IN Deporte.Disciplina2%TYPE,
p_Tiempo2 IN Deporte.Tiempo2%TYPE
) AS
BEGIN
INSERT INTO Deporte (ID_Deporte, Disciplina1, Tiempo1, Disciplina2, Tiempo2)
VALUES (p_ID_Deporte, p_Disciplina1, p_Tiempo1, p_Disciplina2, p_Tiempo2);
COMMIT;
END;
/

EXECUTE sp_InsertarDeporte(21, 'Salto Alto', 2,'Relevos', 4);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarDeporte(
p_ID_Deporte IN Deporte.ID_Deporte%TYPE,
p_Disciplina1 OUT Deporte.Disciplina1%Type,
p_Tiempo1 OUT Deporte.Tiempo1%TYPE,
p_Disciplina2 OUT Deporte.Disciplina2%TYPE,
p_Tiempo2 OUT Deporte.Tiempo2%TYPE
) AS
BEGIN 
SELECT Disciplina1, Tiempo1, Disciplina2, Tiempo2
INTO p_Disciplina1, p_Tiempo1, p_Disciplina2, p_Tiempo2
FROM Deporte
WHERE ID_Deporte = p_ID_Deporte;
END;
/

DECLARE
    v_Disciplina1 Deporte.Disciplina1%TYPE;
    v_Tiempo1 Deporte.Tiempo1%TYPE;
    v_Disciplina2 Deporte.Disciplina2%TYPE;
    v_Tiempo2 Deporte.Tiempo2%TYPE;
BEGIN

sp_ConsultarDeporte(21, v_Disciplina1, v_Tiempo1, v_Disciplina2, v_Tiempo2);

DBMS_OUTPUT.PUT_LINE('Disciplina 1: ' || v_Disciplina1);
DBMS_OUTPUT.PUT_LINE('Tiempo 1:' || v_Tiempo1);
DBMS_OUTPUT.PUT_LINE('Disciplina 2: ' || v_Disciplina2);
DBMS_OUTPUT.PUT_LINE('Tiempo 2: ' || v_Tiempo2);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarDeporte(
p_ID_Deporte IN Deporte.ID_Deporte%TYPE,
p_Disciplina1 IN Deporte.Disciplina1%Type,
p_Tiempo1 IN Deporte.Tiempo1%TYPE,
p_Disciplina2 IN Deporte.Disciplina2%TYPE,
p_Tiempo2 IN Deporte.Tiempo2%TYPE
) AS
BEGIN
UPDATE Deporte
SET Disciplina1 = p_Disciplina1,
Tiempo1 = p_Tiempo1,
Disciplina2 = p_Disciplina2,
Tiempo2 = p_Tiempo2
WHERE ID_Deporte = p_ID_Deporte;
COMMIT;
END;
/

EXECUTE sp_ActualizarDeporte(21, 'Salto Largo', 3, 'Relevos',4);

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarDeporte(
p_ID_Deporte IN Deporte.ID_Deporte%TYPE
) AS
BEGIN
DELETE FROM Deporte
WHERE ID_deporte = p_ID_Deporte;
COMMIT;
END;
/

EXECUTE sp_EliminarDeporte(21);

SELECT * FROM Deporte;