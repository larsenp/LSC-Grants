/*
Developer		: 	Harish Avula
Date			:	03/31/2009
Modification	:	Added new Column to baseline table as Implementation\Modules\Staff\Controls\Page\Administration\ProjectPaymentEditor.ascx needs to store the value
*/

ALTER TABLE PROJECT_PAYMENT ADD request_status_id  int;

GO