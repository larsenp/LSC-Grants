<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Edit Workflow Task Assignment</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td width='15%'><b><%=GetLabel("FundingCycleName")%></b></td>
		
		<td><span id='ctlProjectName' runat='server'/></td>
	</tr>
	<tr>
		<td width='15%'><b>Primary Person/PI</b></td>
		
		<td><span id='ctlPrimaryPerson' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<hr>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td width='15%'><b>Person&nbsp;</b><%=kDenoteRequiredField%></td>
	
	<td>
		<!--
		<span id='spnPerson' runat='server'/>
		-->
		<Core:cUserCtlLoader CtlID='ctlPerson'
			Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
			runat='server'/>
	</td>
</tr>
<tr>
	<td><b>Workflow Task</b></td>
	<td>
		<span id='spnTask' runat='server'/>
	</td>
</tr>
<tr>
	<td><b>Task Role</b></td>
	<td>
		<span id='spnRole' runat='server'/>
	</td>
</tr>
<tr>
	<td><b>Status&nbsp;</b><%=kDenoteRequiredField%></td>
	<td>
		<span id='spnStatus' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Outcome</b></td>
	<td>
		<span id='spnOutcome' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Start Date</b></td>
	<td>
		<span id='spnStartDate' runat='server'/>&nbsp;&nbsp;&nbsp;Funding Cycle Task Date:
		<span id='spnStartDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td>
	<td>mm/dd/yyyy</td>	
</tr>
<tr>
	<td><b>Open Date</b></td>
	<td>
		<span id='spnOpenDate' runat='server'/>&nbsp;&nbsp;&nbsp;Funding Cycle Task Date:
		<span id='spnOpenDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td>
	<td>mm/dd/yyyy</td>	
</tr>
<tr>
	<td><b>Due Date</b></td>
	<td>
		<span id='spnDueDate' runat='server'/>&nbsp;&nbsp;&nbsp;Funding Cycle Task Date:
		<span id='spnDueDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td>
	<td>mm/dd/yyyy</td>	
</tr>
<tr>
	<td><b>Close Date</b></td>
	<td>
		<span id='spnCloseDate' runat='server'/>&nbsp;&nbsp;&nbsp;Funding Cycle Task Date:
		<span id='spnCloseDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td>
	<td>mm/dd/yyyy</td>	
</tr>
<tr>
	<td><b>End Date</b></td>
	<td>
		<span id='spnEndDate' runat='server'/>&nbsp;&nbsp;&nbsp;Funding Cycle Task Date:
		<span id='spnEndDateCalculated' runat='server'/>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td>
	<td>mm/dd/yyyy</td>	
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<table border='1' cellspacing='0' cellpadding='2' runat='server' width='75%'>
	<tr>
		<td colspan='2'><b>Task date definitions</b></td>
	</tr>
	<tr>
		<td><b>Start Date</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment first appears on a user's home page but is not an active link.</td>
	</tr>
	<tr>
		<td><b>Open Date</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment link becomes active.</td>
	</tr>
	<tr>
		<td><b>Due Date</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Due Date displayed to the user assigned the task.</td>
	</tr>
	<tr>
		<td><b>Close Date</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task assignment link is disabled but remains visible on a user's home page.</td>
	</tr>
	<tr>
		<td><b>End Date</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date the task disappears from the user's home page.</td>
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
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>
	</td>
</tr>

</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=WfTaskAssignment&QueryStringKey=WfTaskAssignmentID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />


<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='TaskAssignEditor' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>	
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>		    
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher' RequiredField='True' LabelText='Selected Contact'
						ErrorMessage='Person is required.'/>
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
						DisplayValue='WfTaskStatus'
						RequiredField='True'
						ErrorMessage='Status is required.' DisplayText='Select'>
				        <Sort>
	                        <Argument PropertyKey='WfTaskStatus'/>
                        </Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome' RequiredField='True'
						DisplayText='Select'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='TaskAssignEditor' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>							
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
						MaxLength='10' 
						NotSupportedDateErrorMessage="Start Date must be in MM/DD/YYYY format." />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						NotSupportedDateErrorMessage="Open Date must be in MM/DD/YYYY format." />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						NotSupportedDateErrorMessage="Due Date must be in MM/DD/YYYY format." />	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						NotSupportedDateErrorMessage="Close Date must be in MM/DD/YYYY format." />
				</DisplayProperty>		
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						NotSupportedDateErrorMessage="End Date must be in MM/DD/YYYY format." />
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
					<Control ID='ctlPrimaryPerson'
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
				<DisplayProperty PropertyKey='StartDate'  Format='MM/dd/yyyy hh:mm tt'>
					<Control ID='spnStartDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='OpenDate' Format='MM/dd/yyyy hh:mm tt'>
					<Control ID='spnOpenDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DueDate' Format='MM/dd/yyyy hh:mm tt'>
					<Control ID='spnDueDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CloseDate' Format='MM/dd/yyyy hh:mm tt'>
					<Control ID='spnCloseDateCalculated'
					Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='EndDate' Format='MM/dd/yyyy hh:mm tt'>
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
							AutoSave='True'>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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

		<UserCtlLoader>
			<ctlPerson>
				<DataObject Key='PersonID' DataObjectDefinitionKey='PersonOrganization' DisplayName='Person last'>
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

