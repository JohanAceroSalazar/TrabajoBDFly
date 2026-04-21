-- ============================================
-- INSERT PAYMENT
-- ============================================

INSERT INTO payment_status VALUES (gen_random_uuid(),'PAID','Pagado',now(),now());
INSERT INTO payment_method VALUES (gen_random_uuid(),'CARD','Tarjeta',now(),now());

INSERT INTO payment (
    sale_id, payment_status_id, payment_method_id,
    currency_id, payment_reference, amount
)
VALUES (
    (SELECT sale_id FROM sale),
    (SELECT payment_status_id FROM payment_status),
    (SELECT payment_method_id FROM payment_method),
    (SELECT currency_id FROM currency),
    'PAY123',100000
);