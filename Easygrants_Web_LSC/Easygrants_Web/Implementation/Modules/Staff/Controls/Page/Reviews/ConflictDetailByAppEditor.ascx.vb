Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cConflictDetailByAppEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlPerson As cDropDown
	Protected ctlConflict as cDropDown
	Protected ctlCommittee as cDropDown
    Protected ctlType as cRadioButtonList
    Protected spnName As HtmlGenericControl
    Protected spnAddContent as HtmlGenericControl
    Protected spnEditContent as HtmlGenericControl
    Protected spnCommitteeLabel as HtmlGenericControl
    Protected trCommittee as HtmlTableRow
    Protected tbl As HtmlTable
    
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlPerson = CType(Me.FindControl("ctlPerson"), cDropDown)
		ctlPerson.Set_ServerIndexChange(AddressOf AddFilter)
		ctlCommittee = CType(Me.FindControl("ctlCommittee"), cDropDown)
		ctlCommittee.Set_ServerIndexChange(AddressOf AddCommitteeFilter)

		If Not IsPostBack Then
			if Request.QueryString("ReviewCycleConflictID") = "0" then
				dim aObj as cDataObject
				Dim aItem As ListItem
				dim aList as cDataObjectList
				Dim aXmlDoc as cXMLDoc
				Dim aDataObjectNode As XmlNode
				Dim aFiltersNode As XmlNode
				Dim aSortNode As XmlNode
				dim aArgNode as XmlNode
				
				if Request.QueryString("CommitteeID") = "-1" then
					AddCommitteeFilter(new Object(), new EventArgs())
					aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleCommittee", _
						"ReviewCycleID", me.Request.QueryString("ReviewCycleID"))
				else
					ctlCommittee.Visible = False
					'spnCommitteeLabel.Visible = True
					aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleCommittee", _
						"ReviewCycleID", Request.QueryString("ReviewCycleID"), "ReviewCommitteeID", Request.QueryString("CommitteeID"))
				end if	
												
				for each aObj in aList
					dim aReviewCommitteeList as cDataObjectList
					dim aReviewCommitteeDO as cDataObject					
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("vCommitteePool", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommitteeID", aObj.GetPropertyInt("ReviewCommitteeID")))
					
					'sort the list
					aSortNode = aXmlDoc.CreateSortNode()
					aDataObjectNode.AppendChild(aSortNode)
					aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "", "LastName", "")
					'aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "Person", aArgNode))	
					aSortNode.AppendChild(aArgNode)
					aReviewCommitteeList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
					
					for each aReviewCommitteeDO in aReviewCommitteeList
						aItem = New ListItem("<None>", "")	
						If Not ctlPerson.Items.Contains(aItem) Then
							ctlPerson.Items.Add(aItem)
						end if	
						aItem = New ListItem(aReviewCommitteeDO.GetPropertyString("LastNameFirstName"), aReviewCommitteeDO.GetPropertyInt("PersonID"))
						
						if ctlPerson.Items.Contains(aItem) = False then
							ctlPerson.Items.Add(aItem)
						end if
						if Request.QueryString("RevPersonID") <> "" then
							ctlPerson.SelectedField = Request.QueryString("RevPersonID")
						end if
					next
				next	
				ctlPerson.Visible = True
				ctlPerson.ValidationText = "Reviewer is required."
				ctlCommittee.Visible = True	
				If Request.QueryString("RevPersonID") = "" Then
					tbl.Visible = False
				End If
				spnAddContent.Visible = True
			else
				ctlPerson.Visible = False
				spnName.Visible = True
				ctlCommittee.Visible = False
				trCommittee.Visible = False
				spnEditContent.Visible = True
			End If
		End If
	End Sub
	
	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String = Request.RawUrl()
		ctlPerson = CType(FindControl("ctlPerson"), cDropDown)
		aURL = cWebLib.AddQuerystringParameter(aURL, "RevPersonID", ctlPerson.SelectedValue)
		aURL = aURL + "&#Reviewer"
		Response.Redirect(aURL)
	End Sub
	
	Private Sub AddCommitteeFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aURL as String = me.Request.RawUrl()
		dim aCommitteeID as Integer
		dim aRevCycleConflictDO as cDataObject
		ctlCommittee = CType(FindControl("ctlCommittee"), cDropDown)
		aRevCycleConflictDO = CType(DataObjectCollection("ReviewCycleConflict"), cDataObjectList)(0)
		if not aRevCycleConflictDO is nothing And ctlCommittee.SelectedValue <> "" then 
			aCommitteeID = ctlCommittee.SelectedValue
			aURL = cWebLib.AddQuerystringParameter(aURL, "CommitteeID", aCommitteeID)
			aURL = cWebLib.AddQuerystringParameter(aURL, "NoConflict", "True")
			aURL = aURL + "&#Committee"
			Response.Redirect(aURL)
		end if
	End Sub
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aDO As cDataObject
        aDO = CType(DataObjectCollection("ReviewCycleConflict"), cDataObjectList)(0)
        aDO("ReviewSourceID") = 2
        MyBase.DataPresenter_SaveDataObjects()
    End Sub

    Public Sub ValidateReviewer(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlPerson = CType(FindControl("ctlPerson"), cDropDown)
		If ctlPerson.SelectedField = "" then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
   End Sub
   
    Public Sub ValidateConflict(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlType = CType(FindControl("ctlType"), cRadioButtonList)
		ctlConflict = CType(FindControl("ctlConflict"), cDropDown)
		If ctlType.SelectedValue = "4" And ctlConflict.SelectedValue = "" then  'Conflict
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
   End Sub
    
End Class
End Namespace
