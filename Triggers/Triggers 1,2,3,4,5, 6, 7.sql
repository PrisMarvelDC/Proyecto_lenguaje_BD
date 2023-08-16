ALTER SESSION SET CURRENT_SCHEMA = ENTRENADOR;

-- Trigger para calcular IMC

ALTER TABLE Antropometria ADD IMC NUMBER;

CREATE OR REPLACE TRIGGER calcular_IMC
BEFORE INSERT ON Antropometria
FOR EACH ROW
DECLARE
  altura_metros NUMBER;
BEGIN
  altura_metros := :NEW.Altura / 100.0;

  :NEW.IMC := :NEW.Masa / (altura_metros * altura_metros);
END;
/

--Valida ingresos de masa y altura
CREATE OR REPLACE TRIGGER validar_valores_antropometria
BEFORE INSERT OR UPDATE ON Antropometria
FOR EACH ROW
DECLARE
BEGIN
IF :NEW.Masa IS NULL OR :New.Masa <= 0 THEN
RAISE_APPLICATION_ERROR(-20001, 'El valor de masa debe ser positivo y no nulo');
END IF;

IF :NEW.Altura IS NULL OR :NEW.Altura <= 0 THEN
RAISE_APPLICATION_ERROR(-20002, 'El valor de Altura debe ser positivo y no nulo');
END IF;
END;
/

--Actualizar fechas inserción de registros
ALTER TABLE CCR ADD FechaRegistro TIMESTAMP;

CREATE OR REPLACE TRIGGER actualizar_fecha_registro
BEFORE INSERT ON CCR
FOR EACH ROW
BEGIN
  :NEW.FechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER verificar_referencias_ccr
BEFORE INSERT ON CCR
FOR EACH ROW
DECLARE
l_count NUMBER;
c_count NUMBER;
e_count NUMBER;
r_count NUMBER;
BEGIN

  IF :NEW.ID_Lateralidad IS NOT NULL THEN
    SELECT COUNT(*) INTO l_count FROM Lateralidad WHERE ID_Lateralidad = :NEW.ID_Lateralidad;
    IF l_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'La referencia a Lateralidad no es válida.');
    END IF;
  END IF;

  IF :NEW.ID_Calentamiento IS NOT NULL THEN
    SELECT COUNT(*) INTO c_count FROM Calentamiento WHERE ID_Calentamiento = :NEW.ID_Calentamiento;
    IF c_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20004, 'La referencia a Calentamiento no es válida.');
    END IF;
  END IF;

  IF :NEW.ID_Especifico IS NOT NULL THEN
    SELECT COUNT(*) INTO e_count FROM Especifico WHERE ID_Especifico = :NEW.ID_Especifico;
    IF e_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20005, 'La referencia a Especifico no es válida.');
    END IF;
  END IF;

  IF :NEW.ID_Recuperacion IS NOT NULL THEN
    SELECT COUNT(*) INTO r_count FROM Recuperacion WHERE ID_Recuperacion = :NEW.ID_Recuperacion;
    IF r_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20006, 'La referencia a Recuperacion no es válida.');
    END IF;
  END IF;
END;
/

-- Actualizar fecha de Fecha_Record
CREATE OR REPLACE TRIGGER actualizar_fecha_record
BEFORE INSERT ON Record
FOR EACH ROW
BEGIN
:NEW.Fecha := SYSDATE;
END;
/

--Validar de que al menos un día del plan tenga contenido
CREATE OR REPLACE TRIGGER validar_dias_plan
BEFORE INSERT OR UPDATE ON Plan
FOR EACH ROW
BEGIN
IF :NEW.Dia1 IS NULL AND :NEW.Dia2 IS NULL AND : NEW.Dia3 IS NULL AND : NEW.Dia4 IS NULL AND : NEW.Dia5 IS NULL AND : NEW.Dia6 IS NULL AND : NEW.Dia7 IS NULL THEN
RAISE_APPLICATION_ERROR(-20007, 'Debe especificar al menos un día en el plan de entrenamientos');
END IF;
END;
/

--Tiempos en disiciplinas sean validos
CREATE OR REPLACE TRIGGER validar_tiempos_deporte
BEFORE INSERT OR UPDATE ON Deporte
FOR EACH ROW
BEGIN
IF :NEW.Tiempo1 < 0 OR :NEW.Tiempo2 < 0 THEN
RAISE_APPLICATION_ERROR(-20008, 'Los tiempos de disiciplinas no se pueden ser negativos');
END IF;
END;
/

