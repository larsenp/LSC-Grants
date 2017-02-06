insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(1, '1.0', '1.0', 1, 1)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(2, '1.5', '1.5', 1.5, 2)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(3, '2.0', '2.0', 2, 3)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(4, '2.5', '2.5', 2.5, 4)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(5, '3.0', '3.0', 3.0, 5)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(6, '3.5', '3.5', 3.5, 6)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(7, '4.0', '4.0', 4.0, 7)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(8, '4.5', '4.5', 4.5, 8)

insert LSC_c_REVIEW_INQUIRY_SCORE
	(id, abbr, description, value, sort_order)
	values
		(9, '5.0', '5.0', 5.0, 9)

update s_id_gen
	set next_id = 10 where table_name = 'LSC_c_REVIEW_INQUIRY_SCORE'
