<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
Use this page to modify an existing task assignment. For example, you can re-assign the task to a
different person; change the status or outcome; or override any of the default dates.  This is useful
if you want to re-open the task after it has been submitted or grant the person an extension. (See the
bottom of the page for definitions of task dates.)
<br><br>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Modify Task Assignment</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td>Funding Cycle</td>
		<td width='20'>&nbsp;</td>
		<td><span id='ctlProjectName' runat='server'/></td>
	</tr>
	<tr>
		<td>Grantee</td>
		<td width='20'>&nbsp;</td>
		<td><span id='ctlGranteeName' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>Person</td>
	<td width='10'>&nbsp;</td>
	<td>
		<!--
		<span id='spnPerson' runat='server'/>
		-->
		<Core:cUserCtlLoader CtlID='ctlPerson'
			Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
			runat='server'/>
	</td>
</tr>
<tr>
	<td>Task</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnTask' runat='server'/>
	</td>
</tr>
<tr>
	<td>Task Role</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnRole' runat='server'/>
	</td>
</tr>
<tr>
	<td>Status&nbsp;<%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnStatus' runat='server'/>
	</td>	
</tr>
<tr>
	<td>Outcome</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnOutcome' runat='server'/>
	</td>	
</tr>
<tr>
	<td>Start Date</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnStartDate' runat='server'/>&nbsp;&nbsp;&nbsp;Current default:
		<span id='spnStartDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>Open Date</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnOpenDate' runat='server'/>&nbsp;&nbsp;&nbsp;Current default:
		<span id='spnOpenDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>Due Date</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnDueDate' runat='server'/>&nbsp;&nbsp;&nbsp;Current default:
		<span id='spnDueDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>Close Date</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCloseDate' runat='server'/>&nbsp;&nbsp;&nbsp;Current default:
		<span id='spnCloseDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>End Date</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnEndDate' runat='server'/>&nbsp;&nbsp;&nbsp;Current default:
		<span id='spnEndDateCalculated' runat='server'/>
	</td>	
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<table border='1' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='2'><b>Task date definitions</b></td>
	</tr>
	<tr>
		<td>Start Date&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment first appears on a user's home page but is not an active link.</td>
	</tr>
	<tr>
		<td>Open Date&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment link becomes active.</td>
	</tr>
	<tr>
		<td>Due Date&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Due date displayed to the user assigned the task.</td>
	</tr>
	<tr>
		<td>Close Date&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment link is disabled is but remains visible on a user's home page.</td>
	</tr>
	<tr>
		<td>End Date&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment is removed from a user's home page.</td>
	</tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
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
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='TaskAssignEditor' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher'/>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole'>
					<Control ID='spnRole'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatusAbbr'
						RequiredField='True'
						ErrorMessage='Status is required.'>
						<Sort>
							<Argument PropertyKey='WfTaskStatusAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='TaskAssignEditor' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
							<Argument Type='DataObjectCollection' TypeKey='TaskAssignEditor' DataObjectPropertyKey='WfTaskRoleID' PropertyKey='WfTaskRoleID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' />	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' />
				</DisplayProperty>		
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' />
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='TaskAssignEditor' 
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='ctlProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='ctlGranteeName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='TaskAssignEditor' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StartDate' Format='M/d/yyyy'>
					<Control ID='spnStartDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='OpenDate' Format='M/d/yyyy'>
					<Control ID='spnOpenDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DueDate' Format='M/d/yyyy'>
					<Control ID='spnDueDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CloseDate' Format='M/d/yyyy'>
					<Control ID='spnCloseDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='EndDate' Format='M/d/yyyy'>
					<Control ID='spnEndDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
									<Argument AttributeName='PageKey' Value='TaskAssignEditor'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectOutcomesID' BaseValue='GranteeProjectOutcomesID='/>
									<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
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

		<UserCtlLoader>
			<ctlPerson>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPerson>
		</UserCtlLoader>

	</ModuleSection>
</span>
<!-- End Embedded XML -->
