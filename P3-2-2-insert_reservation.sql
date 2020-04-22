CREATE OR REPLACE FUNCTION gds.insert_reservation(
    une_date_debut timestamp without time zone,
    une_date_fin timestamp without time zone,
    un_nom_de_salle character varying(250))
    RETURNS gds.reservation AS $$
        INSERT INTO gds.reservation
        VALUES (nextval('gds.reservation_seq'), une_date_debut, une_date_fin, now(), now(), (SELECT id FROM gds.salle WHERE nom = un_nom_de_salle))
        RETURNING reservation;
    $$
    LANGUAGE SQL;