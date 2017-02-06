<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="SeparatorHdg">Recommend for Partial Approval</div>
<br />

<table width='600px' cellpadding="1">
	<tr>
		<td colspan="2">
			<b>If recommending for Partial approval, provide the following details:</b>
		</td>
	</tr>
    <tr>
		<td colspan="2" valign="top">
			<b>Partial approval is recommended due to the following concerns <font color='red'>*</font></b>
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
			<b>Start Date<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnRevisedStartDate'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>End Date<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnRevisedEndDate'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Subgrant Amount<font color='red'>*</font></b>
		</td>
		<td>
			$<span runat='server' id='spnRevisedSubgrantAmount'/>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td valign="top">
			<b>Recommend Reporting Requirements?<font color='red'>*</font></b>
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
	<tr>
		<td>
			<b>Other Comments (optional)</b>
		</td>
		<td>
			<span runat='server' id='spnPartialRecComments'/>
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWftaSubgrantReviewOPP' DataObjectDefinitionKey='LscWftaSubgrantReviewOPP' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PartialApprRecommendConcerns'>
					<Control ID='txtPartialApprovalConcerns'
						Type='cTextArea'
						Container='spnPartialApprovalConcerns'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprRevisedStartDate'>
					<Control ID='txtRevisedStartDate'
						Type='cDateTextBox'
						Container='spnRevisedStartDate'
						DateFormatErrorMessage='Start Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Start Date must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprRevisedEndDate'>
					<Control ID='txtRevisedEndDate'
						Type='cDateTextBox'
						Container='spnRevisedEndDate'
						DateFormatErrorMessage='End Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='End Date must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprRevisedSubgrantAmt'>
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
				<DisplayProperty PropertyKey='PartialApprRecommendReportingReqs'>
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
				<DisplayProperty PropertyKey='PartialApprReportInfo'>
					<Control ID='txtReportInfo'
						Type='cTextArea'
						Container='spnReportInfo'
						Rows='4'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprIntervalMonths'>
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
				<DisplayProperty PropertyKey='PartialApprReportDueDate'>
					<Control ID='txtReportDueDate'
						Type='cDateTextBox'
						Container='spnReportDueDate'
						DateFormatErrorMessage='"Due date of first report" must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='"Due date of first report" must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartialApprComments'>
					<Control ID='txtOverallComments'
						Type='cTextArea'
						Container='spnPartialRecComments'
						Rows='5'
						Cols='80'/>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
