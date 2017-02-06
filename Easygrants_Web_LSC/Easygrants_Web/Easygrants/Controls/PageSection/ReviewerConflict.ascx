<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReviewerConflict.ascx.vb" Inherits=".ReviewerConflict" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Conflict</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='3'>Enter your conflict reason and click the <b>Submit</b> button.  The Foundation 
	will be notified of the conflict and will reassign the application.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td/><td><b>Applicant</b></td>
		<td><span id='spnApplicantName' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td/><td><b><%=GetLabel("ProjectTitle")%></b></td>
		<td><span id='spnTitle' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td/><td><b>Conflict Reason</b></td>
		<td>
			<span id='spnConflictReason' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>	
		</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.GrantTitle'>
					<Control ID='spnTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='IsConflict' Value='True' Update='True'/>
				
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConflictReason'>
					<Control ID='ctlConflictReason'
						Container='spnConflictReason'
						Type='cTextArea'
						Rows='6'
						Cols='60'
						MaxLength='500'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,500}$' ErrorMessage='Limit your Reason to 500 characters or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Submit'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Main' />
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='IsConflict' NullDataObject='True' Operator='NotEqual' Value='True' />
						</Visible>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
