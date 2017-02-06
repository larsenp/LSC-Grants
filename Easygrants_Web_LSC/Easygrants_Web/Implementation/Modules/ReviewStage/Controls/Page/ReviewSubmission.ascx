<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>

<table width='100%'>
	<tr>
		<td>
			 <span id='spnValidationPageContent' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmissionButton' Src='Implementation/Modules/ReviewStage/Controls/PageSection/Submission_Button.ascx'
				Properties='ForceGen=False' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Submission Status
		</td>
	</tr>
	<tr>
		<td>
			<Core:cValidate id='ctlValidate' ValidationContentSpanID='spnValidationPageContent' DisplayFormat='Detail' runat='server'/>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	</ModuleSection>
</span>