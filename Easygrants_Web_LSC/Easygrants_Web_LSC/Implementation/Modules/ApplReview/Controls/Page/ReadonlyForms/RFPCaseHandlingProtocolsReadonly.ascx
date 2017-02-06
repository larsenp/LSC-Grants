<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Casehandling Protocols</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Three, Criterion 1 - <i>Legal representation: </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			 <p>Use the web form below to indicate the Applicant-wide written protocols adopted to ensure that cases are being handled effectively.  Complete this form by selecting the appropriate choice.   Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative.</p>
             <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
		<td colspan="4" class="SeparatorHdg" >Casehandling Protocols Chart</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td width='40%' >
			<b>1. Applicant-wide or office systems for calendaring and tickling dates <%=kDenoteRequiredField%></b>
		</td>
		<td width='30%'><span runat="server" id='spnchp1' /></td>
		<td width='25%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>2. Case file coverage for vacation and other case handler absences <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnchp2' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>3. File maintenance <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnchp3' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>4. Timely case closings <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnchp4' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>5. Capturing case outcome(s) <%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnchp5' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>6. Case handling standards <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnchp6' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
</table>
<br />
<br />


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
		
	    <DataObject Key='LSCRFPCASEHANDLING' DataObjectDefinitionKey='LSCRFPCASEHANDLING' >
           <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CaseHandling1' Format='YesNo'>
					<Control ID='spnchp1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseHandling2' Format='YesNo'>
					<Control ID='spnchp2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseHandling3' Format='YesNo'>
					<Control ID='spnchp3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseHandling4' Format='YesNo'>
					<Control ID='spnchp4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseHandling5' Format='YesNo'>
					<Control ID='spnchp5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseHandling6' Format='YesNo'>
					<Control ID='spnchp6'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>