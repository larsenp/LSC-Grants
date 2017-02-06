<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr.cReviewSummary" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Review Summary</div>
<br />
<b>Grant Request Amount: </b><span runat='server' id='spnGrantRequest' />
<br /><br />
<div class='MinorSeparatorHdg'>Recommendations from Other Reviewers</div>
<br />
<span runat='server' id='spnOverallCommentOther' />
<br />
<div class='MinorSeparatorHdg'>Your Recommendations</div>
<br />
<table cellpadding='1'>
	<tr>
		<td>
			<b>Funding Recommendation</b>
		</td>
		<td>
			<span runat='server' id='spnLscTigFundingRecommendationID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Recommended Funding Amount</b> 
		</td>
		<td>
			<span runat='server' id='spnRecommendedFundingAmount' />
		</td>
	</tr>
</table>
 <br />

<b>Overall Comments</b><br />
<span runat='server' id='spnOverallComment' />
<br />
<br />
<br />
<p><span runat='server' id='spnDataEntryCompleted' /><b>  Completed Data Entry</b></p>
<br />
<br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
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

		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOverallCommentOther'
						Type='cDataListCtl'
						Container='spnOverallCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='LscTigFundingRecommendation.Description' ColumnHeader='Funding Recommendation' />
						<DisplayProperty PropertyKey='RecommendedFundingAmount' ColumnHeader='Recommended Funding Amount' Format='$#,0'/>
						<DisplayProperty PropertyKey='OverallComment' ColumnHeader='Comment' >
							<Control ID='lblOverallComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextArea'
						Container='spnOverallComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFundingAmount'>
					<Control ID='txtRecommendedFundingAmount'
						Container='spnRecommendedFundingAmount'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='Recommended Funding Amount must be a whole number.'
					    RegExErrorMessage='Recommended Funding Amount is required.'
					    Size='10'
					    MaxLength='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigFundingRecommendationID'>
					<Control ID='ctlLscTigFundingRecommendationID'
						Type='cDropDown'
						Container='spnLscTigFundingRecommendationID'
						DataObjectDefinitionKey='LscTigFundingRecommendation'
						DisplayValue='Abbr'
						StoredValue='LscTigFundingRecommendationID' >
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataEntryCompleted'>
					<Control ID='chkLowNonLscFund'
						Type='cCheckBox'
						Container='spnDataEntryCompleted' />
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
