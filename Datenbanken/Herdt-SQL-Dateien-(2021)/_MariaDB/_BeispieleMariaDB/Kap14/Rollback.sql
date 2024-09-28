BEGIN;
SELECT COUNT(id) FROM t_lager WHERE stueck < 1;
DELETE FROM t_lager WHERE stueck > 1;
ROLLBACK; 
