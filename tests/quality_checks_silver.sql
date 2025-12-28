USE DataWarehouse;
GO
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

SELECT  prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Data Standarisation & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

-- Chech for Nulls or Negative Numbers
-- Expectation : No Result
SELECT  prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0


-- Check for Invalid Date Orders
Select * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt