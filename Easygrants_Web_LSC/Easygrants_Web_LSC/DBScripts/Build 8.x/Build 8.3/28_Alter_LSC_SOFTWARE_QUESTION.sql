--Added two new columns to Website Information Section in Application.

ALTER TABLE LSC_SOFTWARE_QUESTION
  ADD lawhelp_interactive_use [bit] NULL

ALTER TABLE LSC_SOFTWARE_QUESTION
  ADD a2j_author_use [bit] NULL

ALTER TABLE LSC_SOFTWARE_QUESTION
  ADD legal_research_desc [varchar](max) NULL

