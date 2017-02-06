<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>

<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>LEP Plan and Components</h1></td>
	</tr>
     <tr>
		<td ><b>Performance Area Two, Criteria 2 and 3 - <i>Engagement with the low-income population & Access and utilization by the low-income population: </i></b> </td>
	</tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
          <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			  <p>Use the web form below to indicate whether Applicant has a written Limited English Proficiency (LEP) plan and, if so, whether the plan incorporates the items identified in the form.  Complete this form by selecting the appropriate choice.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative. </p>
              <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
		<td colspan="4" class="SeparatorHdg" >LEP Plan and Components Chart</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
    <tr>
        <td width='2%'>&nbsp;</td>
		<td width='63%' >
			<b>1. Does Applicant have a written LEP plan  <%=kDenoteRequiredField%></b>
		</td>
		<td width='30%' align="left"><span runat="server" id='spnWrittenPlan' /></td>
		<td width='5%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td width='60%' >
			<b>2. Does the LEP plan enumerate:</b>
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
			<b>a. Methods for determining the prospective client’s need for interpretation and translation services.<%=kDenoteRequiredField%></b>
		</td>
		<td width='30%'><span runat="server" id='spnLEP1' /></td>
		<td width='5%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>b. Plans for recruiting and hiring bilingual staff or for language skills training of existing staff.<%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnLEP2' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>c. Use of language translation and interpretation services when bilingual staff is not available.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnLEP3' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>d. Plans for training staff on the Applicant’s LEP policy, how to access language services, and how to work with interpreters.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnLEP4' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>e. Plans for translating all vital program documents into the languages of the LEP communities in the Applicant’s service areas.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnLEP5' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>f. Outreach strategies for dissemination of information about the availability of free interpretation and translation services to the members of the LEP client community that are seeking legal assistance.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnLEP6' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>g. Steps for continued oversight and updating of LEP policies and procedures including assigned responsibility for such oversight and updating.<%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnLEP7' /></td>
		<td >&nbsp;</td>
	</tr>
</table>




<span id='spnConfigXML' visible='false' runat='server'> 
	<ModuleSection>
	   <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
	   
        <DataObject Key='LSCRFPLEP' DataObjectDefinitionKey='LSCRFPLEP'  Updatable='False' CreateNew='False'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='WrittenLEPPlan' Format='YesNo'>
					<Control ID='spnWrittenPlan'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP1' Format='YesNo' >
					<Control ID='spnLEP1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP2' Format='YesNo'>
					<Control ID='spnLEP2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP3' Format='YesNo'>
					<Control ID='spnLEP3'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP4' Format='YesNo'>
					<Control ID='spnLEP4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP5' Format='YesNo'>
					<Control ID='spnLEP5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP6' Format='YesNo'>
					<Control ID='spnLEP6'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LEP7' Format='YesNo'>
					<Control ID='spnLEP7'
						Type='HtmlGenericControl' />
				</DisplayProperty>
        
            </DisplayProperties>
        </DataObject>
    </ModuleSection>
</span>
