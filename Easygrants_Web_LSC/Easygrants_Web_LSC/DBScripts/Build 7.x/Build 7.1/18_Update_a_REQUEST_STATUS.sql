UPDATE a_REQUEST_STATUS
	SET sort_order = 4
	WHERE  request_status = 'Approved'

UPDATE a_REQUEST_STATUS
	SET sort_order = 3
	WHERE  request_status = 'Completed'

UPDATE a_REQUEST_STATUS
	SET sort_order = 2
	WHERE  request_status = 'Requested'

UPDATE a_REQUEST_STATUS
	SET sort_order = 5
	WHERE  request_status = 'Paid'

UPDATE a_REQUEST_STATUS
	SET request_status = 'Received'
	WHERE request_status = 'Requested'