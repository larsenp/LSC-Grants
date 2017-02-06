<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualExpenses.Controls.PageSection.cActualExpensesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_E1a' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form D-2: Interim Expenses</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormD2' 
	Src='Implementation/Modules/GAR/ProjectedExpenses/Controls/PageSection/FormD2_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormD2F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<br />
<div style="text-align: center">
	<span runat='server' id='spnCalculate'/>
	<span runat='server' id='spnContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
		</DataObject>

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False' >
		  <Filters>
				<%--<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />--%>
			   <Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Save_and_Calculate'>
						<Action
							PostBack='True'
							AutoSave='True'>
							
						</Action>
					</Control>
				</DisplayProperty>
				
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Caption='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Submission' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Save and Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>--%>
		</DisplayProperties>
		</DataObject>

		<DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Save and Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					  <Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
                     </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='TopBudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />
				<Argument PropertyKey='CategoryTypeID' Value='6' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
	</ModuleSection>
</span>