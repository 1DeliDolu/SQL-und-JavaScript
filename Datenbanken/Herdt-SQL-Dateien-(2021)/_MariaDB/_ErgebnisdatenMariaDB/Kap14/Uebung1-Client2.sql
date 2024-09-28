

USE Uebungen;

BEGIN;
SELECT * FROM t_lager;

SELECT * FROM t_lager;

-- Beachten Sie: der Aufruf der 2.SELECT-Anweisung wird erst ausgeführt,  
--               wenn im anderen Client die COMMIT-Anweisung ausgeführt wird. 
--               Der 2. Client bleibt solang in einem Wartezustand.
