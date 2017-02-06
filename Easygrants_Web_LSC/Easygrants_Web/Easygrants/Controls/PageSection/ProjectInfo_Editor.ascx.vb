Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web.Navigation
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cProjectInfo_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================
    Protected lblValidationMessage as Label
	'protected ctlPrevAppID as cDropDown
	protected ctlResubmissionAnswer as cRadioButtonList
	protected ctlProjectTitle as cTextBox
	protected ctlPerTimeDevoted as cTextBox
	protected ctlProjectSummary as cTextArea
	protected ctlValSumm as cValidationSummary
	protected ctlIsRecombinantList as cRadioButtonList
	protected ctlIsBiohazardsList as cRadioButtonList
	protected ctlIsHumanSubjectsList as cRadioButtonList
	protected ctlIsAdultStemCellsList as cRadioButtonList
	protected ctlIsFetalStemCellsList as cRadioButtonList
	protected ctlIsFetalTissueList as cRadioButtonList
	protected ctlIsCloningList as cRadioButtonList
	protected ctlIsAnimalSubjectsList as cRadioButtonList
	protected ctlIsAccreditedList as cRadioButtonList
	protected ctlIHasCurrentAssuranceList as cRadioButtonList
	protected ctlAccreditedEffectiveDate as cDateTextBox
	protected ctlIDNumber as cTextBox
	
	protected valSumTotal as CustomValidator
	protected spnLabel as HtmlGenericControl
	
	protected tdPerTimeDevoted as HtmlTableCell
	
	protected valAccredited as CustomValidator
	protected valCurrentAssurance as CustomValidator
	protected valPercentAreas as CustomValidator
	protected tdPercentAreasList as HtmlTableCell
	
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		dim aGranteeProjectID as String = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString

		dim aGPAreaPercentageDOList as cDataObjectList
		dim aGPAreaPercentageDO as cDataObject
		dim aTotal as Integer = 0
		aGPAreaPercentageDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectAreaPercentages", "GranteeProjectID", aGranteeProjectID)

        Dim ctlSumTotal as cLabel
		ctlSumTotal = CType(Me.FindControl("ctlSumTotal"), cLabel)

        If aGPAreaPercentageDOList.Count > 0 Then
            For each aGPAreaPercentageDO in aGPAreaPercentageDOList
                Dim aPercentageTotal as Integer
                aPercentageTotal = aGPAreaPercentageDO.GetPropertyInt("Total")
                aTotal = aPercentageTotal + aTotal
            Next
            If aTotal < 100 Then
                ctlSumTotal.Value = "&nbsp;<font size='2'>" + aTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%"                      
			else
				ctlSumTotal.Value = "<font size='2'>" + aTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%"                      			
            End If
        End If

        If request.QueryString("PrevWfTaskAssignmentID") = "" And request.QueryString("GranteeProjectID") = "" then
		    dim aWfTaskAssignmentList as cDataObjectList
            dim aURL as String = Request.RawUrl.ToString()

            aWfTaskAssignmentList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
            aGranteeProjectID = aWfTaskAssignmentList(0).GetPropertyString("GranteeProjectID")
            aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", aGranteeProjectID)
            Response.Redirect(aURL)          
         End If

		'ctlPrevAppID = me.FindControl("ctlPrevAppID")
		'ctlPrevAppID.Set_ServerIndexChange(addressof DropDown_Selected)
		
	End Sub
	
'-------------------------------------------------------------

	'Private Sub DropDown_Selected(ByVal sender As System.Object, ByVal e As System.EventArgs)
	'	dim aURL as String = Request.RawUrl.ToString()

        
	'	Select Case CType(sender, Control).Parent.ID
	'		Case "ctlPrevAppID"
 '               aURL = cWebLib.RemoveQuerystringParameter(aURL, "GranteeProjectID")
	'			aURL = cWebLib.AddQuerystringParameter(aURL, "PrevWfTaskAssignmentID", ctlPrevAppID.SelectedValue)
	'	End Select
		
	'	Response.Redirect(aURL)
	'End Sub
	
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		'ctlPrevAppID = me.FindControl("ctlPrevAppID")
		'dim aType as String = request.QueryString("PrevWfTaskAssignmentID")
		
		'if aType <> "" then
		'	ctlPrevAppID.SelectedField = aType
		'end if
		
	
	 end Sub

