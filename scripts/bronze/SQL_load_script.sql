USE DataWarehouse;
GO

TRUNCATE TABLE bronze.crm_cust_info;
GO

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\cust_info.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
);

TRUNCATE TABLE bronze.crm_prd_info;
GO

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\prd_info.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
)

TRUNCATE TABLE bronze.crm_sales_details;
GO

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\sales_details.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
)


TRUNCATE TABLE bronze.erp_cust_az12;
GO

BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\cust_az12.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
)

TRUNCATE TABLE bronze.erp_loc_a101;
GO

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\loc_a101.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
)

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
GO

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\px_cat_g1v2.csv'
WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
)

