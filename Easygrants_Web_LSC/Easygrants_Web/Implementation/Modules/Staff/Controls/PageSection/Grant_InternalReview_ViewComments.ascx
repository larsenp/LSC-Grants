<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrant_InternalReview_ViewComments" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->


<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='4' ><b>Task Information</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>
	<tr>
        <td valign="top" width='15%'><b>Task Name</b></td>
        <td width='25%'><span id='spnTaskName' runat='server'/></td>
        <td width='25%'>&nbsp;</td>
        <td width='35%'>&nbsp;</td>
    </tr>
    <tr>
        <td valign="top" width='15%'><b>Date Submitted</b></td>
        <td width='25%'><span id='spnDateSubmitted' runat='server'/></td>
        <td width='25%'><b>Submitted By</b></td>
        <td width='35%'><span id='spnSubmittedBy' runat='server'/></td>
    </tr>
</table>
<br/><br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Comments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td valign="top" width='15%'><b>Comments</b></td>
        <td><span id='spnComments' runat='server'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveAndClose'/>&nbsp;&nbsp;
		<span runat='server' id='spnCancel'/>
	</td>
</tr>

</table>
<br/>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=WfTaskAssignment&QueryStringKey=WfTaskAssignmentID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='lblPreviousTask'
						Container='spnTaskName'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmittedByUser.Person.LastNameFirstName'>
					<Control ID='lblSubmittedBy'
						Container='spnSubmittedBy'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmittedDate' Format='MM/dd/yyyy'>
					<Control ID='lblDateSubmitted'
						Container='spnDateSubmitted'
						Type='cLabel'/>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentReviewID' 
					PropertyKey='WfTaskAssignmentReviewID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' Bool=''/>
			</DefaultValues>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlComments'
						Container='spnComments'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='500'>
					</Control>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndReload'>			    					
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
								<Argument AttributeName='PageKey' Value='ProjectSummary'/>									
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
							</Parameters>							    					
						</Action>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
								<Argument AttributeName='PageKey' Value='ProjectSummary'/>									
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
				
	</ModuleSection>
<!-- End Embedded XML -->
</span>