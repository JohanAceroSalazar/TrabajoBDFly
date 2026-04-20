-- ============================================
-- INSERT SECURITY
-- ============================================

INSERT INTO user_status VALUES (gen_random_uuid(),'ACTIVE','Activo',now(),now());

INSERT INTO security_role VALUES (gen_random_uuid(),'ADMIN','Administrador',NULL,now(),now());

INSERT INTO security_permission VALUES (gen_random_uuid(),'ALL','Full Access',NULL,now(),now());

INSERT INTO user_account (
    person_id,user_status_id,username,password_hash
)
VALUES (
    (SELECT person_id FROM person LIMIT 1),
    (SELECT user_status_id FROM user_status WHERE status_code='ACTIVE'),
    'johan123','hash'
);

INSERT INTO user_role (
    user_account_id, security_role_id
)
VALUES (
    (SELECT user_account_id FROM user_account WHERE username='johan123'),
    (SELECT security_role_id FROM security_role WHERE role_code='ADMIN')
);

INSERT INTO role_permission (
    security_role_id, security_permission_id
)
VALUES (
    (SELECT security_role_id FROM security_role WHERE role_code='ADMIN'),
    (SELECT security_permission_id FROM security_permission WHERE permission_code='ALL')
);