﻿CREATE PROCEDURE [dbo].[forecastTrendByCustomerItem_del]
	@objectKey xml
AS

SET NOCOUNT ON

DECLARE	@company_code varchar(3)
	, @customer_number varchar(10)
	, @item_number varchar(12)
	, @forecast_method varchar(2)

SELECT	@company_code = @objectKey.value('/ObjectKey[1]/@CompanyCode', 'varchar(3)')
	, @customer_number = @objectKey.value('/ObjectKey[1]/@CustomerNumber', 'varchar(10)')
	, @item_number = @objectKey.value('/ObjectKey[1]/@ItemNumber', 'varchar(12)')
	, @forecast_method = @objectKey.value('/ObjectKey[1]/@ForecastMethod', 'varchar(2)')

DELETE	forecastTrendByCustomerItem
WHERE	company_code = @company_code
AND		customer_number = @customer_number
AND		item_number = @item_number
AND		forecast_method = @forecast_method
