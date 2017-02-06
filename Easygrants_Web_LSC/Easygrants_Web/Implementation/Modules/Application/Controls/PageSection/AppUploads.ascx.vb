Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports System.Xml
Imports Core.Web.User
Imports Easygrants_Web.Controls
Imports Easygrants_Web.Controls.PageSection
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.Web.SvrCtls
Namespace Implementation.Modules.Application.Controls.PageSection
    Public MustInherit Class cAppUploads

        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected ctlUpload As cUpload
        Protected mPageKey As String = "AdditionalUploads"
        '============================================================= 

        Public Property PageKey() As String
            Get
                Return mPageKey
            End Get
            Set(ByVal Value As String)
                mPageKey = Value
            End Set
        End Property

        '=============================================================
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

        End Sub

        Public Sub Redirect()
            EventController_NavigateToModulePageKey("AdditionalUploads")
        End Sub

        '=============================================================

    End Class
End Namespace

