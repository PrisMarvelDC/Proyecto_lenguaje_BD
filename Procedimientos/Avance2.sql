--CRUD(Plan Deportivo, ConContraResistencia, Lateralidad, Calentamiento, Especifico, Recuperacion, Ejercicios)

--CRUD Plan Deportivo

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarPlan(
    p_ID_Plan IN Plan.ID_Plan%TYPE,
    p_Dia1 IN Plan.Dia1%TYPE,
    p_Dia2 IN Plan.Dia2%TYPE,
    p_Dia3 IN Plan.Dia3%TYPE,
    p_Dia4 IN Plan.Dia4%TYPE,
    p_Dia5 IN Plan.Dia5%TYPE,
    p_Dia6 IN Plan.Dia6%TYPE,
    p_Dia7 IN Plan.Dia7%TYPE
) AS
BEGIN
    INSERT INTO Plan (ID_Plan, Dia1, Dia2, Dia3, Dia4, Dia5, Dia6, Dia7)
    VALUES (p_ID_Plan, p_Dia1, p_Dia2, p_Dia3, p_Dia4, p_Dia5, p_Dia6, p_Dia7);
    COMMIT;
END;
/

EXECUTE sp_InsertarPlan(6, 'Velocidades', 'Resistencia', 'Velocidades', 'Resistencia', 'Recuperacion', 'Resistencia', 'Resistencia');

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarPlan (
    p_ID_Plan IN Plan.ID_Plan%TYPE,
    p_Dia1    OUT Plan.Dia1%TYPE,
    p_Dia2   OUT Plan.Dia2%TYPE,
    p_Dia3   OUT Plan.Dia3%TYPE,
    p_Dia4   OUT Plan.Dia4%TYPE,
    p_Dia5   OUT Plan.Dia5%TYPE,
    p_Dia6   OUT Plan.Dia6%TYPE,
    p_Dia7   OUT Plan.Dia7%TYPE
) AS
BEGIN
SELECT Plan, ID_Plan
INTO p_Plan, p_ID_Plan
FROM Plan
WHERE ID_Plan = p_ID_Plan;
END;
/

DECLARE
    v_dia1  Plan.Dia1%TYPE;
    v_dia2 Plan.Dia2%TYPE;
    v_dia3 Plan.Dia3%TYPE;
    v_dia4 Plan.Dia4%TYPE;
    v_dia5 Plan.Dia5%TYPE;
    v_dia6 Plan.Dia6%TYPE;
    v_dia7 Plan.Dia7%TYPE;
BEGIN
    sp_ConsultarPlan(6, v_dia1, v_dia2, v_dia3, v_dia4, v_dia5, v_dia6, v_dia7);
    dbms_output.put_line('Dia1: ' || v_dia1);
    dbms_output.put_line('Dia2: ' || v_dia2);
    dbms_output.put_line('Dia3: ' || v_dia3);
    dbms_output.put_line('Dia4: ' || v_dia4);
    dbms_output.put_line('Dia5: ' || v_dia5);
    dbms_output.put_line('Dia6: ' || v_dia6);
    dbms_output.put_line('Dia7: ' || v_dia7);
    
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_actualizarplan (
    p_ID_Plan IN Plan.ID_Plan%TYPE,
    p_Dia1    IN Plan.Dia1%TYPE,
    p_Dia2   IN Plan.Dia2%TYPE,
    p_Dia3   IN Plan.Dia3%TYPE,
    p_Dia4    IN Plan.Dia4%TYPE,
    p_Dia5   IN Plan.Dia5%TYPE,
    p_Dia6   IN Plan.Dia6%TYPE,
    p_Dia7   IN Plan.Dia7%TYPE
) AS
BEGIN
UPDATE Plan 
SET Dia1 = p_Dia1,
Dia2 = p_Dia2,
Dia3 = p_Dia3,
Dia4 = p_Dia4,
Dia5 = p_Dia5,
Dia6 = p_Dia6,
Dia7 = p_Dia7
WHERE ID_Plan = p_ID_Plan;
COMMIT;
END;
/

EXECUTE sp_actualizarplan(6, 'Recuperacion', 'Con contra resistencia', 'Velocidades', 'Resistencia', 'Recuperacion', 'Velocidades', 'Velocidades');

