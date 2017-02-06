<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.Controls.Page.cPanelReviewCommentsEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!--Instructions-->
<table id='tabComments' border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td>
			You may use this page to enter comments regarding this application. The Prior Comments section at the bottom of 
			this page displays all comments that you entered for this applicant during previous review stages. If you enter 
			content into the field below, you must click the <B>Save</B> button to save your data. When you are finished, you can 
			click <B>Close</B> to return to the Review list page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Panel Review Comment</b></td>
	</tr>
	<tr>
		<td>
			<B>Applicant Name:</B> <span id='spnApplicantName' runat='server'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span id='spnComments' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			Limit your critique to 4000 characters including punctuation. Note that 
			after two hours of inactivity your session will time out.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Prior Comments</b></td>
	</tr>
	<tr id='trNoComments' visible='true'>
		<td><i>No prior comments have been entered for this applicant.</i></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>	
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>	
			<Filters>	
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlComments'
						Container='spnComments'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='4000'
						RequiredField='True'
						ErrorMessage='Comment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,4000}$' ErrorMessage='Limit your Comments to 4000 characters or less.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<!-- Save, Close buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							AutoSave='True'
							PostBack='True'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							AutoSave='False'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PanelReview'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->