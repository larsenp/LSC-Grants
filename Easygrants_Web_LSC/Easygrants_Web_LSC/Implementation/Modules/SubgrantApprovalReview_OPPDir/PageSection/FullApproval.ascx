<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class="SeparatorHdg">Recommend for Full Approval</div>
<br />
<p><b>Overall Comments</b></p>
<p><span runat='server' id='spnOverallComments'/></p>
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
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='LscWftaSubgrantReviewOPP' DataObjectDefinitionKey='LscWftaSubgrantReviewOPP' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FullApprRecommendReportingReqs'>
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
				<DisplayProperty PropertyKey='FullApprReportInfo'>
					<Control ID='txtReportInfo'
						Type='cTextArea'
						Container='spnReportInfo'
						Rows='4'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FullApprIntervalMonths'>
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
				<DisplayProperty PropertyKey='FullApprReportDueDate'>
					<Control ID='txtReportDueDate'
						Type='cDateTextBox'
						Container='spnReportDueDate'
						DateFormat='M/d/yyyy'>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='FullApprComments'>
					<Control ID='txtOverallComments'
						Type='cTextArea'
						Container='spnOverallComments'
						Rows='5'
						Cols='80'/>
				 </DisplayProperty>
		    </DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
