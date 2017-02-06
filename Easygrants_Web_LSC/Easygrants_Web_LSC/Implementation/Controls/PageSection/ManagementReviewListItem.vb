Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Imports Core.Web.Modules
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports System.Text

Namespace Implementation.Controls.PageSection

Public Class cManagementReviewListItem
	Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl

	Protected chkSubmit As CheckBox
	Protected spnValidation As HtmlGenericControl
	Protected lnkValidation As HtmlAnchor


	Protected ReadOnly Property ManagementReviewList() As cManagementReviewList
		Get
			Return CType(Me.DataPresenterList.EventController, cManagementReviewList)
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		If Me.Valid Then
			Me.chkSubmit.Visible = True
		Else
			Me.lnkValidation.Visible = True
			Dim aValidationNode As XmlNode = (CType(Page, cModulePage)).ValidationNode
			Dim aValidationHeaderNode As XmlNode = aValidationNode.SelectSingleNode("ValidationHeader")
			If aValidationHeaderNode Is Nothing Then
				WriteValidationResult(aValidationNode)
			Else
				WriteValidationResult(aValidationHeaderNode)
			End If
		End If
	End Sub

	 Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		If Me.chkSubmit.Checked Then
			Dim aWfTAList As cDataObjectList = Me.DataObjectCollection("WfTaskAssignment")
			Me.ManagementReviewList.AddWfTA(aWfTAList(0).GetPropertyInt("WfTaskAssignmentID"))
		End If
	 End Sub

	Public Sub SwitchWfTA(ByVal aWfTaskAssignmentID As String, ByVal aGranteeProjectID As String)
		Me.ManagementReviewList.SwitchWfTA(aWfTaskAssignmentID, aGranteeProjectID)
	End Sub

	Protected Sub WriteValidationResult(ByVal aValidationNode As XmlNode)
		Dim aResultList As XmlNodeList = aValidationNode.SelectNodes("ValidationSection/ValidationItem/Results/Result[@ActualResult='True']")
		Dim aOutput As StringBuilder = New StringBuilder()
		For Each aResultNode As XmlNode In aResultList
			aOutput.Append("<p>")
			aOutput.Append(aResultNode.Attributes("Message").Value)
			aOutput.Append("</p>")
		Next
		Me.spnValidation.InnerHtml = aOutput.ToString
		'The page maintains only one validation node. The node must be cleared of its results before processing the next review assignment in the list
		For Each aResultNode As XmlNode In aResultList
			Dim aActual As XmlAttribute = aResultNode.Attributes("ActualResult")
			aResultNode.Attributes.Remove(aActual)
		Next
	End Sub

End Class

End Namespace

