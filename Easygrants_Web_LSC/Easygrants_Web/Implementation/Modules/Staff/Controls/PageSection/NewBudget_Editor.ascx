<%@ Control Language="vb" AutoEventWireup="true" Codebehind="NewBudget_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cNewBudget_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>
	To create a new budget, work from an existing budget or template by selecting 
	the correct radio button below, select a Budget Version, and Name the budget in the 
	Description field.  Then click Copy to create the new budget and open it in edit mode.
</P>
<!-- Page Content - Controls -->
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='NewBudgetEditor' LinkTitle='New Budget Editor' runat='server'/>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<!-- Control Label (for Education information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>New Budget Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			<b>Budget Version</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnBudgetType' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Description</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	<tr>
		<td>
			<b>Budget</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnBudget' runat='server'/>
		</td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td colspan='2'><span runat='server' id='spnCopy'></span></td>
		<td colspan='2'><span runat='server' id='spnCancel'></span></td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='BudgetTypeID'>
					<Control ID='ctlBudgetType'
						Container='spnBudgetType'
						Type='cDropDown'
						DataObjectDefinitionKey='BudgetType'
						StoredValue='BudgetTypeID'
						DisplayValue='Description'	
						DisplayNone='False'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='25'
						MaxLength='255'
						RequiredField='False'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='BudgetID'>
					<Control ID='ctlBudget'
						Container='spnBudget'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Budget is required.'
						DataObjectDefinitionKey='Budget'
						StoredValue='BudgetID'
						DisplayValue='RadioButtonDescription'>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='GranteeProjectID' 
								PropertyKey='GranteeProjectID' 
								Value='' 
								Bool=''/>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>						
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCopy'
						Container='spnCopy'
						Type='cButton'
						Image='Copy'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CopyBudget'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlBudget' ControlPropertyKey='SelectedValue' Value=''/>
								<Argument Type='Control' TypeKey = 'ctlBudgetType' ControlPropertyKey='SelectedValue' Value='' />
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
