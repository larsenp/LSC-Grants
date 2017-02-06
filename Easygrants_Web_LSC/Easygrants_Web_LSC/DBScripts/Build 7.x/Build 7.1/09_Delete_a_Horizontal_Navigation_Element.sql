---To Remove the Demographics and Media tabs

Delete from dbo.a_HORIZONTAL_NAVIGATION_ELEMENT
where key_name= 'GrantsDemographics' and nav_title = 'Demographics'

Delete from dbo.a_HORIZONTAL_NAVIGATION_ELEMENT
where key_name= 'GrantsMedia' and nav_title = 'Media'

