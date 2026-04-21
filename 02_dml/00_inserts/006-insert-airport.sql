-- ============================================
-- INSERT AIRPORT
-- ============================================

INSERT INTO airport (
    address_id, airport_name, iata_code
)
VALUES (
    (SELECT address_id FROM address),
    'Aeropuerto Neiva','NVA'
);

INSERT INTO terminal (airport_id, terminal_code)
VALUES ((SELECT airport_id FROM airport),'T1');

INSERT INTO boarding_gate (terminal_id, gate_code)
VALUES ((SELECT terminal_id FROM terminal),'G1');

INSERT INTO runway (airport_id, runway_code, length_meters)
VALUES ((SELECT airport_id FROM airport),'R1',2000);