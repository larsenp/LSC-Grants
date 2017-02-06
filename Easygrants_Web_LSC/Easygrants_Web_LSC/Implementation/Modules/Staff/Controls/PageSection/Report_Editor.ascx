<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cReport_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantInfo' 
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br />

<table id="Table1" border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<!-- Control Label (for Education information) -->
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Add or Edit Contingency</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top' width='15%'><b>Assigned Person&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><Core:cUserCtlLoader CtlID='ctlPer' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' 
				runat='server' id="CUserCtlLoader3" /></td>
	</tr>
	<tr>
		<td valign='top'><a name='Contingency'><b>Workflow Task&nbsp;</b><%=kDenoteRequiredField%></a>
		</td>
		<td><span id='spnWorkflowTask' runat="server"></span></td>
	</tr>
	<tr>
		<td valign='top'><b>Start Date</b>
		</td>
		<td><span id='spnStartDate' runat="server"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;Funding Cycle Task Date: <span id='spnTaskStart' runat="server"></span></td>		
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>Open Date</b>
		</td>
		<td><span id='spnOpenDate' runat="server"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;Funding Cycle Task Date: <span id='spnTaskOpen' runat="server"></span></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>Due Date</b>
		</td>
		<td><span id='spnDueDate' runat="server"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;Funding Cycle Task Date: <span id='spnTaskDue' runat="server"></span></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>Close Date</b>
		</td>
		<td><span id='spnCloseDate' runat="server"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;Funding Cycle Task Date: <span id='spnTaskClose' runat="server"></span></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>End Date</b>
		</td>
		<td><span id='spnEndDate' runat="server"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;Funding Cycle Task Date: <span id='spnTaskEnd' runat="server"></span></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
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
<br>

<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=WfTaskAssignment&QueryStringKey=WfTaskAssignmentID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='1'/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPer' Type='cPopUpSelectorLauncher2' RequiredField='True' LabelText='Selected Contact ' ErrorMessage='Assigned Person is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskID'>
					<Control ID='ctlWorkflowTask'
						Container='spnWorkflowTask'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfTaskID'
						AutoPostBack='True'
						DisplayValue='WfTask.WfTask'
						Required='True'
						ErrorMessage='Workflow Task is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' PropertyKey='WfProjectID' DataObjectPropertyKey='WfProjectID' Value='' />
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3'>
								<RelatedProperty PropertyKey='WfTask'/>
							</Argument>							
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'
						NotSupportedDateErrorMessage='Start Date must be mm/dd/yyyy format.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'
						NotSupportedDateErrorMessage='Open Date must be mm/dd/yyyy format.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'
						NotSupportedDateErrorMessage='Due Date must be mm/dd/yyyy format.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'
						NotSupportedDateErrorMessage='Close Date must be mm/dd/yyyy format.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'
						NotSupportedDateErrorMessage='End Date must be mm/dd/yyyy format.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' CreateNew = '' Updatable=''>
		    <Filters>
		        <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'/>
		        <Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'
					 Value='' Bool='AND' />
		    </Filters>
		    <DisplayProperties>
		            <DisplayProperty PropertyKey='StartDate' Format='MM/dd/yyyy'>
					    <Control ID='spnTaskStart' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='OpenDate' Format='MM/dd/yyyy'>
					    <Control ID='spnTaskOpen' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='DueDate' Format='MM/dd/yyyy'>
					    <Control ID='spnTaskDue' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='CloseDate' Format='MM/dd/yyyy'>
					    <Control ID='spnTaskClose' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='EndDate' Format='MM/dd/yyyy'>
					    <Control ID='spnTaskEnd' Type='HtmlGenericControl'/>
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
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
							</Parameters>
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
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
</span>