Imports System.Xml
Imports System.IO
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
'Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Namespace Core_Web.Controls.Base

Public MustInherit Class cReportOutputLink
	Inherits Core.Web.cCoreCtl
'====================================================

	Protected ctlButton As cCSSButton
	'Protected ctlLink As HtmlAnchor
	'Protected spnPrefix As HtmlGenericControl
	'Protected spnSuffix As HtmlGenericControl
    Protected ctlStaffRptOut As cstaffReportOutput
    Protected ctlShow As cNewWindowOpener

    Protected mArgumentsList As XmlNodeList
    Protected mDisplayText As String
    Protected mEntityID As String
    Protected mDefinitionID As String
    Protected mKey As String
    'Protected mEventHandler As EventHandler
    Protected mDisplayStaffReportOutput As String = "True"

'----------------------------------------------------

	Protected ReadOnly Property ArgumentsList() As XmlNodeList
		Get
			ArgumentsList = mArgumentsList
		End Get
	End Property

'----------------------------------------------------

    Public Property EntityID() As String
        Get
            EntityID = mEntityID
        End Get
        Set(ByVal Value As String)
            mEntityID = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property DefinitionID() As String
        Get
            DefinitionID = mDefinitionID
        End Get
        Set(ByVal Value As String)
            mDefinitionID = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property Key() As String
        Get
            Key = mKey
        End Get
        Set(ByVal Value As String)
            mKey = Value
        End Set
    End Property
    
    Public Property DisplayStaffReportOutput() As String
        Get
            DisplayStaffReportOutput = mDisplayStaffReportOutput
        End Get
        Set(ByVal Value As String)
            mDisplayStaffReportOutput = Value
        End Set
    End Property

'----------------------------------------------------

    'Public Property EventHandler() As EventHandler
    'Get
    '    Return mEventHandler
    'End Get
    'Set(ByVal Value As EventHandler)
    '    mEventHandler = Value
    '    AddHandler ctlButton, mEventHandler
    'End Set
    'End Property
'----------------------------------------------------

    Public Property DisplayText() As String
    Get
        Return mDisplayText
    End Get
    Set(ByVal Value As String)
        mDisplayText = Value
        If Not mDisplayText = "" Then
            Dim aStrArray As String()

            aStrArray = mDisplayText.Split("~")
            'spnPrefix.InnerHtml = aStrArray(0)
            If aStrArray.Length > 1 Then
                'ctlLink.InnerText = aStrArray(1)
                'ctlLink.InnerHtml = "<i><b>" + aStrArray(1) + "</b></i>"
                ctlButton.Caption = aStrArray(1)
                'If aStrArray.Length > 2 Then
                '    spnSuffix.InnerHtml = aStrArray(2)
                'End If
            End If
        End If
    End Set
    End Property

