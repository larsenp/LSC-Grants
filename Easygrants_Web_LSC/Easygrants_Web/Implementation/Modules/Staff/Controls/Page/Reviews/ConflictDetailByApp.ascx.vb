Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cConflictDetailByApp
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlPerson As cDropDown
    Protected spnName As HtmlGenericControl
    Protected spnInst as HtmlGenericControl
    
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)	
		
		If Request.QueryString("AppPersonID") = "-1" Then
			spnName.InnerText = "All"
			spnInst.InnerText = "All"
		End If
	End Sub
	
	Public Overrides Sub LoadConfigXML()
		mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		If Request.QueryString("AppPersonID") = "-1" Then
			Dim aNode As XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "AppPersonID")
			mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
		End If		
    End Sub

	Private Sub EditConflict(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aOrganizationDOList as cDataObjectList
		dim aOrganizationID as String
		dim aURL as String = me.Request.RawUrl()
		
		ctlPerson = CType(Me.FindControl("ctlPerson"), cDropDown)
		aOrganizationDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonOrganizationAffiliation", "PersonID", ctlPerson.SelectedValue, "IsPrimary", "True")
		
		if aOrganizationDOList.Count = 0 then
			if Request.QueryString("OrganizationID") <> "" then
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "OrganizationID")
			end if
		else
			aOrganizationID = aOrganizationDOList(0).GetPropertyString("OrganizationID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "OrganizationID", aOrganizationID)
		end if
		aURL = cWebLib.AddQuerystringParameter(aURL, "RevPersonID", ctlPerson.SelectedValue)
		me.Response.Redirect(aURL)
	End Sub

End Class
End Namespace
