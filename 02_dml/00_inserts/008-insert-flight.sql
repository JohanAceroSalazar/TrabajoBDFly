-- ============================================
-- INSERT FLIGHT
-- ============================================

INSERT INTO flight_status VALUES (gen_random_uuid(),'ON_TIME','On Time',now(),now());

INSERT INTO flight (
    airline_id, aircraft_id, flight_status_id, flight_number, service_date
)
VALUES (
    (SELECT airline_id FROM airline),
    (SELECT aircraft_id FROM aircraft),
    (SELECT flight_status_id FROM flight_status),
    'AV123', CURRENT_DATE
);

INSERT INTO flight_segment (
    flight_id, origin_airport_id, destination_airport_id,
    segment_number, scheduled_departure_at, scheduled_arrival_at
)
SELECT
    f.flight_id,
    a1.airport_id,
    a2.airport_id,
    1,
    now(),
    now() + interval '2 hour'
FROM flight f
JOIN airport a1 ON true
JOIN airport a2 ON a1.airport_id <> a2.airport_id
LIMIT 1;