'=============================================================
  
	Public Sub PreviousWfTaskAssignment()
		
		dim aGranteeProjectID as String = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString
		dim aURL as String = me.Request.RawUrl()
		if request.QueryString("PrevWfTaskAssignmentID") <> ""  then
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "PrevWfTaskAssignmentID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", aGranteeProjectID)
			response.Redirect(aURL)
		end if
	End Sub

'=============================================================
	
 Public Overrides Sub DataPresenter_SaveDataObjects()


		dim aGranteeProjectID as String = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID.ToString
		dim aWfTaskAssignmentList as cDataObjectList
		dim aGranteeProjectInfoList as cDataObjectList
		dim aGranteeProjectInfoDO as cDataObject
        dim aURL as String = Request.RawUrl.ToString()
		Dim aValid As Boolean = True
        dim aPercentAreasList as Hashtable
        dim aPercentAreasDO as cDataObject
        dim ctlPercentAreasList as cDataPresenterList
		'dim aKey as String
        dim aDataPresenter as cDataPresenterCtl
        dim aTextBox as cTextBox
        dim aPercentTotal as Integer = 0
		Dim aGPAreaPercentage As cDataObject
		'Dim aXmlDoc As cXMLDoc
		'Dim aDataObjectNode As XmlNode
		'Dim aFiltersNode As XmlNode
		Dim ctlSumTotal as cLabel
		Dim ctlPercentAreas as cLabel
		dim aPercentLabel as cLabel
		dim aPercentAreasID as Integer
 
 		'save Percent Areas
		ctlPercentAreasList = Me.FindControl("ctlPercentAreasList")
        aPercentAreasList = CType(ctlPercentAreasList.DataPresenterCollection, Hashtable)
 
		ctlSumTotal = CType(Me.FindControl("ctlSumTotal"), cLabel)
           
        dim myEnumerator as IDictionaryEnumerator = aPercentAreasList.GetEnumerator
        while myEnumerator.MoveNext
            aDataPresenter = myEnumerator.Value
					aTextBox = CType(aDataPresenter.FindControl("ctlPercentage"), cTextBox) '(FindControl? Whichever is ours) (ID of the text box in the child data presenter)
					
                if aTextBox.Value <> "" then
                    aPercentTotal += Convert.ToInt32(aTextBox.Value) 
                End If
                
                if aPercentTotal > 100 then
					aPercentLabel = CType(aDataPresenter.FindControl("ctlPercentAreas"), cLabel)
					aTextBox.RequiredFieldValidator.IsValid = False
					aTextBox.RequiredFieldValidator.ErrorMessage = aPercentLabel.Value + " cannot be over 100%."
					exit Sub
                end if
                
		End While

 		if aPercentTotal <= 100 then
			dim myEnumerator2 as IDictionaryEnumerator = aPercentAreasList.GetEnumerator
			while myEnumerator2.MoveNext
				aDataPresenter = myEnumerator2.Value
				aTextBox = CType(aDataPresenter.FindControl("ctlPercentage"), cTextBox) '(FindControl? Whichever is ours) (ID of the text box in the child data presenter)	
				ctlPercentAreas = CType(aDataPresenter.FindControl("ctlPercentAreas"), cLabel)
				dim aPercentAreasDOList as cDataObjectList = Me.DataObjectCollection("PercentAreas")
				if ctlPercentAreas.Value <> "" then
					for each aPercentAreasDO in aPercentAreasDOList
						if ctlPercentAreas.Value = aPercentAreasDO.GetPropertyString("PercentAreasDesc") then
							aPercentAreasID = aPercentAreasDO.GetPropertyInt("PercentAreasID")
						end if							
					next
				end if
				dim aGPAreaPercentageDOList as cDataObjectList
				aGPAreaPercentageDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectAreaPercentages", "GranteeProjectID", aGranteeProjectID, "PercentAreasID", aPercentAreasID)	
				if aGPAreaPercentageDOList.Count = 0 then
					if aTextBox.Value <> "" then
						aGPAreaPercentage = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectAreaPercentages")
						aGPAreaPercentage("GranteeProjectID") = aGranteeProjectID
						aGPAreaPercentage("PercentAreasID") = aPercentAreasID
						aGPAreaPercentage("Total") = aTextBox.Value
						WebSession.DataObjectFactory.SaveDataObject(aGPAreaPercentage)
					end if
				end if
				if aGPAreaPercentageDOList.Count > 0 then
					if aTextBox.Value <> "" then
						aGPAreaPercentageDOList(0)("PercentAreasID") = aPercentAreasID
						aGPAreaPercentageDOList(0)("Total") = aTextBox.Value
						WebSession.DataObjectFactory.SaveDataObject(aGPAreaPercentageDOList(0))
					end if
				end if
			End While
		else
			exit Sub
		end if	
		
		aWfTaskAssignmentList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
        aGranteeProjectInfoList = aWfTaskAssignmentList(0).GetRelatedPropertyDataObjectList("GranteeProject.GranteeProjectInfo")
		'dim aGranteeProjectInfoDO as cDataObject
		
		'if Request.QueryString("PrevWfTaskAssignmentID") = "" then
			'aGranteeProjectInfoDO = CType(DataObjectCollection("GranteeProjectInfo"), cDataObjectList)(0)
			if aGranteeProjectInfoList.Count = 0 then
				aGranteeProjectInfoDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectInfo")
				aGranteeProjectInfoDO("GranteeProjectID") = aGranteeProjectID
				aGranteeProjectInfoDO("AreaPercentageTotal") = aPercentTotal
				WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoDO)
			else	
				aGranteeProjectInfoList(0)("AreaPercentageTotal") = aPercentTotal
				WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoList(0))
			end if
		'end if


		'Save Animal Subjects section
 		if ctlIsAnimalSubjectsList.SelectedValue = "False" then
			if ctlIsAccreditedList.SelectedValue <> "" then
				if aGranteeProjectInfoList.Count > 0 then
					if Not IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("IsAccredited")) Or Not IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("AccreditedEffectiveDate")) then
						'aGranteeProjectInfoList(0)("IsAccredited") = System.DBNull.Value
						aGranteeProjectInfoList(0)("AccreditedEffectiveDate") = System.DBNull.Value
						ctlAccreditedEffectiveDate.DateString = ""
						'ctlIsAccreditedList.SelectedField = ""
					end if
				end if
			end if
		else
			if ctlIsAccreditedList.SelectedValue <> "" then
				if aGranteeProjectInfoList.Count > 0 then
					aGranteeProjectInfoList(0)("IsAccredited") = ctlIsAccreditedList.SelectedValue	
				else
					aGranteeProjectInfoDO("IsAccredited") = ctlIsAccreditedList.SelectedValue
				end if
			end if	
		end if
				
		if ctlAccreditedEffectiveDate.DateString <> "" then
			if aGranteeProjectInfoList.Count > 0 then
				aGranteeProjectInfoList(0)("AccreditedEffectiveDate") = ctlAccreditedEffectiveDate.DateString
			else
				aGranteeProjectInfoDO("AccreditedEffectiveDate") = ctlAccreditedEffectiveDate.DateString
			end if
		end if

		if ctlIsAnimalSubjectsList.SelectedValue = "True" then
			if ctlIsAccreditedList.SelectedValue = "False" And aGranteeProjectInfoList.Count > 0 then
				if not IsDBNull(aGranteeProjectInfoList(0)("AccreditedEffectiveDate")) then
					aGranteeProjectInfoList(0)("AccreditedEffectiveDate") = System.DBNull.Value
					WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoList(0))
					ctlAccreditedEffectiveDate.DateString = ""
				end if
			else
				if aGranteeProjectInfoList.Count > 0 then
					aGranteeProjectInfoList(0)("IsAccredited") = ctlIsAccreditedList.SelectedValue	
				else
					aGranteeProjectInfoDO("IsAccredited") = ctlIsAccreditedList.SelectedValue
				end if
			end if
		end if

		if ctlIsAnimalSubjectsList.SelectedValue = "False" then
			if ctlIHasCurrentAssuranceList.SelectedValue <> "" then
				if aGranteeProjectInfoList.Count > 0 then
					if Not IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("HasCurrentAssurance")) Or Not IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("IDNumber")) then
						'aGranteeProjectInfoList(0)("HasCurrentAssurance") = System.DBNull.Value
						aGranteeProjectInfoList(0)("IDNumber") = System.DBNull.Value
						WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoList(0))
						ctlIDNumber.Value = ""
						'ctlIHasCurrentAssuranceList.SelectedField = ""
					end if
				end if
			end if
		else
			if ctlIHasCurrentAssuranceList.SelectedValue <> "" then
				if aGranteeProjectInfoList.Count > 0 then
					aGranteeProjectInfoList(0)("HasCurrentAssurance") = ctlIHasCurrentAssuranceList.SelectedValue	
				else
					aGranteeProjectInfoDO("HasCurrentAssurance") = ctlIHasCurrentAssuranceList.SelectedValue
				end if
			end if	
		end if		
		
		if ctlIDNumber.Value <> "" then
			if aGranteeProjectInfoList.Count > 0 then
				aGranteeProjectInfoList(0)("IDNumber") = ctlIDNumber.Value.ToString()
			else
				aGranteeProjectInfoDO("IDNumber") = ctlIDNumber.Value.ToString()
			end if
		end if

		if ctlIsAnimalSubjectsList.SelectedValue = "True" then
			if ctlIHasCurrentAssuranceList.SelectedValue = "False" And aGranteeProjectInfoList.Count > 0 then
				if Not IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("IDNumber")) then
					aGranteeProjectInfoList(0)("IDNumber") = System.DBNull.Value
					WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoList(0))
					ctlIDNumber.Value = ""
				end if
			else
				if ctlIHasCurrentAssuranceList.SelectedValue <> "" then
					if aGranteeProjectInfoList.Count > 0 then
						if IsDBNull(aGranteeProjectInfoList(0).GetPropertyValue("IDNumber")) then
							aGranteeProjectInfoList(0)("HasCurrentAssurance") = ctlIHasCurrentAssuranceList.SelectedValue
						end if
					end if
				end if
			end if
		end if	
 		
		'if ctlIsAnimalSubjectsList.SelectedValue = "False" then
		'	if (ctlIHasCurrentAssuranceList.SelectedValue = "False" and ctlIsAccreditedList.SelectedValue = "False") then
		'		if not aGranteeProjectDO is nothing then
		'			aGranteeProjectDO("IsAccredited") = System.DBNull.Value
		'			aGranteeProjectDO("HasCurrentAssurance") = System.DBNull.Value
		'		else
		'			ctlIsAccreditedList.SelectedField = ""
		'			ctlIHasCurrentAssuranceList.SelectedField = ""
		'		end if
		'	end if
		'end if		

		'ctlPrevAppID = Me.FindControl("ctlPrevAppID")
		ctlResubmissionAnswer = Me.FindControl("ctlResubmissionAnswer")
		ctlProjectTitle = Me.FindControl("ctlProjectTitle")
		ctlProjectSummary = Me.FindControl("ctlProjectSummary")
		ctlPerTimeDevoted = Me.FindControl("ctlPerTimeDevoted")
		ctlIsRecombinantList = Me.FindControl("ctlIsRecombinantList")
		ctlIsBiohazardsList = Me.FindControl("ctlIsBiohazardsList")
		ctlIsHumanSubjectsList = Me.FindControl("ctlIsHumanSubjectsList")
		ctlIsAdultStemCellsList = Me.FindControl("ctlIsAdultStemCellsList")
		ctlIsFetalStemCellsList = Me.FindControl("ctlIsFetalStemCellsList")
		ctlIsFetalTissueList = Me.FindControl("ctlIsFetalTissueList")
		ctlIsCloningList = Me.FindControl("ctlIsCloningList")
		ctlIsAnimalSubjectsList = Me.FindControl("ctlIsAnimalSubjectsList")
		ctlIsAccreditedList = me.FindControl("ctlIsAccreditedList")
		ctlIHasCurrentAssuranceList = me.FindControl("ctlIHasCurrentAssuranceList")

		if aGranteeProjectInfoList.Count > 0 then
			aGranteeProjectInfoDO = aGranteeProjectInfoList(0)
		end if
		'	dim aGPDO as cDataObject = aGranteeProjectInfoList(0).GetRelatedPropertyDataObject("GranteeProject")
		'	'aGranteeProjectInfoList(0)("PreviousApplicationID") = ctlPrevAppID.SelectedValue
		'	aGranteeProjectInfoList(0)("ResubmissionAnswerID") = ctlResubmissionAnswer.SelectedValue
		'	aGranteeProjectInfoList(0)("ProjectTitle") = ctlProjectTitle.Value
		'	'also saving GP.grant_title
		'	aGPDO("GrantTitle") = ctlProjectTitle.Value
		'	aGranteeProjectInfoList(0)("Description") = ctlProjectSummary.Value
		'	aGranteeProjectInfoList(0)("PercentageTimeDevoted") = ctlPerTimeDevoted.Value
		'	aGranteeProjectInfoList(0)("IsRecombinant") = ctlIsRecombinantList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsBiohazards") = ctlIsBiohazardsList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsHumanSubjects") = ctlIsHumanSubjectsList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsAdultStemCells") = ctlIsAdultStemCellsList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsFetalStemCells") = ctlIsFetalStemCellsList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsFetalTissue") = ctlIsFetalTissueList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsCloning") = ctlIsCloningList.SelectedValue
		'	aGranteeProjectInfoList(0)("IsAnimalSubjects") = ctlIsAnimalSubjectsList.SelectedValue	
		'	aGranteeProjectInfoList(0)("IsAccredited") = ctlIsAccreditedList.SelectedValue
		'	aGranteeProjectInfoList(0)("HasCurrentAssurance") = ctlIHasCurrentAssuranceList.SelectedValue
		'	WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoList(0))
		'else
			dim aGPDO as cDataObject = aGranteeProjectInfoDO.GetRelatedPropertyDataObject("GranteeProject")
			aGranteeProjectInfoDO("GranteeProjectID") = aGranteeProjectID
			'aGranteeProjectDO("PreviousApplicationID") = ctlPrevAppID.SelectedValue
			aGranteeProjectInfoDO("ResubmissionAnswerID") = ctlResubmissionAnswer.SelectedValue
			'also saving GP.grant_title
			aGPDO("GrantTitle") = ctlProjectTitle.Value
			aGranteeProjectInfoDO("ProjectTitle") = ctlProjectTitle.Value
			aGranteeProjectInfoDO("Description") = ctlProjectSummary.Value
			aGranteeProjectInfoDO("PercentageTimeDevoted") = ctlPerTimeDevoted.Value
			aGranteeProjectInfoDO("IsRecombinant") = ctlIsRecombinantList.SelectedValue
			aGranteeProjectInfoDO("IsBiohazards") = ctlIsBiohazardsList.SelectedValue
			aGranteeProjectInfoDO("IsHumanSubjects") = ctlIsHumanSubjectsList.SelectedValue
			aGranteeProjectInfoDO("IsAdultStemCells") = ctlIsAdultStemCellsList.SelectedValue
			aGranteeProjectInfoDO("IsFetalStemCells") = ctlIsFetalStemCellsList.SelectedValue
			aGranteeProjectInfoDO("IsFetalTissue") = ctlIsFetalTissueList.SelectedValue
			aGranteeProjectInfoDO("IsCloning") = ctlIsCloningList.SelectedValue
			aGranteeProjectInfoDO("IsAnimalSubjects") = ctlIsAnimalSubjectsList.SelectedValue	
			aGranteeProjectInfoDO("IsAccredited") = ctlIsAccreditedList.SelectedValue
			aGranteeProjectInfoDO("HasCurrentAssurance") = ctlIHasCurrentAssuranceList.SelectedValue 
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoDO)
			WebSession.DataObjectFactory.SaveDataObject(aGPDO)
			
		'end if

		if request.QueryString("PrevWfTaskAssignmentID") <> "" then
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "PrevWfTaskAssignmentID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", aGranteeProjectID)
			response.Redirect(aURL)
		end if   


 End Sub 
 
