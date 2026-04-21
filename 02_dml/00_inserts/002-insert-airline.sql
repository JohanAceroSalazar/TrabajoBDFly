-- ============================================
-- INSERT AIRLINE
-- ============================================

INSERT INTO airline (home_country_id, airline_code, airline_name)
VALUES (
    (SELECT country_id FROM country WHERE iso_alpha2='CO'),
    'AVI','Avianca'
);