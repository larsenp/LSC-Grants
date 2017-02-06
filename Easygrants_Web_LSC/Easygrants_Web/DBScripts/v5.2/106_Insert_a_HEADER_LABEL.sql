INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(16, 'FundName', 'Fund Name', 'Fund Name');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(17, 'FundDescription', 'Fund Description', 'Fund Description');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(18, 'GrantAllocation', 'Grant Allocation', 'Grant Allocation');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(19, 'PaymentAllocation', 'Payment Allocation', 'Payment Allocation');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(20, 'FundBalance', 'Fund Balance', 'Fund Balance');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(21, 'FundType', 'Fund Type', 'Fund Type');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(22, 'FundStatus', 'Status', 'Status');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(24, 'FundEndDate', 'Fund End Date', 'Fund End Date');

INSERT INTO [a_HEADER_LABEL]([id], [label_name], [label_text], [label_display_name]) 
	VALUES(25, 'AllocationStatus', 'Allocation Status', 'Allocation Status');


update s_id_gen set next_id = 26 where table_name = 'a_HEADER_LABEL'