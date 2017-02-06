<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="InternalReview.ascx.vb" Inherits="Implementation.Modules.Review.Controls.Page.cInternalReviewImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<span id='spnPageContent' runat='server' />


<Core:cUserCtlLoader CtlID='ctlGrantInformation' 
	Src='Implementation/Modules/Review/Controls/PageSection/GrantInformation.ascx'
	runat='server' />	
	

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Task Information</b></td>
	</tr>	
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
    <tr>
        <td width='15%'><b>Task</b></td>
        <td width='35%'>
			<span id='spnTaskName' runat='server'/>
		</td>
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
</table>


<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Summary Documents</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>To view any of the documents in their original format, click <b>View</b>.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td><span id='spnSummaryDocuments' runat='server'/></td>
	</tr>	
</table>


<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Submitted Documents</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>To view any of the documents in their original format, click <b>File Name</b>.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td><span id='spnSubmittedDocuments' runat='server'/></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Resubmission Request</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id='spnAddResubmission' runat='server'/></td></tr>
</table>

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Outcome</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td valign="top" width='15%'><b>Internal Review Task</b></td>
        <td width='35%'><span id='spnInternalReviewTask' runat='server'/></td>
        <td valign="top" width='15%'><b>Outcome</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td width='35%'><span id='spnOutcome' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
		<td valign="top" width='15%'><b>Task Being Reviewed</b></td>
        <td width='35%'><span id='spnTaskBeenReviewed' runat='server'/></td>
        <td valign="top" width='15%'><b>Outcome</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td width='35%'><span id='spnTaskBeenReviewedOutcome' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td valign="top" width='15%'><b>Comments</b></td>
        <td colspan='3'><span id='spnOutcomeComments' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top" width='15%'><b>&nbsp;</b></td>
        <td colspan='3'>Limit: 500 characters</td>
    </tr>	
</table>

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Complete Review</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
        <td>You can go in and out of this review task as many times as desired until you are ready to submit. To save the changes, click <b>Save</b> or <b>Save and Close</b>. The task will be displayed in the Personal Tasks section of the Home page until submission. To re-access the review, click on the task name link.  </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>To complete the review, click <b>Submit</b>.</td>
    </tr>	
</table>
<table id='tblButtons' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='True'>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSave" />
			<span runat='server' id="spnSaveAndClose" />
			<span runat='server' id="spnCancel" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSubmit" />
		</td>
	</tr>
</table>
	
<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectTask.Description'>
					<Control ID='spnInternalReviewTask'
							Type='HtmlGenericControl'/>					
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
		
		<DataObject Key='WfTaskAssignment1' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='AppWftaID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectTask.Description'>
					<Control ID='spnTaskName'
							Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectTask.Description'>
					<Control ID='spnTaskBeenReviewed'
							Type='HtmlGenericControl'/>
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
		
		<DataObject Key='WfTaskAssignment2' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='AppWfta.WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlTaskBeenReviewedOutcome'
						Container='spnTaskBeenReviewedOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						RequiredField='True'
						ErrorMessage='Task Being Reviewed Outcome is required.'
						StoredValue='WfTaskOutcomeID'
						DisplayText='Select'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='AppWfta.WfTaskID' PropertyKey='WfTaskID' Value='' />
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />	
						</Sort>
					</Control>
				</DisplayProperty>		
		
			</DisplayProperties>	
		</DataObject>
		
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='EntityDataObjectKey' Operator='Equal' Value='WfTaskAssignment' Bool='And' />
			</Filters>	
			<DisplayProperties>	
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDocumentList'
						Container='spnSubmittedDocuments'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						NoRecordMessage='No Submitted Documents for this Grant'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='TaskUploadType.Upload.UploadName' ColumnHeader='Type' Width='39%'>
						     <Sortable>
								<Argument PropertyKey='UploadName'>	
									<RelatedProperty PropertyKey='TaskUploadType.Upload'/>
								</Argument>								
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File/Document Name' Width='26%'>
							<Control ID='btnView'
								Type='cLink'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						    <Sortable>
								<Argument PropertyKey='SourceFileName'>	
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName' ColumnHeader='Uploaded By'  Width='15%'>
						    <Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='UploadedBy'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='UploadedBy'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy'  Width='20%'>
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
				<!--    <DisplayProperty PropertyKey='' Width='20%' >
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> -->
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReportOutputOpen'
						Type='cFileUploadOpen'
						Container='spnReportOutputOpen'
					/>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFilesPDF' DataObjectDefinitionKey='SummaryDocuments'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ProjectTaskPdfDesc' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubmittedFilesPDF'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SummaryDocuments'
						NoRecordMessage='No Summary Documents for this Grant'
						Container='spnSummaryDocuments'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ProjectTaskPdfDesc' ColumnHeader='Document Title' Width='40%'>
							<Sortable>
								<Argument PropertyKey='ProjectTaskPdfDesc'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Submitted By' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Submitted Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='20%'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='' Width='20%' >
							<Control ID='btnViewPDF'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewPDF'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='EntityID' AttributeName='EntityID='/>
											<Argument Type='DataObject' TypeKey='DefinitionID' AttributeName='DefinitionID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>			
		</DataObject>
		
		
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View~'>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='ReportOutputLink' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		
		
		
		<DataObject Key='WfTaskAssignmentOutcome' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='SubmittedBy' Update='True' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='SubmittedDate' Update='True' Create='True'/> 
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlReportOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						RequiredField='True'
						ErrorMessage='Internal Review Task Outcome is required.'
						StoredValue='WfTaskOutcomeID'
						DisplayText='Select'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />	
						</Sort>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>	
		</DataObject>
		
		
		
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlOutcomeComments'
						Container='spnOutcomeComments'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='500'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='URL' TypeKey='PathAndQuery'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton' Caption='Save and Close'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Confirmation='Are you sure you want to submit this review?'
						Image='Submit'>
						<Action
							AutoSave='True'
							PostBack='True'
							Object='DataPresenter'
							Method='Submit' />
					</Control>						
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddResubmission'
						Container='spnAddResubmission'
						Type='cButton'
						Image='Add'>
						<Action
							AutoSave='True'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Resubmission'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

<!-- End Embedded XML -->