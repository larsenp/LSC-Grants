<%@ Control Language="vb" AutoEventWireup="true" Codebehind="FundingOppCycleInfo.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cFundingOppCycleInfo" EnableViewState="true" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Funding Opportunity - Cycle Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%>:</b>&nbsp;
		<span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%>:</b>&nbsp;
		<span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%>:</b>&nbsp;
		<span id='spnProject' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='lblProgram'
						Container='spnProgram'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='lblCompetition'
						Container='spnCompetition'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='lblProject'
						Container='spnProject'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>