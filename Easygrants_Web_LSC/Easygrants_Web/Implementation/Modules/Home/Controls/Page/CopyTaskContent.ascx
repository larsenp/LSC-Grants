	<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cCopyTaskContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />

<br />
<p>From this page, you can create a copy of a task. Select the Funding Oppurtunity that you would like to apply the copied task to.</p>
<table cellpadding='2' cellspacing='0' runat='server' width='100%'> 
<tr><td class='SeparatorHdg' colspan='2'>Copy From</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td width='15%'><b>Program</b></td><td><span id='spnCopyFromProgram' runat="server"></span></td></tr>
<tr><td><b>Funding Oppurtunity</b></td><td><span id='spnCopyFromFO' runat="server"></span></td></tr>
<tr><td><b>Funding Cycle</b></td><td><span id='spnCopyFromFC' runat="server"></span></td></tr>
<tr><td><b>Task</b></td><td><span id='spnCopyFromTask' runat="server"></span></td></tr>
<tr><td>&nbsp;</td></tr>

<tr><td class='SeparatorHdg' colspan='2'>Copy To</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td width='15%'><b><%=GetLabel("ProgramName")%></b>&nbsp;<%=kDenoteRequiredField%></td><td><span id='spnCopyToProgram' runat="server"></span></td></tr>
<tr id='trCopyToFO' visible='false'><td><b><%=GetLabel("FundingOpportunity")%></b>&nbsp;<%=kDenoteRequiredField%></td><td><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlCopyToFO' Type='cDropDown'  runat='server' Properties='ValidationText=Funding Oppurtunity is required.'/></td></tr>
<tr id='trCopyToFC' visible='false'><td><b><%=GetLabel("FundingCycleName")%></b>&nbsp;<%=kDenoteRequiredField%></td><td><Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlCopyToFC' Type='cDropDown'  runat='server' Properties='ValidationText=Funding Cycle is required.'/></td></tr>
<tr id='trCopyToTask' visible='false'><td><b>Task</b></td><td><span id='spnCopyToTask' runat="server"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align="center" colspan='2'><span id="spnSave" runat="server"></span>&nbsp;&nbsp;&nbsp;<span id="spnClose" runat="server"></span></td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
			<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.WfProgram.ProgramName'>
					<Control ID='spnCopyFromProgram' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionName'>
					<Control ID='spnCopyFromFO' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfProjectName'>
					<Control ID='spnCopyFromFC' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnCopyFromTask' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCopyToProgram' Container='spnCopyToProgram' Type='cDropDown' DataObjectDefinitionKey='Program' StoredValue='ProgramID' PostBack='True' DisplayValue='ProgramDisplayName' DisplayText='Select' RequiredField='True' ErrorMessage='~~ProgramName~~ is required.'>
						<Action PostBack='True' AutoSave='False' Object='DataPresenter' Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Program' />
								<Argument Type='Control' TypeKey='ctlCopyToProgram' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
						<Control ID='btnSave'
							Container='spnSave'
							Type='cButton'
							Image='Save'
							Confirmation='Are you sure you want to copy this task? The action cannot be undone.'>
							<Action
								AutoSave='True'
								PostBack='True'
								Object='DataPresenter'
								Method='CopyToNewTask'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
									<Argument Type='Control' TypeKey = 'ctlCopyToFC' ControlPropertyKey='SelectedValue' Value='' />
								</Parameters>							
							</Action>
						</Control>	
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Caption='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
