<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Application.Controls.Page.cBudgetDetailsEditor" CodeBehind="BudgetDetailsEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<table id="Table1" border='0' cellspacing='0' cellpadding='2'  runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td align='center'>
	    <span runat='server' id='spnCalculate'/>&nbsp;
	    <span runat='server' id='spnContinue'/>&nbsp;
	    <span runat='server' id='spnContinueNextPage'/>&nbsp;
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' />
			</Filters>
		</DataObject>	
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				
				<Argument Type='Data' TypeKey='' PropertyKey='BudgetTypeID' Value='1'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument PropertyKey='BudgetTypeID' Value='1'/>
			</DefaultValues>
		</DataObject>
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' />				
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Image='Continue'>
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
					<Control ID='btnContinueNextPage'
						Container='spnContinueNextPage'
						Type='cButton'
						Image='Continue' GoToNextPage='True'>
						<Action
							PostBack='True'
							AutoSave='True'>							
						</Action>						
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton' Caption='Save and Calculate'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
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
