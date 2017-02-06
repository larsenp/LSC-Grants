<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />


<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Continuity of Operations Planning</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 4, Criterion 3 - <i>Overall management and administration</i></b> </td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td colspan="4" >&nbsp;</td>
 </tr>
 <tr>
	<td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>
<p>Use the web form below to indicate whether the Applicant has a written continuity of operations plan in the event of an emergency or disaster and, if so, whether the plan incorporates the items identified below. Complete this form by selecting the appropriate choice. Each inquiry in the form must be answered before the form can be submitted. Click the save button below once the form is completed and return to the proposal narrative.</p></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
 </tr>
 <tr><td colspan="4" >&nbsp;</td> </tr>
 <tr>
	<td><p><strong><u>Do not paste this form into the proposal narrative</u></strong>. Email questions pertaining to this form to the competition service desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a></p></td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
		<td colspan="4" class="SeparatorHdg" >Continuity of Operations Planning</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
    <tr>
        <td width='2%'>&nbsp;</td>
		<td width='63%' >
			<b>1. Does Applicant have a written continuity of operations plan <%=kDenoteRequiredField%></b>
		</td>
		<td width='30%' align="left"><span runat="server" id='spnHasWrittenPlan' /></td>
		<td width='5%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td width='60%' >
			<b>2. Does the continuity of operations plan address:</b>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<br  />
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td width='60%' >
			<b>a. ensuring the safety of staff <%=kDenoteRequiredField%></b>
		</td>
		<td width='30%'><span runat="server" id='spnIsSafety' /></td>
		<td width='5%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>b. continuing client services.<%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnIsContinuing' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>c. preserving files, equipment and computer data bases <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnIsPreservingData' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>d. continuing communication among program staff, management, the board, other providers and LSC <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnIsContinuingCommunication' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>e. relocation of Applicants work site(s), if necessary.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnIsRelocation' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>f. coordinating with state/local emergency preparedness entities.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnIsCoordinating' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td width='2%'>&nbsp;</td>
		<td width='63%' >
			<b>3. Is the plan reviewed annually? <%=kDenoteRequiredField%></b>
		</td>
		<td width='30%' align="left"><span runat="server" id='spnIsAnnuallyReviewed' /></td>
		<td width='5%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td width='60%' >
			<b>4. Is there assigned staff responsible for regular review and updating of the plan?<%=kDenoteRequiredField%></b>
		</td>
		<td width='30%' align="left"><span runat="server" id='spnAssignedStaffReview' /></td>
		<td width='5%'></td>
	</tr>
</table>
<br />



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	     <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='LscContinuityOperationsPlanning' DataObjectDefinitionKey='LscContinuityOperationsPlanning' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='HasWrittenPlan' Format='YesNo'>
					<Control ID='spnHasWrittenPlan'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsSafety' Format='YesNo'>
					<Control ID='spnIsSafety'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsContinuing' Format='YesNo'>
					<Control ID='spnIsContinuing'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPreservingData' Format='YesNo'>
					<Control ID='spnIsPreservingData'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsContinuingCommunication' Format='YesNo'>
					<Control ID='spnIsContinuingCommunication'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsRelocation' Format='YesNo'>
					<Control ID='spnIsRelocation'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsCoordinating' Format='YesNo'>
					<Control ID='spnIsCoordinating'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsAnnuallyReviewed' Format='YesNo'>
					<Control ID='spnIsAnnuallyReviewed'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AssignedStaffReview' Format='YesNo'>
					<Control ID='spnAssignedStaffReview'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
			
			
	</ModuleSection>
</span>