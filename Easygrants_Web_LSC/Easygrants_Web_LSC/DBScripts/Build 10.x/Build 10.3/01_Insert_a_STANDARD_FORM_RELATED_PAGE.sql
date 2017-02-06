--Add existing milestone editor to application module (Mantis 2695)

declare @standard_form_id int, @new_id int

select @standard_form_id = id
	from a_standard_forms
	where name = 'LSC - TIG Application - Proposed Payment Schedule'

exec @new_id = getid_sel @table = 'a_standard_form_related_page'

INSERT INTO [a_STANDARD_FORM_RELATED_PAGE]
           ([id]
           ,[standard_form_id]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (@new_id
           ,@standard_form_id
           ,'MilestoneEditor'
           ,'Milestone Editor'
           ,'Implementation/Modules/TIG_Application/Forms/MilestoneEditor.ascx')