--Eliminar
CREATE OR REPLACE PROCEDURE sp_eliminarplan (
    p_ID_Plan IN Plan.ID_Plan%TYPE
) AS
BEGIN
DELETE FROM Plan
WHERE ID_Plan = p_ID_Plan;
COMMIT;
END;
/

EXECUTE sp_eliminarplan(6);


--CRUD ConContraResistencia

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarCCR(
    p_ID_CCR IN CCR.ID_CCR%TYPE,
    p_ID_Lateralidad IN CCR.ID_Lateralidad%TYPE,
    p_ID_Calentamiento IN CCR.ID_Calentamiento%TYPE,
    p_ID_Especifico IN CCR.ID_Especifico%TYPE,
    p_ID_Recuperacion IN CCR.ID_Recuperacion%TYPE
) AS
BEGIN
    INSERT INTO CCR (ID_CCR, ID_Lateralidad, ID_Calentamiento, ID_Especifico, ID_Recuperacion)
    VALUES (p_ID_CCR, p_ID_Lateralidad, p_ID_Calentamiento, p_ID_Especifico, p_ID_Recuperacion);
    COMMIT;
END;
/

EXECUTE sp_InsertarCCR(51, 3, 15, 30, 30);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarCCR(
    p_ID_CCR IN CCR.ID_CCR%TYPE,
    p_ID_Lateralidad OUT CCR.ID_Lateralidad%TYPE,
    p_ID_Calentamiento OUT CCR.ID_Calentamiento%TYPE,
    p_ID_Especifico OUT CCR.ID_Especifico%TYPE,
    p_ID_Recuperacion OUT CCR.ID_Recuperacion%TYPE
) AS
BEGIN
    SELECT ID_Lateralidad, ID_Calentamiento, ID_Especifico, ID_Recuperacion
    INTO p_ID_Lateralidad, p_ID_Calentamiento, p_ID_Especifico, p_ID_Recuperacion
    FROM CCR
    WHERE ID_CCR = p_ID_CCR;
END;
/

DECLARE 
v_ID_Lateralidad CCR.ID_Lateralidad%TYPE;
v_ID_Calentamiento CCR.ID_Calentamiento%TYPE;
v_ID_Especifico CCR.ID_Especifico%TYPE;
v_ID_Recuperacion CCR.ID_Recuperacion%TYPE;
BEGIN

sp_ConsultarCCR(51, v_ID_Lateralidad, v_ID_Calentamiento, v_ID_Especifico, v_ID_Recuperacion);

DBMS_OUTPUT.PUT_LINE('ID_Lateralidad: ' || v_ID_Lateralidad);
DBMS_OUTPUT.PUT_LINE('ID_Calentamiento: ' || v_ID_Calentamiento);
DBMS_OUTPUT.PUT_LINE('ID_Especifico: ' || v_ID_Especifico);
DBMS_OUTPUT.PUT_LINE('ID_Recuperacion: ' || v_ID_Recuperacion);

END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarCCR(
    p_ID_CCR IN CCR.ID_CCR%TYPE,
    p_ID_Lateralidad IN CCR.ID_Lateralidad%TYPE,
    p_ID_Calentamiento IN CCR.ID_Calentamiento%TYPE,
    p_ID_Especifico IN CCR.ID_Especifico%TYPE,
    p_ID_Recuperacion IN CCR.ID_Recuperacion%TYPE
) AS
BEGIN
    UPDATE CCR
    SET ID_Lateralidad = p_ID_Lateralidad,
        ID_Calentamiento = p_ID_Calentamiento,
        ID_Especifico = p_ID_Especifico,
        ID_Recuperacion = p_ID_Recuperacion
    WHERE ID_CCR = p_ID_CCR;
    COMMIT;
END;
/

EXECUTE sp_ActualizarCCR(51, 6, 10, 20, 20);

--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarCCR(
p_ID_CCR IN CCR.ID_CCR%TYPE
) AS
BEGIN 
DELETE FROM CCR
WHERE ID_CCR = p_ID_CCR;
COMMIT;
END;
/

EXECUTE sp_EliminarCCR(51);


--CRUD Lateralidad

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarLateralidad(
p_ID_Lateralidad IN Lateralidad.ID_Lateralidad%TYPE,
p_Lateralidad IN Lateralidad.Lateralidad%TYPE
) AS
BEGIN
INSERT INTO Lateralidad (ID_Lateralidad, Lateralidad)
VALUES (p_ID_Lateralidad, p_Lateralidad);
COMMIT;
END;
/

