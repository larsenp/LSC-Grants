Imports System.Web.UI.HtmlControls
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Application.Controls.Page.PAHierarchy

Public Class cAppFormByCriterion
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Private mStandardFormLocation As String = ""
	Private mFormsHash As Hashtable
	Protected spnInquiries As HtmlGenericControl

	Private ReadOnly Property StandardFormLocation() As String
		Get
			If mStandardFormLocation = "" Then
				Dim aStandardFormEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("StandardInquiryForm")
				mStandardFormLocation = cXMLDoc.AttributeToString(aStandardFormEl, "Location")
			End If
			Return mStandardFormLocation
		End Get
	End Property

	Protected Overrides Sub RenderControls(ByVal aDataObjectNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.RenderControls(aDataObjectNode, aDataObjectList)
		If cXMLDoc.AttributeToString(aDataObjectNode, "Key") = "LscReviewInquiry" Then
			For Each aInquiry As cDataObject In aDataObjectList
				LoadInquiryForm(aInquiry)
			Next
		End If
	End Sub

	Public Sub LoadInquiryForm(ByVal aInquiry As cDataObject)
		Dim aForm As UserControl
		If aInquiry.GetPropertyString("Abbr").Substring(0, 1) = "F" Then
			aForm = LoadSpecialForm(aInquiry)
		Else
			aForm = LoadStandardForm(aInquiry)
		End If
		If Not aForm Is Nothing Then
			mFormsHash.Add(aInquiry.GetPropertyInt("LscReviewInquiryID"), aForm)
		End If
	End Sub

	Public Function LoadStandardForm(ByVal aInquiry As cDataObject) As cDataPresenterCtl
		Dim aForm As cStandardInquiryForm = CType(Page, Core.Web.Modules.cModulePage).CorePage_LoadControl(StandardFormLocation, "ctlInq" & aInquiry.GetPropertyString("LscReviewInquiryID"), spnInquiries)
		aForm.InquiryID = aInquiry.GetPropertyInt("LscReviewInquiryID")
	End Function

	Public Function LoadSpecialForm(ByVal aInquiry As cDataObject) As cDataPresenterCtl
		Return Nothing
	End Function

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement As XmlElement)
		MyBase.DataPresenter_SaveDataObject(aDataObjectElement)
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "LscReviewInquiry" Then
			Dim aQList As cDataObjectList = Me.DataObjectCollection("LscReviewInquiry")
		End If
	End Sub

End Class

End Namespace
