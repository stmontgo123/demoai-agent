cat > sql/demo/04_demo_load_vector_products.sql <<'EOF'
-- ============================================================
-- File:
--   sql/demo/04_demo_load_vector_products.sql
--
-- Local Mac path:
--   ~/oracle-ai/demoai-agent/sql/demo/
--   04_demo_load_vector_products.sql
--
-- Future OCI Compute path:
--   /opt/demoai/app/sql/demo/
--   04_demo_load_vector_products.sql
--
-- Run as database user:
--   DEMO
--
-- Purpose:
--   Insert relational product information and native vectors.
--
-- Vector dimensions:
--   [technology, finance, human_resources]
-- ============================================================

PROMPT VERIFY CURRENT USER

SELECT SYS_CONTEXT('USERENV', 'CURRENT_USER') AS current_user
FROM dual;

PROMPT CLEAR EXISTING ROWS

TRUNCATE TABLE vector_products;

PROMPT INSERT SAMPLE VECTOR DATA

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    101,
    'Oracle AI Database',
    'Technology',
    'Database platform supporting SQL, vector search, machine learning and AI applications.',
    TO_VECTOR('[0.95, 0.10, 0.05]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    102,
    'Cloud Security Platform',
    'Technology',
    'Cloud security service for identity protection, threat detection and zero trust controls.',
    TO_VECTOR('[0.90, 0.05, 0.10]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    103,
    'Financial Planning System',
    'Finance',
    'Software used for corporate budgeting, forecasting and financial analysis.',
    TO_VECTOR('[0.15, 0.95, 0.05]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    104,
    'Expense Management Application',
    'Finance',
    'Application for expense reporting, reimbursement and financial controls.',
    TO_VECTOR('[0.10, 0.85, 0.10]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    105,
    'Talent Management Platform',
    'Human Resources',
    'Human capital platform for recruiting, employee development and performance management.',
    TO_VECTOR('[0.10, 0.05, 0.95]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    106,
    'Payroll Processing Service',
    'Human Resources',
    'Service for employee payroll, compensation processing and benefits administration.',
    TO_VECTOR('[0.05, 0.25, 0.85]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    107,
    'AI Financial Analytics',
    'Technology and Finance',
    'Artificial intelligence platform for analyzing financial data and identifying business trends.',
    TO_VECTOR('[0.80, 0.80, 0.05]')
);

INSERT INTO vector_products (
    product_id,
    product_name,
    product_category,
    product_description,
    product_vector
)
VALUES (
    108,
    'HR Analytics Platform',
    'Technology and Human Resources',
    'Analytics platform for workforce planning, recruiting metrics and employee insights.',
    TO_VECTOR('[0.70, 0.10, 0.80]')
);

COMMIT;

PROMPT VALIDATE DATA

SELECT
    product_id,
    product_name,
    product_category,
    product_vector
FROM vector_products
ORDER BY product_id;

PROMPT ROW COUNT

SELECT COUNT(*) AS product_count
FROM vector_products;
EOF
