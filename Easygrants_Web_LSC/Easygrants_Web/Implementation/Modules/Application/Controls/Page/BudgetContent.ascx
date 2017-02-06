<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
</table>

<p>The <b>Budget</b> section allows you to enter or edit a project budget.</p>
<p>Click the <b>Budget Guidelines</b> below for instructions on how to complete the budget section.</p>
<p><span id='spnBudgetGuidelines' runat='server' visible='true'/></p>
<p>Click <b>Add</b> to add a budget year.</p>

<!-- Page Content - Controls -->
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='BudgetEditor' LinkTitle='Budget Editor' runat='server' visible='false'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget Main Page</b></td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlBudget_Editor' 
	Src='EasyGrants/Controls/PageSection/Budget_Editor.ascx'
	runat='server' />
<p>
<Core:cUserCtlLoader CtlID='ctlBudgetPeriodList' 
	Src='EasyGrants/Controls/PageSection/BudgetPeriodList.ascx'
	runat='server' />


<table border='0' cellspacing='0' cellpadding='2' runat='server' >	
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='3'>Click <b>Save and Continue</b> after you have entered all of the budget years for your project.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align='center'>
		<td><span runat='server' visible='false' id='spnSave'/></td>
		<td><span runat='server' visible='false' id='spnClose'/></td>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlBudget_Editor' Type='cUserCtlLoader'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlBudgetPeriodList' Type='cUserCtlLoader'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlBudgetGuidelines'
						Container='spnBudgetGuidelines'
						Type='cLink'
						Caption='Budget Guidelines'>
						<Action PostBack='False'
							Target='_blank'
							URL='../../../Easygrants/PDF/GuidelinesPlaceholder.pdf'/>
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
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Uploads'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>										
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->

