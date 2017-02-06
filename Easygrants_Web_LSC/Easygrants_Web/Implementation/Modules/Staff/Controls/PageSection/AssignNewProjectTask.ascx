<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cAssignNewProjectTask" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br/>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<asp:label id='lblValidationMessage' forecolor='red' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br />
<Core:cUserCtlLoader CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add Workflow Task Assignment</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" width="120"><b><%=GetLabel("FundingCycleName")%></b></td>
		<td></td>
		<td><span id='ctlProjectName' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Primary Contact/PI</b></td>
		<td></td>
		<td><span id='ctlGranteeName' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<hr>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Person</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlPerson'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Workflow Task&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTask' runat='server'/><span id='spnTaskMessage' runat='server' visible='False'>This Workflow Task already exists for this grant.</span></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task Role</b></td>
		<td>
			<span id='spnRole' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Status&nbsp;</b></td>
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
<table  border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>	
		</td>
	</tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=WfTaskAssignment&QueryStringKey=WfTaskAssignmentID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

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
					<Control ID='ctlGranteeName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='PrimaryPersonID' PropertyKey='PersonID'
					Value='' bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='PersonID' PropertyValue='LastNameFirstName' >
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher' LabelText='Selected Contact' />
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='TaskAssignEditor' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>				
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole'>
					<Control ID='spnRole'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='WfTask.WfTask' RequiredField='True' DisplayText='Select'
						ErrorMessage='Workflow Task is requried.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID'
								PropertyKey='WfProjectID' Value='' Bool=''/>
							<Argument Type='' TypeKey='' PropertyKey='WfProjectTaskOutcomeID' Value='null' Operator='NotEqual' >
								<RelatedProperty PropertyKey='WfProjectTaskOutcome'/>
							</Argument>
							<Argument Group='('/>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='1' Bool='' >
								<RelatedProperty PropertyKey='WfTask.WfTaskType'/>
							</Argument>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool='Or' >
								<RelatedProperty PropertyKey='WfTask.WfTaskType'/>
							</Argument>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='5' Bool='Or' >
								<RelatedProperty PropertyKey='WfTask.WfTaskType'/>
							</Argument>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='8' Bool='Or' >
								<RelatedProperty PropertyKey='WfTask.WfTaskType'/>
							</Argument>
							<Argument Group=')' Bool=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskStatusID'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
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
		
		<UserCtlLoader>
			<ctlPerson>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPerson>
		</UserCtlLoader>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SaveAndRedirect'>
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