'=============================================================
 
   Public Sub ValidatePercentAreas(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)


		Dim aValid As Boolean = True
        dim aPercentAreasList as Hashtable
		'dim aPercentAreasDO as cDataObject
        dim ctlPercentAreasList as cDataPresenterList
		'dim aKey as String
        dim aDataPresenter as cDataPresenterCtl
        dim aTextBox as cTextBox
        dim aPercentTotal as Integer = 0
		'Dim aGPAreaPercentage As cDataObject
		'Dim aXmlDoc As cXMLDoc
		'Dim aDataObjectNode As XmlNode
		'Dim aFiltersNode As XmlNode
		Dim ctlSumTotal as cLabel
		'Dim ctlPercentAreas as cLabel
		dim aPercentLabel as cLabel
		'dim aPercentAreasID as Integer
		dim aLabel as cLabel
		dim aIsValid as Boolean
		
		Dim aValLabel As StringBuilder = New StringBuilder()

		ctlPercentAreasList = Me.FindControl("ctlPercentAreasList")
        aPercentAreasList = CType(ctlPercentAreasList.DataPresenterCollection, Hashtable)
 
		ctlSumTotal = CType(Me.FindControl("ctlSumTotal"), cLabel)
           
        dim myEnumerator as IDictionaryEnumerator = aPercentAreasList.GetEnumerator
        while myEnumerator.MoveNext
            aDataPresenter = myEnumerator.Value
			aTextBox = CType(aDataPresenter.FindControl("ctlPercentage"), cMoneyTextBox) '(FindControl? Whichever is ours) (ID of the text box in the child data presenter)
			aLabel = CType(aDataPresenter.FindControl("ctlPercentAreas"), cLabel)                       
            try
				if aTextBox.Value <> "" then
					aPercentTotal += Convert.ToInt32(aTextBox.Value) 
				else
					aPercentLabel = CType(aDataPresenter.FindControl("ctlPercentAreas"), cLabel)
					'aTextBox.RequiredFieldValidator.IsValid = False
					'valPercentAreas.ErrorMessage = "You must indicate the percentage of time spent on " + aPercentLabel.Value + "."
					'aArgs.IsValid = False
					'exit Sub
							aValLabel.Append("You must indicate the percentage of time spent on " + aPercentLabel.Value + ".")
							'aValLabel.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
							'aValLabel.Append(" , you must select a Conflict Type.")
							aValLabel.Append("<br>")
							'valPercentAreas.ErrorMessage = aValLabel.ToString()
							aIsValid = False
				End If
            Catch ex As Exception
				'valPercentAreas.ErrorMessage = "You must use only numbers for " + aLabel.Value + "."
				aArgs.IsValid = False
				exit Sub
            end try    
		End While
		
		
		
		if aValid <> False
			if (aPercentTotal <> 0 and aPercentTotal = 100) then
				ctlSumTotal.Value = "&nbsp;&nbsp;&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				aArgs.IsValid = True
				aIsValid = True
				spnLabel.Visible = False
			elseif (aPercentTotal <> 0 and aPercentTotal < 100) then
				'valPercentAreas.ErrorMessage = "Total percentage must be 100%."
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				'aArgs.IsValid = false	
				aValLabel.Append("Total percentage must be 100%.")
			elseif (aPercentTotal <> 0 and aPercentTotal > 100) then
				'valPercentAreas.ErrorMessage = "Total percentage must be 100%."
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				'aArgs.IsValid = false
				aValLabel.Append("Total percentage must be 100%.") 
			elseif (aPercentTotal = 0) then
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				'aArgs.IsValid = False
				spnLabel.Visible = False					
			else
				'valPercentAreas.ErrorMessage = "Total percentage must be 100%."
				aValLabel.Append("Total percentage must be 100%.")
				ctlSumTotal.Value = "<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				'aArgs.IsValid = false
			end if  
		else
			if aPercentTotal = 0 then
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
			elseif (aPercentTotal <> 0 and aPercentTotal = 100) then
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				aArgs.IsValid = False
				spnLabel.Visible = False
			elseif (aPercentTotal <> 0 and aPercentTotal < 10) then
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				aArgs.IsValid = False
				spnLabel.Visible = False	 
			elseif (aPercentTotal = 0) then
				ctlSumTotal.Value = "&nbsp;<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				aArgs.IsValid = False
				spnLabel.Visible = False					
			else
				spnLabel.Visible = True
				ctlSumTotal.Value = "<font size='2'>" + aPercentTotal.ToString() + "</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%" 
				aArgs.IsValid = false
			end if  
		end if 
		
		if aIsValid = False then
			aArgs.IsValid = False
			valPercentAreas.ErrorMessage = aValLabel.ToString()
			exit Sub
		end if
		        
	End Sub
 
 '-----------------------------------------------------
  
    Public Sub ValidateAccredited(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		ctlIsAnimalSubjectsList = CType(Me.FindControl("ctlIsAnimalSubjectsList"), cRadioButtonList)
        ctlIsAccreditedList = CType(Me.FindControl("ctlIsAccreditedList"), cRadioButtonList)
        ctlIHasCurrentAssuranceList = CType(Me.FindControl("ctlIHasCurrentAssuranceList"), cRadioButtonList)
        ctlAccreditedEffectiveDate = CType(Me.FindControl("ctlAccreditedEffectiveDate"), cDateTextBox)
        ctlIDNumber = CType(Me.FindControl("ctlIDNumber"), cTextBox)

		'Animal Subjects
		if ctlIsAnimalSubjectsList.SelectedValue <> "" then

			'Animal Subject validated but Accredited not
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIsAccreditedList.SelectedValue = "" then
					valAccredited.ErrorMessage = "If your research does involve Animal Subjects, indicate if your ~~Organization~~ is accredited by AAALAC."
					aArgs.IsValid = False
				end if
			end if 
			'Animal Subject validated but "No" selected for Accredited and Effective Date inputed
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIsAccreditedList.SelectedValue = "False" then
					if ctlAccreditedEffectiveDate.DateString <> "" then
							valAccredited.ErrorMessage = "If you input an 'Effective Date' and your ~~Organization~~ is accredited by AAALAC, you must select 'Yes' for this question."
							aArgs.IsValid = False
					end if
				end if
			end if 				
			'Animal Subject and Accredited validated but Effective Date not
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIsAccreditedList.SelectedValue = "True" then
					if ctlAccreditedEffectiveDate.DateString = ""
						'ctlIsAnimalSubjectsList.RequiredFieldValidator.IsValid = False
						valAccredited.ErrorMessage = "If your research does involve Animal Subjects, indicate the Effective Date your ~~Organization~~ was accredited by AAALAC."
						aArgs.IsValid = False
					end if
				end if
			end if 
			if ctlIsAnimalSubjectsList.SelectedValue = "False" then
				if ctlIsAccreditedList.SelectedValue = "" then
					if ctlAccreditedEffectiveDate.DateString <> ""
						'ctlIsAnimalSubjectsList.RequiredFieldValidator.IsValid = False
						valAccredited.ErrorMessage = "If you input an Effective Date, you must select 'Yes' for Animals subjects and ~~Organization~~ was accredited by AAALAC."
						aArgs.IsValid = False
					end if
				end if
			end if
		end if	
						
   End Sub
   
  '-----------------------------------------------------
  
    Public Sub ValidateCurrentAssurance(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		ctlIsAnimalSubjectsList = CType(Me.FindControl("ctlIsAnimalSubjectsList"), cRadioButtonList)
        ctlIsAccreditedList = CType(Me.FindControl("ctlIsAccreditedList"), cRadioButtonList)
        ctlIHasCurrentAssuranceList = CType(Me.FindControl("ctlIHasCurrentAssuranceList"), cRadioButtonList)
        ctlAccreditedEffectiveDate = CType(Me.FindControl("ctlAccreditedEffectiveDate"), cDateTextBox)
        ctlIDNumber = CType(Me.FindControl("ctlIDNumber"), cTextBox)

		'Animal Subjects
		if ctlIsAnimalSubjectsList.SelectedValue <> "" then
			'Animal Subject validated but "No" selected for Current Assurance and an ID Number is inputed
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIHasCurrentAssuranceList.SelectedValue = "False" then
					if ctlIDNumber.Value <> "" then
							valCurrentAssurance.ErrorMessage = "If you input an 'ID Number' and your ~~Organization~~ has a current PHS Animal Welfare Assurance, you must select 'Yes' for this question."
							aArgs.IsValid = False
					end if
				end if
			end if 						
			'Animal Subject validated but Current Assurance not
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIHasCurrentAssuranceList.SelectedValue = "" then
					'ctlIHasCurrentAssuranceList.RequiredFieldValidator.IsValid = False
					valCurrentAssurance.ErrorMessage = "If your research does involve Animal Subjects, indicate if your ~~Organization~~ has a current PHS Animal Welfare Assurance."
					aArgs.IsValid = False
				end if
			end if 
			'Animal Subject and Current Assurance validated but ID Number not
			if ctlIsAnimalSubjectsList.SelectedValue = "True" then
				if ctlIHasCurrentAssuranceList.SelectedValue = "True" then
					if ctlIDNumber.Value = ""
						'ctlIDNumber.RequiredFieldValidator.IsValid = False
						valCurrentAssurance.ErrorMessage = "If your research does involve Animal Subjects, indicate your Current PHS Animal Welware Assurance ID Number."
						aArgs.IsValid = False
					end if
				end if
			end if 
			if ctlIsAnimalSubjectsList.SelectedValue = "False" then
				if ctlIHasCurrentAssuranceList.SelectedValue = "" then
					if ctlIDNumber.Value <> ""
						'ctlIDNumber.RequiredFieldValidator.IsValid = False
						valCurrentAssurance.ErrorMessage = "If you input an ID Number, you must select 'Yes' for both Animal Subjects and Current PHS Animal Welfare ID Number."
						aArgs.IsValid = False
					end if
				end if
			end if 
		end if	
						
   End Sub
   
   
   Public Sub ValidateApplicationID(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlResubmissionAnswer = CType(Me.FindControl("ctlResubmissionAnswer"), cRadioButtonList)
		'ctlPrevAppID = CType(Me.FindControl("ctlPrevAppID"), cDropDown)
		If ctlResubmissionAnswer.SelectedValue <> "" Then
			If (ctlResubmissionAnswer.SelectedValue = "1") Then 'And (ctlPrevAppID.SelectedValue = "")) Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If
		End If
   End Sub

'=============================================================


End Class
End Namespace
