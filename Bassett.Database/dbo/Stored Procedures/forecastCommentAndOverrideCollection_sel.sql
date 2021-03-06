﻿CREATE PROCEDURE [dbo].[forecastCommentAndOverrideCollection_sel]
	@objectKey xml
AS

SET NOCOUNT ON

DECLARE	@company_code varchar(3)
	, @customer_number varchar(10)
	, @pos_sales_end_date datetime
	, @item_number varchar(12)
	, @forecast_method varchar(2)

SELECT	@company_code = @objectKey.value('/ObjectKey[1]/@CompanyCode', 'varchar(3)')
	, @customer_number = @objectKey.value('/ObjectKey[1]/@CustomerNumber', 'varchar(10)')
	, @pos_sales_end_date = @objectKey.value('/ObjectKey[1]/@POSSalesEndDate', 'datetime')
	, @item_number = @objectKey.value('/ObjectKey[1]/@ItemNumber', 'varchar(12)')
	, @forecast_method = @objectKey.value('/ObjectKey[1]/@ForecastMethod', 'varchar(2)')

SELECT company_code
      , customer_number
      , pos_sales_end_date
      , item_number
      , forecast_method
      , forecast_value_key
      , date_time
      , comment
      , manual_flag
  FROM ForecastCommentAndOverride
WHERE	company_code = @company_code
AND	customer_number = @customer_number
AND	pos_sales_end_date = @pos_sales_end_date
AND	item_number = @item_number
AND	forecast_method = @forecast_method
ORDER BY 7 DESC
