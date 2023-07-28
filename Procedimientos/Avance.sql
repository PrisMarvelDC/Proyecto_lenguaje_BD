--CRUD(Ciclo, Antropometria, Circunferencias, Pliegues, Morfologia)

--CRUD Ciclo

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarCiclo(
    p_ID_Ciclo IN Ciclo.ID_Ciclo%TYPE,
    p_Masociclo IN Ciclo.Masociclo%TYPE,
    p_Mesociclo IN Ciclo.Mesociclo%TYPE,
    p_Microciclo IN Ciclo.Microciclo%TYPE
) AS
BEGIN
    INSERT INTO Ciclo (ID_Ciclo, Masociclo, Mesociclo, Microciclo)
    VALUES (p_ID_Ciclo, p_Masociclo, p_Mesociclo, p_Microciclo);
    COMMIT;
END;
/

EXECUTE sp_InsertarCiclo(10, 'Rehabilitatorio', 'Destreza basica', 'Re aprendizaje y fortalecimiento');

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarCiclo (
    p_id_ciclo IN ciclo.id_ciclo%TYPE,
    p_masociclo    OUT ciclo.masociclo%TYPE,
    p_mesociclo   OUT ciclo.mesociclo%TYPE,
    p_microciclo   OUT ciclo.microciclo%TYPE
) AS
BEGIN
SELECT Ciclo, ID_Ciclo
INTO p_Ciclo, p_ID_Ciclo
FROM Ciclo
WHERE ID_Ciclo = p_ID_Ciclo;
END;
/

DECLARE
    v_masociclo  ciclo.masociclo%TYPE;
    v_mesociclo ciclo.mesociclo%TYPE;
    v_microciclo ciclo.microciclo%TYPE;
BEGIN
    sp_ConsultarCiclo(10, v_masociclo, v_mesociclo, v_microciclo);
    dbms_output.put_line('Masociclo: ' || v_masociclo);
    dbms_output.put_line('Mesociclo: ' || v_mesociclo);
    dbms_output.put_line('Microciclo: ' || v_microciclo);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_actualizarciclo (
    p_id_ciclo IN ciclo.id_ciclo%TYPE,
    p_masociclo    IN ciclo.masociclo%TYPE,
    p_mesociclo   IN ciclo.mesocicloTYPE,
    p_microciclo   IN ciclo.microciclo%TYPE
) AS
BEGIN
UPDATE Ciclo 
SET Masociclo = p_Masociclo,
Mesociclo = p_Mesociclo,
Microcilo = p_Microcilo
WHERE ID_Ciclo = p_ID_Ciclo;
COMMIT;
END;
/

EXECUTE sp_actualizarciclo(10, 'Recuperacion', 'Fortalecimiento', 'Resistencia a la fuerza');


--Eliminar
CREATE OR REPLACE PROCEDURE sp_eliminarciclo (
    p_id_ciclo IN ciclo.id_ciclo%TYPE
) AS
BEGIN
DELETE FROM Ciclo
WHERE ID_Ciclo = p_ID_Ciclo;
COMMIT;
END;
/

EXECUTE sp_eliminarciclo(10);


--CRUD Antropometria

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarAntropometria(
    p_ID_Antropometria IN Antropometria.ID_Antropometria%TYPE,
    p_Masa IN Antropometria.Masa%TYPE,
    p_Altura IN Antropometria.Altura%TYPE,
    p_Observaciones IN Antropometria.Observaciones%TYPE,
    p_ID_Circunferencias IN Antropometria.ID_Circunferencias%TYPE,
    p_ID_Pliegues IN Antropometria.ID_Pliegues%TYPE,
    p_ID_Morfologia IN Antropometria.ID_Morfologia%TYPE
) AS
BEGIN
    INSERT INTO Antropometria (ID_Antropometria, Masa, Altura, Observaciones, ID_Circunferencias, ID_Pliegues, ID_Morfologia)
    VALUES (p_ID_Antropometria, p_Masa, p_Altura, p_Observaciones, p_ID_Circunferencias, p_ID_Pliegues, p_ID_Morfologia);
    COMMIT;
END;
/

