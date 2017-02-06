/****** Object:  View [dbo].[vLSC_OFFICE]    Script Date: 02/19/2009 19:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_OFFICE]

AS

select o.lsc_office_id,
	org.legacy_organization_id recipient_id,
	org.organization_name,
	tp.sort_order year,
	o.organization_id,
	o.time_period_id,
	o.off_id,
	o.off_Type_id,
	ot.abbr off_type,
	o.off_name,
	o.addr1_off,
	o.addr2_off,
	o.city_off,
	o.state_province_id_off,
	sp.abbr [state],
	o.zip_off,
	o.phone,
	o.fax,
	o.email,
	o.person_incharge,
	o.Note1,
	o.WorkWeek
	from lsc_office o
		join organization org on o.organization_id = org.organization_id 
		join c_time_period tp on o.time_period_id = tp.id 
		join c_state_prov sp on o.state_province_id_off = sp.id
		join LSC_c_OFFICE_TYPE ot ON o.off_type_id = ot.id


