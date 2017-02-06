Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cProjectCopy
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

'=============================================================

	Public ReadOnly Property WfProjectID() As String
		Get
            If Not Request.QueryString("WfProjectID") Is Nothing Then
                Return Request.QueryString("WfProjectID")
            Else
                Return ""
            End If
		End Get
	End Property

'=============================================================

    'Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '    MyBase.CoreCtl_Load(sender, e)
    'End Sub

'=============================================================

 '   Public Overloads Overrides Function EventController_Save() As Boolean
 '  		Dim aURL As String
	'	aURL = Request.QueryString("ReturnURL")
       
 '       MyBase.EventController_Save()

	'	Response.Redirect(aURL)
	'End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		dim aWfProjectObj as cDataObject = me.DataObjectCollection("WfProject")(0)
		dim aSourceObj as cDataObject = me.DataObjectCollection("Project")(0)
		Dim aBudgetSourceObj As cDataObject = Me.DataObjectCollection("BudgetCategory")(0)

		'dim aWfTaskID as Integer
  '      dim aWfProjectTaskOutcomeList, aList as cDataObjectList
  '      dim aChildObj, aProjectTaskObj, aChildProjectTaskObj, aWfProjectTaskOutcomeObj, aChildProjectTaskOutcomeObj as cDataObject

		aWfProjectObj("AutoGeneratePayment") = aSourceObj.GetPropertyBool("AutoGeneratePayment")
		aWfProjectObj("DefaultPaymentSetup") = aSourceObj.GetPropertyBool("DefaultPaymentSetup")
		aWfProjectObj("PaymentProcessID") = aSourceObj.GetPropertyString("PaymentProcessID")
		aWfProjectObj("AutoGenerateReport") = aSourceObj.GetPropertyBool("AutoGenerateReport")
		aWfProjectObj("DefaultReportSetup") = aSourceObj.GetPropertyBool("DefaultReportSetup")
		aWfProjectObj("ReportProcessID") = aSourceObj.GetPropertyString("ReportProcessID")
		aWfProjectObj("FundID") = aSourceObj.GetPropertyString("FundID")

		MyBase.DataPresenter_SaveDataObjects()
		Copy_WfProject_RelatedDataObjects(aSourceObj.GetPropertyValue("WfProjectID"), aWfProjectObj.GetPropertyValue("WfProjectID"))

  '      'copy page content
  '      aChildObj = CopyDataObject("PageContent", me.Request.QueryString("ProjectID"), nothing, False, nothing, "ProjectID", aWfProjectObj.GetPropertyValue("WfProjectID"))

  '      'copy project task and related tables
  '      aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", _
		'	"WfProjectID", me.Request.QueryString("ProjectID"))

  '      for each aProjectTaskObj in aList
  '          aChildProjectTaskObj = CopyDataObject("", "", aProjectTaskObj, False, nothing, "WfProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))

  '          'copy project_task_uploads and related table
  '          dim aWfProjectTaskUploadsList as cDataObjectList = aProjectTaskObj.GetRelatedPropertyDataObjectList("WfProjectTaskUploads")
  '          dim aWfProjectTaskUploadsObj, aChildProjectTaskUploadsObj, aChildWfProjectTaskUploadOrgObj as cDataObject
  '          dim aWfProjectTaskUploadOrganizationEligibilityList as cDataObjectList
  '          for each aWfProjectTaskUploadsObj in aWfProjectTaskUploadsList
  '              aChildProjectTaskUploadsObj = CopyDataObject("", "", aWfProjectTaskUploadsObj, False, nothing, "WfProjectTaskID", _
  '                                                              aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

  '              aChildWfProjectTaskUploadOrgObj = CopyDataObject("WfProjectTaskUploadOrganizationEligibility", "", aWfProjectTaskUploadsObj, True, nothing, _
  '                                                                  "WfProjectTaskUploadID", aChildProjectTaskUploadsObj.GetPropertyInt("WfProjectTaskUploadID"))  
  '          next  
  '          'copy project_task_nav_elements
  '          dim aWfProjectTaskNavElementObj, aChildProjectTaskNavElementObj as cDataObject
  '          aChildProjectTaskNavElementObj = CopyDataObject("WfProjectTaskNavElements", "", aProjectTaskObj, True, nothing, "WfProjectTaskID", _
  '                                                              aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))  

  '          'copy project_task_eligibility_answers
  '          dim aWfProjectTaskEligAnswersObj, aChildProjectTaskEligAnswersObj as cDataObject
  '          aChildProjectTaskEligAnswersObj = CopyDataObject("WFProjectTaskEligibilityAnswers", "", aProjectTaskObj, True, nothing, "WfProjectTaskID", _
  '                                                              aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))   

  '          'copy project_task_outcome and related tables
  '          aWfProjectTaskOutcomeList = aProjectTaskObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcome") 
  '          for each aWfProjectTaskOutcomeObj in aWfProjectTaskOutcomeList

  '              aChildProjectTaskOutcomeObj = CopyDataObject("", "", aWfProjectTaskOutcomeObj, False, nothing, "WfProjectTaskID", _
  '                                                              aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

  '              'copy project_task_outcome_events and related tables
  '              dim aWfProjectTaskOutcomeEventsList as cDataObjectList = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeEvents")
  '              dim aWfProjectTaskOutcomeEventsObj, aChildProjectTaskOutcomeEventsObj, aChildEventObj, aChildEventCorrObj as cDataObject
  '              for each aWfProjectTaskOutcomeEventsObj in aWfProjectTaskOutcomeEventsList
  '                  aChildProjectTaskOutcomeEventsObj = me.WebSession.DataObjectFactory.CloneDataObject(aWfProjectTaskOutcomeEventsObj)
		'	        aChildProjectTaskOutcomeEventsObj("WfProjectTaskOutcomeID") = aChildProjectTaskOutcomeObj.GetPropertyInt("WfProjectTaskOutcomeID")
		'	        aChildProjectTaskOutcomeEventsObj("WfProjectTaskID") = aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID")            
		'	        me.WebSession.DataObjectFactory.SaveDataObject(aChildProjectTaskOutcomeEventsObj)

  '                  aChildEventObj = CopyDataObject("EventKey", "", aWfProjectTaskOutcomeEventsObj, True, nothing, "", "")

  '                  aChildEventCorrObj = CopyDataObject("EventCorrespondence", "", aWfProjectTaskOutcomeEventsObj, True, nothing, "", "")
  '              next
  '              'copy project_task_outcome_filters and related table
  '              dim aWfProjectTaskOutcomeFiltersList as cDataObjectList = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeFilters")
  '              dim aWfProjectTaskOutcomeFiltersObj, aChildProjectTaskOutcomeFiltersObj, aChildFilterArgumentObj as cDataObject
  '              for each aWfProjectTaskOutcomeFiltersObj in aWfProjectTaskOutcomeFiltersList

  '                  aChildProjectTaskOutcomeFiltersObj = CopyDataObject("", "", aWfProjectTaskOutcomeFiltersObj, False, nothing, _
  '                                                                  "WfProjectTaskOutcomeID", aChildProjectTaskOutcomeObj.GetPropertyInt("WfProjectTaskOutcomeID"))

  '                  aChildFilterArgumentObj = CopyDataObject("FilterArgument", "", aWfProjectTaskOutcomeFiltersObj, True, nothing, "", "")
  '              Next
  '          Next

  '          'copy project_task_pdf
  '          dim aChildProjectTaskPDFObj as cDataObject
  '          aChildProjectTaskPDFObj = CopyDataObject("WfProjectTaskPDF", "", aProjectTaskObj, True, nothing, "WfProjectTaskID", aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

  '          'copy reminders, ONLY if reminder is enabled
  '          dim aRemindersList as cDataObjectList = aProjectTaskObj.GetRelatedPropertyDataObjectList("Reminders")
  '          dim aRemindersObj, aChildRemindersObj as cDataObject
  '          for each aRemindersObj in aRemindersList
  '              if aRemindersObj.GetRelatedPropertyBool("IsEnabled") then
  '                  aChildRemindersObj = CopyDataObject("", "", nothing, False, aRemindersList, "ProjectTaskID", aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))
  '              end if
  '          next
		'Next

  '      'copy project_task_outcome_tasks
  '      'because there can be multiple project task outcome and project task outcome tasks records with the same wf_project_task_id AND next_wf_project_task_id, 
  '      '  we need to find the project task outcome.task_outcome_id for source obj.  then, once we have that we can get the wf_project_task_outcome_id AND
  '      '  next_wf_project_task_id for new obj to create our new project task outcome tasks records.  (kda, 6/24/2008)
  '      for each aSourceObj in aList
  '          dim aWfProjectTaskOutcomeTasksObj, aChildProjectTaskOutcomeTasksObj, aNextProjectTaskObj, aNewProjectTaskObj as cDataObject
  '          dim aNextWfTaskID, aNewProjectTaskID, aParentProjectTaskID, aTaskOutcomeID, aNewWfProjectTaskOutcomeID as Integer
  '          aWfProjectTaskOutcomeList = aSourceObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcome")
  '          if aWfProjectTaskOutcomeList.Count > 0 then
  '              for each aWfProjectTaskOutcomeObj in aWfProjectTaskOutcomeList
  '                  aWfProjectTaskOutcomeTasksObj = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObject("WfProjectTaskOutcomeTasks")
  '                  if not aWfProjectTaskOutcomeTasksObj is nothing then 
  '                      aTaskOutcomeID = aWfProjectTaskOutcomeObj.GetPropertyInt("TaskOutcomeID")
  '                      aNewProjectTaskObj = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
  '                          aWfProjectObj.GetPropertyInt("WfProjectID").ToString(), "WfTaskID", aWfProjectTaskOutcomeObj.GetRelatedPropertyInt("WfProjectTask.WfTaskID").ToString())(0)
  '                      aChildProjectTaskOutcomeTasksObj = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeTasks")
  '                      aNextWfTaskID = aWfProjectTaskOutcomeTasksObj.GetRelatedPropertyInt("NextWfProjectTask.WfTaskID") 
  '                      aNextProjectTaskObj = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
  '                          aWfProjectObj.GetPropertyInt("WfProjectID"), "WfTaskID", aNextWfTaskID.ToString())(0)
  '                      aNewWfProjectTaskOutcomeID =  me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", _
  '                          aNewProjectTaskObj.GetPropertyInt("WfProjectTaskID").ToString(), "TaskOutcomeID", _
  '                          aTaskOutcomeID.ToString())(0).GetPropertyInt("WfProjectTaskOutcomeID")
  '                      aChildProjectTaskOutcomeTasksObj("WfProjectTaskOutcomeID") = aNewWfProjectTaskOutcomeID
  '                      aChildProjectTaskOutcomeTasksObj("NextWfProjectTaskID") = aNextProjectTaskObj.GetPropertyInt("WfProjectTaskID")
  '                      me.WebSession.DataObjectFactory.SaveDataObject(aChildProjectTaskOutcomeTasksObj)
  '                  end if
  '              next    
  '          end if  

  '          'update parent task id
  '          dim aNewParentProjectTaskObj as cDataObject  
  '          dim aNewProjectTaskList as cDataObjectList
  '          aParentProjectTaskID = aSourceObj.GetPropertyInt("ParentProjectTaskID", 0)
  '          if aParentProjectTaskID <> 0 then
  '              aWfTaskID = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aParentProjectTaskID.ToString()).GetPropertyInt("WfTaskID").ToString()
  '              aNewParentProjectTaskObj = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"), _
  '                  "WfTaskID", aWfTaskID.ToString())(0)
  '              aNewProjectTaskList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
  '                  aWfProjectObj.GetPropertyInt("WfProjectID").ToString(), "WfTaskID", aSourceObj.GetPropertyInt("WfTaskID").ToString())
  '              for each aNewProjectTaskObj in aNewProjectTaskList
  '                  aNewProjectTaskObj("ParentProjectTaskID") = aNewParentProjectTaskObj.GetPropertyInt("WfProjectTaskID")
  '                  aNewProjectTaskObj.SaveData()    
  '              Next
  '          End If
  '      Next

  '      'copy project payment table
  '      aChildObj = CopyDataObject("ProjectPayment", me.Request.QueryString("ProjectID"), nothing, False, nothing, _
  '                                      "ProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))


  '      'copy project report table
  '      aChildObj = CopyDataObject("ProjectReport", me.Request.QueryString("ProjectID"), nothing, False, nothing, _
  '                                      "ProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))

  '      'copy budget category table
  '      aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", _
		'	"ProjectID", me.Request.QueryString("ProjectID"))

  '      for each aBudgetSourceObj in aList
		'	aChildObj = me.WebSession.DataObjectFactory.CloneDataObject(aBudgetSourceObj)
		'	aChildObj("ProjectID") = aWfProjectObj.GetPropertyInt("WfProjectID")
		'	me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)
  '          aChildObj("SortOrder") = aChildObj.GetPropertyInt("BudgetCategoryID")
  '          aChildObj.SaveData()
		'Next

  '      'update new budget parent ids
  '      '  TODO:  because of time we did not change data model but we will need to change budget data model so we do not need to rely
  '      '  TODO:  on description.  currently, if client implementation does not follow budget category set up then copy will not be accurate.
  '      dim aChildBudgetCategoryList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", _
  '          "ProjectID", aChildObj.GetPropertyInt("ProjectID", 0).ToString()) 
  '      dim aDirectBudgetCategoryID, aIndirectBudgetCategoryID, aTotalBudgetCategoryID as Integer
  '      for each aChildObj in aChildBudgetCategoryList
  '          if aChildObj.GetPropertyInt("ParentID") <> 0 AndAlso aChildObj.GetPropertyString("HasChild") > 0 then
  '              aChildObj("ParentID") = aTotalBudgetCategoryID 
  '          else
  '             aTotalBudgetCategoryID = aChildObj.GetPropertyInt("BudgetCategoryID", 0)   
  '          End If
  '          if Trim(aChildObj.GetPropertyString("Description", "")) = "Direct Costs" then
  '              aDirectBudgetCategoryID = aChildObj.GetPropertyInt("BudgetCategoryID")   
  '          End If
  '          if Trim(aChildObj.GetPropertyString("Description", "")) = "Indirect Costs" AndAlso aChildObj.GetPropertyString("HasChild") = 1 then
  '              aIndirectBudgetCategoryID = aChildObj.GetPropertyInt("BudgetCategoryID")   
  '          End If
  '          if aChildObj.GetPropertyString("HasChild") <> 1 AndAlso Trim(aChildObj.GetPropertyString("Description", "")) <> "Indirect Costs" then
  '              aChildObj("ParentID") = aDirectBudgetCategoryID  
  '          elseif aChildObj.GetPropertyString("HasChild") = 0 AndAlso Trim(aChildObj.GetPropertyString("Description", "")) = "Indirect Costs" then 
  '              aChildObj("ParentID") = aIndirectBudgetCategoryID
  '          End If
  '          aChildObj.SaveData()
  '      Next
        
	End Sub

	'Public Function CopyDataObject(ByVal aDataObjKey as String, ByVal aParamValue as String, ByVal aDataObj as cDataObject, ByVal aRelatedObj as Boolean,  _
	'                                    ByVal aList as cDataObjectList, ByVal aPropertyKey As String, ByVal aPropertyValue as String)
	'    dim aChildObj as cDataObject
	'    dim aSourceObj as cDataObject

	'    if aDataObjKey <> "" AndAlso not aRelatedObj then
	'        aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter(aDataObjKey, aPropertyKey, aParamValue) 
	'    end if
	'    if aRelatedObj then
	'        aList = aDataObj.GetRelatedPropertyDataObjectList(aDataObjKey)
	'    end if
	'    if not aList is nothing AndAlso aList.Count > 0 then
	'        for each aSourceObj in aList
	'            aChildObj = me.WebSession.DataObjectFactory.CloneDataObject(aSourceObj) 
	'            if aPropertyKey <> "" then aChildObj(aPropertyKey) = aPropertyValue
	'            me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)   
	'        next
	'    elseif not aDataObj is nothing AndAlso not aRelatedObj then
	'        aChildObj = me.WebSession.DataObjectFactory.CloneDataObject(aDataObj) 
	'        if aPropertyKey <> "" then aChildObj(aPropertyKey) = aPropertyValue
	'        me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)
	'    end if

	'    Return aChildObj

	'End Function

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
