<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cPeerReviewCritique" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->    
 <br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			You may use this page to enter your critique narrative for this applicant.  If you enter 
			comments into the field below, you must click the <b>Save</b> button to save your data.  When you 
			are finished, you can click <b>Close</b> to return to the Review list page.  Please note that 
			following the funding decision, scores and critiques are published annonymously for applicants 
			to read.     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Critique Text</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><span id='spnPeerCritique' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td><td class='FieldLabel'>Please limit your critique to 5000 characters including punctuation.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td>
			<span runat='server' id='spnSave' />
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentReviewID' PropertyKey='WfTaskAssignmentReviewID' Value='' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PeerCritique'>
					<Control ID='ctlPeerCritique'
						Container='spnPeerCritique'
						Type='cTextArea'
						Rows='15'
						Cols='90'
						MaxLength='5000'
						RequiredField='False'
						ErrorMessage='Critique Text is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,5000}$' ErrorMessage='Limit your Critique to 5000 characters (approximately 500 words) or less.' />
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Save'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
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
</span>


