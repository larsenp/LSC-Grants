Imports Core.DataAccess
Imports Core.Web.User
Imports EasyGrants.Web
Imports EasyGrants.Web.User

Namespace EasyGrants_Web.User

Public Class cEGHomeUser
	Inherits EasyGrants.Web.User.cEGHomeUser

	Public Sub New(ByVal aAppl As cEGAppl, ByVal aSession As cEGSession)
		MyBase.New(aAppl, aSession)
	End Sub


	Public Sub New(ByVal aUser As cEGUser)
		MyBase.New(aUser)
	End Sub

	Public Overrides Sub Notify_DataModified(ByVal aDataObjectFactory As cDataObjectFactory, ByVal aDataObjHash As Hashtable)
		'Do nothing on save from the home module. 
		'This overrides the baseline functionality which automatically wipes out all PDFs corresponding to a user when the user saves any data in the Home module.
	End Sub

End Class

End Namespace
