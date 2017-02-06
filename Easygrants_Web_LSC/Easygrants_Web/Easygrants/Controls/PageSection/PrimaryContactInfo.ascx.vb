Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports EasyGrants.Web.User
Imports Core.Web.Modules

Namespace Easygrants_Web.Controls.PageSection

Public MustInherit Class cPrimaryContactInfo
    Inherits EasyGrants_Web.Controls.Base.cEGDataPresenterCtl

'====================================================
	
	Protected spnPersonName As HtmlGenericControl
	Protected spnEmail As HtmlGenericControl
	Protected spnCityStateZip As HtmlGenericControl
        Protected ctlNewWindowOpener As cNewWindowOpener
        Protected tblEditDeleteBtn As HtmlTable
	Private mPersonID As String
	Private mDisplayPropertyNode As XmlNode

	Protected spnDoNotContact As HtmlGenericControl
	Protected spnDeceased As HtmlGenericControl

'====================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
            btnDelete_SetVisibility()
            rowEditDelete_SetVisibility()
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

		'ctlDoNotContact = CType(FindControl("ctlDoNotContact"), cLabel)
		'ctlDeceased = CType(FindControl("ctlDeceased"), cLabel)

		Dim aPersonName As String = ""
		Dim aIsDoNotContact As Boolean = False
		Dim aIsDeceased As Boolean = False
		Dim aPersonDO As cDataObject = CType(DataObjectCollection("Person"), cDataObjectList)(0)
		If Not aPersonDO Is Nothing Then
			aPersonName = aPersonDO.GetPropertyString("FirstName", "") + " " + _
				aPersonDO.GetPropertyString("MiddleName", "") + " " + _
				aPersonDO.GetPropertyString("LastName", "")
				aIsDoNotContact = aPersonDO.GetPropertyBool("IsDoNotContact", False)
				aIsDeceased = aPersonDO.GetPropertyBool("IsDeceased", False)
				If aIsDoNotContact = True Then
					spnDoNotContact.InnerHtml = "Do not contact"
				Else
					spnDoNotContact.InnerHtml = ""
				End If
				If aIsDeceased = True Then
					spnDeceased.InnerHtml = "Deceased"
				Else
					spnDeceased.InnerHtml = ""
				End If
		End If
		Dim aPrefixDO As cDataObject = CType(DataObjectCollection("Prefix"), cDataObjectList)(0)
		If Not aPrefixDO Is Nothing Then
			aPersonName = aPrefixDO.GetPropertyString("Prefix", "") + " " + aPersonName
		End If
		Dim aSuffixDO As cDataObject = CType(DataObjectCollection("Suffix"), cDataObjectList)(0)
		If Not aSuffixDO Is Nothing Then
			aPersonName = aPersonName + ", " + aSuffixDO.GetPropertyString("Suffix", "")
		End If
		spnPersonName.InnerText = aPersonName
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

	Public Property PersonID() As String
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
		Set(ByVal PersonID As String)
			mPersonID = PersonID
		End Set
	End Property

'----------------------------------------------------

	Protected Sub btnDelete_SetVisibility()
			Dim btnDelete As cCSSButton = GetControl("btnDelete")
            If btnDelete Is Nothing Then
                Exit Sub
            End If

            Dim aCurrentUser As cEGStaffUser = CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser)

            'Users cannot delete themselves
			If PersonID = aCurrentUser.PersonID.ToString Then
				btnDelete.Visible = False
				Exit Sub
			End If

            Dim aPersonDOList As cDataObjectList = DataObjectCollection("Person")
            Dim aPersonDO As cDataObject = aPersonDOList(0)
            If Not aPersonDO Is Nothing Then
                'Persons with task assignments cannot be deleted unless all task assignments have a status of 3 (Not Active)
                Dim aDataObjectNode As XmlNode
                Dim aFiltersNode As XmlNode
                Dim aXMLDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
                Dim aArgNode As XmlNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "PersonID", PersonID.ToString)
                aFiltersNode.AppendChild(aArgNode)
                aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskStatusID", "3", "And", "NotEqual")
                aFiltersNode.AppendChild(aArgNode)
                Dim aWfTAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
                If aWfTAList.Count > 0 Then
                    btnDelete.Visible = False
                    Exit Sub
                End If

                ''Persons with grantee project affiliations cannot be deleted.
                Dim aGPList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
                    "PrimaryPersonID", PersonID.ToString)
                If aGPList.Count > 0 Then
                    btnDelete.Visible = False
                    Exit Sub
                End If
                Dim aGPPAList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPersonAffiliation", _
                    "PersonID", PersonID.ToString)
                If aGPPAList.Count > 0 Then
                    btnDelete.Visible = False
                    Exit Sub
                End If

                'Staff users cannot delete staff or admin users.
                If aCurrentUser.AccessLevel < 3 Then
                    Dim aUserDO As cDataObject = aPersonDO.GetRelatedPropertyDataObject("User")
                    If Not aUserDO Is Nothing Then
                        If aUserDO.GetPropertyInt("UserTypeID") > 1 Then
                            btnDelete.Visible = False
                            Exit Sub
                        End If
                    End If
                End If
            End If
        End Sub


        Protected Sub rowEditDelete_SetVisibility()

            'Dim btnEdit As cButton = GetControl("btnEdit")
            'edit button visible only on contact details tab.
            If Page.Request.QueryString("Page") <> "PersonContact" Then
                tblEditDeleteBtn.Visible = False
                Exit Sub
            End If
        End Sub

    End Class
End Namespace