EXECUTE sp_InsertarLateralidad(4, 'Diestro');

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarLateralidad(
p_ID_Lateralidad IN Lateralidad.ID_Lateralidad%TYPE,
p_Lateralidad OUT Lateralidad.Lateralidad%Type
) AS
BEGIN
    SELECT Lateralidad
    INTO  p_Lateralidad
    FROM Lateralidad
    WHERE ID_Lateralidad = p_ID_Lateralidad;
END;
/

DECLARE 
    v_Lateralidad Lateralidad.Lateralidad%TYPE;

BEGIN

sp_ConsultarLateralidad(4, v_Lateralidad);

DBMS_OUTPUT.PUT_LINE('Lateralidad: ' || v_Lateralidad);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarLateralidad(
    p_ID_Lateralidad IN Lateralidad.ID_Lateralidad%TYPE,
    p_Lateralidad IN Lateralidad.Lateralidad%TYPE
) AS
BEGIN
    UPDATE Lateralidad
    SET Lateralidad = p_Lateralidad
    WHERE ID_Lateralidad = p_ID_Lateralidad;
    COMMIT;
END;
/


EXECUTE sp_ActualizarLateralidad(4, 'Ambidiestro');

--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarLateralidad(
p_ID_Lateralidad IN Lateralidad.ID_Lateralidad%TYPE
) AS
BEGIN 
DELETE FROM Lateralidad
WHERE ID_Lateralidad = p_ID_Lateralidad;
COMMIT;
END;
/

EXECUTE sp_EliminarLateralidad(4);


--CRUD Calentamiento

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarCalentamiento(
p_ID_Calentamiento IN Calentamiento.ID_Calentamiento%TYPE,
p_Ejercicio1 IN Calentamiento.Ejercicio1%TYPE,
p_Ejercicio2 IN Calentamiento.Ejercicio2%TYPE,
p_Ejercicio3 IN Calentamiento.Ejercicio3%TYPE,
p_Ejercicio4 IN Calentamiento.Ejercicio4%TYPE,
p_Ejercicio5 IN Calentamiento.Ejercicio5%Type,
p_Ejercicio6 IN Calentamiento.Ejercicio6%TYPE,
p_Ejercicio7 IN Calentamiento.Ejercicio7%TYPE,
p_Ejercicio8 IN Calentamiento.Ejercicio8%TYPE
) AS
BEGIN
INSERT INTO Calentamiento (ID_Calentamiento, Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6, Ejercicio7, Ejercicio8)
VALUES (p_ID_Calentamiento, p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4,  p_Ejercicio5, p_Ejercicio6, p_Ejercicio7, p_Ejercicio8);
COMMIT;
END;
/

EXECUTE sp_InsertarCalentamiento(51,26,17,24,5,3,6,0,0);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarCalentamiento(
p_ID_Calentamiento IN Calentamiento.ID_Calentamiento%TYPE,
p_Ejercicio1 OUT Calentamiento.Ejercicio1%TYPE,
p_Ejercicio2 OUT Calentamiento.Ejercicio2%TYPE,
p_Ejercicio3 OUT Calentamiento.Ejercicio3%TYPE,
p_Ejercicio4 OUT Calentamiento.Ejercicio4%TYPE,
p_Ejercicio5 OUT Calentamiento.Ejercicio5%Type,
p_Ejercicio6 OUT Calentamiento.Ejercicio6%TYPE,
p_Ejercicio7 OUT Calentamiento.Ejercicio7%TYPE,
p_Ejercicio8 OUT Calentamiento.Ejercicio8%TYPE
) AS
BEGIN 
SELECT Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6, Ejercicio7, Ejercicio8
INTO p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4, p_Ejercicio5, p_Ejercicio6, p_Ejercicio7, p_Ejercicio8
FROM Calentamiento
WHERE ID_Calentamiento = p_ID_Calentamiento;
END;
/

DECLARE
    v_Ejercicio1 Calentamiento.Ejercicio1%TYPE;
    v_Ejercicio2 Calentamiento.Ejercicio2%TYPE;
    v_Ejercicio3 Calentamiento.Ejercicio3%TYPE;
    v_Ejercicio4 Calentamiento.Ejercicio4%TYPE;
    v_Ejercicio5 Calentamiento.Ejercicio5%TYPE;
    v_Ejercicio6 Calentamiento.Ejercicio6%TYPE;
    v_Ejercicio7 Calentamiento.Ejercicio7%TYPE;
    v_Ejercicio8 Calentamiento.Ejercicio8%TYPE;
