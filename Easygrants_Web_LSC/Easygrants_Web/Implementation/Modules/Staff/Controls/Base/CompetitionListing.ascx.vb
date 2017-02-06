Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.Base


Public MustInherit Class cCompetitionListing
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected btnClear As cCSSButton

'=============================================================

	Protected ReadOnly Property CompetitionID() As String
		Get
			CompetitionID = Request.QueryString("CompetitionID")
		End Get
	End Property

'-------------------------------------------------------------

	Protected ReadOnly Property ProgramID() As String
		Get
			ProgramID = Request.QueryString("ProgramID")
		End Get
	End Property

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		btnClear.Visible = Not (CompetitionID = "")

		MyBase.CoreCtl_Load(sender, e)
	End Sub

'=============================================================

 '   Public Overloads Sub EventController_Delete(ByVal aDataObjectNode As XmlNode)
 '       Dim aCompetitionID As Integer
 '       aCompetitionID = cXMLDoc.AttributeToInt(aDataObjectNode, "Value", 0)
	'	'TO DO: Delete CompetitionWHCF filtered by CompetitionID

 '       MyBase.EventController_Delete(aDataObjectNode)

 '       CorePage.Redirect()
	'End Sub

'=============================================================
End Class


End Namespace 'Easygrants_Web.Modules.Staff.Controls.Base