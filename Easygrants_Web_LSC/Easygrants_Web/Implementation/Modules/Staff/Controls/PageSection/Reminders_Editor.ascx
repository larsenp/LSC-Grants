<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Reminders_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cReminders_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<%-- <P>Use this page to set up, modify, or suspend reminder e-mails for a particular task.</P> --%>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Add or Edit E-mail Reminder</b></td>
</tr>	
</table>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProgram' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSubmitProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>&nbsp;<%=kDenoteRequiredField%>
			<asp:CustomValidator 
				id='valCompetition'
				runat='server'
				OnServerValidate='ValidateCompetition'
				ErrorMessage='~~FundingOpportunity~~ is required.'
				Display='None'/>		
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server'  /></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>&nbsp;<%=kDenoteRequiredField%>
			<asp:CustomValidator 
				id='valProject'
				runat='server'
				OnServerValidate='ValidateProject'
				ErrorMessage='~~FundingCycleName~~ is required.'
				Display='None'/>		
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'  /></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>&nbsp;<%=kDenoteRequiredField%>
			<asp:CustomValidator 
				id='valTask'
				runat='server'
				OnServerValidate='ValidateTask'
				ErrorMessage='Task is required.'
				Display='None'/>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr><td height='20'>&nbsp;</td></tr>
	<tr id='trTemplateList' visible='False'>
		<td><b>E-Mail Template</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTemplateList' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblReminderSettings' visible='False' border='0' cellspacing='0' cellpadding='0' runat='server'>	
	<tr>
		<td width='141'><b>Send Reminder&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span id='spnDaysToRemind' runat='server'/>&nbsp;&nbsp;Days</td>
		<td width='25'></td>
		<td><span id='spnBeforeAfter' runat='server'/></td>
		<td width='25'></td>
		<td><span id='spnTargetDate' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblEnabled' visible='False' border='0' cellspacing='0' cellpadding='0' runat='server'>		
	<tr>
		<td width='137'><b>Enabled</b></td>
		<td><span id='spnIsEnabled' runat='server'/></td>
		<td>Uncheck to suspend sending this reminder</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<table id='tblName' visible='False' border='0' cellspacing='0' cellpadding='0' runat='server'>		
	<tr>
		<td width='141'><b>Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnReminderName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td width='141'><b>Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>		
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnSaveAndClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnCancel'/>	
	</td>
</tr>
</table>


<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						RequiredField='True'
						ErrorMessage='~~ProgramName~~ is required.'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Reminder' DataObjectDefinitionKey='Reminder' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReminderID' PropertyKey='ReminderID' Value=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='CorrespondenceID'>
					<Control ID='ctlTemplateList'
						Container='spnTemplateList'
						Type='cDropDown'
						RequiredField='True'
						ErrorMessage='E-mail Template is required.'
						DataObjectDefinitionKey='CorrespondenceDefinition'
						StoredValue='CorrespondenceDefinitionID'
						DisplayValue='Title'>
						<Sort>
							<Argument PropertyKey='Title' Direction='Ascending'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DaysToRemind'>
					<Control ID='ctlDaysToRemind'
						Type='cTextBox'
						Container='spnDaysToRemind'
						Size='1'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Days is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='BeforeAfterID'>
					<Control ID='ctlBeforeAfter'
						Container='spnBeforeAfter'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Before or After selection is required.'
						DataObjectDefinitionKey='ReminderBefore'
						StoredValue='ReminderBeforeID'
						DisplayValue='Description'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TargetDateID'>
					<Control ID='ctlTargetDate'
						Container='spnTargetDate'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Open Date or Due Date selection is required.'
						DataObjectDefinitionKey='ReminderTarget'
						StoredValue='ReminderTargetID'
						DisplayValue='Description'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsEnabled'>
					<Control ID='ctlIsEnabled'
						Container='spnIsEnabled'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Enabled'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReminderName'>
					<Control ID='ctlReminderName'
						Type='cTextBox'
						Container='spnReminderName'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						RequiredField='True'
						ErrorMessage='Description is required.'
						Rows='3'
						Cols='50'
						MaxLength='200'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,200}$' ErrorMessage='Limit your Description to 200 characters or less.' />
					</Control>
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
							Object='DataPresenter'
							Method='DataPresenter_Save_And_Reload'>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Reminders'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Reminders'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