EXECUTE sp_InsertarAntropometria(51, 73.35, 164.62, 'Hablar con entrenador', 3, 15, 2);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarAntropometria(
    p_ID_Antropometria IN Antropometria.ID_Antropometria%TYPE,
    p_Masa OUT Antropometria.Masa%TYPE,
    p_Altura OUT Antropometria.Altura%TYPE,
    p_Observaciones OUT Antropometria.Observaciones%TYPE,
    p_ID_Circunferencias OUT Antropometria.ID_Circunferencias%TYPE,
    p_ID_Pliegues OUT Antropometria.ID_Pliegues%TYPE,
    p_ID_Morfologia OUT Antropometria.ID_Morfologia%TYPE
) AS
BEGIN
    SELECT Masa, Altura, Observaciones, ID_Circunferencias, ID_Pliegues, ID_Morfologia
    INTO p_Masa, p_Altura, p_Observaciones, p_ID_Circunferencias, p_ID_Pliegues, p_ID_Morfologia
    FROM Antropometria
    WHERE ID_Antropometria = p_ID_Antropometria;
END;
/

DECLARE 
v_Masa Antropometria.Masa%TYPE;
v_Altura Antropometria.Altura%TYPE;
v_Observaciones Antropometria.Observaciones%TYPE;
v_ID_Circunferencias Antropometria.ID_Circunferencias%TYPE;
v_ID_Pliegues Antropometria.ID_Pliegues%TYPE;
v_ID_Morfologia Antropometria.ID_Morfologia%TYPE;
BEGIN

sp_ConsultarAtleta(51, v_Masa, v_Altura, v_Observaciones, v_ID_Circunferencias, v_ID_Pliegues, v_ID_Morfologia);

DBMS_OUTPUT.PUT_LINE('Masa: ' || v_Masa);
DBMS_OUTPUT.PUT_LINE('Altura: ' || v_Altura);
DBMS_OUTPUT.PUT_LINE('Observaciones: ' || v_Observaciones);
DBMS_OUTPUT.PUT_LINE('ID_Circunferencias: ' || v_ID_Circunferencias);
DBMS_OUTPUT.PUT_LINE('ID_Pliegues: ' || v_ID_Pliegues);
DBMS_OUTPUT.PUT_LINE('ID_Morfologia: ' || v_ID_Morfologia);

END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarAntropometria(
    p_ID_Antropometria IN Antropometria.ID_Antropometria%TYPE,
    p_Masa IN Antropometria.Masa%TYPE,
    p_Altura IN Antropometria.Altura%TYPE,
    p_Observaciones IN Antropometria.Observaciones%TYPE,
    p_ID_Circunferencias IN Antropometria.ID_Circunferencias%TYPE,
    p_ID_Pliegues IN Antropometria.ID_Pliegues%TYPE,
    p_ID_Morfologia IN Antropometria.ID_Morfologia%TYPE
) AS
BEGIN
    UPDATE Antropometria
    SET Masa = p_Masa,
        Altura = p_Altura,
        Observaciones = p_Observaciones,
        ID_Circunferencias = p_ID_Circunferencias,
        ID_Pliegues = p_ID_Pliegues,
        ID_Morfologia = p_ID_Morfologia
    WHERE ID_Antropometria = p_ID_Antropometria;
    COMMIT;
END;
/

EXECUTE sp_ActualizarAntropometria(51, 74.35, 166.62, 'Hablar con entrenador', 2, 7, 3);

--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarAntropometria(
p_ID_Antropometria IN Antropometria.ID_Antropometria%TYPE
) AS
BEGIN 
DELETE FROM Antropometria
WHERE ID_Antropometria = p_ID_Antropometria;
COMMIT;
END;
/

EXECUTE sp_EliminarAntropometria(51);


--CRUD Circunferencias

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarCircunferencias(
p_ID_Circunferencias IN Circunferencias.ID_Circunferencias%TYPE,
p_BicepsRej IN Circunferencias.BicepsRej%Type,
p_BicepsCont IN Circunferencias.BicepsCont%TYPE,
p_Muneca IN Circunferencias.Muneca%TYPE,
p_Antebrazo IN Circunferencias.Antebrazo%TYPE,
p_Pecho IN Circunferencias.Pecho%Type,
p_Cintura IN Circunferencias.Cintura%TYPE,
p_Cadera IN Circunferencias.Cadera%TYPE,
p_MusloRej IN Circunferencias.MusloRej%TYPE,
p_MusloCont IN Circunferencias.MusloCont%TYPE,
p_Pantorrilla IN Circunferencias.Pantorrilla%TYPE,
p_Tobillo IN Circunferencias.Tobillo%TYPE
) AS
BEGIN
INSERT INTO Circunferencias (ID_Circunferencias, BicepsRej, BicepsCont, Muneca, Antebrazo, Pecho, Cintura, Cadera, MusloRej, MusloCont, Pantorrilla, Tobillo)
VALUES (p_ID_Circunferencias, p_BicepsRej, p_BicepsCont, p_Muneca, p_Antebrazo,  p_Pecho, p_Cintura, p_Cadera, p_MusloRej, p_MusloCont, p_Pantorrilla, p_Tobillo);
COMMIT;
END;
/

