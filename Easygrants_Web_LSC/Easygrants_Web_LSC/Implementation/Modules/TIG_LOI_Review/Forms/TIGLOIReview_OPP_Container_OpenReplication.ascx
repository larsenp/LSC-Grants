<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

  <Core:cUserCtlLoader 
		ID="CUserCtlLoader1" 
		CtlID='ctlScoresandCritiques' 
		Src='Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIReview_OPP_List.ascx' 
		Properties='ReportOuputDefinitionTypeID=1&EditorPageKeyName=ReviewOPPOpenEditor'
		runat='server' />

<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>

	</ModuleSection>
</span>
