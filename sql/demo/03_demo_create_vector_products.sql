cd ~/oracle-ai/demoai-agent

cat > sql/demo/03_demo_create_vector_products.sql <<'EOF'
-- ============================================================
-- File:
--   sql/demo/03_demo_create_vector_products.sql
--
-- Local Mac path:
--   ~/oracle-ai/demoai-agent/sql/demo/
--   03_demo_create_vector_products.sql
--
-- Future OCI Compute path:
--   /opt/demoai/app/sql/demo/
--   03_demo_create_vector_products.sql
--
-- Run as database user:
--   DEMO
--
-- Run in:
--   Autonomous Database Database Actions SQL Worksheet
--
-- Purpose:
--   Create a demonstration table containing relational data
--   and a native Oracle VECTOR column.
--
-- Vector meaning for this demonstration:
--   Dimension 1 = technology relevance
--   Dimension 2 = financial relevance
--   Dimension 3 = human-resources relevance
-- ============================================================

SET SERVEROUTPUT ON;

PROMPT ========================================================
PROMPT VERIFY EXECUTION USER
PROMPT Expected database user: DEMO
PROMPT ========================================================

SELECT
    SYS_CONTEXT('USERENV', 'CURRENT_USER') AS current_user,
    SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') AS current_schema
FROM dual;

PROMPT ========================================================
PROMPT REMOVE PREVIOUS DEMO TABLE IF IT EXISTS
PROMPT ========================================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE VECTOR_PRODUCTS PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

PROMPT ========================================================
PROMPT CREATE VECTOR_PRODUCTS
PROMPT ========================================================

CREATE TABLE vector_products (
    product_id          NUMBER
        CONSTRAINT vector_products_pk PRIMARY KEY,

    product_name        VARCHAR2(100) NOT NULL,

    product_category    VARCHAR2(50) NOT NULL,

    product_description VARCHAR2(500) NOT NULL,

    product_vector      VECTOR(3, FLOAT32) NOT NULL
);

COMMENT ON TABLE vector_products IS
    'Demonstrates relational data stored with Oracle VECTOR data';

COMMENT ON COLUMN vector_products.product_vector IS
    'Three dimensions: technology, finance, human resources';

PROMPT ========================================================
PROMPT VALIDATE TABLE
PROMPT ========================================================

SELECT
    table_name
FROM user_tables
WHERE table_name = 'VECTOR_PRODUCTS';

SELECT
    column_name,
    data_type,
    data_length
FROM user_tab_columns
WHERE table_name = 'VECTOR_PRODUCTS'
ORDER BY column_id;
EOF