EXECUTE sp_InsertarCircunferencias(21, 19.19, 30.18, 26.37, 37.89, 52.69, 32.03, 177.64, 67.73, 82.48, 36.40, 38.09);


--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarCircunferencias(
p_ID_Circunferencias IN Circunferencias.ID_Circunferencias%TYPE,
p_BicepsRej OUT Circunferencias.BicepsRej%Type,
p_BicepsCont OUT Circunferencias.BicepsCont%TYPE,
p_Muneca OUT Circunferencias.Muneca%TYPE,
p_Antebrazo OUT Circunferencias.Antebrazo%TYPE,
p_Pecho OUT Circunferencias.Pecho%Type,
p_Cintura OUT Circunferencias.Cintura%TYPE,
p_Cadera OUT Circunferencias.Cadera%TYPE,
p_MusloRej OUT Circunferencias.MusloRej%TYPE,
p_MusloCont OUT Circunferencias.MusloCont%TYPE,
p_Pantorrilla OUT Circunferencias.Pantorrilla%TYPE,
p_Tobillo OUT Circunferencias.Tobillo%TYPE
) AS
BEGIN
    SELECT BicepsRej, BicepsCont, Muneca, Antebrazo, Pecho, Cintura, Cadera, MusloRej, MusloCont, Pantorrilla, Tobillo
    INTO  p_BicepsRej, p_BicepsCont, p_Muneca, p_Antebrazo,  p_Pecho, p_Cintura, p_Cadera, p_MusloRej, p_MusloCont, p_Pantorrilla, p_Tobillo
    FROM Circunferencias
    WHERE ID_Circunferencias = p_ID_Circunferencias;
END;
/

DECLARE 
    V_BicepsRej Circunferencias.BicepsRej%TYPE;
    v_BicepsCont Circunferencias.BicepsCont%TYPE;
    v_Muneca Circunferencias.Muneca%TYPE;
    v_Antebrazo Circunferencias.Antebrazo%TYPE;
    v_Pecho Circunferencias.Pecho%TYPE;
    v_Cintura Circunferencias.Cintura%TYPE;
    v_Cadera Circunferencias.Cadera%TYPE;
    v_MusloRej Circunferencias.MusloRej%TYPE;
    v_MusloCont Circunferencias.MusloCont%TYPE;
    v_Pantorrilla Circunferencias.Pantorrilla%TYPE;
    v_Tobillo Circunferencias.Tobillo%TYPE;

BEGIN

sp_ConsultarCircunferencias(21, V_BicepsRej, v_BicepsCont, v_Muneca, v_Antebrazo, v_Pecho, v_Cintura, v_Cadera, v_MusloRej, v_MusloCont, v_Pantorrilla, v_Tobillo);

DBMS_OUTPUT.PUT_LINE('BicepsRej: ' || V_BicepsRej);
DBMS_OUTPUT.PUT_LINE('BicepsCont:' || v_BicepsCont);
DBMS_OUTPUT.PUT_LINE('Muneca: ' || v_Muneca);
DBMS_OUTPUT.PUT_LINE('Antebrazo: ' || v_Antebrazo);
DBMS_OUTPUT.PUT_LINE('Pecho: ' || v_Pecho);
DBMS_OUTPUT.PUT_LINE('Cintura:' || v_Cintura);
DBMS_OUTPUT.PUT_LINE('Cadera: ' || v_Cadera);
DBMS_OUTPUT.PUT_LINE('MusloRej: ' || v_MusloRej);
DBMS_OUTPUT.PUT_LINE('MusloCont:' || v_MusloCont);
DBMS_OUTPUT.PUT_LINE('Pantorrilla: ' || v_Pantorrilla);
DBMS_OUTPUT.PUT_LINE('Tobillo: ' || v_Tobillo);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarCircunferencias(
    p_ID_Circunferencias IN Circunferencias.ID_Circunferencias%TYPE,
    p_BicepsRej IN Circunferencias.BicepsRej%Type,
    p_BicepsCont IN Circunferencias.BicepsCont%TYPE,
    p_Muneca IN Circunferencias.Muneca%TYPE,
    p_Antebrazo IN Circunferencias.Antebrazo%TYPE,
    p_Pecho IN Circunferencias.Pecho%Type,
    p_Cintura IN Circunferencias.Cintura%TYPE,
    p_Cadera IN Circunferencias.Cadera%TYPE,
    p_MusloRej IN Circunferencias.MusloRej%TYPE,
    p_MusloCont IN Circunferencias.MusloCont%TYPE,
    p_Pantorrilla IN Circunferencias.Pantorrilla%TYPE,
    p_Tobillo IN Circunferencias.Tobillo%TYPE
) AS
BEGIN
    UPDATE Circunferencias
    SET BicepsRej = p_BicepsRej,
        BicepsCont = p_BicepsCont,
        Muneca = p_Muneca,
        Antebrazo = p_Antebrazo,
        Pecho = p_Pecho,
        Cintura = p_Cintura,
        Cadera = p_Cadera,
        MusloRej = p_MusloRej,
        MusloCont = p_MusloCont,
        Pantorrilla = p_Pantorrilla,
        Tobillo = p_Tobillo
    WHERE ID_Circunferencias = p_ID_Circunferencias;
    COMMIT;
