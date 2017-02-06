Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Core.Web.User
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cAwards_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

    Protected ctlIsOther1 As cCheckBox
    Protected ctlIsOther2 as cCheckBox
    Protected ctlOtherText1 as cTextBox
    Protected ctlOtherText2 as cTextBox

    Protected spnPersonContent As HtmlGenericControl
    Protected spnOrgContent As HtmlGenericControl
    Protected trPerson As HtmlTableRow
    Protected trOrg As HtmlTableRow
    protected valOther1 as CustomValidator
    protected valOther2 as CustomValidator
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub
	
 '-----------------------------------------------------
  
    Public Sub ValidateOther1(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlIsOther1 = CType(Me.FindControl("ctlIsOther1"), cCheckBox)
		ctlOtherText1 = CType(Me.FindControl("ctlOtherText1"), cTextBox)
						
		If (ctlOtherText1.Value = "" And ctlIsOther1.BaseCheckButton.Checked = True) then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 

 '-----------------------------------------------------
  
    Public Sub ValidateOther1b(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlIsOther1 = CType(Me.FindControl("ctlIsOther1"), cCheckBox)
		ctlOtherText1 = CType(Me.FindControl("ctlOtherText1"), cTextBox)
						
		If (ctlOtherText1.Value <> "" And ctlIsOther1.BaseCheckButton.Checked = False) then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 
   
'-----------------------------------------------------
  
    Public Sub ValidateOther2(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlIsOther2 = CType(Me.FindControl("ctlIsOther2"), cCheckBox)
		ctlOtherText2 = CType(Me.FindControl("ctlOtherText2"), cTextBox)
						
		If (ctlOtherText2.Value = "" And ctlIsOther2.BaseCheckButton.Checked = True) then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 

'-----------------------------------------------------
  
    Public Sub ValidateOther2b(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlIsOther2 = CType(Me.FindControl("ctlIsOther2"), cCheckBox)
		ctlOtherText2 = CType(Me.FindControl("ctlOtherText2"), cTextBox)
						
		If (ctlOtherText2.Value <> "" And ctlIsOther2.BaseCheckButton.Checked = False) then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub 

 '-----------------------------------------------------
  
'Invoked by EventController_ControlValidate
'	Public Function ValidateCountry(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
'		ValidateCountry = True
		
'	    Dim ctlCountry As cDropDown
'		ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)

'	    Dim ctlState As cDropDown
'		ctlState = CType(Me.FindControl("ctlState"), cDropDown)
	
'		Dim iType As Integer
'		iType = CType(ctlCountry.SelectedValue, Integer)
		
'		If iType = 280 Or iType = 41 Then  'US or Canada
'			If ctlState.SelectedValue = "" Then
'				ValidateCountry = False
'			End If
'		Else
'			ValidateCountry = True
'		End If	
		
'	End Function
	
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		
        MyBase.DataPresenter_SaveDataObjects()
 


        Dim aPrimList As cDataObjectList

		Dim aPersonCurrentAwardsList As cDataObjectList
        Dim aPersonCurrentAwardsDO as cDataObject
        Dim aPersonCurrentAwardsList2 as cDataObjectList
        Dim aPersonCurrentAwards2DO as cDataObject
        Dim aUser as cEGUser

        Dim aPrimPhoneList as cDataObjectList
        Dim aPrimFaxList as cDataObjectList
        Dim aPhoneList as cDataObjectList
        Dim aFaxList as cDataObjectList
        Dim aPhoneDO as cDataObject
        Dim aFaxDO as cDataObject

        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
		
        ctlIsOther1 = CType(Me.FindControl("ctlIsOther1"), cCheckBox)
        ctlIsOther2 = CType(Me.FindControl("ctlIsOther2"), cCheckBox)
        ctlOtherText1 = CType(Me.FindControl("ctlOtherText1"), cTextBox)
        ctlOtherText2 = CType(Me.FindControl("ctlOtherText2"), cTextBox)

        aPersonCurrentAwardsList = me.DataObjectCollection("PersonCurrentAward")
        aPersonCurrentAwardsList2 = me.DataObjectCollection("PersonCurrentAward2")
        
' ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
         
 						
		    'If not aPersonCurrentAwardsList is nothing then
				If aPersonCurrentAwardsList.Count >= 0 then
                    aPersonCurrentAwardsDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("PersonCurrentAward")
                    aPersonCurrentAwardsDO("PersonID") = aUser.PersonID
                    aPersonCurrentAwardsDO("CurrentAwardID") = 27 'Other 1
                    aPersonCurrentAwardsDO("IsOther1") = ctlIsOther1.Value
                    aPersonCurrentAwardsDO("OtherSpecify1") = ctlOtherText1.Value
                    WebSession.DataObjectFactory.SaveDataObject(aPersonCurrentAwardsDO)
                    aPersonCurrentAwardsDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("PersonCurrentAward")
                    aPersonCurrentAwardsDO("PersonID") = aUser.PersonID
                    aPersonCurrentAwardsDO("CurrentAwardID") = 28 'Other 2
                    aPersonCurrentAwardsDO("IsOther2") = ctlIsOther2.Value
                    aPersonCurrentAwardsDO("OtherSpecify2") = ctlOtherText2.Value
                    WebSession.DataObjectFactory.SaveDataObject(aPersonCurrentAwardsDO)
                 End If
  
	        'End If

            'Dim aURL = Request.Url.ToString

            'aURL = cWebLib.AddQuerystringParameter(aURL, "IsOther", ctlIsOther.Value)
            'CorePage.Redirect(aURL)

	End Sub
	
'=============================================================
End Class 'cAddressInfoEditor
End Namespace
