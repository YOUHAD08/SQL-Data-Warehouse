USE DataWarehouse;
GO

-- ====================================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id  IS NULL


-- Check for Unwanted Spaces
-- Expectation : No Result

SELECT  cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

SELECT  cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT  cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)


-- Data Standarisation & Consistency

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info


-- Final Check
SELECT * FROM silver.crm_cust_info

-- ====================================================================
-- Checking 'silver.crm_prd_info'
-- ====================================================================

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);


-- Chech for Nulls or Negative Numbers in Cost
-- Expectation : No Result
SELECT  
   prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders  (Start Date > End Date)
Select * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- Final Check
SELECT 
    *
FROM silver.crm_prd_info


-- ====================================================================
-- Checking 'silver.crm_sales_details'
-- ====================================================================