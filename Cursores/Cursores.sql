--Cursor Promedio De Masa Corporal --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_mc
AS
	CURSOR DATOS IS SELECT Masa FROM Antropometria;

	Masa NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Masa;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Masa;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL;
    END IF;

  CLOSE c_mi_cursor;
  
  DBMS_OUTPUT.PUT_LINE('El promedio de masa corporal es: ' || Promedio);
    
END;

EXEC cursor_mc;

--Cursor Desviacion estandar de masa corporal --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_de_mc
AS
	CURSOR DATOS IS SELECT Masa FROM Antropometria;

	Masa NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
    Cuadrados NUMBER :=0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Masa;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Masa;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL;
    END IF;

  CLOSE cursor_de_mc;
  OPEN cursor_de_mc;
  
  LOOP
    FETCH cursor_de_mc INTO Masa;
    EXIT WHEN DATOS%NOTFOUND;
    Cuadrados := Cuadrados + POWER(Masa - Promedio, 2);
  END LOOP;

  DECLARE
    Desviacion NUMBER;
  BEGIN
    IF v_count > 1 THEN
      Desviacion := SQRT(Cuadrados / (Contador - 1));
    END IF;

  DBMS_OUTPUT.PUT_LINE('La desviación estándar de la masa corporal es: ' || Desviacion);
  
END;

CLOSE cursor_de_mc;

EXEC cursor_de_mc;

--Cursor Altura --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_altura
AS
	CURSOR DATOS IS SELECT Altura FROM Antropometria;

	Altura NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Altura;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Altura;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL; 
    END IF;

  CLOSE cursor_altura;
  
  DBMS_OUTPUT.PUT_LINE('El promedio de altura es: ' || Promedio);
    
END;

EXEC cursor_altura;


--Cursor Desviacion estandar de altura --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_de_altura
AS
	CURSOR DATOS IS SELECT Altura FROM Antropometria;

	Altura NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
    Cuadrados NUMBER :=0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Altura;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Altura;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL;
    END IF;

  CLOSE cursor_de_altura;
  OPEN cursor_de_altura;
  
  LOOP
    FETCH cursor_de_altura INTO Altura;
    EXIT WHEN DATOS%NOTFOUND;
    Cuadrados := Cuadrados + POWER(Altura - Promedio, 2);
  END LOOP;

  DECLARE
    Desviacion NUMBER;
  BEGIN
    IF v_count > 1 THEN
      Desviacion := SQRT(Cuadrados / (Contador - 1));
    END IF;

  DBMS_OUTPUT.PUT_LINE('La desviación estándar de la altura es: ' || Desviacion);
  
END;

CLOSE cursor_de_altura;

EXEC cursor_de_altura;

--Cursor Promedio Cinturas --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_cin
AS
	CURSOR DATOS IS SELECT Cintura FROM CIRCUNFERENCIAS;

	Cintura NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Cintura;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Cintura;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL; 
    END IF;

  CLOSE cursor_cin;
  
  DBMS_OUTPUT.PUT_LINE('El promedio de la cintura es: ' || Promedio);
    
END;

EXEC cursor_cin;

--Cursor Desviacion estandar de la cintura --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_de_cintura
AS
	CURSOR DATOS IS SELECT Cintura FROM CIRCUNFERENCIAS;

	Cintura NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
    Cuadrados NUMBER :=0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Cintura;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Cintura;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL;
    END IF;

  CLOSE cursor_de_cintura;
  OPEN cursor_de_cintura;
  
  LOOP
    FETCH cursor_de_cintura INTO Cintura;
    EXIT WHEN DATOS%NOTFOUND;
    Cuadrados := Cuadrados + POWER(Cintura - Promedio, 2);
  END LOOP;

  DECLARE
    Desviacion NUMBER;
  BEGIN
    IF v_count > 1 THEN
      Desviacion := SQRT(Cuadrados / (Contador - 1));
    END IF;

  DBMS_OUTPUT.PUT_LINE('La desviación estándar de la cintura es: ' || Desviacion);
  
END;

CLOSE cursor_de_cintura;

EXEC cursor_de_cintura;

--Cursor Promedio Pliegues abdominales --
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cursor_pabdo
AS
	CURSOR DATOS IS SELECT Abdominal FROM Pliegues;

	Abdominal NUMBER;
    Total NUMBER:= 0;
	Promedio NUMBER;
	Contador NUMBER := 0;
BEGIN
	OPEN DATOS;
	LOOP
		FETCH DATOS INTO Abdominal;
		EXIT WHEN DATOS%NOTFOUND;
        Total := Total + Abdominal;
        
        Contador := Contador + 1;
	
    END LOOP;
    
    IF Contador > 0 THEN
    Promedio := Total / Contador;
    ELSE
    Promedio := NULL; 
    END IF;

  CLOSE cursor_pabdo;
  
  DBMS_OUTPUT.PUT_LINE('El promedio de los pliegues abdominales es: ' || Promedio);
    
END;

EXEC cursor_pabdo;

--Información del atleta
DECLARE 
CURSOR c_atletas IS
SELECT ID_Atleta, FN
FROM Atleta;
BEGIN 
FOR r_atleta In c_atletas LOOP
DBMS_OUTPUT.PUT_LINE('ID: ' || r_atleta.ID_Atleta || ', Fecha de nacmiento: ' || r_atleta.FN);
END LOOP;
END;
/

--Informacion de antropometría de un atleta
DECLARE
  CURSOR c_antropometria (p_ID_Antropometria INT) IS
    SELECT Masa, Altura
    FROM Antropometria
    WHERE ID_Antropometria = p_ID_Antropometria;
  v_ID_Antropometria INT := 1;
BEGIN
  FOR r_antropometria IN c_antropometria(v_ID_Antropometria) LOOP
    DBMS_OUTPUT.PUT_LINE('Masa: ' || r_antropometria.Masa || ', Altura: ' || r_antropometria.Altura);
  END LOOP;
END;
/

--Ejercicios de calentamiento de un registro
DECLARE
  CURSOR c_ejercicios_calentamiento (p_ID_Calentamiento INT) IS
    SELECT e.Ejercicio
    FROM EJERCICIOS e
    JOIN Calentamiento c ON e.ID_Ejercicio = c.Ejercicio1 OR e.ID_Ejercicio = c.Ejercicio2
      OR e.ID_Ejercicio = c.Ejercicio3 OR e.ID_Ejercicio = c.Ejercicio4
      OR e.ID_Ejercicio = c.Ejercicio5 OR e.ID_Ejercicio = c.Ejercicio6
      OR e.ID_Ejercicio = c.Ejercicio7 OR e.ID_Ejercicio = c.Ejercicio8
    WHERE c.ID_Calentamiento = p_ID_Calentamiento;
  v_ID_Calentamiento INT := 1;
BEGIN
  FOR r_ejercicio_calentamiento IN c_ejercicios_calentamiento(v_ID_Calentamiento) LOOP
    DBMS_OUTPUT.PUT_LINE('Ejercicio de calentamiento: ' || r_ejercicio_calentamiento.Ejercicio);
  END LOOP;
END;
/

--Ejercicios de específico de un registro
DECLARE
  CURSOR c_ejercicios_especifico (p_ID_Especifico INT) IS
    SELECT e.Ejercicio
    FROM EJERCICIOS e
    JOIN Especifico c ON e.ID_Ejercicio = c.Ejercicio1 OR e.ID_Ejercicio = c.Ejercicio2
      OR e.ID_Ejercicio = c.Ejercicio3 OR e.ID_Ejercicio = c.Ejercicio4
      OR e.ID_Ejercicio = c.Ejercicio5 OR e.ID_Ejercicio = c.Ejercicio6
      OR e.ID_Ejercicio = c.Ejercicio7 OR e.ID_Ejercicio = c.Ejercicio8
      OR e.ID_Ejercicio = c.Ejercicio9 OR e.ID_Ejercicio = c.Ejercicio10
    WHERE c.ID_Especifico = p_ID_Especifico;
  v_ID_Especifico INT := 1;
BEGIN
  FOR r_ejercicio_especifico  IN c_ejercicios_Especifico (v_ID_Especifico ) LOOP
    DBMS_OUTPUT.PUT_LINE('Ejercicio de especifico: ' || r_ejercicio_especifico.Ejercicio);
  END LOOP;
END;
/

--Ejercicios de recuperación de un registro
DECLARE
  CURSOR c_ejercicios_recuperacion (p_ID_Recuperacion INT) IS
    SELECT e.Ejercicio
    FROM EJERCICIOS e
    JOIN Recuperacion c ON e.ID_Ejercicio = c.Ejercicio1 OR e.ID_Ejercicio = c.Ejercicio2
      OR e.ID_Ejercicio = c.Ejercicio3 OR e.ID_Ejercicio = c.Ejercicio4
      OR e.ID_Ejercicio = c.Ejercicio5 OR e.ID_Ejercicio = c.Ejercicio6
    WHERE c.ID_Recuperacion = p_ID_Recuperacion;
  v_ID_Recuperacion INT := 1;
BEGIN
  FOR r_ejercicio_recuperacion  IN c_ejercicios_Recuperacion (v_ID_Recuperacion) LOOP
    DBMS_OUTPUT.PUT_LINE('Ejercicio de recuperacion: ' || r_ejercicio_recuperacion.Ejercicio);
  END LOOP;
END;
/