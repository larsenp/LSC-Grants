<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cAssignReportEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %><!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
From this page you can enter details of a progress report task. First, select the Status and Task for the progress report. 
After selection of the Task, click on the <b>Go</b> button. Then, select a corresponding Task Role and click on the <b>Go</b> button. 
Next, select the corresponding Outcome. Click on the <b>Select...</b> button to select the Person responsible for the report. 
After completion of progress report details, click on the <b>Save</b> button. 
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add Progress Report Task</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<asp:label id='lblValidationMessage' forecolor='red' runat='server' />
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr id='trReviewer' visible='false'>
		<td colspan=3><b>Current Reviewers Assigned To This Task</b>
		</td>
		<td width='10'>&nbsp;</td>
		
	</tr>
	<tr>
		<td><span id='spnReviewer' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Status&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Task&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTask' runat='server'/>&nbsp;<span id='spnGo' runat='server'/></td>
	</tr>
	<tr id='trTaskRole' visible='false'>
		<td><b>Task Role&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTaskRole' Type='cDropDown' runat='server'/>&nbsp;
		<Core:cUserCtlLoader CtlID='btnTaskRole' Type='cButton' Properties='Caption=GobtnTaskRole&CausesValidation=False' runat='server'/></td>
	</tr>
	<tr id='trOutcome' visible='false'>
		<td><b><span id='spnOutcome' runat='server'>Outcome<%=kDenoteRequiredField%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlOutcome' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Person&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlPerson'
				Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
				Properties='Origin=Person'
				runat='server'/>
		</td>
	</tr>
	<tr>
	<td><b>Open Date</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnOpenDate' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Due Date</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnDueDate' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Close Date</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCloseDate' runat='server'/>
	</td>	
</tr>
<tr visible='false'>
		<td><b></b>
		</td>
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
		
<!-- Save Reset and Cancel buttons -->
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='TaskID' PropertyKey='WfTaskID' Value=''/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
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
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatusAbbr'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPerson'
							DataObjectDefinitionKey='Person'					
							Type='cPopUpSelectorLauncher'
							StoredValue='PersonID'
							DisplayValue='LastNameFirstName'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'>
						<Filters>
							<Argument Type='Data' 
								TypeKey=''
								PropertyKey='WfTaskTypeID'
								Value='3' 
								/>
							<Argument Type='Data' 
								TypeKey=''
								PropertyKey='WfTaskTypeID'
								Value='5' 
								Bool='Or'/>
						</Filters>
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
<!-- End Embedded XML -->
</span>
