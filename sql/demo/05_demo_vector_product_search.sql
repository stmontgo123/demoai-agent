cat > sql/demo/05_demo_vector_product_search.sql <<'EOF'
-- ============================================================
-- File:
--   sql/demo/05_demo_vector_product_search.sql
--
-- Local Mac path:
--   ~/oracle-ai/demoai-agent/sql/demo/
--   05_demo_vector_product_search.sql
--
-- Future OCI Compute path:
--   /opt/demoai/app/sql/demo/
--   05_demo_vector_product_search.sql
--
-- Run as database user:
--   DEMO
--
-- Purpose:
--   Demonstrate vector similarity searches using COSINE
--   distance.
--
-- Lower distance means a closer match.
-- ============================================================

SET LINESIZE 220;
SET PAGESIZE 100;

PROMPT ========================================================
PROMPT SEARCH 1: TECHNOLOGY
PROMPT Query vector: [1.0, 0.0, 0.0]
PROMPT ========================================================

SELECT
    product_id,
    product_name,
    product_category,
    ROUND(
        VECTOR_DISTANCE(
            product_vector,
            TO_VECTOR('[1.0, 0.0, 0.0]'),
            COSINE
        ),
        6
    ) AS distance
FROM vector_products
ORDER BY distance
FETCH FIRST 5 ROWS ONLY;

PROMPT ========================================================
PROMPT SEARCH 2: FINANCE
PROMPT Query vector: [0.0, 1.0, 0.0]
PROMPT ========================================================

SELECT
    product_id,
    product_name,
    product_category,
    ROUND(
        VECTOR_DISTANCE(
            product_vector,
            TO_VECTOR('[0.0, 1.0, 0.0]'),
            COSINE
        ),
        6
    ) AS distance
FROM vector_products
ORDER BY distance
FETCH FIRST 5 ROWS ONLY;

PROMPT ========================================================
PROMPT SEARCH 3: HUMAN RESOURCES
PROMPT Query vector: [0.0, 0.0, 1.0]
PROMPT ========================================================

SELECT
    product_id,
    product_name,
    product_category,
    ROUND(
        VECTOR_DISTANCE(
            product_vector,
            TO_VECTOR('[0.0, 0.0, 1.0]'),
            COSINE
        ),
        6
    ) AS distance
FROM vector_products
ORDER BY distance
FETCH FIRST 5 ROWS ONLY;

PROMPT ========================================================
PROMPT SEARCH 4: TECHNOLOGY PLUS FINANCE
PROMPT Query vector: [0.8, 0.8, 0.0]
PROMPT ========================================================

SELECT
    product_id,
    product_name,
    product_category,
    ROUND(
        VECTOR_DISTANCE(
            product_vector,
            TO_VECTOR('[0.8, 0.8, 0.0]'),
            COSINE
        ),
        6
    ) AS distance
FROM vector_products
ORDER BY distance
FETCH FIRST 5 ROWS ONLY;

PROMPT ========================================================
PROMPT SEARCH 5: TECHNOLOGY PLUS HR
PROMPT Query vector: [0.8, 0.0, 0.8]
PROMPT ========================================================

SELECT
    product_id,
    product_name,
    product_category,
    ROUND(
        VECTOR_DISTANCE(
            product_vector,
            TO_VECTOR('[0.8, 0.0, 0.8]'),
            COSINE
        ),
        6
    ) AS distance
FROM vector_products
ORDER BY distance
FETCH FIRST 5 ROWS ONLY;
EOF
