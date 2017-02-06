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
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cProjectInfo
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================
        Protected ctlDollarRequest As cTextBox
        Protected CtlSubjectArea As cDropDown
        Protected CtlOther As cTextBox
        Protected CtlResearchAreas As cDoubleListBox2
        Protected ctlResearchOther As cTextBox
'=============================================================
        '-----------------------------------------------------
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            ctlDollarRequest = CType(Me.FindControl("ctlDollarRequest"), cTextBox)
        End Sub
'-----------------------------------------------------
        Public Overrides Sub CoreCtl_SetValues()
            MyBase.CoreCtl_SetValues()
            ctlDollarRequest.Value = CType(CType(Me.DataObjectCollection("GranteeProjectInfo"), cDataObjectList)(0).GetPropertyDouble("DollarRequest"), Long).ToString
        End Sub
'-----------------------------------------------------  
        Public Sub ValidatevalSubjectArea(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            CtlSubjectArea = CType(Me.FindControl("CtlSubjectArea"), cDropDown)
            CtlOther = CType(Me.FindControl("CtlOther"), cTextBox)

            CtlResearchAreas = CType(Me.FindControl("CtlResearchAreas"), cDoubleListBox2)
            ctlResearchOther = CType(Me.FindControl("ctlResearchOther"), cTextBox)

            If CtlSubjectArea.SelectedText.ToLower = "other" Then
                If CtlOther.Value.Trim = "" Then
                    aArgs.IsValid = False
                End If
            Else
                CtlOther.Value = ""
                aArgs.IsValid = True
            End If
        End Sub
        Public Sub ValidatevalResearchAreas(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            CtlResearchAreas = CType(Me.FindControl("CtlResearchAreas"), cDoubleListBox2)
            ctlResearchOther = CType(Me.FindControl("ctlResearchOther"), cTextBox)
            Dim aValueList As String = CtlResearchAreas.SelectedValueList()
            Dim aSplitCount As String() = aValueList.Split(",")
            If Array.IndexOf(aSplitCount, "13") < 0 Then

            Else
                If ctlResearchOther.Value.Trim = "" Then
                    aArgs.IsValid = False
                Else
                    ctlResearchOther.Value = ""
                    aArgs.IsValid = True
                End If
            End If
        End Sub
        '-----------------------------------------------------

End Class
End Namespace
