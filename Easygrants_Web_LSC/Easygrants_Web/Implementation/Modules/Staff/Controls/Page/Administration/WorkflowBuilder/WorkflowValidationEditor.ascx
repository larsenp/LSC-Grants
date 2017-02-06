<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTask' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Forms</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			<span runat='server' id='spnFormsList'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' align="center">
			<span runat='server' id='spnClose'></span>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
				<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='3' Operator='NotEqual'>
					<RelatedProperty PropertyKey='StandardForms' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='4' Operator='NotEqual'>
					<RelatedProperty PropertyKey='StandardForms' />
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlNextTask'
						Container='spnNextTask'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFormsvList'
						Container='spnFormsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskModuleConfigNavElement'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Order' Width='5%'>
							<Sortable>
								<Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StandardForms.Name' ColumnHeader='Form' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='StandardForms' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StandardForms.Description' ColumnHeader='Form Description' Width='55%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='StandardForms' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnValidation'
								Type='cButton'
								Image='Validation'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowValidationFormEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
										<Argument Type='DataObject' TypeKey='WfTaskModuleConfigNavElementID' AttributeName='WfTaskModuleConfigNavElementID' BaseValue='WfTaskModuleConfigNavElementID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowValidation'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>