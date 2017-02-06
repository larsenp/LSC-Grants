Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core_Web.Controls.Base
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core.Web.Modules


Namespace Easygrants_Web.Controls.Page
Public MustInherit Class cPersonSummary_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'====================================================

	Protected ctlPersonInfo as Easygrants_Web.Controls.PageSection.cPersonSummaryInfo
    Protected ctlPersonRelationships as Easygrants_Web.Controls.PageSection.cWfTAListPerson
    Private mDisplayPropertyNode As XmlNode
    Private mPersonID As Integer
    Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
    
'====================================================

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property
	
'------------------------------------------------------------------------

    Public Property PersonID() As Integer
        Get
            PersonID = mPersonID
        End Get
        Set(ByVal PersonID As Integer)
            mPersonID = PersonID
        End Set
	End Property  

'------------------------------------------------------------------------
	
	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
        Dim aPersonID As Integer

		ctlCrumbTrail.CrumbTrail = CType(CType(Page, cModulePage).ModuleUser, cWebUser).CrumbTrail
        ctlCrumbTrail.CrumbTrail.Validate("PersonSummary", "", "Person Summary", Request.Url.AbsoluteUri)

		aPersonID = CType(Request.QueryString("PersonID"), Integer)

		If aPersonID = 0 Then
			If Request.QueryString("WfTaskAssignmentID") <> "" Then
				'get the primary person id from WfTasksAssignment
				Dim aWfTaskAssignmentDataObject As cDataObject
				Dim WfTaskAssignmentID As Integer

				WfTaskAssignmentID = CType(Request.QueryString("WfTaskAssignmentID"), Integer)
				aWfTaskAssignmentDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", WfTaskAssignmentID)
				aPersonID = aWfTaskAssignmentDataObject.GetPropertyInt("PersonID")
			Else
				'get the primary person id from Grantee Project
				Dim aGranteeProjectDataObject As cDataObject
				Dim GranteeProjectID

				GranteeProjectID = CType(Request.QueryString("GranteeProjectID"), Integer)
				aGranteeProjectDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", GranteeProjectID)
				aPersonID = aGranteeProjectDataObject.GetPropertyInt("PrimaryPersonID")
			End If
		End If

		ctlPersonInfo.PersonID = aPersonID
		ctlPersonRelationships.PersonID = aPersonID
		PersonID = aPersonID


 	End Sub
		
'----------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)

		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

		
    End Sub
  
'=============================================================
End Class
End Namespace
