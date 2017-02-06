Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Workflow

Namespace Easygrants_Web.Modules.Home.Controls.Page
Public MustInherit Class cHomeContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected spnStaffAdministration As HtmlGenericControl
    Protected spnAwardee As HtmlGenericControl
    Protected trToDoHdg As HtmlTableRow
    Protected trToDoSummary As HtmlTableRow
    Protected spnApply As HtmlGenericControl
        Protected WithEvents CUserCtlLoader1 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents CUserCtlLoader2 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents CUserCtlLoader3 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents CUserCtlLoader4 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents trProfileHdg As System.Web.UI.HtmlControls.HtmlTableRow
        Protected WithEvents trProfileLink As System.Web.UI.HtmlControls.HtmlTableRow
        Protected WithEvents spnProfile As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnGuidelines As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnIsTenure As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnIsBiomedical As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnDegreeYear As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnRankType As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
       ' Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected tbInEligible As HtmlTable
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		
		dim aObj as cDataObject
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
	    
        If aUser.AccessLevel > 1 Then
			spnStaffAdministration.Visible = True
			'Hiding ToDo List for Staff members
			Me.trToDoHdg.Visible = False
			Me.trToDoSummary.Visible = False
			Me.spnApply.Visible = False
			Me.tbInEligible.Visible = False
		End If
		
		'dim aList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
			'"PrimaryPersonID", aUser.PersonID.ToString())
		
		'dim aAwardeeList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", aUser.PersonID.ToString())
			
		'for each aObj in aAwardeeList
		'	dim aWfTaskTypeID as Integer
		'	aWfTaskTypeID = aObj.GetRelatedPropertyInt("WfTask.WfTaskTypeID")
		'	if aWfTaskTypeID = 3 Or aWfTaskTypeID = 8 then
		'		spnAwardee.Visible = True
		'		exit For
		'	end if 
		'	'if aObj.GetPropertyInt("WfProjectOutcomeID", 9) < 3 then
		'	'	spnAwardee.Visible = True
		'	'	exit For
		'	'End If	
		'next	
		'dim aUserObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("User", aUser.UserID)
		
		'if aUser.PersonID <> aUserObj.GetPropertyInt("CreatedUser", 0) then
		'	Me.trToDoSummary.Visible = False
		'end if
		
		Dim aPerson As cPerson
		aPerson = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID)
		'If IsBME(aPerson) Then
		'	Me.trToDoHdg.Visible = False
		'	Me.trToDoSummary.Visible = False
		'	Me.spnApply.Visible = False
		'	Me.tbInEligible.Visible = False
		'Else
			Dim aPE As cDataObject
			aPE = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonEligibility", "PersonID", aUser.PersonID)(0)
			If Not aPE Is Nothing Then
				'Eligible
				If aPE.GetPropertyInt("EligibilityStatusID", 0) = 1 Then
					Me.trToDoSummary.Visible = False			
					Me.spnApply.Visible = False
					Me.tbInEligible.Visible = False
				End If
				'Ineligible
				If aPE.GetPropertyInt("EligibilityStatusID", 0) = 2 Then
					Me.trToDoSummary.Visible = False
					Me.spnApply.Visible = False
					Me.tbInEligible.Visible = True
					
					If aPE.GetPropertyBool("IsTenure") = False Then
						Dim spnIsTenure As HtmlGenericControl
						spnIsTenure = FindControl("spnIsTenure")
						spnIsTenure.Style.Add("color", "red")
					End If
					
					If aPE.GetPropertyBool("IsBiomedical") = False Then
						Dim spnIsBiomedical As HtmlGenericControl
						spnIsBiomedical = FindControl("spnIsBiomedical")
						spnIsBiomedical.Style.Add("color", "red")
					End If

					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode As XmlNode
					Dim aFiltersNode As XmlNode
					Dim aWfProject As cWfProject
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProject", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Date", "StartDate", System.DateTime.Now(), "and", "LessThanEqual"))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Date", "EndDate", System.DateTime.Now(), "and", "GreaterThanEqual"))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProjectTypeID", "1"))
					aWfProject = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)(0)
					If Not aWfProject Is Nothing Then
						If aWfProject.GetPropertyInt("EligibilityDate", 0) > aPE.GetPropertyInt("DegreeYear", 0) Then
							Dim spnDegreeYear As HtmlGenericControl
							spnDegreeYear = FindControl("spnDegreeYear")
							spnDegreeYear.Style.Add("color", "red")
						End If
					End If

					If aPE.GetRelatedPropertyBool("RankType.IsEligible") = False Then
						Dim spnRankType As HtmlGenericControl
						spnRankType = FindControl("spnRankType")
						spnRankType.Style.Add("color", "red")
						If aPE.GetPropertyInt("RankTypeID") = 9 Then
							spnRankType.InnerText = spnRankType.InnerText + " (Ineligible due to academic rank of Other, please call the Foundation.)"
						End If					
					End If
				End If
			Else
				Me.tbInEligible.Visible = False
			End If
		'End If
	End Sub

'=============================================================

	'Public Function IsBME(ByVal aPerson As cPerson)
	'	IsBME = False

	'	Dim aWfTA As cDataObject
	'	Dim aWfTAList As cDataObjectList
	'	Dim aDataObjectNode As XmlNode
	'	Dim aFiltersNode As XmlNode
	'	Dim aXmlDoc As cXMLDoc
	'	Dim aGP As cDataObject

	'	aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
	'	'select only task 1 and role 5
	'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", 1))
	'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", 5))
	'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aPerson("PersonID")))
	'	aWfTAList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
	'	If Not aWfTAList Is Nothing Then
	'		If aWfTAList.Count > 0 Then
	'			IsBME = True
	'		End If
	'	End If

	'End Function

'=============================================================
End Class
End Namespace