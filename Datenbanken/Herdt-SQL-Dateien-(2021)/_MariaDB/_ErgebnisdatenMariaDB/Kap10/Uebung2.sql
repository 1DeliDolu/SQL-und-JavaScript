USE Uebungen;

SELECT a.id, a.name, a.lieferant, l.stueck FROM t_artikel a 
   INNER JOIN t_lager l ON l.id = a.id;

SELECT a.id, a.name, a.lieferant, l.stueck, l.preis FROM t_artikel a 
   LEFT OUTER JOIN t_lager l ON l.id = a.id;

SELECT a.id, a.name, a.lieferant, l.stueck, l.preis, li.name FROM t_artikel a 
   INNER JOIN t_lager l ON l.id = a.id
   INNER JOIN t_liefer li ON a.lieferant = li.id
   ORDER BY a.name;
 