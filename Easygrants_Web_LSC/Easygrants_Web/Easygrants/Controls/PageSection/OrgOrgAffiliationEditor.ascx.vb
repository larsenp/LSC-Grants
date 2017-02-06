Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cOrgOrgAffiliationEditor
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
		Protected ctlOrg As cPopUpSelectorLauncher2
		  
		  
		Protected Overrides Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
			MyBase.DataPresenter_SetDataObjectValuesFromCtls(aDataObjectList, aDataObjectElement)
			If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "EntityAffiliationAffil" Then
				Dim aEntityOrg As cDataObject
				aEntityOrg = CType(DataObjectCollection("EntityAffiliationAffil"), cDataObjectList)(0)
				aEntityOrg("EntityID") = ctlOrg.ObjID
			End If
		End Sub

    End Class
End Namespace

