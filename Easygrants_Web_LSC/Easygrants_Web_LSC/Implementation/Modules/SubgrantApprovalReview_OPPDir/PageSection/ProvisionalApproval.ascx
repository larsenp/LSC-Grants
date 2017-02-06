<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="SeparatorHdg">Recommend for Provisional Approval</div>
<br />

<table width='800px' cellpadding="1" >
	<tr>
		<td colspan="2">
			<b>If recommending for provisional approval, provide the following details:</b>
		</td>
	</tr>
	<tr>
		<td valign="top" style="width:200px">
			<b>Rationale for provisional approval and list of necessary documents<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnProvisionalApprovalPendingItem'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Due date for submission<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnProvisionalDueDate'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Other Comments (optional)</b>
		</td>
		<td>
			<span runat='server' id='spnProvisionalcomments'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='LscWftaSubgrantReviewOPP' DataObjectDefinitionKey='LscWftaSubgrantReviewOPP' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
		    <DisplayProperties>
				<DisplayProperty PropertyKey='ProvApprPendingItem'>
					<Control ID='txtProvisionalApprovalPendingItem'
						Type='cTextArea'
						Container='spnProvisionalApprovalPendingItem'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProvApprDueDate'>
					<Control ID='txtProvisionalDueDate'
						Type='cDateTextBox'
						Container='spnProvisionalDueDate'
						DateFormatErrorMessage='"Due date for submission" must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='"Due date for submission" must be in mm/dd/yyyy format.'
						DateFormat='M/d/yyyy'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProvApprComments'>
					<Control ID='txtOverallComments'
						Type='cTextArea'
						Container='spnProvisionalcomments'
						Rows='5'
						Cols='80'/>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
