/*
   Wednesday, March 05, 20085:10:03 PM
   User: sa
   Server: LSC-EGDEV
   Database: Easygrants_Migration
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
CREATE TABLE dbo.Tmp_LSC_TECHNOLOGY
	(
	lsc_technology_id int NOT NULL,
	grantee_project_id int NULL,
	wf_task_assignment_id int NULL,
	computer_capacity_desk bit NULL,
	computer_capacity_training bit NULL,
	computer_capacity_pdf bit NULL,
	access_email_case int NULL,
	access_email_staff int NULL,
	access_research_desktop int NULL,
	access_research_other int NULL,
	access_research_none int NULL,
	connectivity_wi_one bit NULL,
	connectivity_wi_all bit NULL,
	connectivity_bt_two bit NULL,
	connectivity_bt_all bit NULL,
	dial_up bit NULL,
	dsl bit NULL,
	isdn bit NULL,
	frame bit NULL,
	t1 bit NULL,
	cable bit NULL,
	satellite bit NULL,
	voice_over_ip bit NULL,
	voice_over_ip_network varchar(100) NULL,
	voice_over_ip_bandwidth varchar(100) NULL,
	voice_over_ip_router varchar(100) NULL,
	intake_phone int NULL,
	intake_direct bit NULL,
	intake_may bit NULL,
	intake_incoming int NULL,
	intake_maximum int NULL,
	voice_mail bit NULL,
	intake_automated bit NULL,
	call_distribution bit NULL,
	self_direct bit NULL,
	self_select bit NULL,
	callback bit NULL,
	return_call bit NULL,
	telephony bit NULL,
	interactive_voice bit NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.LSC_TECHNOLOGY)
	 EXEC('INSERT INTO dbo.Tmp_LSC_TECHNOLOGY (lsc_technology_id, grantee_project_id, computer_capacity_desk, computer_capacity_training, computer_capacity_pdf, access_email_case, access_email_staff, access_research_desktop, access_research_other, access_research_none, connectivity_wi_one, connectivity_wi_all, connectivity_bt_two, connectivity_bt_all, dial_up, dsl, isdn, frame, t1, cable, satellite, voice_over_ip, voice_over_ip_network, voice_over_ip_bandwidth, voice_over_ip_router, intake_phone, intake_direct, intake_may, intake_incoming, intake_maximum, voice_mail, intake_automated, call_distribution, self_direct, self_select, callback, return_call, telephony, interactive_voice)
		SELECT lsc_technology_id, grantee_project_id, computer_capacity_desk, computer_capacity_training, computer_capacity_pdf, access_email_case, access_email_staff, access_research_desktop, access_research_other, access_research_none, connectivity_wi_one, connectivity_wi_all, connectivity_bt_two, connectivity_bt_all, dial_up, dsl, isdn, frame, t1, cable, satellite, voice_over_ip, voice_over_ip_network, voice_over_ip_bandwidth, voice_over_ip_router, intake_phone, intake_direct, intake_may, intake_incoming, intake_maximum, voice_mail, intake_automated, call_distribution, self_direct, self_select, callback, return_call, telephony, interactive_voice FROM dbo.LSC_TECHNOLOGY WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.LSC_TECHNOLOGY
GO
EXECUTE sp_rename N'dbo.Tmp_LSC_TECHNOLOGY', N'LSC_TECHNOLOGY', 'OBJECT' 
GO
ALTER TABLE dbo.LSC_TECHNOLOGY ADD CONSTRAINT
	PK_grantee_project1 PRIMARY KEY CLUSTERED 
	(
	lsc_technology_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