BEGIN

sp_ConsultarCalentamiento(51,v_Ejercicio1, v_Ejercicio2, v_Ejercicio3, v_Ejercicio4, v_Ejercicio5, v_Ejercicio6, v_Ejercicio7, v_Ejercicio8);

DBMS_OUTPUT.PUT_LINE('Ejercicio1: ' || v_Ejercicio1);
DBMS_OUTPUT.PUT_LINE('Ejercicio2:' || v_Ejercicio2);
DBMS_OUTPUT.PUT_LINE('Ejercicio3: ' || v_Ejercicio3);
DBMS_OUTPUT.PUT_LINE('Ejercicio4: ' || v_Ejercicio4);
DBMS_OUTPUT.PUT_LINE('Ejercicio5: ' || v_Ejercicio5);
DBMS_OUTPUT.PUT_LINE('Ejercicio6:' || v_Ejercicio6);
DBMS_OUTPUT.PUT_LINE('Ejercicio7: ' || v_Ejercicio7);
DBMS_OUTPUT.PUT_LINE('Ejercicio8: ' || v_Ejercicio8);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarCalentamiento(
p_ID_Calentamiento IN Calentamiento.ID_Calentamiento%TYPE,
p_Ejercicio1 IN Calentamiento.Ejercicio1%TYPE,
p_Ejercicio2 IN Calentamiento.Ejercicio2%TYPE,
p_Ejercicio3 IN Calentamiento.Ejercicio3%TYPE,
p_Ejercicio4 IN Calentamiento.Ejercicio4%TYPE,
p_Ejercicio5 IN Calentamiento.Ejercicio5%Type,
p_Ejercicio6 IN Calentamiento.Ejercicio6%TYPE,
p_Ejercicio7 IN Calentamiento.Ejercicio7%TYPE,
p_Ejercicio8 IN Calentamiento.Ejercicio8%TYPE
) AS
BEGIN
UPDATE Calentamiento
SET Ejercicio1 = p_Ejercicio1,
Ejercicio2 = p_Ejercicio2,
Ejercicio3 = p_Ejercicio3,
Ejercicio4 = p_Ejercicio4,
Ejercicio5 = p_Ejercicio5,
Ejercicio6 = p_Ejercicio6,
Ejercicio7 = p_Ejercicio7,
Ejercicio8 = p_Ejercicio8
WHERE ID_Calentamiento = p_ID_Calentamiento;
COMMIT;
END;
/

EXECUTE sp_ActualizarCalentamiento(51,23,16,20,4,2,5,3,3);

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarCalentamiento(
p_ID_Calentamiento IN Calentamiento.ID_Calentamiento%TYPE
) AS
BEGIN
DELETE FROM Calentamiento
WHERE ID_Calentamiento = p_ID_Calentamiento;
COMMIT;
END;
/

EXECUTE sp_EliminarCalentamiento(51);

--CRUD Especifico

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarEspecifico(
p_ID_Especifico IN Especifico.ID_Especifico%TYPE,
p_Ejercicio1 IN Especifico.Ejercicio1%TYPE,
p_Ejercicio2 IN Especifico.Ejercicio2%TYPE,
p_Ejercicio3 IN Especifico.Ejercicio3%TYPE,
p_Ejercicio4 IN Especifico.Ejercicio4%TYPE,
p_Ejercicio5 IN Especifico.Ejercicio5%Type,
p_Ejercicio6 IN Especifico.Ejercicio6%TYPE,
p_Ejercicio7 IN Especifico.Ejercicio7%TYPE,
p_Ejercicio8 IN Especifico.Ejercicio8%TYPE,
p_Ejercicio9 IN Especifico.Ejercicio9%TYPE,
p_Ejercicio10 IN Especifico.Ejercicio10%TYPE
) AS
BEGIN
INSERT INTO Especifico (ID_Especifico, Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6, Ejercicio7, Ejercicio8, Ejercicio9, Ejercicio10)
VALUES (p_ID_Especifico, p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4,  p_Ejercicio5, p_Ejercicio6, p_Ejercicio7, p_Ejercicio8, p_Ejercicio9, p_Ejercicio10);
COMMIT;
END;
/

