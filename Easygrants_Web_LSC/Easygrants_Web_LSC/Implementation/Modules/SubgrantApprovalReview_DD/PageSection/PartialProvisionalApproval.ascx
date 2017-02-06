<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="SeparatorHdg">Recommend for Partial and/or Provisional Approval</div>
<br />
<div class="MinorSeparatorHdg">Recommend for Partial Approval</div>
<br />
<table width='600px' cellpadding="1">
	<tr>
		<td colspan="2" valign="top">
			<b>Recommend for Partial Approval?</b>
		</td>
		<td>
			<span runat='server' id='spnRecommendPartialApproval'/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<b>If recommending for partial approval, provide the following details:</b>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top">
			<b>Partial approval is recommended due to concerns raised by</b>
		</td>
		<td>
			<span runat='server' id='spnPartialApprovalConcerns'/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<b>Revised Subgrant Terms</b>
		</td>
	</tr>
	<tr>
		<td width='20px'>&nbsp;</td>
		<td width="100px">
			<b>Start Date</b>
		</td>
		<td>
			<span runat='server' id='spnRevisedStartDate'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>End Date</b>
		</td>
		<td>
			<span runat='server' id='spnRevisedEndDate'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Subgrant Amount</b>
		</td>
		<td>
			$<span runat='server' id='spnRevisedSubgrantAmount'/>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td valign="top">
			<b>Recommend Reporting Requirements?</b>
		</td>
		<td>
			<span runat='server' id='spnRecommendReportingReqs'/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>If reporting requirements are recommended, provide the following details:</b>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<b>Information to be submitted</b>
		</td>
		<td>
			<span runat='server' id='spnReportInfo'/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>Reports are to be submitted every <span runat='server' id='spnReportIntervalMonths'/>months</b>
		</td>
	</tr>
	<tr>
		<td>
			<b>Due date of first report</b>
		</td>
		<td>
			<span runat='server' id='spnReportDueDate'/>
		</td>
	</tr>
</table>
<div class="MinorSeparatorHdg">Recommend for Provisional Approval</div>
<br />
<table width='600px' cellpadding="1" >
	<tr>
		<td valign="top" style='width:100px'>
			<b>Recommend for Provisional Approval?</b>
		</td>
		<td>
			<span runat='server' id='spnRecommendProvisionalApproval'/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>If recommending for provisional approval, provide the following details:</b>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<b>Rationale for provisional approval and list of necessary documents</b>
		</td>
		<td>
			<span runat='server' id='spnProvisionalApprovalPendingItem'/>
		</td>
	</tr>
	<tr>
		<td >
			<b>Due date for submission</b>
		</td>
		<td>
			<span runat='server' id='spnProvisionalDueDate'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWftaSubgrantReviewDD' DataObjectDefinitionKey='LscWftaSubgrantReviewDD' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecommendPartialApproval'>
					<Control ID='ctlRecommendPartialApproval'
						Type='cRadioButtonList'
						Container='spnRecommendPartialApproval'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprovalConcerns'>
					<Control ID='txtPartialApprovalConcerns'
						Type='cTextArea'
						Container='spnPartialApprovalConcerns'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevisedStartDate'>
					<Control ID='txtRevisedStartDate'
						Type='cDateTextBox'
						Container='spnRevisedStartDate'
						DateFormatErrorMessage='Start Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Start Date must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevisedEndDate'>
					<Control ID='txtRevisedEndDate'
						Type='cDateTextBox'
						Container='spnRevisedEndDate'
						DateFormatErrorMessage='End Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='End Date must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevisedSubgrantAmount'>
					<Control ID='txtRevisedSubgrantAmount' 
						Type='cMoneyTextBox' 
						Container='spnRevisedSubgrantAmount' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
						 CommaErrorMessage='Commas are incorrectly formatted in Subgrant Amount.'
					    Size='10'
					    MaxLength='9' 
					    DecimalErrorMessage='The Subgrant Amount must be a whole number.'
						 RegExErrorMessage='The Subgrant Amount must be a whole number.'
					    Format='#,0'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendReportingReqs'>
					<Control ID='ctlRecommendReportingReqs'
						Type='cRadioButtonList'
						Container='spnRecommendReportingReqs'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReportInfo'>
					<Control ID='txtReportInfo'
						Type='cTextArea'
						Container='spnReportInfo'
						Rows='4'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReportIntervalMonths'>
					<Control ID='txtReportIntervalMonths'
						Type='cTextBox'
						Container='spnReportIntervalMonths'
						Size='3'
						MaxLength='2'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='1'
							MaximumValue='99'
							ErrorMessage='The field "Reports are to be submitted every ... months" must be a whole number between 1 and 99.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReportDueDate'>
					<Control ID='txtReportDueDate'
						Type='cDateTextBox'
						Container='spnReportDueDate'
						DateFormatErrorMessage='"Due date of first report" must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='"Due date of first report" must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendProvisionalApproval'>
					<Control ID='ctlRecommendProvisionalApproval'
						Type='cRadioButtonList'
						Container='spnRecommendProvisionalApproval'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProvisionalApprovalPendingItem'>
					<Control ID='txtProvisionalApprovalPendingItem'
						Type='cTextArea'
						Container='spnProvisionalApprovalPendingItem'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProvisionalDueDate'>
					<Control ID='txtProvisionalDueDate'
						Type='cDateTextBox'
						Container='spnProvisionalDueDate'
						DateFormatErrorMessage='"Due date for submission" must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='"Due date for submission" must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
