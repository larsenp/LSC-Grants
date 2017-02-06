	<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr.cBudget" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
<div style='width:800px;'>
	<div class='SeparatorHdg'>Budget</div>
	<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlBudgetGrid' 
		Src='Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr/BudgetGrid.ascx'
		runat='server'/>
	<br />
	<div class='SeparatorHdg'>Budget Narrative</div>
	<br />
	<span runat='server' id='spnBudgetNarrative' />
	<br /><br />
	<div class='SeparatorHdg'>Statement of Additional Funds</div>
	<br />
	<b>Please use this section to describe any additional funds your project will receive from other sources. 
	If you do not anticipate any additional project funding, please also indicate that in this section.</b>
	<br /><br />
	<span runat='server' id='spnStmtAdditionalFunds' />  
	<br /><br />
	<div class='SeparatorHdg'>Reporting on Expenditure of Funds</div>
	<br />
	<span runat='server' id='spnReportingExpenses' />
	<br /><br />
	<div runat='server' id='divContracts'>
			<div class="SeparatorHdg" >
				Contracts
			</div>
			<span runat='server' id='spnContracts' />
	</div>
	<br />
	<div runat='server' id='div1'>
			<div class="SeparatorHdg" >
				OLA Review Indicator
			</div>
			<p><strong>OLA review is indicated</strong>  <span runat='server' id='spnOLAReview' /></p><br />
			<p><b>Administrative Plan Required:</b><span runat='server' id='spnAdministrativePlanReq' /></p>
	</div>
	<br />
	<div class='SeparatorHdg'>Reviewer Comments and Scores</div>
	<br />
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers on Budget</div>
	<br />
	<span runat='server' id='spnBudgetComments' />
	<br />
	<div runat='server' id='divReviewersComments'>
			<div class="MinorSeparatorHdg" >
				Comments from Other Reviewers on Contracts
			</div>
			<span runat='server' id='spnContractsComments' />
	</div>
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				Displays a clear link between the specific project activities and the proposed budget items
			</td>
			<td style="text-align:center">
				3
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnBudgetClearLink'/>
			</td>
		</tr>
		<tr>
			<td>
				Adequate to carry-out the project objectives and activities
			</td>
			<td style="text-align:center">
				3
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnBudgetAdequate'/>
			</td>
		</tr>
		<tr>
			<td>
				Costs are reasonable, and does not include any expenses unrelated to the project
			</td>
			<td style="text-align:center">
				3
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnBudgetReasonableCost'/>
			</td>
		</tr>
		<tr>
			<td>
				The Budget Narrative supports all costs included in the budget and explains how the costs of goods and services were determined 
			</td>
			<td style="text-align:center">
				6
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnBudgetNarrativeSupports'/>
			</td>
		</tr>
		<tr>
			<td>
				BONUS: Shows support from other funding sources
			</td>
			<td style="text-align:center">
				3
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnBudgetSupportFromOther'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments on Budget</div>
	<br />
	<span runat='server' id='spnBudgetComment' />
	<br />
	<br />
	<div runat='server' id='divReviewerComment'>
			<div class="MinorSeparatorHdg" >
				Your Comments on Contracts
			</div>
			<p></p>
			<span runat='server' id='spnContractsComment' />
	</div>
	<br />
	<br />
	
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnSaveContinue' />
	</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscTigBudget' />
				</Argument>
				<Argument PropertyKey='Amount' Value='0' Operator='GreaterThan' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscTigBudgetLine' />
				</Argument>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscTigBudgetFundingType' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetNarrative'
						Container='spnBudgetNarrative'
						Type='cDataPresenterList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr/BudgetNarrativeItem.ascx'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'>
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Operator='NotEqual'>
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetComments'
						Type='cDataListCtl'
						Container='spnBudgetComments'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='BudgetComment' ColumnHeader='Comment' >
							<Control ID='lblBudgetComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlContractsComments'
						Type='cDataListCtl'
						Container='spnContractsComments'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='ContractsComment' ColumnHeader='Comment' >
							<Control ID='lblContractsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetComment'>
					<Control ID='txtBudgetComment'
						Type='cTextArea'
						Container='spnBudgetComment'
						Cols='80'
						Rows='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractsComment'>
					<Control ID='txtContractsComment'
						Type='cTextArea'
						Container='spnContractsComment'
						Cols='80'
						Rows='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OLAReview'>
					<Control ID='chkOLAReview'
						Container='spnOLAReview'
						Type='cCheckBox' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdministrativePlanReq'>
					<Control ID='ctlAdministrativePlanReq'
						Container='spnAdministrativePlanReq'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigAppReviewScore' DataObjectDefinitionKey='LscTigAppReviewScore' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetClearLink'>
					<Control ID='txtBudgetClearLink'
						Type='cTextBox'
						Container='spnBudgetClearLink'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='3'
							ErrorMessage='The score for "Displays a clear link between the specific project activities and the proposed budget items" must be a whole number between 0 and 3.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetAdequate'>
					<Control ID='txtBudgetAdequate'
						Type='cTextBox'
						Container='spnBudgetAdequate'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='3'
							ErrorMessage='The score for "Adequate to carry-out the project objectives and activities" must be a whole number between 0 and 3.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetReasonableCost'>
					<Control ID='txtBudgetReasonableCost'
						Type='cTextBox'
						Container='spnBudgetReasonableCost'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='3'
							ErrorMessage='The score for "Costs are reasonable, and does not include any expenses unrelated to the project" must be a whole number between 0 and .3'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetNarrativeSupports'>
					<Control ID='txtBudgetNarrativeSupports'
						Type='cTextBox'
						Container='spnBudgetNarrativeSupports'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='6'
							ErrorMessage='The score for "The Budget Narrative supports all costs included in the budget and explains how the costs of goods and services were determined" must be a whole number between 0 and 6.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetSupportFromOther'>
					<Control ID='txtBudgetSupportFromOther'
						Type='cTextBox'
						Container='spnBudgetSupportFromOther'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='3'
							ErrorMessage='The score for "BONUS: Shows support from other funding sources" must be a whole number between 0 and 3.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		
		<DataObject Key='NoContracts' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='LscTigBudget' />
				</Argument>
				<Argument PropertyKey='LscTigBudgetTypeID' Value="1" >
					<RelatedProperty PropertyKey='LscTigBudget' />
				</Argument>
				<Argument PropertyKey='Amount' Value='0' Operator='GreaterThan' />
				<Argument PropertyKey='SortOrder' Value='9' >
					<RelatedProperty PropertyKey='BudgetCategory'/>
				</Argument>
				<Argument PropertyKey='LscTigBudgetFundingTypeID' Value='1' />
			</Filters>
			 <DisplayProperties>
			 </DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscTigContract' DataObjectDefinitionKey='LscTigContract' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		    </Filters>
		    <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlContracts'
						Container='spnContracts'
						Type='cDataPresenterList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_ApplReview/Forms/Open_Repl_WebImpr/ContractsItem.ascx'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='ReportingExpenses' >
					<Control ID='spnReportingExpenses' 
					         Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StmtAdditionalFunds'>
					<Control ID='lblStmtAdditionalFunds'
						Type='cLabel'
						Container='spnStmtAdditionalFunds'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		
	</ModuleSection>
</span>