CREATE OR REPLACE FUNCTION gds.pl_insert_reservation(
    une_date_debut timestamp without time zone,
    une_date_fin timestamp without time zone,
    un_nom_de_salle character varying(250))
    RETURNS gds.reservation AS $$
	DECLARE
		une_reservation gds.reservation%ROWTYPE;
		un_id_salle integer;
	BEGIN
		SELECT id INTO un_id_salle FROM gds.salle WHERE nom = un_nom_de_salle;
		IF FOUND 
			THEN
        		INSERT INTO gds.reservation
        		VALUES (nextval('gds.reservation_seq'), une_date_debut, une_date_fin, now(), now(), un_id_salle)
        		RETURNING * INTO une_reservation;
			ELSE
				RAISE NOTICE 'La salle n existe pas';
		END IF;
		RETURN une_reservation;
	END
    $$
    LANGUAGE plpgsql;