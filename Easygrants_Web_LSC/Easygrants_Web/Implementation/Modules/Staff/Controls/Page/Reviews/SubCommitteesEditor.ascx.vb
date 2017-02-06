Imports Core.Web
Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cSubCommitteesEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlParentReviewCommittee As cDropDown
	Protected ctlReviewCommitteeMember As cDoubleListBox2
	Protected valCommittee As CustomValidator
	Protected txtLastName As HtmlInputText
	Protected ctlName As cTextBox
	Protected ctlInactive As cDropDown

	Public Overrides Sub LoadConfigXML()
		mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		If Request.QueryString("find") = "" Then
			Dim aNode As XmlNode
            aNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters"), "Argument", "TypeKey", "find")
			if not aNode is nothing then
                mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters").RemoveChild(aNode)
            end if
        Else
 			Dim aRCIDNode As XmlNode
            aRCIDNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters"), "Argument", "TypeKey", "ParentRCID")
			if not aRCIDNode is nothing then
                mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters").RemoveChild(aRCIDNode)
            end if
           
            Dim aRCMNode As XmlNode
            aRCMNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters"), "Argument", "ID", "RCM")
			if not aRCMNode is nothing then
                mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ReviewCommitteeMembers']/DisplayProperties/DisplayProperty/Control/Filters").RemoveChild(aRCMNode)
            end if
		End If		
    End Sub

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		valCommittee.Enabled = False
		ctlParentReviewCommittee = CType(FindControl("ctlParentReviewCommittee"), cDropDown)
		ctlParentReviewCommittee.Set_ServerIndexChange(AddressOf OnParentReviewCommitteeSelect)
		If Not IsPostBack AndAlso Request.QueryString("find") <> "%" Then
			txtLastName.Value = Request.QueryString("find")
		End If
	End Sub

	Private Sub OnParentReviewCommitteeSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim aURL As String
		aURL = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "ParentRCID", ctlParentReviewCommittee.SelectedValue)
		If Request.QueryString("ReviewCommitteeID") = "" Then
			Response.Redirect(aURL)
		Else
			valCommittee.Enabled = True
			Page.Validate
			If Page.IsValid Then
            txtLastName.Value = ""
            aURL = cWebLib.RemoveQuerystringParameter(aURL, "find")
			Response.Redirect(aURL)
			End If
		End If
	End Sub

    Public Sub ValidateCommittee(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCommitteeMember", "ReviewCommitteeID", Request.QueryString("ReviewCommitteeID"))
		If aDOList.Count = 0 Then
			aArgs.IsValid = True
		Else
			aArgs.IsValid = False
			ctlParentReviewCommittee.SelectedField = Request.QueryString("ParentRCID")
		End If
	End Sub

Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		If Request.QueryString("name") <> "" Then
			ctlName = CType(Me.FindControl("ctlName"), cTextBox)
			ctlName.Value = Request.QueryString("Name")
		End If
		If Request.QueryString("isactive") <> "" Then
			ctlInactive = CType(Me.FindControl("ctlInactive"), cDropDown)
			ctlInactive.SelectedField = Request.QueryString("isactive")
		End If
        
	End Sub

	Public Sub Find()
		Dim aEncodeString As String
		Dim aURL As String
		Dim aReviewCommitteeDO As cDataObject

        ctlName = CType(Me.FindControl("ctlName"), cTextBox)
        ctlInactive = CType(Me.FindControl("ctlInactive"), cDropDown)
        ctlParentReviewCommittee = CType(Me.FindControl("ctlParentReviewCommittee"), cDropDown)
        aURL = Request.RawUrl.ToString()
        Page.Validate()
        If txtLastName.Value <> "" Then
            If Page.IsValid then
                MyBase.EventController_Save()
			    aReviewCommitteeDO = CType(DataObjectCollection("ReviewCommittee"), cDataObjectList)(0)
			    aEncodeString = aReviewCommitteeDO("ReviewCommitteeID")
			    aURL = cWebLib.AddQuerystringParameter(aURL, "ReviewCommitteeID", aEncodeString)

			    aEncodeString = aReviewCommitteeDO("ParentReviewCommitteeID")
			    aURL = cWebLib.AddQuerystringParameter(aURL, "ParentRCID", aEncodeString)

			    aEncodeString = Server.UrlEncode(txtLastName.Value)
			    aURL = cWebLib.AddQuerystringParameter(aURL, "find", aEncodeString)
			    'ctlName = CType(Me.FindControl("ctlName"), cTextBox)
			    aEncodeString = Server.UrlEncode(ctlName.Value)
			    aURL = cWebLib.AddQuerystringParameter(aURL, "name", aEncodeString)
			    'ctlInactive = CType(Me.FindControl("ctlInactive"), cDropDown)
			    aEncodeString = Server.UrlEncode(ctlInactive.SelectedValue)
			    aURL = cWebLib.AddQuerystringParameter(aURL, "isactive", aEncodeString)
               
			    Response.Redirect(aURL)
            Else
                Exit Sub
            End If
        Else
            If Page.IsValid then
                Save("", "", "", aURL)
            Else
                Exit Sub
            End If
		End If 
	End Sub

    Public Sub Save(ByVal aPageKey as String, ByVal aReviewCommitteeID as String, ByVal aParentRCID as String, ByVal aURL as String)
        
        if Not MyBase.EventController_Save() then
            exit Sub
        end if
        dim aRevCommDOList as cDataObjectList = CType(me.DataObjectCollection("ReviewCommittee"), cDataObjectList)  
        if aReviewCommitteeID.Substring(aReviewCommitteeID.IndexOf("=") + 1) = "" AndAlso not aRevCommDOList is nothing then
            aReviewCommitteeID = "ReviewCommitteeID=" + aRevCommDOList(0).GetPropertyInt("ReviewCommitteeID", 0).ToString()
        End If
        if aURL = "" then
            EventController_NavigateToModulePageKey(aPageKey, aReviewCommitteeID, aParentRCID)   
        else 
            if  not aRevCommDOList is nothing then
                aURL = cWebLib.AddQuerystringParameter(aURL, "ReviewCommitteeID", aRevCommDOList(0).GetPropertyInt("ReviewCommitteeID", 0).ToString())
            end if
            EventController_NavigateToURL(aURL)
        end if 
    End Sub

End Class
End Namespace
