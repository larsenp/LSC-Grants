<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Nominator Tasks</b></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			Listed below are the nomination tasks assigned to this contact. Click the <b>Add</b> button to 
			add a Nomination task. To edit a nomination task, select the Task - Edit option from the 
			Action list and click the <b>Go</b> button. To delete a nomination task, select the Task - Delete 
			option from the Action list and click the <b>Go</b> button.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNominationList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='NominationCriteriaList' DataObjectDefinitionKey='NominationCriteria'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='NominatorPersonID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='ModulePageContent'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='NominatorInfoEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='NominationCriteriaID=0' Value=''/>
									<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>									
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlNominationList'
						Container='spnNominationList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='NominationCriteria'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfProject.WfProjectName' ColumnHeader='Project Name' />
						<DisplayProperty PropertyKey='NominatorOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' />
						<!--
						<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionName' ColumnHeader='Competition' />
						-->
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='NominatorInfoEditor'/>
										<Argument Type='DataObject' TypeKey='NominationCriteriaID' AttributeName='NominationCriteriaID' BaseValue='NominationCriteriaID='/>
										<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>									
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Separator>&nbsp;&nbsp;</Separator>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='NominationCriteriaID' AttributeName='NominationCriteriaID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->