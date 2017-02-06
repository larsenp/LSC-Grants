Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Imports Core.Web.SvrCtls
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Modules.Review.Controls.Page
    Partial Public Class cInternalReviewResubmission
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

        Protected valResubmissionReqs As CustomValidator
        '======================================================
        Public Sub ValidateResubmissionReqs(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

            aArgs.IsValid = True
            Dim ctlResubmissionReqs As cCheckBoxList = GetControl("ctlResubmissionReqs")
            Dim aCBValues As String = ctlResubmissionReqs.RetrieveRows
            If aCBValues Is Nothing Then
                valResubmissionReqs.ErrorMessage = "You must select at least one requirement for resubmission."
                aArgs.IsValid = False
                Exit Sub
            Else
                aArgs.IsValid = True
            End If
        End Sub
        '======================================================

    End Class

End Namespace