EXECUTE sp_InsertarEspecifico(51,24,13,8,20,2,11,15,22,14,3);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarEspecifico(
p_ID_Especifico IN Especifico.ID_Especifico%TYPE,
p_Ejercicio1 OUT Especifico.Ejercicio1%TYPE,
p_Ejercicio2 OUT Especifico.Ejercicio2%TYPE,
p_Ejercicio3 OUT Especifico.Ejercicio3%TYPE,
p_Ejercicio4 OUT Especifico.Ejercicio4%TYPE,
p_Ejercicio5 OUT Especifico.Ejercicio5%Type,
p_Ejercicio6 OUT Especifico.Ejercicio6%TYPE,
p_Ejercicio7 OUT Especifico.Ejercicio7%TYPE,
p_Ejercicio8 OUT Especifico.Ejercicio8%TYPE,
p_Ejercicio9 OUT Especifico.Ejercicio9%TYPE,
p_Ejercicio10 OUT Especifico.Ejercicio10%TYPE
) AS
BEGIN 
SELECT Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6, Ejercicio7, Ejercicio8, Ejercicio9, Ejercicio10
INTO p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4, p_Ejercicio5, p_Ejercicio6, p_Ejercicio7, p_Ejercicio8, p_Ejercicio9, p_Ejercicio10
FROM Especifico
WHERE ID_Especifico = p_ID_Especifico;
END;
/

DECLARE
    v_Ejercicio1 Especifico.Ejercicio1%TYPE;
    v_Ejercicio2 Especifico.Ejercicio2%TYPE;
    v_Ejercicio3 Especifico.Ejercicio3%TYPE;
    v_Ejercicio4 Especifico.Ejercicio4%TYPE;
    v_Ejercicio5 Especifico.Ejercicio5%TYPE;
    v_Ejercicio6 Especifico.Ejercicio6%TYPE;
    v_Ejercicio7 Especifico.Ejercicio7%TYPE;
    v_Ejercicio8 Especifico.Ejercicio8%TYPE;
    v_Ejercicio9 Especifico.Ejercicio9%TYPE;
    v_Ejercicio10 Especifico.Ejercicio10%TYPE;
BEGIN

sp_ConsultarEspecifico(51,v_Ejercicio1, v_Ejercicio2, v_Ejercicio3, v_Ejercicio4, v_Ejercicio5, v_Ejercicio6, v_Ejercicio7, v_Ejercicio8, v_Ejercicio9, v_Ejercicio10);

DBMS_OUTPUT.PUT_LINE('Ejercicio1: ' || v_Ejercicio1);
DBMS_OUTPUT.PUT_LINE('Ejercicio2:' || v_Ejercicio2);
DBMS_OUTPUT.PUT_LINE('Ejercicio3: ' || v_Ejercicio3);
DBMS_OUTPUT.PUT_LINE('Ejercicio4: ' || v_Ejercicio4);
DBMS_OUTPUT.PUT_LINE('Ejercicio5: ' || v_Ejercicio5);
DBMS_OUTPUT.PUT_LINE('Ejercicio6:' || v_Ejercicio6);
DBMS_OUTPUT.PUT_LINE('Ejercicio7: ' || v_Ejercicio7);
DBMS_OUTPUT.PUT_LINE('Ejercicio8: ' || v_Ejercicio8);
DBMS_OUTPUT.PUT_LINE('Ejercicio9: ' || v_Ejercicio9);
DBMS_OUTPUT.PUT_LINE('Ejercicio10: ' || v_Ejercicio10);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarEspecifico(
p_ID_Especifico IN Especifico.ID_Especifico%TYPE,
p_Ejercicio1 IN Especifico.Ejercicio1%TYPE,
p_Ejercicio2 IN Especifico.Ejercicio2%TYPE,
p_Ejercicio3 IN Especifico.Ejercicio3%TYPE,
p_Ejercicio4 IN Especifico.Ejercicio4%TYPE,
p_Ejercicio5 IN Especifico.Ejercicio5%Type,
p_Ejercicio6 IN Especifico.Ejercicio6%TYPE,
p_Ejercicio7 IN Especifico.Ejercicio7%TYPE,
p_Ejercicio8 IN Especifico.Ejercicio8%TYPE,
p_Ejercicio9 IN Especifico.Ejercicio9%TYPE,
p_Ejercicio10 IN Especifico.Ejercicio10%TYPE
) AS
BEGIN
UPDATE Especifico
SET Ejercicio1 = p_Ejercicio1,
Ejercicio2 = p_Ejercicio2,
Ejercicio3 = p_Ejercicio3,
Ejercicio4 = p_Ejercicio4,
Ejercicio5 = p_Ejercicio5,
Ejercicio6 = p_Ejercicio6,
Ejercicio7 = p_Ejercicio7,
Ejercicio8 = p_Ejercicio8,
Ejercicio9 = p_Ejercicio9,
Ejercicio10 = p_Ejercicio10
WHERE ID_Especifico = p_ID_Especifico;
COMMIT;
END;
/

