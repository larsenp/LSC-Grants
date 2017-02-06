<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGranteeProjectOutcomesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grantee Project Manager</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" align="right" width="120"><b>Project Info</b></td>
		<td></td>
	</tr>
	<tr>
		<td><b>Name:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlProjectName' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Person:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlName' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" align="right" width="120"><b>Task Info</b></td>
		<td></td>
	</tr>
	<tr>
		<td><b>Task:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlWfTask' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Outcome:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOutcome' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Complete:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlComplete' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td	valign="top" align="right" width="120"><b>Assignments List</b></td>
		<td></td>
	</tr>
	
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>

</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>	
		</td>
</tr>
</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='ctlProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='ctlName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskDOC' DataObjectDefinitionKey='WfTask'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID'
					PropertyKey='WfTaskID' Value='' bool=''/>
			</Filters>
		</DataObject>
		
		<!-- Task Info -->
		<DataObject Key='GranteeProjectOutcomes' DataObjectDefinitionKey='GranteeProjectOutcomes' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectOutcomesID'
					PropertyKey='GranteeProjectOutcomesID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlWfTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='OutcomeID'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayNone='True'>
						<Filters>
							<!--
							<Argument PropertyKey='WfTaskTypeID' Value='1'>
								<RelatedProperty PropertyKey='WfTask'/>
							</Argument>
							-->
							<Argument Type='DataObjectCollection' TypeKey='WfTaskDOC' 
								DataObjectPropertyKey='WfParentTaskID' PropertyKey='WfParentTaskID' Value=''>
									<RelatedProperty PropertyKey='WfTask'/>
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' 
								DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' Value=''>
								<RelatedProperty PropertyKey='WfTask.WfProjectTasks'>
									<JoinFilter>
										<Argument Type='DataObjectCollection' TypeKey='WfTaskDOC' 
											DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
									</JoinFilter>
								</RelatedProperty>
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Complete'>
					<Control ID='ctlComplete'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	

			</DisplayProperties>
		</DataObject>
		
		<!-- Assignments List -->
		<DataObject Key='WfTAList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value='' bool=''/>
				<Argument Type='QueryString' TypeKey='WfTaskID'
					PropertyKey='WfTaskID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'/>
						<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole' ColumnHeader='Role'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
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
