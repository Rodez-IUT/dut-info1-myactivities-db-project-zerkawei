CREATE OR REPLACE FUNCTION gds.pl_calcule_temps_occupation(
	un_nom_de_salle character varying(250))
    RETURNS interval AS $$
	DECLARE
		somme_temps interval;
		un_id_salle integer;
		reservation gds.reservation%ROWTYPE;
	BEGIN
		SELECT id INTO un_id_salle FROM gds.salle WHERE nom = un_nom_de_salle;
		IF FOUND 
			THEN
				somme_temps := '00:00:00';
				FOR reservation IN 
				SELECT * FROM gds.reservation WHERE salle_id = un_id_salle 
				LOOP
					somme_temps := somme_temps + age(reservation.date_fin,reservation.date_debut);
				END LOOP;
			ELSE
				RAISE NOTICE 'La salle n existe pas';
				RAISE invalid_parameter_value USING MESSAGE='Le nom de salle nest pas valide';
			END IF;
		RETURN somme_temps;
	END
    $$
    LANGUAGE plpgsql;