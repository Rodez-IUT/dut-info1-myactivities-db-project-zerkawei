CREATE OR REPLACE FUNCTION gds.pl_get_salles_avec_temps_occupation(curs refcursor)
    RETURNS refcursor AS $$
	DECLARE
	BEGIN
	    OPEN curs FOR 
		SELECT nom, gds.pl_calcule_temps_occupation(nom) AS temps_occup
		FROM gds.salle
		ORDER BY temps_occup DESC, nom_salle ASC;
		RETURN curs;
	END
    $$
    LANGUAGE plpgsql;