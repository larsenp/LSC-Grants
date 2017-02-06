<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
		Src='Implementation/Modules/PBIF_OPP_Dir_Review/PageSection/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div class="SeparatorHdg" style="width:100%">
		Primary Review Scores
	</div>
	<Core:cUserCtlLoader CtlID='ctlPrimaryScores' 
		Src='Implementation/Modules/PBIF_OPP_Dir_Review/PageSection/PrimaryReviewScores.ascx'
		runat='server'/>
	<div class="SeparatorHdg" style="width:100%">
		Secondary Review Scores
	</div>
	<Core:cUserCtlLoader CtlID='ctlSecondaryScores' 
		Src='Implementation/Modules/PBIF_OPP_Dir_Review/PageSection/SecondaryReviewScores.ascx'
		runat='server'/>
				
	<div class='SeparatorHdg'>
		Application Score
	</div>
	<table style="width:100%">
		<tr>
			<td style="width:25%">&nbsp;
				
			</td>
			<td style="width:15%">
				<b>Maximum possible</b>
			</td>
			<td style="width:15%">
				<b>Application Score</b>
			</td>
			<td style="width:45%">&nbsp;
				
			</td>
		</tr>
		<tr>
			<td style="width:25%">
				<strong>Raw Score</strong>
			</td>
			<td style="width:15%">
				<b><span runat='server' id='spnMaxScore'/></b>
			</td>
			<td style="width:15%">
				<b><span runat='server' id='spnRawScore'/></b>
			</td>
			<td style="width:45%">&nbsp;
				
			</td>
		</tr>
		<tr>
			<td style="width:25%">
				<strong>Weighted Score</strong>
			</td>
			<td style="width:15%">
				<strong>100</strong>
			</td>
			<td style="width:15%">
				<b><span runat='server' id='spnApplicationScore'/></b>
			</td>
			<td style="width:45%">&nbsp;
				
			</td>
		</tr>
	</table>
	<br />
	<div class='SeparatorHdg'>
		Management Recommendations
	</div>
	<table style="width:100%">
		<tr>
			<td>
				<b>Funding Recommendation</b>
			</td>
			<td>
				<span runat='server' id='spnWfTaskOutcomeID'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Recommended Funding Amount</b>
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
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Name</b>
			</td>
			<td >
				<span runat='server' id='spnReviewerPersonID'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Date</b>
			</td>
			<td>
				<span runat='server' id='spnReviewDate'/>
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
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='MaxScore'>
					<Control ID='spnMaxScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RawScore'>
					<Control ID='spnRawScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplicationScore' Format='0.0'>
					<Control ID='spnApplicationScore'
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
							<Argument PropertyKey='WfTaskID' Value='111' />
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
					    DecimalErrorMessage='Recommended Funding Amount must be a whole number.'
					    RegExErrorMessage='Recommended Funding Amount must be a whole number.'
					    Size='10'
					    MaxLength='9'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewerPersonID'>
					<Control ID='txtReviewerPersonID'
						Container='spnReviewerPersonID'
						Type='cDropDown'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='3' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewDate'>
					<Control ID='txtReviewDate'
						Container='spnReviewDate'
						Type='cDateTextBox'
						Calendar='True'/>
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
