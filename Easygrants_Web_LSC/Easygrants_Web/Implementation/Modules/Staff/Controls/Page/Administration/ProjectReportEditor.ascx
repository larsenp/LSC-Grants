<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectReportEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProjectReportEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<!-- Page Content - Top Of Page -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Edit Default Grantee Report Parameter</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProgram' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCompetition' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectName' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTask' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Award Term</b>&nbsp;<font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAwardTerm' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Start Date&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStartDate' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Open Date&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOpenDate' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Due Date&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDueDate' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Close Date&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCloseDate' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>End Date&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEndDate' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Status&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnStatus' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Outcome&nbsp;</b><font color=red>*</font></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOutcome' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ProjectReport' DataObjectDefinitionKey='ProjectReport' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectReportID'
					PropertyKey='ProjectReportID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TaskID'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						RequiredField='True'
						ErrorMessage='Task is required.'>
						<Filters>
							<Argument PropertyKey='WfTaskTypeID' Value='3'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AwardTermID'>
					<Control ID='ctlAwardTerm'
						Container='spnAwardTerm'
						Type='cDropDown'
						DataObjectDefinitionKey='BudgetPeriodDescription'
						StoredValue='BudgetPeriodDescriptionID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Award Term is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Start Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Open Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Due Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Close Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='End Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='ProjectReportStatus'
						StoredValue='ProjectReportStatusID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Status is required.'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OutcomeID'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						RequiredField='True'
						ErrorMessage='Outcome is required.'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3'>	
								<RelatedProperty PropertyKey='WfTask'/>
							</Argument>
						</Filters>
			            <Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
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
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='ProjectReport' DataObjectPropertyKey='ProjectReportID' PropertyKey='ProjectReportID' BaseValue='ProjectReportID='/>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
