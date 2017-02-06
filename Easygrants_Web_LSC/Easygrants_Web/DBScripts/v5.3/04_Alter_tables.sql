ALTER TABLE a_PROGRAM ADD short_name varchar(10)
GO
ALTER TABLE a_COMPETITION ADD short_name varchar(10)
GO
ALTER TABLE a_WF_PROJECT ADD short_name varchar(10)
GO

UPDATE a_PROGRAM SET short_name = substring(description,0,11)
GO
UPDATE a_COMPETITION SET short_name = substring(description,0,11)
GO
UPDATE a_WF_PROJECT SET short_name = substring(description,0,11)
GO
