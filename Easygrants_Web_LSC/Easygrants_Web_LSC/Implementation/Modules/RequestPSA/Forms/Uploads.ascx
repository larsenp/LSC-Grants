<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>

<div width='100%' class="SeparatorHdg">
	Instructions
</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td><p>All applicants are required to upload a Draft Subgrant Agreement and other required documents listed below.  <!--As in past years, recipients are encouraged to use the a Subgrant Agreement Form (Form A) which is provided below and available on LSC’s Recipient Information Network.  If the Subgrant Agreement Form provided by LSC is not used, the proposed agreement should include, at a minimum, the substance of the provisions of that form.  --></p>
	<!-- <p>All applicants seeking to subgrant LSC Field Grants (i.e., Basic Field, Native American, and Migrant funds) are also required to respond to the inquiries in Form B (for new subgrants) or Form C (for renewal subgrants).  As also explained on the form, applicants are asked to convert the completed document to PDF and to upload it here.  The Microsoft Word versions of these forms are available below and on LSC’s Recipient Information Network.</p> -->
    </td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
