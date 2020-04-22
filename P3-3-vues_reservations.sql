CREATE VIEW gds.vue_reservations AS
    SELECT reservation.id, nom, date_debut, date_fin
    FROM gds.reservation
    JOIN gds.salle
    ON salle_id = salle.id
    ORDER BY nom ASC, date_debut ASC