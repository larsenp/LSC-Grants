<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cApplicantPoolEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ApplicantPoolEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<asp:CustomValidator 
	id='valApplicationTask'
	runat='server'
	OnServerValidate='ValidateApplicationTask'
	ErrorMessage='Task is required.'
	Display='None'/>
<asp:CustomValidator 
	id='valOutcomes'
	runat='server'
	OnServerValidate='ValidateOutcomes'
	ErrorMessage='Outcome is required.'
	Display='None'/>

<!-- Page Content - Top Of Page -->
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b><span runat='server' id='spnName' visible='true'></span></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' id='tblApplicant' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Participant Task Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr valign='top' visible='true'>
		<td width='20%'><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='80%'><span runat='server' id='spnSelectedTask' visible='false'/>
			<span runat='server' id='spnTask' visible='false'/>
			<span runat='server' id='spnGo' visible='false'/><br><br>
		</td>
	</tr>
	<tr visible='false'><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td width='20%'><b>Outcomes&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='80%'><span runat='server' id='spnOutcome' visible='true'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr >
		<td align='center'><span runat='server' id='spnSave'/><span runat='server' id='spnSaveAndClose'/><span runat='server' id='spnCancel'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- End Page Section - Applicant Pool -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectTaskID' PropertyKey='WfProjectTaskID'/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewCycleProjectTask' DataObjectDefinitionKey='ReviewCycleProjectTask' Updatable='True' CreateNew='True'>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleProjectTaskID' PropertyKey='ReviewCycleProjectTaskID'/>
			</Filters>
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
				<DisplayProperty PropertyKey='ProjectTask.Description'>
					<Control ID='spnTask' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectTaskID'>
					<Control ID='ctlSelectedTask'
						Container='spnSelectedTask'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCycleProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='ProjectTask.Description'
						DisplayNone='True'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'>
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='Description' Direction='Ascending'>
								<RelatedProperty PropertyKey='ProjectTask' />
							</Argument>
						</Sort>
						<SelectedValue>
							<Argument Type='QueryString' 
								TypeKey='ProjectTaskID'
								PropertyKey='WfProjectTaskID'
								Value=''/>
						</SelectedValue>
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
								<Argument Type='Control' TypeKey = 'ctlSelectedTask' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewCycleProjectTask2' DataObjectDefinitionKey='ReviewCycleProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleProjectTask' PropertyKey='ReviewCycleProjectTaskID' DataObjectPropertyKey='ReviewCycleProjectTaskID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleProjectTaskOutcome'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='WfTaskOutcome'
						DisplayValue='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						RepeatColumns='1'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='ReviewCycleProjectTask' PropertyKey='ReviewCycleProjectTaskID' DataObjectPropertyKey='ReviewCycleProjectTaskID' Value='' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' Value='' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' PropertyKey='WfProjectID' DataObjectPropertyKey='WfProjectID' Value='' />
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value='' />
						</DefaultValues>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' Value='' />
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
