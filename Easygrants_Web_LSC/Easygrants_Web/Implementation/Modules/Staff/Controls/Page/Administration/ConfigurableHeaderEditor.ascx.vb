Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports EasyGrants.Web
Imports EasyGrants.DataAccess.Report

Namespace Easygrants_Web.Modules.Staff.Controls.Page
Public Class cConfigurableHeaderEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub


	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		Dim aHeadeLabelDOL As cDataObjectList = Me.DataObjectCollection("HeaderLabel")
		If aHeadeLabelDOL(0).GetPropertyString("LabelText", "").Trim = "" Then
			aHeadeLabelDOL(0)("LabelText") = aHeadeLabelDOL(0)("LabelDisplayName")
			aHeadeLabelDOL(0).SaveData()
		End If
		Me.WebAppl.ConfigLabelsCollection(aHeadeLabelDOL(0)("LabelName"), aHeadeLabelDOL(0)("LabelText"))
	End Sub
End Class

End Namespace
