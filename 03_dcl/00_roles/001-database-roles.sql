-- ============================================
-- CREATE DATABASE ROLES
-- ============================================

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_admin') THEN
        CREATE ROLE app_admin LOGIN PASSWORD 'admin123';
    END IF;

    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_user') THEN
        CREATE ROLE app_user LOGIN PASSWORD 'user123';
    END IF;

    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_readonly') THEN
        CREATE ROLE app_readonly LOGIN PASSWORD 'readonly123';
    END IF;
END$$;

-- ============================================
-- GRANTS
-- ============================================

-- ADMIN (todo)
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO app_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO app_admin;

-- USER (lectura + escritura básica)
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO app_user;

-- READONLY (solo lectura)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_readonly;

-- ============================================
-- FUTURE TABLES
-- ============================================

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON TABLES TO app_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE ON TABLES TO app_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO app_readonly;