UPDATE t_ma_dt SET str = 'Hauptstr.', hnr = '17' 
   WHERE name = 'Meier' AND vname = 'Susann';
UPDATE t_ma_frankfurt SET ort='Frankfurt/Main';
UPDATE t_lager SET stueck=stueck+100 WHERE stueck<100;
