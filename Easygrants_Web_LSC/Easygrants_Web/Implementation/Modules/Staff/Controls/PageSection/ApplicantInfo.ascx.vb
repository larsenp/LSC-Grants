Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Implementation.Modules.Staff.Controls.PageSection
    Public MustInherit Class cApplicantInfo
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

 '====================================================

    Private mGranteeProjectID As Integer
    Private mWfTaskAssignmentID As Integer
    Private mWfTaskID As Integer
    Private mPersonID As Integer
    Private mDisplayPropertyNode As XmlNode
    Private mDefinitionID as Integer

'====================================================

    Public Property WfTaskAssignmentID() As Integer
        Get
			'if me.Request.QueryString("AppWfTaskAssignmentID") <> "" 
			'	If Not Request.QueryString("AppWfTaskAssignmentID") Is Nothing Then
			'		Return Request.QueryString("AppWfTaskAssignmentID")
			'	Else
			'		Return Request.QueryString("WfTaskAssignmentID")
			'	End if
			'else
					'Return me.Request.QueryString("WfTaskAssignmentID")
				dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", me.Request.QueryString("WfTaskAssignmentID"))
				dim aWfTaskDO as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", aList(0).GetPropertyInt("WfTaskID"))
				dim aParentTaskID as Integer = aWfTaskDO.GetPropertyInt("WfParentTaskID")
				dim aAppList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
						"GranteeProjectID", aList(0).GetPropertyInt("GranteeProjectID"), "WfTaskID", aParentTaskID)	
				'EntityID = aAppList(0).GetPropertyInt("WfTaskAssignmentID")
				'if aParentTaskID = 1 then 
					'DefinitionID = 2	'LOI
					Return aAppList(0).GetPropertyInt("WfTaskAssignmentID")
				'else
					'Return aAppList(0).GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
				'end if
			'end if
        End Get
        Set(ByVal aWfTaskAssignmentID As Integer)
            mWfTaskAssignmentID = aWfTaskAssignmentID
        End Set
    End Property

'----------------------------------------------------

    Public Property DefinitionID() As Integer
        Get
			If Not Request.QueryString("DefinitionID") Is Nothing Then
				'If Request.QueryString("DefinitionID") = 3 then 
				'	Return 2
				'Else
				'	Return Request.QueryString("DefinitionID")
    '            End If
				dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", me.Request.QueryString("WfTaskAssignmentID"))
				dim aWfTaskDO as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", aList(0).GetPropertyInt("WfTaskID"))
				dim aParentTaskID as Integer = aWfTaskDO.GetPropertyInt("WfParentTaskID")
				dim aAppList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
						"GranteeProjectID", aList(0).GetPropertyInt("GranteeProjectID"), "WfTaskID", aParentTaskID)	
				'EntityID = aAppList(0).GetPropertyInt("WfTaskAssignmentID")
				if aParentTaskID = 54 then 'LOI
					'DefinitionID = 35	'LOI
					Return 35
				else
					Return aAppList(0).GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
				end if
 			End if
        End Get
        Set(ByVal aDefinitionID As Integer)
            mDefinitionID = aDefinitionID
        End Set
    End Property

'----------------------------------------------------

    Public Property WfTaskID() As Integer
        Get
            WfTaskID = mWfTaskID
        End Get
        Set(ByVal aWfTaskID As Integer)
            mWfTaskID = aWfTaskID
        End Set
    End Property

'----------------------------------------------------

    Public Property PersonID() As Integer
        Get
            PersonID = mPersonID
        End Get
        Set(ByVal aPersonID As Integer)
            mPersonID = aPersonID
        End Set
    End Property

'----------------------------------------------------
 
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

        End Sub

    End Class
End Namespace