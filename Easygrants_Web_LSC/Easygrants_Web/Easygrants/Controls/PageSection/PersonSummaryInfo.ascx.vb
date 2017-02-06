Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection

Public MustInherit Class cPersonSummaryInfo
    Inherits EasyGrants_Web.Controls.Base.cEGDataPresenterCtl

'====================================================
	
	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mPersonID as Integer
	Private mDisplayPropertyNode As XmlNode

'====================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
        
        'need to remove matching sessions in case crumb trail is used for nav
		Session.Remove("AddNewOrg")
		Session.Remove("OrgID")
		Session.Remove("Org")
		Session.Remove("PersonID")
		Session.Remove("Person")
		Session.Remove("Origin")
		Session.Remove("PersonOrgAffID")
		Session.Remove("AddNewOrg")
		Session.Remove("AddNewPerson")
		Session.Remove("Add")
		Session.Remove("Type")
		Session.Remove("IsPrimary")
		Session.Remove("Desc")
		Session.Remove("IsPrimaryContact")
        
	End Sub
'----------------------------------------------------
	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			DisplayPropertyNode = mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property PersonID() As Integer
		Get
			If mPersonID = Nothing Then
				If Not Request.QueryString("PersonID") Is Nothing Then
					mPersonID = Request.QueryString("PersonID")
				ElseIf Not Request.QueryString("WfTaskAssignmentID") Is Nothing Then
					Dim aWfTA As cDataObject
					aWfTA = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", Request.QueryString("WfTaskAssignmentID"))
					If Not aWfTA Is Nothing Then
						mPersonID = aWfTA.GetPropertyInt("PersonID")
					End If
				ElseIf Not Request.QueryString("GranteeProjectID") Is Nothing Then
					Dim aGP As cDataObject
					aGP = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", Request.QueryString("GranteeProjectID"))
					If Not aGP Is Nothing Then
						mPersonID = aGP.GetPropertyInt("PrimaryPersonID")
					End If
				End If
			End If
			Return mPersonID
		End Get
		Set(ByVal PersonID As Integer)
			mPersonID = PersonID
		End Set
	End Property

'----------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		Dim aPropertyKey As String

		DisplayPropertyNode = aDisplayPropertyNode

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
		PersonID = aDataObjectList(0).GetRelatedPropertyString(aPropertyKey)

	End Sub

'----------------------------------------------------

	Public Sub SendEmail(ByVal aEmail As String)

		ctlNewWindowOpener.NewWindowURL = "mailto:" + aEmail
		ctlNewWindowOpener.Open()

	End Sub

'----------------------------------------------------

End Class
End Namespace