Imports Core.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cFundingOppCycleInfo
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected ReadOnly Property ProgramID() As String
        Get
			If Not Request.QueryString("ProgramID") = "" Then
				ProgramID = Request.QueryString("ProgramID")
            Elseif Not Request.QueryString("WfProjectID") = "" Then
				ProgramID = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", Request.QueryString("WfProjectID")).GetRelatedPropertyString("WfCompetition.ProgramID")
			Else
				ProgramID = ""
			End If
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property CompetitionID() As String
        Get
			If Not Request.QueryString("CompetitionID") = "" Then
				CompetitionID = Request.QueryString("CompetitionID")
			ElseIf Not Request.QueryString("WfProjectID") = "" Then
				CompetitionID = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", Request.QueryString("WfProjectID")).GetPropertyString("CompetitionID")
			Else
				CompetitionID = ""
			End If	
        End Get
    End Property

'-------------------------------------------------------------

    Protected ReadOnly Property WfProjectID() As String
        Get
            WfProjectID = Request.QueryString("WfProjectID")
        End Get
    End Property
    
    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
	End Sub
'=============================================================

End Class
End Namespace