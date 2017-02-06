<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<table width='100%'>
	<tr>
		<td>
			 <span id='spnValidationPageContent' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<Core:cUserCtlLoader CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx'
				Properties='ForceGen=False' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
            <Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	            Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	            runat='server'/>
		</td>
	</tr>
</table>
<table width='100%'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGeneratePDF' Src='Easygrants/Controls/PageSection/GeneratePDF.ascx'
				runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<table width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Validation Status
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