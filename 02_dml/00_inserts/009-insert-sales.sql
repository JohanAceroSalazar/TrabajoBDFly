-- ============================================
-- INSERT RESERVA / VENTA
-- ============================================

INSERT INTO reservation_status VALUES (gen_random_uuid(),'CONF','Confirmado',now(),now());
INSERT INTO sale_channel VALUES (gen_random_uuid(),'WEB','Web',now(),now());
INSERT INTO ticket_status VALUES (gen_random_uuid(),'ACTIVE','Activo',now(),now());

INSERT INTO reservation (
    reservation_status_id, sale_channel_id, reservation_code, booked_at
)
VALUES (
    (SELECT reservation_status_id FROM reservation_status),
    (SELECT sale_channel_id FROM sale_channel),
    'RES123', now()
);

INSERT INTO reservation_passenger (
    reservation_id, person_id, passenger_sequence_no, passenger_type
)
VALUES (
    (SELECT reservation_id FROM reservation),
    (SELECT person_id FROM person),
    1,'ADULT'
);

INSERT INTO sale (
    reservation_id, currency_id, sale_code, sold_at
)
VALUES (
    (SELECT reservation_id FROM reservation),
    (SELECT currency_id FROM currency),
    'SALE123', now()
);

INSERT INTO fare_class VALUES (gen_random_uuid(),(SELECT cabin_class_id FROM cabin_class),'E','Economy',false,now(),now());

INSERT INTO fare (
    airline_id, origin_airport_id, destination_airport_id,
    fare_class_id, currency_id, fare_code, base_amount, valid_from
)
SELECT
    (SELECT airline_id FROM airline),
    a1.airport_id,
    a2.airport_id,
    (SELECT fare_class_id FROM fare_class),
    (SELECT currency_id FROM currency),
    'F123',
    100000,
    CURRENT_DATE
FROM airport a1, airport a2
WHERE a1.airport_id <> a2.airport_id
LIMIT 1;

-- ⚠️ ESTE SOLO FUNCIONA SI EL FARE EXISTE
INSERT INTO ticket (
    sale_id, reservation_passenger_id, fare_id, ticket_status_id,
    ticket_number, issued_at
)
SELECT
    (SELECT sale_id FROM sale),
    (SELECT reservation_passenger_id FROM reservation_passenger),
    f.fare_id,
    (SELECT ticket_status_id FROM ticket_status),
    'T123',
    now()
FROM fare f
LIMIT 1;