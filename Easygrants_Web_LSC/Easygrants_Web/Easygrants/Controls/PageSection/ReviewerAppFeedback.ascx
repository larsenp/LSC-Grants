<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for Additional information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Reviewer Feedback</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnNoRequests' ></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewFeedbackToApplicant' DataObjectDefinitionKey='ReviewFeedbackToApplicant'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='AppWfTaskAssignmentID'
					Value='' 
					bool=''/>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='Comment'
					Operator='NotEqual'
					Value='' 
					bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Comment' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='lblNoRequests'
						Container='spnNoRequests'
						Type='cLabel'
						LabelText='No reviewer-to-applicant feedback has been entered.'>
						<Visible>
							<Argument PropertyKey='Comment' NullDataObject='True' Operator='Equal' Value='' />
						</Visible>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewFeedbackToApplicant'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Comment' ColumnHeader='Comment'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	