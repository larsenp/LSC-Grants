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
    <td><p>Utilize the <strong>Uploads</strong> Uploads page to submit the fully executed subgrant agreement and any other documentation which supports the request for approval.  The subgrant agreement and any supporting documentation must be submitted in pdf format.  Approval requests which are submitted with a subgrant agreement that has not yet been executed or which is not properly executed will be denied.</p>
    </td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
