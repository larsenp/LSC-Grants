UPDATE LSC_c_CASE_TYPE
	SET description = '01 Bankruptcy/Debt Relief'
	WHERE sort_order = 1
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '02 Collections/Repossessions'
	WHERE sort_order = 2
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '05 Pred. Lending Practices (Not Mortgages)'
	WHERE sort_order = 5
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '06 Loans/Install. Purch. (Not Collections)'
	WHERE sort_order = 6
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '08 Unfair/Deceptive Sales/Practices (Not Real Prop.)'
	WHERE sort_order = 8
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '09 Oth. Consumer/Finance'
	WHERE sort_order = 9
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '12 Discipline (incl. Expulsion & Susp.)'
	WHERE sort_order = 12
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '13 Special Ed./Learning Disabilities'
	WHERE sort_order = 13
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '14 Access (incl. Bilingual, Residency, Testing)'
	WHERE sort_order = 14
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '15 Vocational Ed.'
	WHERE sort_order = 15
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '19 Other Education'
	WHERE sort_order = 19
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '22 Wage Claims & Oth. FLSA'
	WHERE sort_order = 22
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '26 Agricultural Worker (Not Wage Claims/FLSA)'
	WHERE sort_order = 26
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '29 Oth. Employment'
	WHERE sort_order = 29
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '32 Divorce/Separation/Annul.'
	WHERE sort_order = 32
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '33 Adult Guardian./Conservator.'
	WHERE sort_order = 33
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '39 Oth. Family'
	WHERE sort_order = 39
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '42 Neglected/Abused/Depend.'
	WHERE sort_order = 42
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '44 Minor Guardian./Conservator.'
	WHERE sort_order = 44
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '49 Oth. Juvenile'
	WHERE sort_order = 49
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '53 Gov''t Children''s Health Insurance'
	WHERE sort_order = 53
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '54 Home & Community Based Care'
	WHERE sort_order = 54
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '57 State & Local Health'
	WHERE sort_order = 57
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '59 Oth. Health'
	WHERE sort_order = 59
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '61 Federally Subsidized Housing'
	WHERE sort_order = 61
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '62 Homeownership/Real Prop. (Not Foreclosure)'
	WHERE sort_order = 62
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '64 Public Housing'
	WHERE sort_order = 64
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '67 Mort. Floreclosures (Not Pred. Lend.)'
	WHERE sort_order = 67
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '68 Mort. Pred. Lend./Practices'
	WHERE sort_order = 68
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '69 Oth. Housing'
	WHERE sort_order = 69
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '71 TANF'
	WHERE sort_order = 71
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '73 Food Stamps'
	WHERE sort_order = 73
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '76 Unemployment Comp.'
	WHERE sort_order = 76
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '78 State and Local Income Maint.'
	WHERE sort_order = 78
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '79 Oth. Income Maint.'
	WHERE sort_order = 79
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '81 Immigration/Naturalization'
	WHERE sort_order = 81
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET end_date = getdate()
	WHERE sort_order = 83
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '89 Oth. Individual Rights'
	WHERE sort_order = 89
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '91 Legal Assist. to Non-Profit Org./Group (Incl. Incorp./Dissolution)'
	WHERE sort_order = 91
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '93 Licenses (Drivers, Occupation & Oth.)'
	WHERE sort_order = 93
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '95 Wills/Estates'
	WHERE sort_order = 95
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '96 Adv. Directives/Powers of Attorney'
	WHERE sort_order = 96
		AND end_date is null

UPDATE LSC_c_CASE_TYPE
	SET description = '99 Other Miscellaneous'
	WHERE sort_order = 99
		AND end_date is null


