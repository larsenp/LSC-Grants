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

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantInfo
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected spnPayment As HtmlGenericControl

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)

        'dim aObj as cDataObject
        'dim aSum = 0
        'dim aObjList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("Payment", _
        '	"GranteeProjectID", request.QueryString("GranteeProjectID"))

        'for each aObj in aObjList
        '	aSum += aObj.GetPropertyInt("RequestedAmount", 0
        'next
        'spnPayment.InnerHtml = String.Format("{0:$#,##0.##}", aSum)
    End Sub

'=============================================================

End Class
End Namespace