/*
   Thursday, January 17, 20082:58:21 PM
   User: sa
   Server: LSC-EGDEV
   Database: Easygrants
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.a_BUDGET_CATEGORY ADD
	lsc_fund_code int NULL
GO
COMMIT
