<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>

<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Board Policies and Practices</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Four, Criterion 1 - <i>Board governance: </i></b> </td>
	</tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			<p>Use the web form below to describe governing board policies and practices.  Complete this form by selecting the appropriate choice for each inquiry.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative. </p>
            <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
		<td colspan="4" class="SeparatorHdg" >Board Policies and Practices</td>
	</tr>
	<tr>
          <td>&nbsp;</td>
    </tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td width='50%' >
			<b>1. Does the board have a written policy or practice that deals with conflicts of interest or potential conflicts of interest? <%=kDenoteRequiredField%> </b>
		</td>
		<td width='30%'><span runat="server" id='spnBoardPolicy1' /></td>
		<td width='15%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>2. In the last twenty-four months did a quorum of board members attend each scheduled board meeting? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy2' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>3. Is there a limitation on the number of terms board members can serve on the board? <%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnBoardPolicy3' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>4. Are board members given an orientation on board responsibilities? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy4' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>5. Have board members received copies of the 2007 LSC Performance Criteria? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy5' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>6. Have board members received copies of the LSC Act and Regulations? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy6' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<%--<tr>
	    <td >&nbsp;</td>
		<td>
			<b>7. Does the board have a finance committee? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy7' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>8. Does the board have an audit committee?  <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy8' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>--%>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>7. Does the board have at least one member with expertise in accounting or auditing? <%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnBoardPolicy9' /></td>
		<td >&nbsp;</td>
	</tr>
</table>
<br />
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
	
	    <DataObject Key='LSCRFPBOARDPOLICIES' DataObjectDefinitionKey='LSCRFPBOARDPOLICIES' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
            <DisplayProperties>
	            <DisplayProperty PropertyKey='RFPBoardPolicy1' Format='YesNo'>
					<Control ID='spnBoardPolicy1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy2' Format='YesNo'>
					<Control ID='spnBoardPolicy2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy3' Format='YesNo'>
					<Control ID='spnBoardPolicy3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy4' Format='YesNo'>
					<Control ID='spnBoardPolicy4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy5' Format='YesNo'>
					<Control ID='spnBoardPolicy5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy6' Format='YesNo'>
					<Control ID='spnBoardPolicy6'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy9' Format='YesNo'>
					<Control ID='spnBoardPolicy9'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 
	</ModuleSection>
</span>