Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow

Namespace Easygrants_Web.Modules.Home.Controls.Page
Public MustInherit Class cEligibility
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	'Invoked by EventController_ControlValidate
	Public Function ValidatePrimaryDepartment(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidatePrimaryDepartment = True
		
		Dim ctlIsBiomedical As cRadioButtonList
		ctlIsBiomedical = CType(Me.FindControl("ctlIsBiomedical"), cRadioButtonList)
		Dim iSelVal as Boolean
		iSelVal = CType(ctlIsBiomedical.SelectedValue, Boolean)
		If iSelVal = False Then
			Dim ctlPrimaryDepartment As cTextBox
			ctlPrimaryDepartment = CType(Me.FindControl("ctlPrimaryDepartment"), cTextBox)
			If ctlPrimaryDepartment.Value.Trim() = "" Then
				ValidatePrimaryDepartment = False
			End If
		End If
	End Function

'=============================================================

	Private Function IsEligible(ByRef aWfProject As cWfProject)
		IsEligible = True

		Dim aPE As cDataObject
        aPE = (CType(Me.DataObjectCollection("PersonEligibility"), cDataObjectList))(0)
        If Not aPE Is Nothing Then
			If aPE.GetPropertyBool("IsTenure") = False Then
				IsEligible = False
			Else
				If aPE.GetPropertyBool("IsBiomedical") = False Then
					IsEligible = False
				Else
					If aWfProject.GetPropertyInt("EligibilityDate", 0) > aPE.GetPropertyInt("DegreeYear", 0) Then
						IsEligible = False
					Else
						Dim aRankDO As cDataObject
						aRankDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("FacultyRankType", aPE.GetPropertyInt("RankTypeID", 0))
						If Not aRankDO Is Nothing Then
							If aRankDO.GetPropertyBool("IsEligible") = False Then
								IsEligible = False
							End If							
						Else
							IsEligible = False
						End If						
					End If					
				End If
			End If
		Else
			IsEligible = False
		End If        
		
		If IsEligible Then
			aPE("EligibilityStatusID") = 1 ' Eligible
		Else
			aPE("EligibilityStatusID") = 2 'Ineligible
		End If
		WebSession.DataObjectFactory.SaveDataObject(aPE)

	End	Function

'=============================================================

	'Public Sub Submit(ByVal aUserDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
	Public Sub Submit(ByVal aPageKey As String)

        MyBase.DataPresenter_SaveDataObjects()

		Dim iInitialTaskID As Integer = 0
		Dim iInitialProjectID As Integer = 0

		Dim aWfProject As cWfProject
		aWfProject = (CType(Me.DataObjectCollection("WfProject"), cDataObjectList))(0)
		If Not aWfProject Is Nothing Then
			iInitialProjectID = aWfProject.GetPropertyInt("WfProjectID", 0)
			iInitialTaskID = aWfProject.GetInitialTask()
		End If
		
		If iInitialProjectID > 0 And iInitialTaskID > 0
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		        
			If IsEligible(aWfProject) Then
				Dim aPE As cDataObject
				aPE = (CType(Me.DataObjectCollection("PersonEligibility"), cDataObjectList))(0)
		
				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode As XmlNode
				Dim aFiltersNode As XmlNode

				dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", _
					"WfProjectID", iInitialProjectID.ToString(), "PrimaryPersonID", aUser.PersonID.ToString())
					
				if aList.Count = 0 then
					'Create Grantee object for User
					Dim aGranteeDataObject As cDataObject
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Grantee", aDataObjectNode, aFiltersNode)
					aGranteeDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
					aGranteeDataObject("EntityID") = aUser.PersonID
					aGranteeDataObject("EntityTypeID") = 1 'Person
					WebSession.DataObjectFactory.SaveDataObject(aGranteeDataObject)

					'Create GranteeProject record
					Dim aGranteeProjectDataObject As cDataObject
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
					aGranteeProjectDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
					aGranteeProjectDataObject("GranteeID") = aGranteeDataObject("GranteeID")
					aGranteeProjectDataObject("WfProjectID") = iInitialProjectID
					aGranteeProjectDataObject("PrimaryPersonID") = aUser.PersonID
					WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectDataObject)

					'Create GranteeProjectPI record
					Dim aGP_PI_DO As cDataObject
					aGP_PI_DO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectPI")
					aGP_PI_DO("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
					aGP_PI_DO("PITypeID") = 1 ' PI
					aGP_PI_DO("DegreeYear") = aPE("DegreeYear")
					aGP_PI_DO("FacultyRankTypeID") = aPE("RankTypeID")
					
					'Get info from Person table
					Dim aPerson As cDataObject
					aPerson = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID)
					If Not aPerson Is Nothing Then
						aGP_PI_DO("PersonID") = aPerson("PersonID")
						aGP_PI_DO("LastName") = aPerson("LastName")
						aGP_PI_DO("FirstName") = aPerson("FirstName")
						aGP_PI_DO("MiddleName") = aPerson("MiddleName")
						aGP_PI_DO("PrefixID") = aPerson("PrefixID")
						aGP_PI_DO("SuffixID") = aPerson("SuffixID")
						aGP_PI_DO("Degree") = aPerson("Degree")
						'Get info from Address table
						Dim aAddress As cDataObject
						Dim aAddressList As cDataObjectList
						aAddressList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Address", "EntityID", aUser.PersonID, "EntityTypeID", 1, "IsPrimary", "True")
						If aAddressList.Count > 0 Then
							aAddress = aAddressList(0)
							aGP_PI_DO("OrganizationID") = aAddress("OrganizationID")
							aGP_PI_DO("OrganizationName") = aAddress("Inst")
							aGP_PI_DO("OrganizationDepartment") = aAddress("Dept")
							aGP_PI_DO("SecondaryDepartment") = aAddress("DepartmentOther")
							aGP_PI_DO("Address1") = aAddress.GetPropertyString("Address1")
							aGP_PI_DO("Address2") = aAddress.GetPropertyString("Address2")
							aGP_PI_DO("Address3") = aAddress.GetPropertyString("Address3")
							aGP_PI_DO("City") = aAddress.GetPropertyString("City")
							aGP_PI_DO("StateID") = aAddress.GetPropertyInt("StateID", 0)
							aGP_PI_DO("Zip") = aAddress.GetPropertyString("Zip")
							aGP_PI_DO("CountryID") = aAddress("CountryID")
							aGP_PI_DO("InstitutionalComponent") = aAddress("InstitutionalComponent")
							aGP_PI_DO("Title") = aAddress("Title")
						End If
						'Get info from Phone table
						Dim aPhone As cDataObject
						Dim aPhoneList As cDataObjectList
						aPhoneList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", "EntityID", aUser.PersonID, "EntityTypeID", 1, "IsPrimary", "True")
						If aPhoneList.Count > 0 Then
							aPhone = aPhoneList(0)
							aGP_PI_DO("PhoneNumber") = aPhone("ContactValue1")
							aGP_PI_DO("PhoneExt") = aPhone("PhoneExt")
						End If
						'Get info from Email table
						Dim aEmail As cDataObject
						Dim aEmailList As cDataObjectList
						aEmailList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "EntityID", aUser.PersonID, "EntityTypeID", 1, "IsPrimary", "True")
						If aEmailList.Count > 0 Then
							aEmail = aEmailList(0)
							aGP_PI_DO("Email") = aEmail("ContactValue1")
						End If
					End If
					aGP_PI_DO("OrganizationDepartment") = aPE("PrimaryDepartment")
					WebSession.DataObjectFactory.SaveDataObject(aGP_PI_DO)

					'Create WfTaskAssignment record
					Dim aWfTaskAssgObject As cWfTaskAssignment
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
					aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			        
					aWfTaskAssgObject("WfTaskID") = iInitialTaskID
					
					aWfTaskAssgObject("WfTaskStatusID") = 1
					aWfTaskAssgObject("WfTaskRoleID") = 1 'Grantee
					aWfTaskAssgObject("PersonID") = aUser.PersonID
					aWfTaskAssgObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
					WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)

					'Create Budget record
					Dim aBudgetDO As cDataObject
					aBudgetDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
					aBudgetDO("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
					aBudgetDO("BudgetTypeID") = 1 'Submitted
					aBudgetDO("Description") = "2-year Budget Projection"
					aBudgetDO("CreateDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aBudgetDO)

					'Create BudgetPeriod record
					Dim aBudgetPeriodDO As cDataObject
					aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
					aBudgetPeriodDO("BudgetID") = aBudgetDO("BudgetID")
					aBudgetPeriodDO("BudgetPeriodDescription") = "First Budget Period"
					aBudgetPeriodDO("CarryoverCost") = 0
					aBudgetPeriodDO("Total") = 0
					aBudgetPeriodDO("StartDate") = System.DateTime.Now
					aBudgetPeriodDO("EndDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aBudgetPeriodDO)
				end if
			else
				Try
					dim aUserObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("User", aUser.UserID)
					aUserObj.RaiseEvent(14, aUser.UserID)
				Catch
				End Try
			End if
			EventController_NavigateToModulePageKey(aPageKey)

		End If		
		
	End Sub

'=============================================================
End Class
End Namespace