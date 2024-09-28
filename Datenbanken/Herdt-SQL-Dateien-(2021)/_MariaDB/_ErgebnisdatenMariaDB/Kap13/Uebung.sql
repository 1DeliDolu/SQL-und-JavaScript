CREATE USER 'umeyer'@'%' IDENTIFIED BY 'geheim';

USE uebungen;

GRANT SELECT, UPDATE ON t_ma TO umeyer;

REVOKE ALL ON t_ma FROM umeyer;

GRANT ALL ON t_proj TO umeyer;
GRANT SELECT ON t_ma TO umeyer;
GRANT UPDATE (abtnr) ON t_ma TO umeyer;

REVOKE DELETE ON t_proj FROM umeyer;