Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews

Public MustInherit Class cAssignmentsEditorByAppOne
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	'protected valPrimary as CustomValidator
	Protected ctlType As cDropDown
	
    Public Sub ValidatePrimary(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlType = FindControl("ctlType")
		
        if ctlType.SelectedField = "1" then
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"ReviewCycleStageID", me.Request.QueryString("ReviewCycleStageID"), _
				"GranteeProjectID", ctype(me.DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0).GetPropertyString("GranteeProjectID"), _
				"ReviewAssignmentTypeID", "1")
			
			if aList.Count > 0 then aArgs.IsValid = False
		end if
   End Sub

End Class
End Namespace