<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<br />
<table width='100%' border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Actual Forms</td>
   </tr>
 </table>
 <br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form D-1: Actual Expenses</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlForm3' 
	Src='Implementation/Modules/GAR/ActualExpenses/Controls/PageSection/FormD1_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form D-3: Actual Support and Revenue</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader7" CtlID='ctlForm7' 
	Src='Implementation/Modules/GAR/ActualRevenue/Controls/Page/FormD3_Instruct.ascx'
	runat='server' />
<br />
<table width='100%' border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Office & Staffing Forms</td>
   </tr>
</table>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form E-0: Actual Office Information</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader4" CtlID='ctlForm4' 
	Src='Implementation/Modules/GAR/ActualOfficeInfo/Controls/PageSection/FormE0_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form E-1(a),(b),(c): Actual Staffing - Main Office, Branch Office, Subrecipient Office</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader8" CtlID='ctlForm7' 
	Src='Implementation/Modules/GAR/ActualStaffing/Controls/PageSection/FormE1_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-2: Additional Information Relating to Cases</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoaderG2" CtlID='ctlForm10' 
	Src='Implementation/Modules/GAR/AdditionalInformation/Controls/PageSection/FormG2_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-3, G-3(d): Actual Case Services (Staff) & (PAI)</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlForm1' 
	Src='Implementation/Modules/GAR/ActualCaseServ/Controls/PageSection/FormG_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-4: Client Age, Ethnicity, Gender, and Veteran Status</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlForm8' 
	Src='Implementation/Modules/GAR/ClientAgeEthGen/Controls/Page/FormG4_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-5: Actual Open Cases (Staff)</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader5" CtlID='ctlForm5' 
	Src='Implementation/Modules/GAR/ActualOpenCases/Controls/PageSection/FormG5_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-5(d): Actual Open Cases (PAI)</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader6" CtlID='ctlForm6' 
	Src='Implementation/Modules/GAR/ActualOpenCases/Controls/PageSection/FormG5d_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-6: Self-Inspection Certification</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader23" CtlID='ctlForm10' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Certification_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-6: Self-Inspection Summary</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader24" CtlID='ctlForm10' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Summary_Instruct.ascx'
	runat='server' />
<br />
<%--<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form G-6: Self-Inspection Unreported Non-LSC Case</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader25" CtlID='ctlForm10' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Unreported_Instruct.ascx'
	runat='server' />
<br />--%>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form J-1: Components of Actual PAI</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader9" CtlID='ctlForm9' 
	Src='Implementation/Modules/GAR/ComponentsPAI/Controls/PageSection/FormJ1_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form L: Other Services Narrative </td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader26" CtlID='ctlForm20' 
	Src='Implementation/Modules/GAR/ServiceNarrative/Controls/Page/ServNarrative_Instruct.ascx'
	runat='server' />
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td class="SeparatorHdg">Form M: Community Legal Education</td>
   </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader11" CtlID='ctlForm10' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormM_Instruct.ascx'
	runat='server' />

<br />





<!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
     <ModuleSection>
     
    </ModuleSection>
  </span>














