<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectCopy.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProjectCopy" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Copy Funding Cycle</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Program</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProgram' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Funding Opportunity</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCompetition' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Funding Cycle Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCopyFromProjectName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>New Funding Cycle Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td colspan='2'></td>	
		<td>Limit: 200 characters</td>	
	</tr>
	<tr>
		<td><b>New Funding Cycle Abbreviation&nbsp;<%=kDenoteRequiredField%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectAbbr' runat='server'/>		
		</td>	
	</tr>
	<tr>
		<td colspan='2'></td>	
		<td>Limit: 10 characters</td>	
	</tr>
	<tr>
		<td><b>Technical Support E-mail Address&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnSupportEmail' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Program Support E-mail Address&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnContentEmail' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Time Period/Award Cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTimePeriod' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Award Term (Years)</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTerm' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Start Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStartDate' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td><b>End Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEndDate' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='2' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	    <DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectID'
					PropertyKey='ProjectID' Value='' bool=''/>
			</Filters>
	    </DataObject>
		<DataObject Key='Project' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfCompetition.WfProgram.ProgramName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfCompetition.CompetitionName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnCopyFromProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='ctlProjectName'
						Container='spnProjectName'
						Type='cTextBox'
						Size='65'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='New Funding Cycle Name is required.'>
					</Control>					
				</DisplayProperty>
				 <DisplayProperty PropertyKey='ShortName'>
					<Control ID='ctlProjectAbbr'
						Container='spnProjectAbbr'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='New Funding Cycle Abbreviation is required.'>
					</Control>					
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AwardTerm'>
					<Control ID='ctlTerm'
						Container='spnTerm'
						Type='cTextBox'
						Size='2'
						MaxLength='2'
						RequiredField='False'>
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
				<DisplayProperty PropertyKey='SupportEmailAddress'>
					<Control ID='ctlSupportEmail'
						Container='spnSupportEmail'
						Type='cEmailTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Support e-mail address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContentEmailAddress'>
					<Control ID='ctlContentEmail'
						Container='spnContentEmail'
						Type='cEmailTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Content e-mail address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimePeriodID'>
					<Control ID='ctlTimePeriod'
						Container='spnTimePeriod'
						Type='cDropDown'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
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
						Image='Copy and Close'>
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
