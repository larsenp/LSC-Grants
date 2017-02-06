Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cConflictDetailByRevEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

    Protected spnName As HtmlGenericControl
    Protected spnAddContent as HtmlGenericControl
    Protected spnEditContent as HtmlGenericControl
	Protected ctlPerson As cDropDown
    Protected ctlConflict as cDropDown
    Protected ctlType as cRadioButtonList
    Protected tbl As HtmlTable
    
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlPerson = CType(Me.FindControl("ctlPerson"), cDropDown)
		ctlPerson.Set_ServerIndexChange(AddressOf AddFilter)

		If Not IsPostBack Then
			dim aObj as cDataObject
			Dim aItem As ListItem
			dim aWFTAList as cDataObjectList
			dim aWFTA as cDataObject
			dim aConflictList as cDataObjectList
			Dim aXmlDoc as cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aSortNode As XmlNode
			dim aArgNode as XmlNode
			dim aRCPTList as cDataObjectList
			dim aRCPTDO as cDataObject
			dim aWfptList as cDataObjectList
			dim aWfptDO as cDataObject
			dim aWfProjectTaskID as Integer
			dim aWfProjectID
			dim aGPDOList as cDataObjectList
			dim aGPDO as cDataObject
			dim aGPID as Integer
			dim aWftaID as Integer	

			If Request.QueryString("ReviewCycleConflictID") = "0" Or Request.QueryString("CommitteeName") <> "" Then
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("vApplicantPool", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleID", Request.QueryString("ReviewCycleID")))
				'aWFTAList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode) 
				'sort the list
				aSortNode = aXmlDoc.CreateSortNode()
				aDataObjectNode.AppendChild(aSortNode)
				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "", "LastName", "")
				'aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "Person", aArgNode))
				aSortNode.AppendChild(aArgNode)
				aWFTAList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				for each aObj in aWFTAList
					dim aReviewCommitteeList as cDataObjectList
					dim aReviewCommitteeDO as cDataObject
					aItem = New ListItem("<None>", "")	
					If Not ctlPerson.Items.Contains(aItem) Then
						ctlPerson.Items.Add(aItem)
					end if
					aItem = New ListItem(aObj.GetPropertyString("LastNameFirstName"), aObj.GetPropertyInt("PersonID"))
					if ctlPerson.Items.Contains(aItem) = False then
						ctlPerson.Items.Add(aItem)
					end if
					if request.QueryString("AppPersonID") <> "" then
						ctlPerson.SelectedField = Request.QueryString("AppPersonID")
					end if
				next
				ctlPerson.Visible = True
				ctlPerson.ValidationText = "Participant is required."
				If Request.QueryString("AppPersonID") = "" Then
					tbl.Visible = False
				End If
				spnAddContent.Visible = True
			else
				ctlPerson.Visible = False
				spnName.Visible = True
				spnEditContent.Visible = True
			End If
		End If
	End Sub
	
	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aURL as String = me.Request.RawUrl()
		ctlPerson = CType(Me.FindControl("ctlPerson"), cDropDown)
		aURL = cWebLib.AddQuerystringParameter(aURL, "AppPersonID", ctlPerson.SelectedValue)
		aURL = aURL + "&#Applicant"
		Response.Redirect(aURL)
	End Sub
	
	Public Sub ValidateApplicant(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlPerson = CType(Me.FindControl("ctlPerson"), cDropDown)
		If ctlPerson.SelectedField = "" Then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True
		End If
	End Sub
   
	Public Sub ValidateConflict(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlType = CType(Me.FindControl("ctlType"), cRadioButtonList)
		ctlConflict = CType(Me.FindControl("ctlConflict"), cDropDown)
		If ctlType.SelectedValue = "4" And ctlConflict.SelectedValue = "" then  'Conflict
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
	End Sub
   
	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aDO As cDataObject
        aDO = CType(DataObjectCollection("ReviewCycleConflict"), cDataObjectList)(0)
        aDO("ReviewSourceID") = 2
        
        MyBase.DataPresenter_SaveDataObjects()
    End Sub

End Class
End Namespace