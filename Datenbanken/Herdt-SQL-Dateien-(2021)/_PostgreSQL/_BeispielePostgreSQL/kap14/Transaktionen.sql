BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE t_lager SET preis = preis * 0.95 WHERE stueck > 200;
UPDATE t_lager SET preis = preis * 0.98 WHERE stueck > 100 and stueck <= 200;
COMMIT;