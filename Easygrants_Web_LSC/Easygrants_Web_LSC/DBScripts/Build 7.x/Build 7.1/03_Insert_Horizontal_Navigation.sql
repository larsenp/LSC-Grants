DECLARE @hne_id INT, @hnea_id INT

exec getid_sel @table = 'a_HORIZONTAL_NAVIGATION_ELEMENT',
	@id = @hne_id OUTPUT

INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT]
           ([horiz_nav_element_id]
           ,[horiz_nav_id]
           ,[key_name]
           ,[nav_title]
           ,[enable]
           ,[source_file]
           ,[method])
     VALUES
           (@hne_id
           ,1
           ,'GrantsTIG'
           ,'TIG'
           ,1
           ,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantsTIG'
           ,NULL)

exec getid_sel @table = 'a_HORIZONTAL_NAVIGATION_ELEMENT_ARG',
	@id = @hnea_id OUTPUT

INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG]
           ([horiz_nav_element_arg_id]
           ,[horiz_nav_element_id]
           ,[arg_type]
           ,[arg_property_key])
     VALUES
           (@hnea_id
           ,@hne_id
           ,'QueryString'
           ,'GranteeProjectID')