END;
/


EXECUTE sp_ActualizarCircunferencias(21, 18.18, 32.18, 27.37, 47.89, 62.69, 35.03, 199.64, 56.73, 88.48, 46.40, 48.09);


--Eliminar
CREATE OR REPLACE PROCEDURE sp_EliminarCircunferencias(
p_ID_Circunferencias IN Circunferencias.ID_Circunferencias%TYPE 
) AS
BEGIN 
DELETE FROM Circunferencias
WHERE ID_Circunferencias = p_ID_Circunferencias;
COMMIT;
END;
/

EXECUTE sp_EliminarCircunferencias(21);


--CRUD Pliegues

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarPliegues(
p_ID_Pliegues IN Pliegues.ID_Pliegues%TYPE,
p_Bicipital IN Pliegues.Bicipital%Type,
p_Tricipital IN Pliegues.Tricipital%TYPE,
p_Subescapular IN Pliegues.Subescapular%TYPE,
p_Abdominal IN Pliegues.Abdominal%TYPE,
p_Supraespinal IN Pliegues.Supraespinal%Type,
p_Suprailiaco IN Pliegues.Suprailiaco%TYPE,
p_Cuadricipal IN Pliegues.Cuadricipal%TYPE,
p_Peroneal IN Pliegues.Peroneal%TYPE
) AS
BEGIN
INSERT INTO Pliegues (ID_Pliegues, Bicipital, Tricipital, Subescapular, Abdominal, Supraespinal, Suprailiaco, Cuadricipal, Peroneal)
VALUES (p_ID_Pliegues, p_Bicipital, p_Tricipital, p_Subescapular, p_Abdominal,  p_Supraespinal, p_Suprailiaco, p_Cuadricipal, p_Peroneal);
COMMIT;
END;
/

EXECUTE sp_InsertarPliegues(21, 16.80, 8.30, 5.80, 5.80, 6.60, 7.50, 20.80, 18.60);

--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarPliegues(
p_ID_Pliegues IN Pliegues.ID_Pliegues%TYPE,
p_Bicipital OUT Pliegues.Bicipital%Type,
p_Tricipital OUT Pliegues.Tricipital%TYPE,
p_Subescapular OUT Pliegues.Subescapular%TYPE,
p_Abdominal OUT Pliegues.Abdominal%TYPE,
p_Supraespinal OUT Pliegues.Supraespinal%Type,
p_Suprailiaco OUT Pliegues.Suprailiaco%TYPE,
p_Cuadricipal OUT Pliegues.Cuadricipal%TYPE,
p_Peroneal OUT Pliegues.Peroneal%TYPE
) AS
BEGIN 
SELECT Bicipital, Tricipital, Subescapular, Abdominal, Supraespinal, Suprailiaco, Cuadricipal, Peroneal
INTO p_Bicipital, p_Tricipital, p_Subescapular, p_Abdominal, p_Supraespinal, p_Suprailiaco, p_Cuadricipal, p_Peroneal
FROM Pliegues
WHERE ID_Pliegues = p_ID_Pliegues;
END;
/

DECLARE
    v_Bicipital Pliegues.Bicipital%TYPE;
    v_Tricipital Pliegues.Tricipital%TYPE;
    v_Subescapular Pliegues.Subescapular%TYPE;
    v_Abdominal Pliegues.Abdominal%TYPE;
    v_Supraespinal Pliegues.Supraespinal%TYPE;
    v_Suprailiaco Pliegues.Suprailiaco%TYPE;
    v_Cuadricipal Pliegues.Cuadricipal%TYPE;
    v_Peroneal Pliegues.Peroneal%TYPE;
BEGIN

sp_ConsultarPliegues(21,v_Bicipital, v_Tricipital, v_Subescapular, v_Abdominal, v_Supraespinal, v_Suprailiaco, v_Cuadricipal, v_Peroneal);

