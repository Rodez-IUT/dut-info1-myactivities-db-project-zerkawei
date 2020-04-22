CREATE OR REPLACE FUNCTION gds.insert_salle(
	un_nom character varying(250),
    un_nb_personnes_max integer)
    RETURNS gds.salle AS $$
		INSERT INTO gds.salle
		VALUES (nextval('gds.salle_seq'), un_nom, un_nb_personnes_max, now(), now())
		RETURNING salle;
	$$
	LANGUAGE SQL;