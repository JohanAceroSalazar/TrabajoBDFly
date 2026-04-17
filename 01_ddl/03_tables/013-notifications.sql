-- ============================================
-- NOTIFICATIONS DOMAIN
-- ============================================

CREATE TABLE notification_type (
    notification_type_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    type_code varchar(30) NOT NULL,
    type_name varchar(100) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_type_code UNIQUE (type_code),
    CONSTRAINT uq_notification_type_name UNIQUE (type_name)
);

CREATE TABLE notification_channel (
    notification_channel_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    channel_code varchar(20) NOT NULL,
    channel_name varchar(80) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_channel_code UNIQUE (channel_code),
    CONSTRAINT uq_notification_channel_name UNIQUE (channel_name)
);

CREATE TABLE notification (
    notification_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_account_id uuid REFERENCES user_account(user_account_id),
    customer_id uuid REFERENCES customer(customer_id),
    notification_type_id uuid NOT NULL REFERENCES notification_type(notification_type_id),
    title varchar(150) NOT NULL,
    message text NOT NULL,
    related_reservation_id uuid REFERENCES reservation(reservation_id),
    related_flight_id uuid REFERENCES flight(flight_id),
    is_read boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE notification_delivery (
    notification_delivery_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_id uuid NOT NULL REFERENCES notification(notification_id),
    notification_channel_id uuid NOT NULL REFERENCES notification_channel(notification_channel_id),
    sent_at timestamptz,
    delivery_status varchar(20) NOT NULL,
    error_message text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_delivery_status CHECK (
        delivery_status IN ('PENDING', 'SENT', 'FAILED')
    )
);