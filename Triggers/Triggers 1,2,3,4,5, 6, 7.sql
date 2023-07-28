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