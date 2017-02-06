DECLARE @new_id INT

EXEC @new_id = getid_sel @table='a_STANDARD_FORM_RELATED_PAGE'

INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (@new_id
           ,1247
           ,'Contracts'
           ,'Contracts'
           ,'Implementation/Modules/TIG_Application/Forms/Contracts.ascx')
           
EXEC @new_id = getid_sel @table='a_STANDARD_FORM_RELATED_PAGE'

INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (@new_id
           ,1247
           ,'ContractEditor'
           ,'Contract Editor'
           ,'Implementation/Modules/TIG_Application/Forms/ContractEditor.ascx')
           