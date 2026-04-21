-- ============================================
-- 1. INSERT BASE (GEOGRAPHY + CONFIG)
-- ============================================

INSERT INTO continent (continent_code, continent_name)
VALUES ('SA', 'South America');

INSERT INTO country (continent_id, iso_alpha2, iso_alpha3, country_name)
VALUES (
    (SELECT continent_id FROM continent WHERE continent_code='SA'),
    'CO','COL','Colombia'
);

INSERT INTO time_zone (time_zone_name, utc_offset_minutes)
VALUES ('America/Bogota', -300);

INSERT INTO currency (iso_currency_code, currency_name, currency_symbol)
VALUES ('COP','Peso Colombiano','$');

-- ============================================
-- INSERT UBICATION
-- ============================================

INSERT INTO state_province (country_id, state_name)
VALUES (
    (SELECT country_id FROM country WHERE iso_alpha2='CO'),
    'Huila'
);

INSERT INTO city (state_province_id, time_zone_id, city_name)
VALUES (
    (SELECT state_province_id FROM state_province WHERE state_name='Huila'),
    (SELECT time_zone_id FROM time_zone WHERE time_zone_name='America/Bogota'),
    'Neiva'
);

INSERT INTO district (city_id, district_name)
VALUES (
    (SELECT city_id FROM city WHERE city_name='Neiva'),
    'Centro'
);

INSERT INTO address (district_id, address_line_1)
VALUES (
    (SELECT district_id FROM district WHERE district_name='Centro'),
    'Calle 1 #2-3'
);