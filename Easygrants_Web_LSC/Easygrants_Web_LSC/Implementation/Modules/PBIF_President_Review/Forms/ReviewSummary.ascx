<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<div style="width:800px">
	<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
	
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
		Src='Implementation/Modules/PBIF_President_Review/PageSection/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	
	<div class="SeparatorHdg">
		Application Score
	</div>
	
	<table style="margin-left:auto; margin-right:auto">
		<tr>
			<td>
				<b>Maximum Possible</b>
			</td>
			<td style='width:20px'>&nbsp;</td>
			<td>
				<b>Application Score</b>
			</td>
		</tr>
		<tr>
			<td style="text-align:center">
				<strong>100</strong>
			</td>
			<td></td>
			<td style="text-align:center">
				<strong><span runat='server' id='spnApplicationScore'/></strong>
			</td>
		</tr>
	</table>
	<br />
	<div class="SeparatorHdg">
		OPP Director Review
	</div>
	<table style="width:100%">
		<tr>
			<td style='width:250px'>
				<strong>Funding Recommendation</strong>
			</td>
			<td>
				<span runat='server' id='spnFundingRecommendationOPPDir'/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>Recommended Funding Amount</strong>
			</td>
			<td>
				<span runat='server' id='spnFundingAmountOPPDir'/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>Comments</strong>
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnOverallCommentOPPDir'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
	<div class="SeparatorHdg">
		President Recommendation
	</div>
	<table style="width:100%">
		<tr>
			<td>
				<b>Funding Decision</b>
			</td>
			<td>
				<span runat='server' id='spnWfTaskOutcomeID'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Funding Amount</b>
			</td>
			<td>
				<span runat='server' id='spnFundingAmount'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Overall Comments</b>
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnOverallComment'/>
			</td>
		</tr>
	</table>
	<br />
	
	<div width='100%' style="text-align:center" >
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>
	
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscProBonoScoreByApplication' DataObjectDefinitionKey='LscProBonoScoreByApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ApplicationScore' Format='0.0'>
					<Control ID='spnApplicationScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='OPPDirReviewWfta' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey='WfTaskID' Value='111'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnFundingRecommendationOPPDir'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscPbifProgReviewOPPDir' DataObjectDefinitionKey='LscPbifProgReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey="OPPDirReviewWfta" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundingAmount' Format='$0,0'>
					<Control ID='spnFundingAmountOPPDir'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='spnOverallCommentOPPDir'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlWfTaskOutcomeID'
						Type='cDropDown'
						Container='spnWfTaskOutcomeID'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument PropertyKey='WfTaskID' Value='113' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscPbifProgReview' DataObjectDefinitionKey='LscPbifProgReview' Updatable='True' CreateNew='True'>
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
						Rows='10'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundingAmount'>
					<Control ID='txtFundingAmount'
						Container='spnFundingAmount'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='Funding Amount must be a whole number.'
					    RegExErrorMessage='Funding Amount must be a whole number.'
					    Size='10'
					    MaxLength='9'/>
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
