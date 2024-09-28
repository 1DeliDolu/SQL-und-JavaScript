select * from t_lager WHERE id = 8;
INSERT INTO t_lager(id, preis) VALUES (8, 1) ON CONFLICT DO NOTHING;
select * from t_lager WHERE id = 8;
INSERT INTO t_lager(id, preis) VALUES (8, 2) ON CONFLICT (id) DO UPDATE SET preis = 2;
select * from t_lager WHERE id = 8;