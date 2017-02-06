Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports Core.Web
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports EasyGrants.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cEmailEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected trPerson As HtmlTableRow
        Protected WithEvents CUserCtlLoader1 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents spnPerson As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOrg As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnEmail As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnEmailType As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnIsPrimary As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCancel As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected trOrg As HtmlTableRow
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Select Case EntityTypeID
			Case 1 'Person E-mail
				trOrg.Visible = False
			Case 2 'Organization E-mail
				trPerson.Visible = False
		End Select
	End Sub
	
'-------------------------------------------------------------

    Public Function ValidateEmail(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs) As Boolean
		ValidateEmail = True

	    Dim ctlEmail As cTextBox
        ctlEmail = CType(FindControl("ctlEmail"), cTextBox)

        Dim aEmailList As cDataObjectList
        aEmailList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "ContactValue1", ctlEmail.Value)

		Dim aPersonDO As cDataObject
        aPersonDO = Me.DataObjectCollection("Person")(0)
		
		Dim aPersonID As Integer
		aPersonID = CType(WebSession, cEGSession).GetDuplicatePersonID(aArgs.Value)
		
		If aPersonID > 0 Then
			If aEmailList.Count >= 1 Then
				If Request.QueryString("EmailID") = "0" OrElse Request.QueryString("EmailID") = "" Then
					ValidateEmail = False
				
				'duplicate in EMAIL table
				else
					Dim aDataObjectNode As XmlNode
					Dim aFiltersNode As XmlNode
					Dim aXmlDoc As cXMLDoc
					Dim aEmailDOList As cDataObjectList

					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Email", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ContactValue1", ctlEmail.Value))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "EmailID", Request.QueryString("EmailID"), "And", "NotEqual"))
					aEmailDOList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
					If aEmailDOList.Count > 0 Then
						ValidateEmail = False
					End If
				End If
			Else
			'duplicate in EASYGRANTS_USER table
				If aPersonID <> aPersonDO.GetPropertyInt("PersonID", 0)
					ValidateEmail = False
				End If
			End If
		End If
    End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aAddrList As cDataObjectList
		'Dim aEasyGranteUserList As cDataObjectList
		'Dim aUserName As String

        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aAddrList = me.DataObjectCollection("Email")
        
		If ctlIsPrimary.Value = True Then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", _
						"EntityID", EntityID, "EntityTypeID", EntityTypeID, "IsPrimary", "True")

			If Not aPrimList Is Nothing Then
				If aPrimList.Count > 0 Then
					If aAddrList(0).GetPropertyInt("EmailID", 0) <> aPrimList(0).GetPropertyInt("EmailID", 0) Then
						aPrimList(0)("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
					End If
				End If
			End If
		End If
        
		MyBase.DataPresenter_SaveDataObjects()

	End Sub
	
'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class 'cEmailEditor
End Namespace