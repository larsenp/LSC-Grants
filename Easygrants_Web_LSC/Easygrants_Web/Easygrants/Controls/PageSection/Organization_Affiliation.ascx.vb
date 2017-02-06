Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Namespace Easygrants_Web.Controls.PageSection
Public Class cOrganization_Affiliation

    Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl



    Public Sub DeleteEntityAffil(Byval aMainEntityAffiliationID as String, Byval aAffilEntityAffiliationID as String)
		'Use the values of the unique identifiers from the EntityAffiliationMainAndAffil 
		'data object to delete the two corresponding EntityAffiliation data objects.
		WebSession.DataObjectFactory.DeleteData("EntityAffiliation", aMainEntityAffiliationID)
            WebSession.DataObjectFactory.DeleteData("EntityAffiliation", aAffilEntityAffiliationID)
            CorePage.Redirect()
    end sub
    
End Class
end Namespace
