ALTER TABLE LSC_c_LANG_CODE
	ADD successor_id INT NULL

GO

UPDATE LSC_c_LANG_CODE
	SET successor_id = 104 
	WHERE id = 30

UPDATE LSC_c_LANG_CODE
	SET successor_id = 105
	WHERE id = 32

UPDATE LSC_c_LANG_CODE
	SET successor_id = 105
	WHERE id = 40

UPDATE LSC_c_LANG_CODE
	SET successor_id = 105
	WHERE id = 46

UPDATE LSC_c_LANG_CODE
	SET successor_id = 106
	WHERE id = 52

UPDATE LSC_c_LANG_CODE
	SET successor_id = 106
	WHERE id = 58

UPDATE LSC_c_LANG_CODE
	SET successor_id = 106
	WHERE id = 65

UPDATE LSC_c_LANG_CODE
	SET successor_id = 106
	WHERE id = 66