--Verificar fecha de nacimiento
CREATE OR REPLACE TRIGGER validar_fecha_nacimiento_atleta
BEFORE INSERT OR UPDATE ON Atleta
FOR EACH ROW
DECLARE
v_fecha_actual DATE;
v_id_record_exists NUMBER;
BEGIN
SELECT SYSDATE INTO v_fecha_actual FROM DUAL;
IF :NEW.FN > v_fecha_actual THEN
RAISE_APPLICATION_ERROR(-20009, 'La fecha de nacimiento no puede ser posterior a la fecha actual');
END IF;

SELECT COUNT(*) INTO v_id_record_exists FROM Record WHERE ID_Record = :NEW.ID_PB;
IF :NEW.ID_PB IS NOT NULL AND v_id_record_exists = 0 THEN
RAISE_APPLICATION_ERROR(-20010, 'La referencia al ID_Record no es válida.');
END IF;
END;
/

--Verficar edad
CREATE OR REPLACE TRIGGER Verificar_Edad
BEFORE INSERT ON Atleta
FOR EACH ROW
BEGIN
  IF MONTHS_BETWEEN(SYSDATE, :NEW.FN) < 216 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El atleta debe ser mayor de 18 años.');
  END IF;
END;
/

--Verficar circunferencias positivas
CREATE OR REPLACE TRIGGER Verificar_Circunferencias
BEFORE INSERT OR UPDATE ON CIRCUNFERENCIAS
FOR EACH ROW
BEGIN
  IF :NEW.BicepsRej <= 0 OR :NEW.BicepsCont <= 0 OR :NEW.Muneca <= 0 OR
     :NEW.Antebrazo <= 0 OR :NEW.Pecho <= 0 OR :NEW.Cintura <= 0 OR
     :NEW.Cadera <= 0 OR :NEW.MusloRej <= 0 OR :NEW.MusloCont <= 0 OR
     :NEW.Pantorrilla <= 0 OR :NEW.Tobillo <= 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Los valores deben ser mayores a 0 en la tabla CIRCUNFERENCIAS.');
  END IF;
END;
/

--Verificar antropometria positivas
CREATE OR REPLACE TRIGGER Verificar_Antropometria
BEFORE INSERT OR UPDATE ON Antropometria
FOR EACH ROW
BEGIN
  IF :NEW.Masa <= 0 OR :NEW.Altura <= 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Los valores deben ser mayores a 0 en la tabla Antropometria.');
  END IF;
END;
/

--Verificar pliegues positivos
CREATE OR REPLACE TRIGGER Verificar_Pliegues
BEFORE INSERT OR UPDATE ON Pliegues
FOR EACH ROW
BEGIN
  IF :NEW.Bicipital <= 0 OR :NEW.Tricipital <= 0 OR :NEW.Subescapular <= 0 OR
     :NEW.Abdominal <= 0 OR :NEW.Supraespinal <= 0 OR :NEW.Suprailiaco <= 0 OR
     :NEW.Cuadricipal <= 0 OR :NEW.Peroneal <= 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Los valores deben ser mayores a 0 en la tabla Pliegues.');
  END IF;
END;
/

--Verificación de datos de Atleta
CREATE OR REPLACE TRIGGER Verificar_Null_Atleta
BEFORE INSERT OR UPDATE ON Atleta
FOR EACH ROW
BEGIN
  IF :NEW.FN IS NULL OR :NEW.ID_Deporte IS NULL OR :NEW.ID_PB IS NULL OR
     :NEW.ID_Ciclo IS NULL OR :NEW.ID_Antropometria IS NULL OR :NEW.ID_Plan IS NULL OR
     :NEW.ID_CCR IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permiten valores NULL en la tabla Atleta.');
  END IF;
END;
/

--Creación de ID unico en cada ciclo
CREATE SEQUENCE SEQ_CICLO;

CREATE OR REPLACE TRIGGER Asignar_ID_Ciclo
BEFORE INSERT ON Ciclo
FOR EACH ROW
BEGIN
  :NEW.ID_Ciclo := SEQ_Ciclo.NEXTVAL;
END;
/

--Verificación de referencias de deporte
CREATE OR REPLACE TRIGGER Verificar_Referencias_Deporte
BEFORE DELETE ON Deporte
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM Atleta WHERE ID_Deporte = :OLD.ID_Deporte;
  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede eliminar el deporte porque está siendo referenciado por la tabla Atleta.');
  END IF;
END;
/

--
CREATE OR REPLACE TRIGGER Evitar_Borrado_Con_Registro
BEFORE DELETE ON Atleta
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM Registro
  WHERE ID_Atleta = :OLD.ID_Atleta;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede eliminar el atleta porque tiene registros en la tabla Registro.');
  END IF;
END;
/


