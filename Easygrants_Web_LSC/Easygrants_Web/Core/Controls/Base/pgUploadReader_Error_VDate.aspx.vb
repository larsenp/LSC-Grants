Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public Class pgUploadReader_Error_VDate
	Inherits Core.Web.cCorePage
'=============================================================

	'Protected spnStyles As HtmlGenericControl
	Protected spnServerErrorMsg As HtmlGenericControl
	Protected tdFileInvalid As HtmlTableCell
	Protected tdExceptionCaught As HtmlTableCell

	Private mResult As String = "An undetermined error occurred"
	Private mStatus As Integer = -3

'=============================================================

	Public ReadOnly Property Result() As String
	Get
		Result = mResult
	End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property SubmittedFileID() As String
		Get
			SubmittedFileID = Request.QueryString("SubmittedFileID")
		End Get
	End Property

'=============================================================

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aSubmittedFileDataObj As cDataObject

		'CorePage_LoadStyles(spnStyles)

		'Get submitted file information in data object, using query string parameters as filters
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
		aSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aSubmittedFileDataObj Is Nothing Then
			mStatus = aSubmittedFileDataObj.GetPropertyString("ConversionStatus")
			If mStatus = -3 AndAlso aSubmittedFileDataObj.GetPropertyString("ConversionResult", "") <> "" Then
				mResult = aSubmittedFileDataObj.GetPropertyString("ConversionResult")
			Else
				mResult = spnServerErrorMsg.InnerText
			End If
		End If

		Select Case mStatus
			Case -2
				tdFileInvalid.Visible = True
			Case Else
				tdExceptionCaught.Visible = True
		End Select
	End Sub

'=============================================================

End Class
End Namespace