'====================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        Dim aURL As String

		dim aApplicationID = request.QueryString("ApplicationPDF")
		dim aReviewerID = request.QueryString("ReviewerPDF")
		dim aStaffID = request.QueryString("StaffPDF")
		'ctlButton.Set_ServerClick(AddressOf ButtonClicked)
		'ctlButton.CausesValidation = False
		ctlButton = CType(Me.FindControl("ctlButton"), cCSSButton)

		if not aApplicationID is nothing then
			EntityID = aApplicationID
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aApplicationID)
			'DefinitionID = aList(0).GetRelatedPropertyString("GranteeProject.WfProject.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			DefinitionID = aList(0).GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			if DefinitionID = "" then
				RedirectToPDFErrorPage()
			end if
		else if not aReviewerID is nothing then
			EntityID = aReviewerID
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aReviewerID)
			'DefinitionID = aList(0).GetRelatedPropertyString("GranteeProject.WfProject.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			DefinitionID = aList(0).GetRelatedPropertyString("WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			if DefinitionID = "" then
				RedirectToPDFErrorPage()
			end if
		else if not aStaffID is nothing then
			EntityID = aStaffID
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aStaffID)
			'DefinitionID = aList(0).GetRelatedPropertyString("GranteeProject.WfProject.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			DefinitionID = aList(0).GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			if DefinitionID = "" then
				RedirectToPDFErrorPage()
			end if
		else
			If EntityID Is Nothing Then
				EntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
			End If

			If DefinitionID Is Nothing Then

				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode As XmlNode
				Dim aFiltersNode As XmlNode
				Dim aArgNode As XmlNode
				Dim	aRODefDO As cDataObject

				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReportOutputDefinition", aDataObjectNode, aFiltersNode)
				aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "Key", Key))
			
				aRODefDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
				If Not aRODefDO Is Nothing Then
					DefinitionID = aRODefDO.GetPropertyString("ReportOutputDefinitionID")
				End If			

			End If        
		end if
		
        aURL = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
		aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", EntityID)
        aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", DefinitionID)

		ctlButton.Href = aURL
		ctlButton.Target = "_blank"
        'If EventHandler Is Nothing Then
            'Control acts as a hyperlink
            'ctlLink.HRef = aURL
            'ctlLink.Target = "_blank"
        'Else
            'Control posts back to server and uses NewWindowOpener control
			'ctlShow.NewWindowURL() = aURL
        'End If
        ctlStaffRptOut.ReportOutputLinkCtl = Me
        if MyBase.WebSession.HasStaffUser then
			If DisplayStaffReportOutput = "True" Then
				ctlStaffRptOut.Visible = True
			Else
				ctlStaffRptOut.Visible = False
			End If
		else
			ctlStaffRptOut.Visible = False
		End If        

		'ctlButton.ImageUrl = WebAppl.Build_RootURL("Core/Images/view_pdf.jpg")
        
		If Not ((aApplicationID Is Nothing) And (aReviewerID Is Nothing) And (aStaffID Is Nothing)) Then
			ctlButton.Href = aURL
			ctlButton.Target = "_blank"
			'ctlShow.NewWindowURL() = aURL
			'ctlShow.Open()
			'aURL = Request.QueryString("ReturnURL")
			'ctlShow.RefreshURL() = aURL
		End If
		
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        mArgumentsList = aDisplayControlNode.SelectNodes("Control/Parameters/Argument")
        EventController.EventController_SetArgumentsInNodeList(ArgumentsList)
        'EntityID = cXMLDoc.AttributeToString(ArgumentsList(0), "Value")
        'DefinitionID = cXMLDoc.AttributeToString(ArgumentsList(1), "Value")
		'ctlButton.Set_ServerClick(AddressOf ButtonClicked)
		Dim aArgNode As XmlNode
        For Each aArgNode In mArgumentsList
			Select cXMLDoc.AttributeToString(aArgNode,"PropertyKey")
				Case "EntityID"
					EntityID = cXMLDoc.AttributeToString(aArgNode, "Value")
				Case "DefinitionID"
					DefinitionID = cXMLDoc.AttributeToString(aArgNode, "Value")
				Case "Key"
					Key = cXMLDoc.AttributeToString(aArgNode, "Value")
			End Select
        Next
        
        DisplayText = cXMLDoc.AttributeToString(cXMLDoc.GetControlNode(aDisplayControlNode), "DisplayText")
        DisplayStaffReportOutput = cXMLDoc.AttributeToString(cXMLDoc.GetControlNode(aDisplayControlNode), "DisplayStaffReportOutput")
    End Sub

'----------------------------------------------------

    Sub ButtonClicked(sender As Object, ByVal aEventArgs As EventArgs)
        Dim aURL As String

        If EntityID Is Nothing Then
            EntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
        End If

        aURL = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
        aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", EntityID)
        If DefinitionID Is Nothing Then

			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aArgNode As XmlNode
			Dim	aRODefDO As cDataObject

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReportOutputDefinition", aDataObjectNode, aFiltersNode)
			aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "Key", Key))
		
			aRODefDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
			If Not aRODefDO Is Nothing Then
				DefinitionID = aRODefDO.GetPropertyString("ReportOutputDefinitionID")
			End If
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", DefinitionID)
		End If

		ctlShow.NewWindowURL() = aURL
		ctlShow.Open()
    End Sub

'----------------------------------------------------

	Public Sub RedirectToPDFErrorPage()
		Dim aURL As String
		Dim aReturnURL As String

		aReturnURL = Request.QueryString("ReturnURL")
		aReturnURL = aReturnURL.Replace("/", "%2f")
		aReturnURL = aReturnURL.Replace("?", "%3f")
		aReturnURL = aReturnURL.Replace("&", "%26")
		aReturnURL = aReturnURL.Replace("=", "%3d")
		
		aURL = Request.RawUrl
		aURL = aURL.Substring(0, aURL.IndexOf("&"))
		aURL += "&Page=PDFError&ReturnURL=" + aReturnURL
		
		Response.Redirect(aURL)
	End Sub	

'----------------------------------------------------

    Public Sub Show()
        ctlShow.Open()
    End Sub
'====================================================
End Class


End Namespace