DBMS_OUTPUT.PUT_LINE('Bicipital: ' || v_Bicipital);
DBMS_OUTPUT.PUT_LINE('Tricipital:' || v_Tricipital);
DBMS_OUTPUT.PUT_LINE('Subescapular: ' || v_Subescapular);
DBMS_OUTPUT.PUT_LINE('Abdominal: ' || v_Abdominal);
DBMS_OUTPUT.PUT_LINE('Supraespinal: ' || v_Supraespinal);
DBMS_OUTPUT.PUT_LINE('Suprailiaco:' || v_Suprailiaco);
DBMS_OUTPUT.PUT_LINE('Cuadricipal: ' || v_Cuadricipal);
DBMS_OUTPUT.PUT_LINE('Peroneal: ' || v_Peroneal);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_ActualizarPliegues(
p_ID_Pliegues IN Pliegues.ID_Pliegues%TYPE,
p_Bicipital IN Pliegues.Bicipital%Type,
p_Tricipital IN Pliegues.Tricipital%TYPE,
p_Subescapular IN Pliegues.Subescapular%TYPE,
p_Abdominal IN Pliegues.Abdominal%TYPE,
p_Supraespinal IN Pliegues.Supraespinal%Type,
p_Suprailiaco IN Pliegues.Suprailiaco%TYPE,
p_Cuadricipal IN Pliegues.Cuadricipal%TYPE,
p_Peroneal IN Pliegues.Peroneal%TYPE
) AS
BEGIN
UPDATE Pliegues
SET Bicipital = p_Bicipital,
Tricipital = p_Tricipital,
Subescapular = p_Subescapular,
Abdominal = p_Abdominal,
Supraespinal = p_Supraespinal,
Suprailiaco = p_Suprailiaco,
Cuadricipal = p_Cuadricipal,
Peroneal = p_Peroneal
WHERE ID_Pliegues = p_ID_Pliegues;
COMMIT;
END;
/

EXECUTE sp_ActualizarPliegues(21, 17.80, 9.30, 3.80, 4.80, 8.60, 8.50, 26.80, 20.60);

--Elimianr
CREATE OR REPLACE PROCEDURE sp_EliminarPliegues(
p_ID_Pliegues IN Pliegues.ID_Pliegues%TYPE
) AS
BEGIN
DELETE FROM Pliegues
WHERE ID_Pliegues = p_ID_Pliegues;
COMMIT;
END;
/

EXECUTE sp_EliminarPliegues(21);


--CRUD Morfologia

--Insertar
CREATE OR REPLACE PROCEDURE sp_InsertarMorfologia(
    p_ID_Morfologia IN Morfologia.ID_Morfologia%TYPE,
    p_Clasificacion IN Morfologia.Clasificacion%TYPE
) AS
BEGIN
    INSERT INTO Morfologia (ID_Morfologia, Clasificacion)
    VALUES (p_ID_Morfologia, p_Clasificacion);
    COMMIT;
END;
/

EXECUTE sp_InsertarMorfologia(7, 'Equilibrado');


--Ver
CREATE OR REPLACE PROCEDURE sp_ConsultarMorfologia (
    p_id_morfologia IN morfologia.id_morfologia%TYPE,
    p_clasificacion    OUT morfologia.clasificacion%TYPE
) AS
BEGIN
SELECT Morfologia, ID_Morfologia
INTO p_Morfologia, p_ID_Morfologia
FROM Morfologia
WHERE ID_Morfologia = p_ID_Morfologia;
END;
/

DECLARE
    v_clasificacion  morfologia.clasificacion%TYPE;
BEGIN
    sp_ConsultarMorfologia(7, v_clasificacion);
    dbms_output.put_line('Clasificacion: ' || v_clasificacion);
END;
/

--Modificar
CREATE OR REPLACE PROCEDURE sp_actualizarmorfologia (
    p_id_morfologia IN morfologia.id_morfologia%TYPE,
    p_clasificacion    IN morfologia.clasificacion%TYPE
) AS
BEGIN
UPDATE Morfologia 
SET Clasificacion = p_clasificacion
WHERE ID_Morfologia = p_ID_Morfologia;
COMMIT;
END;
/

EXECUTE sp_actualizarmorfologia(7, 'Endoformico');

--Eliminar
CREATE OR REPLACE PROCEDURE sp_eliminarmorfologia (
    p_id_morfologia IN morfologia.id_morfologia%TYPE
) AS
BEGIN
DELETE FROM Morfologia
WHERE ID_Morfologia = p_ID_Morfologia;
COMMIT;
END;
/

EXECUTE sp_eliminarmorfologia(7);
