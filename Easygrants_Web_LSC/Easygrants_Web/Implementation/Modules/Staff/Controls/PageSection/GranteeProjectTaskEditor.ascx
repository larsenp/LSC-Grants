<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGranteeProjectTaskEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grantee Project Outcome Management</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'
					Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProjectOutcomes' DataObjectDefinitionKey='GranteeProjectOutcomes'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'
					Value='' bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectOutcomes'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='Outcome.WfTaskOutcome' ColumnHeader='Outcome'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='TaskAssignEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOutcomesID' AttributeName='GranteeProjectOutcomesID' BaseValue='GranteeProjectOutcomesID='/>
										<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<!-- Cancel button -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
