<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:600px">
	<div class="SeparatorHdg">
		Interim Forms
	</div>
	<p>
		All Interim Form information is expected to be the best available at the time of submission, but LSC realizes it is not final data.  For Case Services, there is no Interim Self-Inspection process, so we realize that some cases reported as of June 30 may ultimately prove not to meet the criteria for LSC-reportable cases; and, conversely, LSC also realizes that not all cases eligible for closure by June 30 will have been processed in time to be included in this report.  For Revenue and Expenses, we are aware that accounting adjustments made later in the year may change data submitted as of June 30. 
	</p>
	<div class="SeparatorHdg">
		Form D-2: Interim Expenses
	</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoaderD2" CtlID='ctlFormD2' 
		Src='Implementation/Modules/GAR/ProjectedExpenses/Controls/PageSection/FormD2_Instruct.ascx'
		runat='server' />
	<br />
	<div class="SeparatorHdg">
		Form D-4: Interim Support and Revenue
	</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoaderD4" CtlID='ctlFormD4' 
		Src='Implementation/Modules/GAR/ProjectedRevenue/Controls/Page/FormD4_Instruct.ascx'
		runat='server' />
	<br />
	<div class="SeparatorHdg">
		Form E-2: Interim Staffing Recipient
	</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoaderE2" CtlID='ctlFormE2' 
		Src='Implementation/Modules/GAR/ProjectedStaffing/Controls/PageSection/FormE2a_Instruct.ascx'
		runat='server' />
	<br />
	<div class="SeparatorHdg">
		Form G-1: Interim Case Services
	</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoaderG1" CtlID='ctlFormG1' 
		Src='Implementation/Modules/GAR/ProjectedCaseServ/Controls/PageSection/FormG1_Instruct.ascx'
		runat='server' />
	<br />
	<div class="SeparatorHdg">
		Form G-1(d): Interim Case Services (PAI)
	</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoaderG1d" CtlID='ctlFormG1d'
		Src='Implementation/Modules/GAR/ProjectedCaseServ/Controls/PageSection/FormG1d_Instruct.ascx'
		runat='server' />
	<br />
</div>


<span id='spnConfigXML' visible='false' runat='server'>
  <ModuleSection>
  
 </ModuleSection>
</span>
