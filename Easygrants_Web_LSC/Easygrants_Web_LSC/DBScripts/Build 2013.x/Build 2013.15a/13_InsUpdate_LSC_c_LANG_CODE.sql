
UPDATE LSC_c_LANG_CODE
	SET end_date = '2013-12-1'
	WHERE abbr in ('00', '10', '44', '25', '30', '32', '40', '46', '52', '58', '65', '66', '80', '90', '20', '99')

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(100
		,'00'
		,'00 - English only'
		,1)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(101
		,'10'
		,'10 - American Sign Language and other sign languages'
		,2)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(102
		,'44'
		,'44 - Spanish/Spanish Creole'
		,3)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 4
	WHERE abbr = '34'--French

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(103
		,'25'
		,'25 - French Creole'
		,5)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 6
	WHERE abbr = '38'--Italian

UPDATE LSC_c_LANG_CODE
	SET sort_order = 7
	WHERE abbr = '42'--Portuguese

UPDATE LSC_c_LANG_CODE
	SET sort_order = 8
	WHERE abbr = '36'--German

UPDATE LSC_c_LANG_CODE
	SET sort_order = 9
	WHERE abbr = '67'--Yiddish

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(104
		,'11'
		,'11 - Other West Germanic languages'
		,10)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(105
		,'12'
		,'12 - Scandinavian languages'
		,11)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 12
	WHERE abbr = '54'--Greek

UPDATE LSC_c_LANG_CODE
	SET sort_order = 13
	WHERE abbr = '62'--Russian

UPDATE LSC_c_LANG_CODE
	SET sort_order = 14
	WHERE abbr = '60'--Polish

UPDATE LSC_c_LANG_CODE
	SET sort_order = 15
	WHERE abbr = '64'--Serbo-Croatian

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(106
		,'13'
		,'13 - Other Slavic languages'
		,16)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 17
	WHERE abbr = '50'--Armenian

UPDATE LSC_c_LANG_CODE
	SET sort_order = 18
	WHERE abbr = '75'--Persian

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(107
		,'76'
		,'76 - Gujarati'
		,19)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 20
	WHERE abbr = '84'--Hindi

UPDATE LSC_c_LANG_CODE
	SET sort_order = 21
	WHERE abbr = '85'--Urdu

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(108
		,'14'
		,'14 - Other Indic languages'
		,22)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(109
		,'15'
		,'15 - Other Indo-European languages'
		,23)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 24
	WHERE abbr = '82'--Chinese

UPDATE LSC_c_LANG_CODE
	SET sort_order = 25
	WHERE abbr = '86'--Japanese

UPDATE LSC_c_LANG_CODE
	SET sort_order = 26
	WHERE abbr = '88'--Korean

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(110
		,'80'
		,'80 - Mon-Khmer, Cambodian'
		,27)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(111
		,'81'
		,'81 - Hmong'
		,28)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 29
	WHERE abbr = '92'--Thai

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(112
		,'83'
		,'83 - Laotian'
		,30)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 31
	WHERE abbr = '94'--Vietnamese

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(113
		,'16'
		,'16 - Other Asian languages'
		,32)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(114
		,'90'
		,'90 - Tagalog'
		,33)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(115
		,'17'
		,'17 - Other Pacific Island languages'
		,34)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(116
		,'98'
		,'98 - Navajo'
		,35)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(117
		,'20'
		,'20 - Other Native American languages'
		,36)

UPDATE LSC_c_LANG_CODE
	SET sort_order = 37
	WHERE abbr = '56'--Hungarian

UPDATE LSC_c_LANG_CODE
	SET sort_order = 38
	WHERE abbr = '70'--Arabic

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(118
		,'68'
		,'68 - Hebrew'
		,39)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(119
		,'18'
		,'18 - African languages'
		,40)

INSERT LSC_c_LANG_CODE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(120
		,'99'
		,'99 - All other languages'
		,41)

UPDATE s_ID_GEN
	SET next_id = 121
	WHERE table_name = 'LSC_c_LANG_CODE'