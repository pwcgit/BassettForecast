﻿CREATE PROCEDURE [dbo].[utlRestoreTrendByCompanyItemPriorToImport]
AS
SET NOCOUNT ON

DECLARE	@errorNumber int
	, @errorMessage varchar(255)
	, @errorSeverity int
	, @errorState int
	, @errorLine int
	, @errorProcedure varchar(255)
	, @rowRestored int

SELECT @errorNumber = 0
	, @errorMessage = ''
	, @errorSeverity = 0
	, @errorState = 0
	, @errorLine = 0
	, @errorProcedure = 'utlRestoreTrendByCompanyItemPriorToImport'
	, @rowRestored = 0

BEGIN TRY
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ForecastTrendByCompanyItemPriorToImport') AND type = N'U') BEGIN
		IF (SELECT COUNT(1) FROM ForecastTrendByCompanyItemPriorToImport) > 0 BEGIN
			TRUNCATE TABLE ForecastTrendByCompanyItem

			INSERT	ForecastTrendByCompanyItem
				  ([company_code]
				  ,[item_number]
				  ,[forecast_method]
				  ,[factor_month_01]
				  ,[factor_month_02]
				  ,[factor_month_03]
				  ,[factor_month_04]
				  ,[factor_month_05]
				  ,[factor_month_06]
				  ,[factor_month_07]
				  ,[factor_month_08]
				  ,[factor_month_09]
				  ,[factor_month_10]
				  ,[factor_month_11]
				  ,[factor_month_12])
			SELECT [company_code]
				  ,[item_number]
				  ,[forecast_method]
				  ,[factor_month_01]
				  ,[factor_month_02]
				  ,[factor_month_03]
				  ,[factor_month_04]
				  ,[factor_month_05]
				  ,[factor_month_06]
				  ,[factor_month_07]
				  ,[factor_month_08]
				  ,[factor_month_09]
				  ,[factor_month_10]
				  ,[factor_month_11]
				  ,[factor_month_12]
			FROM	ForecastTrendByCompanyItemPriorToImport
			ORDER BY 1, 2, 3

			SELECT	@rowRestored = @@ROWCOUNT

			DBCC DBREINDEX(ForecastTrendByCompanyItem)
		END ELSE BEGIN
			SELECT @errorNumber = 1
				, @errorMessage = 'ForecastTrendByCompanyItem Backup table contains zero record.'
		END
	END ELSE BEGIN
		SELECT @errorNumber = 1
			, @errorMessage = 'ForecastTrendByCompanyItem Backup table does not exist.'
	END
END TRY
BEGIN CATCH
	SELECT @errorNumber = ERROR_NUMBER()
	, @errorMessage = ERROR_MESSAGE()
	, @errorSeverity = ERROR_SEVERITY()
	, @errorState = ERROR_STATE()
	, @errorLine = ERROR_LINE()
	, @errorProcedure = ERROR_PROCEDURE()
END CATCH

SELECT @errorNumber errorNumber
	, @errorMessage errorMessage
	, @errorSeverity errorSeverity
	, @errorState errorState
	, @errorLine errorLine
	, @errorProcedure errorProcedure
	, @rowRestored rowRestored

