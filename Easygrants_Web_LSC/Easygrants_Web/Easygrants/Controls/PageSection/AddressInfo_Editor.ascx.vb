Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.Web.cCoreCtl

Namespace Easygrants_Web.Controls.PageSection
Public Class cAddressInfo_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected spnPersonContent As HtmlGenericControl
    Protected spnOrgContent As HtmlGenericControl
    Protected trPerson As HtmlTableRow
    Protected trOrg As HtmlTableRow
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub

'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidateCountry(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateCountry = True
		
	    Dim ctlCountry As cDropDown
		ctlCountry = CType(Me.FindControl("ctlCountry"), cDropDown)

	    Dim ctlState As cDropDown
		ctlState = CType(Me.FindControl("ctlState"), cDropDown)
	
		Dim iType As Integer
		iType = CType(ctlCountry.SelectedValue, Integer)
		
		If iType = 280 Or iType = 41 Then  'US or Canada
			If ctlState.SelectedValue = "" Then
				ValidateCountry = False
			End If
		Else
			ValidateCountry = True
		End If	
		
	End Function
	
'=============================================================

'Invoked by EventController_ControlValidate
	Public Function ValidateEffectiveDates(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateEffectiveDates = True
		
	    Dim ctlEffectiveStartDate As cDateTextBox
	    Dim ctlEffectiveEndDate As cDateTextBox
	    dim aStartDate as String
	    dim aEndDate as String
	    
		ctlEffectiveStartDate = CType(Me.FindControl("ctlEffectiveStartDate"), cDateTextBox)
		ctlEffectiveEndDate = CType(Me.FindControl("ctlEffectiveEndDate"), cDateTextBox)
	
		'Dim iType As Integer
		'iType = CType(ctlCountry.SelectedValue, Integer)
		
		'If iType = 280 Or iType = 41 Then  'US or Canada
		aStartDate = ctlEffectiveStartDate.DateString
		aEndDate = ctlEffectiveEndDate.DateString
		
		if (ctlEffectiveStartDate.DateString <> "" and ctlEffectiveEndDate.DateString <> "") then
			try
				If System.Convert.ToDateTime(aStartDate) > System.Convert.ToDateTime(aEndDate) Then
					ValidateEffectiveDates = False
				Else
					ValidateEffectiveDates = True
				End If
			catch
			end try
		end if	
		
	End Function
		
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aAddrList As cDataObjectList
        Dim aPrimPhoneList as cDataObjectList
        Dim aPrimFaxList as cDataObjectList
        Dim aPhoneList as cDataObjectList
        Dim aFaxList as cDataObjectList
        Dim aPhoneDO as cDataObject
        Dim aFaxDO as cDataObject
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aAddrList = me.DataObjectCollection("Address")
        aPhoneList = Me.DataObjectCollection("Phone")
        aFaxList = Me.DataObjectCollection("Fax")   
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
         
        if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Address", _
						"EntityID", EntityID, "EntityTypeID", EntityTypeID, "IsPrimary", "True")
						
			if not aPrimList is nothing then
				if aPrimList.Count > 0 then
					if aAddrList(0).GetPropertyInt("AddressID", 0) <> aPrimList(0).GetPropertyInt("AddressID", 0) then 
						aPrimList(0)("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))                      
                        aPrimPhoneList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
                           "EntityID", EntityID, "EntityTypeID", EntityTypeID, "PhoneTypeID", "1", "IsPrimary", "True")
                        If aPrimPhoneList.Count > 0 Then
                            For each aPhoneDO in aPhoneList
                                If aPhoneList(0).GetPropertyInt("PhoneID", 0) <> aPrimPhoneList(0).GetPropertyInt("PhoneID", 0) then
                                    aPrimPhoneList(0)("IsPrimary") = False
					                WebSession.DataObjectFactory.SaveDataObject(aPrimPhoneList(0))
                                    aPhoneList(0)("IsPrimary") = True
                                    If IsDBNull(aPhoneList(0)("EntityID")) Then
                                        aPhoneList(0)("EntityID") = EntityID
                                    End If
                                    If IsDBNull(aPhoneList(0)("EntityTypeID")) Then
                                        aPhoneList(0)("EntityTypeID") = EntityTypeID
                                    End If
                                    If IsDBNull(aPhoneList(0)("PhoneTypeID")) Then
                                        aPhoneList(0)("PhoneTypeID") = 1
                                    End If
                                    If IsDBNull(aPhoneList(0)("AddressID")) Then
                                        aPhoneList(0)("AddressID") = Request.QueryString("AddressID")
                                    End If
                                    WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
                                End If
                            Next
                        Else
                            For each aPhoneDO in aPhoneList
                                If aPhoneList(0).GetPropertyInt("PhoneID", 0) <> aPrimPhoneList(0).GetPropertyInt("PhoneID", 0) then
                                    aPrimPhoneList(0)("IsPrimary") = True
					                WebSession.DataObjectFactory.SaveDataObject(aPrimPhoneList(0))
                                End If
                            Next
                          End If
                      
                        aPrimFaxList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
                           "EntityID", EntityID, "EntityTypeID", EntityTypeID, "PhoneTypeID", "4", "IsPrimary", "True")
                        If aPrimFaxList.Count > 0 Then
                            For each aFaxDO in aFaxList
                                If aFaxList(0).GetPropertyInt("PhoneID", 0) <> aPrimFaxList(0).GetPropertyInt("PhoneID", 0) then
                                    aPrimFaxList(0)("IsPrimary") = False
					                WebSession.DataObjectFactory.SaveDataObject(aPrimFaxList(0))
                                    aFaxList(0)("IsPrimary") = True
                                    aFaxList(0)("EntityID") = EntityID
                                    aFaxList(0)("EntityTypeID") = EntityTypeID
                                    aFaxList(0)("PhoneTypeID") = 4
                                    aFaxList(0)("AddressID") = Request.QueryString("AddressID")
                                    WebSession.DataObjectFactory.SaveDataObject(aFaxList(0))
                                End If
                            Next
                        Else
                           For each aFaxDO in aFaxList
                                If aFaxList(0).GetPropertyInt("PhoneID", 0) <> aPrimFaxList(0).GetPropertyInt("PhoneID", 0) then
                                    aPrimFaxList(0)("IsPrimary") = False
					                WebSession.DataObjectFactory.SaveDataObject(aPrimFaxList(0))
                                End If
                            Next
                        End If
 					end if
				end if
			End If	
		

		End If  
       
		MyBase.DataPresenter_SaveDataObjects()

        If aPrimList Is Nothing Then
            If ctlIsPrimary.Value = True then
                aPhoneList(0)("IsPrimary") = True
                WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
                aFaxList(0)("IsPrimary") = True
                WebSession.DataObjectFactory.SaveDataObject(aFaxList(0))
            else 
                aPhoneList(0)("IsPrimary") = False
                WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
                aFaxList(0)("IsPrimary") = False
                WebSession.DataObjectFactory.SaveDataObject(aFaxList(0))
            End If 
        End If 
           
        If Not aPrimList Is Nothing Then 
            If aPrimList.Count >= 0 Then
                If ctlIsPrimary.Value = True Then
                    aPhoneList(0)("IsPrimary") = True
                    aPhoneList(0)("AddressID") = aAddrList(0).GetPropertyValue("AddressID")
                    WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
                    aFaxList(0)("IsPrimary") = True
                    aFaxList(0)("AddressID") = aAddrList(0).GetPropertyValue("AddressID")
                    WebSession.DataObjectFactory.SaveDataObject(aFaxList(0))              
                else 
                    aPhoneList(0)("IsPrimary") = False
                    WebSession.DataObjectFactory.SaveDataObject(aPhoneList(0))
                    aFaxList(0)("IsPrimary") = False
                    WebSession.DataObjectFactory.SaveDataObject(aFaxList(0))
                End If          
            End If
        End If
	End Sub
	
'=============================================================

	Public Sub Save()
		
		dim aURL as String
		dim aAddressID as String
		dim aAddressDO as cDataObject
		
		DataPresenter_SaveDataObjects()
		
		aAddressDO = Me.DataObjectCollection("Address")(0)
		
		if not aAddressDO is nothing then
			aAddressID = aAddressDO.GetRelatedPropertyString("AddressID")	
			aURL = Request.RawUrl.ToString()
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "AddressID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "AddressID", aAddressID)
			response.Redirect(aURL)
		end if
		
	End Sub
	
'=============================================================
End Class 'cAddressInfoEditor
End Namespace