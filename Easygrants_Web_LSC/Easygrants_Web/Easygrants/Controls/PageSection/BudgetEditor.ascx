<%@ Control Language="vb" AutoEventWireup="true" Codebehind="BudgetEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cBudgetEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="7" class="SeparatorHdg"><b>Budget</b></td>
	</tr>
</table>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
</table>

<table runat='server' width='100%' id='tblBudget' visible='true'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnCalculate'/>&nbsp; 
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
</table>

<table runat='server' width='100%' id='tblOtherBudget' visible='false'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnCalculate1'/>&nbsp; 
			<span runat='server' id='spnCancel1'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>
		<!--
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' PropertyKey='BudgetID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='BudgetTypeID' PropertyKey='BudgetTypeID' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
		</DataObject>
		-->
		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' 
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>		
            </Filters>
		</DataObject>
		
		
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID'
					PropertyKey='BudgetID' Value='' bool=''/>				
            </Filters>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue' 
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' >
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Calculate_and_Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate1'
						Container='spnCalculate1'
						Type='cButton'
						Image='Calculate_and_Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				<!--
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
				-->
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
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel1'
						Container='spnCancel1'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
