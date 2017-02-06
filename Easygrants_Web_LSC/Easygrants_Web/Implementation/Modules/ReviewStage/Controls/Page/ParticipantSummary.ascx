<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cParticipantSummary" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register tagprefix='Core' tagname='cButton' src='../../../../../Core/Controls/Base/CSSButton.ascx' %>
<br>
<span id='spnCloseWindow' runat="server" visible="false">
	<SCRIPT language="javascript">
		window.close();
	</SCRIPT>
</span>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Project Information</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='60%' runat='server'>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b></td>
		<td><span id='spnProgram' runat='server' /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td><span id='spnFundingOpportunity' runat='server' /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td><span id='spnFundingCycle' runat='server' /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("GrantId")%></b></td>
		<td><span id='spnGrantId' runat='server' /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("Organization")%></b></td>
		<td><span id='spnOrganization' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Primary Contact/PI</b></td>
		<td><span id='spnApplicant' runat='server' /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("ProjectTitle")%></b></td>
		<td><span id='spnProjectTitle' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Subject Area</b></td>
		<td><span id='spnSubjectArea' runat='server' /></td>
	</tr>
	<tr>
		<td valign='top'><b>Focus Area(s)</b></td>
		<td><span id='spnFocusAreas' runat='server' /></td>
	</tr>
	<tr>
		<td valign='top'><b>Other Grant Project Contacts</b></td>
		<td><span id='spnOtherGrantProjectContacts' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2' align="center">
			<span id='spnClose' runat='server' />
		</td>
	</tr>
</table>
<br>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' >
					<Control ID='spnApplicant'
				        Type='HtmlGenericControl'>
			        </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
					<Control ID='spnOrganization'
				        Type='HtmlGenericControl'>
			        </Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='GrantTitle'>
			        <Control ID='spnProjectTitle'
				        Type='HtmlGenericControl'>
			        </Control>
		        </DisplayProperty>										
				<DisplayProperty PropertyKey='GranteeProjectID'>
			        <Control ID='spnGrantId'
				        Type='HtmlGenericControl'>
			        </Control>
		        </DisplayProperty>
		        <DisplayProperty PropertyKey='WfProject.WfProjectName'>
			        <Control ID='spnFundingCycle'
				        Type='HtmlGenericControl'>
			        </Control>
		        </DisplayProperty>
		        <DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
			        <Control ID='spnFundingOpportunity'
				        Type='HtmlGenericControl'>
			        </Control>
			    </DisplayProperty>
		        <DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
			        <Control ID='spnProgram'
				        Type='HtmlGenericControl'>
			        </Control>
		        </DisplayProperty>
		        <DisplayProperty PropertyKey='GrantsGranteeProjectResearchCategories.ResearchCategory.Description'>
			        <Control ID='spnSubjectArea'
				        Type='HtmlGenericControl'>
			        </Control>
		        </DisplayProperty>
		        <DisplayProperty PropertyKey=''>
			        <Control ID='ctlClose'
						Container='spnClose'
						Caption='Close'
				        Type='cButton'>
				        <Action
							PostBack='True'
							Object='DataPresenter'
							Method='btnClose_Clicked'>
							<Parameters></Parameters>
						</Action>
			        </Control>
		        </DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->
		<DataObject Key='GranteeProjectResearchArea' DataObjectDefinitionKey='GranteeProjectResearchArea'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='ResearchArea'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFocusAreas'
						Container='spnFocusAreas'
						ShowColumnHeaderRow='False'
						HideBlankRow='True'
						Type='cDataListCtl'>
						    <DisplayProperty PropertyKey='ResearchArea.Description'  ColumnHeader=' '  Width='50%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
				    <RelatedProperty PropertyKey='OtherStaff'/>
			   </Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='OtherStaff'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOtherGrantProjectContacts'
						Container='spnOtherGrantProjectContacts'
						ShowColumnHeaderRow='False'
						HideBlankRow='True'
						Type='cDataListCtl'>
						    <DisplayProperty PropertyKey='OtherStaff.LastNameFirstName'  ColumnHeader=' '  Width='50%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>