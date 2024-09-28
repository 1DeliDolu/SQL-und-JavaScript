CREATE ROLE umeyer LOGIN PASSWORD 'kennwort1';

GRANT SELECT, UPDATE ON t_ma TO umeyer;

REVOKE ALL ON t_ma FROM umeyer;

GRANT ALL ON t_proj TO umeyer;
GRANT SELECT ON t_ma TO umeyer;
GRANT UPDATE (abtnr) ON t_ma TO umeyer;

REVOKE DELETE ON t_proj FROM umeyer;