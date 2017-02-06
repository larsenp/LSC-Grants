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
Imports System.Text

Namespace Implementation.Modules.Staff.Controls.PageSection
Public MustInherit Class cAppInfo
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Protected ctlPerson As cDropDown
	Protected ctlConflict as cDropDown
	Protected ctlCommittee as cDropDown
    Protected spnName As HtmlGenericControl
    Protected spnInst as HtmlGenericControl
    Protected trInst as HtmlTableRow
    Protected tdInst as HtmlTableCell
    protected valReviewer as CustomValidator
    Protected spnCommitteeLabel as HtmlGenericControl
    
    Protected spnNameNoConflict as HtmlGenericControl
    Protected spnInstNoConflict as HtmlGenericControl
    Protected spnCmtNoConflict as HtmlGenericControl
    Protected spnCmt as HtmlGenericControl
    
'=============================================================

	Public ReadOnly Property ReviewStageID() As String
		Get
            If Not Request.QueryString("ReviewStageID") Is Nothing Then
                Return Request.QueryString("ReviewStageID")
            Else
                Return ""
            End If
		End Get
	End Property
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		'dim aOrganizationDO as cDataObject
		'dim aOrganizationID as String
		'dim aOrganizationDOList as cDataObjectList
		'dim aCommitteeID as Integer
		
		dim aReviewCommitteeDO as cDataObject
		ctlCommittee = CType(me.FindControl("ctlCommittee"), cDropDown)
		
		'if No conflict record exists
		if (me.Request.QueryString("CommitteeID") = "-1" Or me.Request.QueryString("CommitteeID") = "" And _
			(me.Request.QueryString("NoConflict") = "True" Or me.Request.QueryString("NoConflict") = "")) Or _
			me.Request.QueryString("CommitteeID") <> "" And (me.Request.QueryString("NoConflict") = "True" Or _
			me.Request.QueryString("NoConflict") = "") then
				spnName.Visible = False
				spnInst.Visible = False
				spnCmt.Visible = False
				spnNameNoConflict.Visible = True	
				spnInstNoConflict.Visible = True
				if request.QueryString("CommitteeID") <> "" And me.Request.QueryString("NoConflict") = "True" then
					spnCmtNoConflict.Visible = True
					aReviewCommitteeDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReviewCommittee", me.Request.QueryString("CommitteeID"))
					spnCmtNoConflict.InnerHtml = aReviewCommitteeDO.GetPropertyString("ReviewCommitteeDescription")
				end if
		end if
	
		'if conflict record exists
		if me.Request.QueryString("ReviewCycleConflictID") = Nothing then
			if me.Request.QueryString("ReviewCycleConflictID") <> "0" And me.Request.QueryString("CommitteeID") <> "-1" then
				spnNameNoConflict.Visible = False	
				spnInstNoConflict.Visible = False
				spnCmtNoConflict.Visible = False
				spnName.Visible = True
				spnInst.Visible = True
				spnCmt.Visible = True
			end if
		end if
		
		if me.Request.QueryString("ReviewCycleConflictID") <> "0" And me.Request.QueryString("RevPersonID") <> "-1"
			spnNameNoConflict.Visible = False	
			spnInstNoConflict.Visible = False
			spnCmtNoConflict.Visible = False
			spnName.Visible = True
			spnInst.Visible = True
			spnCmt.Visible = True
		end if
		
		if me.Request.QueryString("NoConflict") <> Nothing  then
			if me.Request.QueryString("ReviewCycleConflictID") = Nothing And me.Request.QueryString("CommitteeID") <> "-1" then
				spnNameNoConflict.Visible = False	
				spnInstNoConflict.Visible = False
				spnCmtNoConflict.Visible = False
				spnName.Visible = True
				spnInst.Visible = True
				spnCmt.Visible = True
			end if
		end if	
	End Sub
	
'=============================================================

End Class
End Namespace
