-- ============================================
-- INSERT IDENTITY
-- ============================================

INSERT INTO person_type VALUES (gen_random_uuid(),'NAT','Natural',now(),now());
INSERT INTO document_type VALUES (gen_random_uuid(),'CC','Cedula',now(),now());
INSERT INTO contact_type VALUES (gen_random_uuid(),'EMAIL','Correo',now(),now());

INSERT INTO person (
    person_type_id, first_name, last_name
)
VALUES (
    (SELECT person_type_id FROM person_type WHERE type_code='NAT'),
    'Johan','Acero'
);

INSERT INTO person_document (
    person_id, document_type_id, document_number
)
VALUES (
    (SELECT person_id FROM person LIMIT 1),
    (SELECT document_type_id FROM document_type WHERE type_code='CC'),
    '123456'
);

INSERT INTO person_contact (
    person_id, contact_type_id, contact_value
)
VALUES (
    (SELECT person_id FROM person LIMIT 1),
    (SELECT contact_type_id FROM contact_type WHERE type_code='EMAIL'),
    'johan@mail.com'
);