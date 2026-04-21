-- ============================================
-- INSERT CUSTOMER + LOYALTY
-- ============================================

INSERT INTO customer_category VALUES (gen_random_uuid(),'REG','Regular',now(),now());
INSERT INTO benefit_type VALUES (gen_random_uuid(),'VIP','VIP Lounge',NULL,now(),now());

INSERT INTO loyalty_program (
    airline_id, default_currency_id, program_code, program_name
)
VALUES (
    (SELECT airline_id FROM airline),
    (SELECT currency_id FROM currency),
    'LP1','Programa Puntos'
);

INSERT INTO loyalty_tier (
    loyalty_program_id, tier_code, tier_name, priority_level
)
VALUES (
    (SELECT loyalty_program_id FROM loyalty_program),
    'GOLD','Gold',1
);

INSERT INTO customer (
    airline_id, person_id
)
VALUES (
    (SELECT airline_id FROM airline),
    (SELECT person_id FROM person)
);

INSERT INTO loyalty_account (
    customer_id, loyalty_program_id, account_number
)
VALUES (
    (SELECT customer_id FROM customer),
    (SELECT loyalty_program_id FROM loyalty_program),
    'ACC123'
);