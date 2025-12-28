-- Check For Nulls or Duplicate Values in Primary Keys
-- Expectation : No Result
SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id  IS NULL

-- Check for Unwanted Spaces
-- Expectation : No Result
SELECT  cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Data Standarisation & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info
  