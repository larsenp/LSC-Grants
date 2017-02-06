<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGrant_AssignTaskWorkflowEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<asp:label id='lblValidationMessage' forecolor='red' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<!-- USER MODIFIIABLE CONTENT AREA -->


<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assign Next Workflow Task</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" width="120"><b>Funding Cycle</b></td>
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
		<td	valign="top" colspan='2'><b>Completed Workflow Task</b></td>
		
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
		<td><b>Workflow Task</b>
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
		<td><b>Status</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Outcome</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOutcome0' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Submitted Date</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlOpenDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>	
</table>
<hr>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top" colspan='2'><b>Next Workflow Task</b></td>
		
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
		<td><b>Workflow Task&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTask' runat='server'/></td>
	</tr>
	<tr id='trTaskRole' visible='false'>
		<td><b>Task Role</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTaskRole' Type='cDropDown' runat='server'/>&nbsp;
		</td>
	</tr>
	<tr id='trStatusNew' visible='false'>
		<td><b>Status</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatusNew' runat='server'/></td>
	</tr>
	<tr id='trOutcome' visible='false'>
		<td><b><span id='spnOutcome' runat='server'>Outcome</span></b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlOutcome'  Type='cDropDown'  runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Person</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlPerson'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
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
<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
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
						DisplayValue='WfTaskStatusAbbr'
						RequiredField='True' 
						DisplayText='Select'
						ErrorMessage='Task Status is required.'>
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
						StoredValue='WfTaskOutcomeID' DisplayText='Select'
						DisplayValue='WfTaskOutcome' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' 
								DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SubmittedDate'>
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
						DisplayValue='WfTaskStatusAbbr'
						>
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
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask.WfTask' RequiredField='True' DisplayText='Select'
						ErrorMessage='Workflow Task is requried.'>
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

	</ModuleSection>
<!-- End Embedded XML -->
</span>
