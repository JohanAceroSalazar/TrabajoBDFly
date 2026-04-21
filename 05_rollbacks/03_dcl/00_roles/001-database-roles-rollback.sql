-- ============================================
-- REVOKE PRIVILEGES
-- ============================================

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM app_admin;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM app_user;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM app_readonly;

-- ============================================
-- DROP ROLES
-- ============================================

DROP ROLE IF EXISTS app_admin;
DROP ROLE IF EXISTS app_user;
DROP ROLE IF EXISTS app_readonly;