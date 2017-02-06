<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="InternalReviewResubmission.ascx.vb" Inherits="Easygrants_Web.Modules.Review.Controls.Page.cInternalReviewResubmission" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td  class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td ><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader CtlID='ctlGrantInformation' 
	Src='Implementation/Modules/Review/Controls/PageSection/GrantInformation.ascx'
	runat='server' />	
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Task Information</b></td>
	</tr>	
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
    <tr>
        <td width='15%'><b>Task</b></td>
        <td width='35%'><span id='spnTaskName' runat='server'/></td>
        <td valign="top" width='15%'>
        			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Src='Core/Controls/Base/ReportOutputLink.ascx'
				runat='server' /></td>
        <td valign="top" width='35%'>&nbsp;</td>
       
    </tr>
     <tr>
        <td valign="top" width='15%'><b>Date Submitted</b></td>
        <td width='35%'><span id='spnDateSubmitted' runat='server'/></td>
        <td width='15%'><b>Submitted By</b></td>
        <td width='35%'><span id='spnSubmittedBy' runat='server'/></td>
    </tr>
    <tr>
        <td colspan='4'>&nbsp;</td>
    </tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td  class="SeparatorHdg"><b>Resubmission Requirements</b></td></tr>	
	<tr><td>Click the checkbox next to the page that needs to be resubmitted. 
	    To check all items, click <b>Check All</b>.  To clear all items, click <b>Clear All</b>.</td></tr>
	<tr>
		<td>
			<a href='javascript:CheckClearAll(true)'>Check All </a> &nbsp;&nbsp;<a href='javascript:CheckClearAll(false)'>Clear All</a> 
		</td>
	</tr>
	</td></tr>
	<tr><td><span id='spnResubmissionReqs' runat='server'/>
			<asp:CustomValidator 
				id='valResubmissionReqs'
				runat='server'
				OnServerValidate='ValidateResubmissionReqs'
				Display='none'/>
	</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td  class="SeparatorHdg" colspan='2'><b>Review and Invite for Resubmission</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Primary Contact/PI<b></td>
	    <td><span id='spnPrimaryContact' runat='server'/></td>
	 </tr>
	<tr><td><b>Email Address<b></td>
	    <td><span id='spnPrimaryEmail' runat='server'/></td>
	 </tr>
</table>
<table id='tblButtons' border='0' width='100%' cellpadding='2' runat='server'>
    <tr><td>&nbsp;</td></tr>
	<tr><td align='center'>
			<span runat='server' id="spnSave" />
			&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnSaveContinue" />
			&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnCancel" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskInformation' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WorkFlowBuilderList.PrevWfTask.WfTask'>
					<Control ID='spnTaskName' Type='HtmlGenericControl'/>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmittedDate' Format='M/d/yyyy'>
					<Control ID='spnDateSubmitted' 
							Type='HtmlGenericControl'/>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnSubmittedBy'
							Type='HtmlGenericControl'/>					
				</DisplayProperty>
				
			</DisplayProperties>	
		</DataObject>
		<DataObject Key='WfTaskAssignment1' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTask.WorkFlowBuilderList.PrevWfTask.WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
			</DisplayProperties>	
		</DataObject>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink' Type='cReportOutputLink' DisplayText='~View~'>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='ReportOutputLink' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''/>
							<Argument Type='DataObjectCollection' TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<!--If the WftaReopen data object does not already exist, it must be created by a DataObject element separate
		from the one containing the checkbox list representing the WftaReopenSection data objects. This is the only way
		that the section items represented by the checked checkboxes will be able to access the ID of the new 
		WftaReopenRequest object.-->
		<DataObject Key='WftaReopenRequestNew' DataObjectDefinitionKey='WftaReopenRequest' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='RequestingWfTaskAssignmentID'/>
				<Argument PropertyKey='Active' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReopenWfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='RequestingWfTaskAssignmentID'/>
				<Argument PropertyKey='Active' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReopenWfTaskAssignmentID'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='PersonID' PropertyKey='ReopenedTaskPersonID' Update='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate'/>
			</DefaultValues>
		</DataObject>
		<DataObject Key='WftaReopenRequest' DataObjectDefinitionKey='WftaReopenRequest' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='RequestingWfTaskAssignmentID'/>
				<Argument PropertyKey='Active' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReopenWfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WftaReopenSections'>
					<Control ID='ctlResubmissionReqs'
						Container='spnResubmissionReqs'
						Type='cWftaReopenCheckboxlist'
						StoredValue='SectionKey'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='WftaReopenRequestNew' DataObjectPropertyKey='WftaReopenRequestID' PropertyKey='WftaReopenRequestID'/>
							<Argument PropertyKey='SavedAfterReopen' Value='False'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save'>
						<Action PostBack='True' AutoSave='True' Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Resubmission'/>
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue' Container='spnSaveContinue' Type='cButton' Image='Save_and_Continue'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='InviteResumission'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>						
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewAndInvite' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='ctlLink' Container='spnPrimaryContact' Type='cLink' >
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Staff' />
								<Argument Type='' TypeKey = '' Value='ModuleConfig' />
								<Argument AttributeName='PageKey' Value='PersonContact'/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryPersonID' BaseValue='PersonID='/>
								<Argument Type='' TypeKey = '' Value='' />	
							</Parameters>
						</Action>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1'>
					<Control ID='ctlLink1' Container='spnPrimaryEmail' Type='cLink'>
								<Action PostBack='False' URL='Email'> </Action>
							</Control>					
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