EXECUTE sp_ActualizarEspecifico(51,22,10,8,10,2,11,16,21,12,2);

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarEspecifico(
p_ID_Especifico IN Especifico.ID_Especifico%TYPE
) AS
BEGIN
DELETE FROM Especifico
WHERE ID_Especifico = p_ID_Especifico;
COMMIT;
END;
/

EXECUTE sp_EliminarEspecifico(51);

--CRUD Recuperacion

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarRecuperacion(
p_ID_Recuperacion IN Recuperacion.ID_Recuperacion%TYPE,
p_Ejercicio1 IN Recuperacion.Ejercicio1%TYPE,
p_Ejercicio2 IN Recuperacion.Ejercicio2%TYPE,
p_Ejercicio3 IN Recuperacion.Ejercicio3%TYPE,
p_Ejercicio4 IN Recuperacion.Ejercicio4%TYPE,
p_Ejercicio5 IN Recuperacion.Ejercicio5%Type,
p_Ejercicio6 IN Recuperacion.Ejercicio6%TYPE
) AS
BEGIN
INSERT INTO Recuperacion (ID_Recuperacion, Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6)
VALUES (p_ID_Recuperacion, p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4,  p_Ejercicio5, p_Ejercicio6);
COMMIT;
END;
/

EXECUTE sp_InsertarRecuperacion(51,2,4,25,6,16,22);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarRecuperacion(
p_ID_Recuperacion IN Recuperacion.ID_Recuperacion%TYPE,
p_Ejercicio1 OUT Recuperacion.Ejercicio1%TYPE,
p_Ejercicio2 OUT Recuperacion.Ejercicio2%TYPE,
p_Ejercicio3 OUT Recuperacion.Ejercicio3%TYPE,
p_Ejercicio4 OUT Recuperacion.Ejercicio4%TYPE,
p_Ejercicio5 OUT Recuperacion.Ejercicio5%Type,
p_Ejercicio6 OUT Recuperacion.Ejercicio6%TYPE
) AS
BEGIN 
SELECT Ejercicio1, Ejercicio2, Ejercicio3, Ejercicio4, Ejercicio5, Ejercicio6
INTO p_Ejercicio1, p_Ejercicio2, p_Ejercicio3, p_Ejercicio4, p_Ejercicio5, p_Ejercicio6
FROM Recuperacion
WHERE ID_Recuperacion = p_ID_Recuperacion;
END;
/

DECLARE
    v_Ejercicio1 Recuperacion.Ejercicio1%TYPE;
    v_Ejercicio2 Recuperacion.Ejercicio2%TYPE;
    v_Ejercicio3 Recuperacion.Ejercicio3%TYPE;
    v_Ejercicio4 Recuperacion.Ejercicio4%TYPE;
    v_Ejercicio5 Recuperacion.Ejercicio5%TYPE;
    v_Ejercicio6 Recuperacion.Ejercicio6%TYPE;
BEGIN

sp_ConsultarRecuperacion(51,v_Ejercicio1, v_Ejercicio2, v_Ejercicio3, v_Ejercicio4, v_Ejercicio5, v_Ejercicio6);

