ALTER TABLE s_SHAREPOINT_INTEGRATION ADD  invalid_character_regex varchar(100)

GO

UPDATE [s_SHAREPOINT_INTEGRATION] SET [invalid_character_regex] = '[\^~\"#%&*:<>?\\//{|}.\s]*' WHERE [id] = 1
GO