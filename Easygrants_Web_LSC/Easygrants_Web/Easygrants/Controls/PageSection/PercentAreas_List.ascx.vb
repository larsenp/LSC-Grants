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

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPercentAreas_List
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================
	
	protected ctlPercentage As cMoneyTextBox
	protected ctlPercentAreas as cLabel
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
   
        ctlPercentage = CType(FindControl("ctlPercentage"), cMoneyTextBox)
		ctlPercentAreas = CType(FindControl("ctlPercentAreas"), cLabel)
		
		ctlPercentage.RegExErrorMessage = "You must only enter digits for " + ctlPercentAreas.Value + " percent area."
		ctlPercentage.DecimalErrorMessage = "You cannot enter decimals for " + ctlPercentAreas.Value + " percent area."
		ctlPercentage.CommaErrorMessage = "You cannot enter commas for " + ctlPercentAreas.Value + " percent area."
 
	End Sub
	
'=============================================================

End Class
End Namespace
