-- ============================================
-- INSERT AIRCRAFT
-- ============================================

INSERT INTO aircraft_manufacturer VALUES (gen_random_uuid(),'Boeing',now(),now());

INSERT INTO aircraft_model (
    aircraft_manufacturer_id, model_code, model_name
)
VALUES (
    (SELECT aircraft_manufacturer_id FROM aircraft_manufacturer),
    '737','Boeing 737'
);

INSERT INTO cabin_class VALUES (gen_random_uuid(),'ECO','Economy',now(),now());

INSERT INTO aircraft (
    airline_id, aircraft_model_id, registration_number, serial_number
)
VALUES (
    (SELECT airline_id FROM airline),
    (SELECT aircraft_model_id FROM aircraft_model),
    'HK123','SN123'
);