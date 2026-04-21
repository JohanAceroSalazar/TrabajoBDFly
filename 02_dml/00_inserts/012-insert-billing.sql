-- ============================================
-- INSERT BILLING
-- ============================================

INSERT INTO tax VALUES (gen_random_uuid(),'IVA','IVA',19, CURRENT_DATE,NULL,now(),now());

INSERT INTO invoice_status VALUES (gen_random_uuid(),'ISSUED','Emitida',now(),now());

INSERT INTO invoice (
    sale_id, invoice_status_id, currency_id, invoice_number, issued_at
)
VALUES (
    (SELECT sale_id FROM sale),
    (SELECT invoice_status_id FROM invoice_status),
    (SELECT currency_id FROM currency),
    'INV123', now()
);

INSERT INTO invoice_line (
    invoice_id, tax_id, line_number, line_description, quantity, unit_price
)
VALUES (
    (SELECT invoice_id FROM invoice),
    (SELECT tax_id FROM tax),
    1,'Vuelo',1,100000
);
