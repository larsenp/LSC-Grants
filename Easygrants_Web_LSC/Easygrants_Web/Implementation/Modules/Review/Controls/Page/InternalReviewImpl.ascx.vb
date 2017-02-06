Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Implementation.Modules.Review.Controls.Page
Imports Core.Web.SvrCtls
Imports EasyGrants.Web.Modules

Namespace Implementation.Modules.Review.Controls.Page
Public MustInherit Class cInternalReviewImpl
	Inherits cInternalReview

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub



End Class
End Namespace