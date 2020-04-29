CREATE OR REPLACE FUNCTION gds.pl_insert_salle(
	un_nom character varying(250),
    un_nb_personnes_max integer)
    RETURNS gds.salle AS $$
	DECLARE
		une_salle gds.salle%ROWTYPE;
	BEGIN
		INSERT INTO gds.salle
		VALUES (nextval('gds.salle_seq'), un_nom, un_nb_personnes_max, now(), now())
		RETURNING * INTO une_salle;
		RETURN une_salle;
	END
	$$
	LANGUAGE plpgsql;