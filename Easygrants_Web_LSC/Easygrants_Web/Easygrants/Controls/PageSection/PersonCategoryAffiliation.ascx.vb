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
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPersonCategoryAffiliation
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	protected spnNewPerson as HtmlGenericControl
	protected spnAncAdmin as HtmlGenericControl
	protected ctlPer as cPopUpSelectorLauncher
	
'=============================================================

	Public ReadOnly Property QueryID as String
		Get
			dim aFrom as String = request.QueryString("Origin")
			
			if aFrom <> "" then return aFrom
			
			Return "Person"
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property NewObj as String
		Get
			dim aNewObj as String = request.QueryString("NewObj")
			
			Return aNewObj
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property DataObjectCollectionKey as String
		Get
			return "ContactCategoryMember"
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property PersonAffiliationDO as cDataObject
		Get
			Dim aDataObjectList As cDataObjectList
			
			aDataObjectList = DataObjectCollection(DataObjectCollectionKey)
			if aDataObjectList is nothing then return nothing
			if aDataObjectList.Count < 1 then return nothing
			return aDataObjectList(0)
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property PersonID as String
		Get
			Dim aQueryStrVal as String
			
			aQueryStrVal = cWebLib.Get_QueryString(Request, "PersonID", "")
			if aQueryStrVal <> "" then return aQueryStrVal
			
			Dim aDataObject as cDataObject
			aDataObject = PersonAffiliationDO
			if not aDataObject is nothing then return aDataObject.GetPropertyString("PersonID", "0")
			
			return "0"
		End Get		
	End Property	
	
'-----------------------------------------------------

	Public ReadOnly Property ContactCategoryID as String
		Get
			Dim aQueryStrVal as String
			
			aQueryStrVal = cWebLib.Get_QueryString(Request, "ContactCategoryID", "")
			if aQueryStrVal <> "" then return aQueryStrVal
			
			Dim aDataObject as cDataObject
			aDataObject = PersonAffiliationDO
			if not aDataObject is nothing then  return aDataObject.GetPropertyString("ContactCategoryID", "0")
			
			return "0"
		End Get		
	End Property	
	
'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
        
        'PersonAffiliationDO("ContactCategoryID") = ContactCategoryID
		'PersonAffiliationDO("PersonID") = PersonID
		
		if QueryID = "Person" then
			If WebSession.HasStaffUser then
				spnAncAdmin.Visible = False
			else
				spnAncAdmin.Visible = True
			end if
		End If		
		
		if QueryID = "ContactCategory" then
			spnNewPerson.Visible = True
		End If	
		
    End Sub    
    
'-----------------------------------------------------
 
	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		Dim aDataObject As cDataObject
		
		'if QueryID = "Person" or NewObj = "Person" then
		'	aDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PersonID)
		'	ctlPer.ObjID = PersonID
		'	ctlPer.ObjName = aDataObject("LastNameFirstName")
		'end if
	End Sub

'=============================================================

End Class
End Namespace