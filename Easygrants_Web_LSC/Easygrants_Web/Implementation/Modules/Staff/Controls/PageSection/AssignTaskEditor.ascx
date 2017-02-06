<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cAssignTaskEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<p>
	The Assign Task Editor allows you to view the current task and add a new task.  
	This feature is helpful in cases where the completion of one task does not 
	automatically create a new task, such as an application waiting for review and 
	assignment to the next review stage. Manually adding a new assignment is also 
	helpful when a decision has been made on a particular application or grant, for 
	example, and a new task needs to be added to an individual’s To Do list.
</p>  

<p>
	To add a new task assignment, select the appropriate Status and Outcome for the 
	completed task in the Completed Task section of the page.  Next, select a Task 
	and click on the <b>Go</b> button.  Select a Task Role and click on the <b>Go</b> 
	button.  Next, select the appropriate Outcome and Status for the new task.  
	Finally, click on the <b>Select…</b> button to use the Person Selector tool to 
	search for and choose the name of the person responsible for the new task.  After 
	all selections, click on the <b>Save</b> button to add the new task assignment information.
	Click on the <b>Close</b> button to close the page without saving the data.
</p>

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assign Next Task</b></td>
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
		<td	valign="top" width="120"><b>Grantee</b></td>
		<td></td>
		<td><span id='ctlGranteeName' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" width="120"><b>Completed Task</b></td>
		<td></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Person</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlName' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Task</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlWfTask' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Task Role</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlWfTaskRole' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Status</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Outcome</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOutcome0' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Date</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlOpenDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>	
</table>
<asp:label id='lblValidationMessage' forecolor='red' runat='server' />
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" width="120"><b>Next Task</b></td>
		<td></td>
	</tr>
	<tr id='trReviewer' visible='true'>
		<td colspan=3><b><asp:label id='lblPeopleAssigned' runat='server' /></b>
		</td>
		<td width='10'>&nbsp;</td>
		
	</tr>
	<tr>
		<td><span id='spnReviewer' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Task</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTask' runat='server'/>&nbsp;<span id='spnGo' runat='server'/></td>
	</tr>
	<tr id='trTaskRole' visible='false'>
		<td><b>Task Role</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTaskRole' Type='cDropDown' runat='server'/>&nbsp;
		<Core:cUserCtlLoader CtlID='btnTaskRole' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server'/></td>
	</tr>
	<tr id='trOutcome' visible='false'>
		<td><b><span id='spnOutcome' runat='server'>Outcome</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlOutcome' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trStatusNew' visible='false'>
		<td><b>Status</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatusNew' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Person</b></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlPerson'
				Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr visible='false'>
		<td><b></b></td>
		<td width='10'>&nbsp;</td>
		<td><asp:checkbox id='chkbxRaiseEvent' runat='server'/>Send E-mail</td>
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
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='ctlName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlWfTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole'>
					<Control ID='ctlWfTaskRole'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatusAbbr'>
						<Sort>
							<Argument PropertyKey='WfTaskStatusAbbr' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlOutcome0'
						Container='spnOutcome0'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' 
								DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'
					Value='' bool=''/>
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
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatusNew'
						Container='spnStatusNew'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatusAbbr'>
					</Control>	
				</DisplayProperty>	
	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='PersonID' PropertyKey='PersonID'
					Value='' bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='PersonID' PropertyValue='LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher'/>
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
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask.WfTask'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'
								DataObjectPropertyKey='GranteeProject.WfProjectID'
								PropertyKey='WfProjectID' Value='' bool=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey="SortOrder" Direction="Ascending"/>
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo'
						Container='spnGo'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Task' />
								<Argument Type='Control' TypeKey = 'ctlTask' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlStatus' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlOutcome0' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlPerson' ControlPropertyKey='ObjID' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
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