DBMS_OUTPUT.PUT_LINE('Ejercicio1: ' || v_Ejercicio1);
DBMS_OUTPUT.PUT_LINE('Ejercicio2:' || v_Ejercicio2);
DBMS_OUTPUT.PUT_LINE('Ejercicio3: ' || v_Ejercicio3);
DBMS_OUTPUT.PUT_LINE('Ejercicio4: ' || v_Ejercicio4);
DBMS_OUTPUT.PUT_LINE('Ejercicio5: ' || v_Ejercicio5);
DBMS_OUTPUT.PUT_LINE('Ejercicio6:' || v_Ejercicio6);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarRecuperacion(
p_ID_Recuperacion IN Recuperacion.ID_Recuperacion%TYPE,
p_Ejercicio1 IN Recuperacion.Ejercicio1%TYPE,
p_Ejercicio2 IN Recuperacion.Ejercicio2%TYPE,
p_Ejercicio3 IN Recuperacion.Ejercicio3%TYPE,
p_Ejercicio4 IN Recuperacion.Ejercicio4%TYPE,
p_Ejercicio5 IN Recuperacion.Ejercicio5%Type,
p_Ejercicio6 IN Recuperacion.Ejercicio6%TYPE
) AS
BEGIN
UPDATE Recuperacion
SET Ejercicio1 = p_Ejercicio1,
Ejercicio2 = p_Ejercicio2,
Ejercicio3 = p_Ejercicio3,
Ejercicio4 = p_Ejercicio4,
Ejercicio5 = p_Ejercicio5,
Ejercicio6 = p_Ejercicio6
WHERE ID_Recuperacion = p_ID_Recuperacion;
COMMIT;
END;
/

EXECUTE sp_ActualizarRecuperacion(51,1,2,23,3,13,21);

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarRecuperacion(
p_ID_Recuperacion IN Recuperacion.ID_Recuperacion%TYPE
) AS
BEGIN
DELETE FROM Recuperacion
WHERE ID_Recuperacion = p_ID_Recuperacion;
COMMIT;
END;
/

EXECUTE sp_EliminarRecuperacion(51);

--CRUD Ejercicios

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarEjercicios(
p_ID_Ejercicio IN EJERCICIOS.ID_Ejercicio%TYPE,
p_Ejercicio IN EJERCICIOS.Ejercicio%TYPE,
p_Imagen IN EJERCICIOS.Imagen%TYPE,
p_Video IN EJERCICIOS.Video%TYPE
) AS
BEGIN
INSERT INTO EJERCICIOS (ID_Ejercicio, Ejercicio, Imagen, Video)
VALUES (p_ID_Ejercicio, p_Ejercicio, p_Imagen, p_Video);
COMMIT;
END;
/

EXECUTE sp_InsertarEjercicios(26, 'Press pierna');

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarEjercicios(
p_ID_Ejercicio IN EJERCICIOS.ID_Ejercicio%TYPE,
p_Ejercicio OUT EJERCICIOS.Ejercicio%TYPE,
p_Imagen OUT EJERCICIOS.Imagen%TYPE,
p_Video OUT EJERCICIOS.Video%TYPE
) AS
BEGIN 
SELECT Ejercicio, Imagen, Video
INTO p_Ejercicio, p_Imagen, p_Video
FROM EJERCICIOS
WHERE ID_Ejercicio = p_ID_Ejercicio;
END;
/

DECLARE
    v_Ejercicio EJERCICIOS.Ejercicio%TYPE;
    v_Imagen EJERCICIOS.Imagen%TYPE;
    v_Video EJERCICIOS.Video%TYPE;
BEGIN

sp_ConsultarEjercicios(26, v_Ejercicio, v_Imagen, v_Video);

DBMS_OUTPUT.PUT_LINE('Ejercicio: ' || v_Ejercicio);
DBMS_OUTPUT.PUT_LINE('Imagen:' || v_Imagen);
DBMS_OUTPUT.PUT_LINE('Video: ' || v_Video);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarEjercicios(
p_ID_Ejercicio IN EJERCICIOS.ID_Ejercicio%TYPE,
p_Ejercicio IN EJERCICIOS.Ejercicio%TYPE,
p_Imagen IN EJERCICIOS.Imagen%TYPE,
p_Video IN EJERCICIOS.Video%TYPE
) AS
BEGIN
UPDATE EJERCICIOS
SET Ejercicio = p_Ejercicio,
Imagen = p_Imagen,
Video = p_Video
WHERE ID_Ejercicio = p_ID_Ejercicio;
COMMIT;
END;
/

EXECUTE sp_ActualizarEjercicios(26, 'Press pecho');

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarEjercicios(
p_ID_Ejercicio IN EJERCICIOS.ID_Ejercicio%TYPE
) AS
BEGIN
DELETE FROM EJERCICIOS
WHERE ID_Ejercicio = p_ID_Ejercicio;
COMMIT;
END;
/

EXECUTE sp_EliminarEjercicios(26);