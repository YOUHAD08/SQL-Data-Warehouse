USE DataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer'
		PRINT '=========================================='


		PRINT '------------------------------------------'
		PRINT 'Loading CRM Table'
		PRINT '------------------------------------------'


		PRINT '>> Trunicating Table : bronze.crm_cust_info '
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data into : bronze.crm_cust_info '
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\cust_info.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		);

		PRINT '>> Trunicating Table : bronze.crm_prd_info '
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data into : bronze.crm_prd_info '
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\prd_info.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		)

		PRINT '>> Trunicating Table : bronze.crm_sales_details '
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data into : bronze.crm_sales_details '
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_crm\sales_details.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		)

		PRINT '------------------------------------------'
		PRINT 'Loading ERP Table'
		PRINT '------------------------------------------'

		PRINT '>> Trunicating Table : bronze.erp_cust_az12 '
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data into : bronze.erp_cust_az12 '
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\cust_az12.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		)

		PRINT '>> Trunicating Table : bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data into : bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\loc_a101.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		)

		PRINT '>> Trunicating Table : bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data into : bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\hp\Documents\ENSET\Big Data\Projects\SQL Data Warehouse\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		);
	END TRY
	BEGIN CATCH
		   PRINT '***********************************************'
		   PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		   PRINT 'ERROR MESSAGE :' + ERROR_MESSAGE();
		   PRINT 'ERROR NUMBER :' + CAST(ERROR_NUMBER() AS NVARCHAR);
		   PRINT 'ERROR STATE :' + CAST(ERROR_STATE() AS NVARCHAR);
		   PRINT '***********************************************'
	END CATCH
END

