declare @new_id int

EXEC @new_id = getid_sel
	@table = 'c_FILE_EXTENSIONS',
	@mode = 2

INSERT c_FILE_EXTENSIONS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	'.docx',
	'.docx',
	@new_id)

EXEC @new_id = getid_sel
	@table = 'c_FILE_EXTENSIONS',
	@mode = 2

INSERT c_FILE_EXTENSIONS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(@new_id,
	'.xlsx',
	'.xlsx',
	@new_id)