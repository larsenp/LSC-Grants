
ALTER      PROCEDURE [dbo].[spImportPayments]
	@ImportedFileID	int
AS
-- Payment variables
DECLARE @PaymentImportID int,
		@PaymentID int,
		@RelatedPaymentID int,
		@GranteeProjectID int,
		@CheckNumber Varchar(50),
		@PaymentAmount money,
		@TransactionDate datetime,
		@GLAccountID varchar(250)
DECLARE @ErrNo int,
		@AccountFundID int,
		@Cnt int,
		@ReturnCode int,
		@NewPaymentID int,
		@PaymentRowCount int,
		@UploadedPersonID int

DECLARE Import_Cursor CURSOR FORWARD_ONLY FOR
SELECT	payment_import_id,
		payment_id, 
		related_payment_id,
		grantee_project_id,
		check_payment_number, 
		payment_amount, 
		transaction_date,
		gl_account_id
FROM	PAYMENT_IMPORT
WHERE	imported_file_id = @ImportedFileID
AND		is_imported = 0

select @UploadedPersonID = uploaded_by_id from IMPORTED_FILE WHERE imported_file_id = @ImportedFileID


OPEN Import_Cursor

FETCH NEXT FROM Import_Cursor
INTO	@PaymentImportID,
		@PaymentID, 
		@RelatedPaymentID,
		@GranteeProjectID,
		@CheckNumber, 
		@PaymentAmount,
		@TransactionDate,
		@GLAccountID

BEGIN TRANSACTION

WHILE @@FETCH_STATUS = 0
BEGIN
	If @PaymentID is null
	BEGIN
		exec @ReturnCode = getid_sel @table = 'PAYMENT', @id = @NewPaymentID OUTPUT, @mode = 2
		--Since this a refund/rescind/void originated in MIPS requested_amount and payment_amount are set to the same value
		INSERT PAYMENT
			(payment_id, grantee_project_id, check_payment_number, requested_amount, payment_amount, gl_account_id, 
				request_status_id, payment_date, create_user, create_date, related_payment_id, is_supplemental)
		values (@NewPaymentID, @GranteeProjectID, @CheckNumber, @PaymentAmount, @PaymentAmount, @GLAccountID, 
				4, @TransactionDate, @UploadedPersonID, GetDate(), @RelatedPaymentID, 0)
	END

	Else
	BEGIN

		UPDATE	PAYMENT
		SET		
			check_payment_number = @CheckNumber,
			payment_amount = @PaymentAmount, 
			payment_date = @TransactionDate,
			--gl_account_id = @GLAccountID, 
			request_status_id = 4, -- Paid
			modify_user = @UploadedPersonID,
			modify_date = GetDate(),
			related_payment_id = @RelatedPaymentID,
			is_supplemental =  0
		WHERE	payment_id = @PaymentID
	END

	IF @@ERROR <> 0
	BEGIN
		Set @ErrNo = -11
		GOTO Err
	END

	UPDATE	PAYMENT_IMPORT
	SET		is_imported = 1
	WHERE	payment_import_id = @PaymentImportID
	IF @@ERROR <> 0
	BEGIN
		Set @ErrNo = -12
		GOTO Err
	END

    FETCH NEXT FROM Import_Cursor
	INTO	@PaymentImportID,
			@PaymentID, 
			@RelatedPaymentID,
			@GranteeProjectID,
			@CheckNumber, 
			@PaymentAmount,
			@TransactionDate,
			@GLAccountID
END

SELECT	@Cnt=count(*)
FROM	PAYMENT_IMPORT
WHERE	imported_file_id = @ImportedFileID
AND		is_imported = 0

IF @Cnt = 0
BEGIN
	UPDATE	IMPORTED_FILE
	SET		import_status = 4, --successful final import
			import_result = 'Successful final import.'
	WHERE	imported_file_id = @ImportedFileID
	IF @@ERROR <> 0
	BEGIN
		Set @ErrNo = -13
		GOTO Err
	END
END

CLOSE Import_Cursor
DEALLOCATE Import_Cursor

	COMMIT TRANSACTION
	SET NOCOUNT OFF
	RETURN 0

Err:
	ROLLBACK TRANSACTION
	SET NOCOUNT OFF
	RETURN @ErrNo
