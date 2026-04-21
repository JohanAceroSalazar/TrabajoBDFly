-- ============================================
-- INSERT NOTIFICATIONS
-- ============================================

INSERT INTO notification_type VALUES (gen_random_uuid(),'FLIGHT','Flight Alert',now(),now());
INSERT INTO notification_channel VALUES (gen_random_uuid(),'EMAIL','Correo',now(),now());

INSERT INTO notification (
    user_account_id, notification_type_id, title, message
)
VALUES (
    (SELECT user_account_id FROM user_account),
    (SELECT notification_type_id FROM notification_type),
    'Retraso','Tu vuelo se retrasó'
);

INSERT INTO notification_delivery (
    notification_id, notification_channel_id, delivery_status
)
VALUES (
    (SELECT notification_id FROM notification),
    (SELECT notification_channel_id FROM notification_channel),
    'SENT'
);