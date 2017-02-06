<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="True" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<!--Instructions-->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td>Enter your review comments for this application below.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Comments</b></td>
	</tr>
	<tr>
		<td><B>Institution:</B> <span id='spnInstitution' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnComments' runat='server'/></td>
	</tr>
	<tr>
		<td>Limit your critique to 4000 characters including punctuation.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!--Save/Close-->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveReturn'/>&nbsp;&nbsp;&nbsp;&nbsp;
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
				<DisplayProperty PropertyKey='PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInstitution' Type='HtmlGenericControl'/>
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
						Rows='20'
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
						Image='Save' EnterKey='True'
						ToolTipText='Save and stay on this page'>
						<Action
							AutoSave='True'
							PostBack='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveReturn'
						Container='spnSaveReturn'
						Type='cButton'
						Image='Save_And_Return_Arrow' 
						ToolTipText='Save page and return to the previous page'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURLWithAnchor'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								<Argument Type='Data' BaseValue='List'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'
						ToolTipText='Close without saving changes and return to previous page'>
						<Action
							AutoSave='False'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURLWithAnchor'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								<Argument Type='Data' BaseValue='List'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->