<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<h1>Form E-0: Actual Office Information</h1><br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlE0a' 
	Src='Implementation/Modules/GAR/ActualOfficeInfo/Controls/Page/Form_E0aReadOnly.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlE0b' 
	Src='Implementation/Modules/GAR/ActualOfficeInfo/Controls/Page/Form_E0bReadOnly.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlE0c' 
	Src='Implementation/Modules/GAR/ActualOfficeInfo/Controls/Page/Form_E0cReadOnly.ascx'
	runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
