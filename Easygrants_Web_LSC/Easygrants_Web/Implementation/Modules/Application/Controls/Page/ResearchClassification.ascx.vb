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

Namespace Implementation.Modules.Application.Controls.Page
    Public MustInherit Class cResearchClassification
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '=============================================================

        Protected mSvButton As String
        Protected trSaveAndCancel As HtmlTableRow
        Protected ctlPopulation As cCheckBox
        Protected WithEvents valProject As System.Web.UI.WebControls.CustomValidator
        ' Protected WithEvents spnPageContent As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnResearchClassification As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnPopulation As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnTherapy As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnBiomedical As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnClinical As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnPopulationHealth As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave_and_Continue As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected ctlTherapy As cCheckBox

        '=============================================================

        Public Property SvButton() As String
            Get
                Return mSvButton
            End Get
            Set(ByVal Value As String)
                mSvButton = Value
            End Set
        End Property

        '=============================================================

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)


        End Sub

        '-----------------------------------------------------

        Public Sub ValidateInterest(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            ctlPopulation = CType(Me.FindControl("ctlPopulation"), cCheckBox)
            ctlTherapy = CType(Me.FindControl("ctlTherapy"), cCheckBox)

            If ctlPopulation.Value = False And ctlTherapy.Value = False Then
                aArgs.IsValid = False
            Else
                aArgs.IsValid = True
            End If
        End Sub

        '=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class
End Namespace
