<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="CreateAgreement.ascx.vb" Inherits="Easygrants_Web.Modules.ProgressReport.PageContent.cCreateAgreement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<br><br>
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<span id='spnPageContent' runat='server' />

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInformation' 
	Src='Implementation/Modules/Review/Controls/PageSection/GrantInformation.ascx'
	runat='server' />	
	

<br>

<table id="Table4" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Summary Documents</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table5" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td><span id='spnSummaryDocuments' runat='server'/></td>
	</tr>	
</table>

<br>	
<table width='100%' border='0'>
	<tr>
		<td class='SeparatorHdg' colspan='3'><b>Create Agreement</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td width='15%'><span id='spnCreateAgreementType' runat='server' /></td>
	    <td width='5%'>&nbsp;</td>
	    <td><span id='spnCreateGrantAgreement' runat='server' /></td>
	</tr>
</table>


<br>
<asp:Panel runat="server" ID="UploadDetailsPanel" Visible="true">
<table width='100%' border='0'>
	<tr>
		<td class='SeparatorHdg'><b>Upload Details</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><span runat='server' id='spnDataList' ></span>
			<asp:RequiredFieldValidator
				runat='server'
				id='valTemplateType'
				ControlToValidate='ctlCreateAgreementType'
				ErrorMessage='Agreement Type is required.'
				Display='None' Enabled='False'/>
			<asp:CustomValidator 
				id='valUpload'
				runat='server' Enabled='False'
				ErrorMessage='Upload is required.'
				OnServerValidate='ValidateUpload'
				Display='none'/>				
	    </td>
	</tr>
</table>
</asp:Panel>
<!-- The below code has been comented because, earlier after the word merge document is created , 
	 the user has to manually add the document using Upload control.
	 but now the every thing is handeled automaticaly. so no need of Upload control. instead of Upload control, we need to display in datalist. 
<asp:Panel runat="server" ID="UploadPanel" Visible="true"> 
<span runat='server' id='spnAgreementUpload'/> 
		
<br><br>
</asp:Panel> -->
<table id="Table11" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Complete Review</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
        <td>You can go in and out of this review task as many times as desired until you are ready to submit. To save the changes, click <b>Save</b>. The task will be displayed in the Personal Tasks section of the Home page until submission. To re-access the review, click on the task name link.</td>
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnSaveAndClose" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		
		<DataObject Key='CASubmittedFilesPDF' DataObjectDefinitionKey='SummaryDocuments'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
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
						<DisplayProperty PropertyKey='ProjectTaskPdfDesc' ColumnHeader='Document Title' Width='40%'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Submitted By' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='20%'/>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Submitted Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='20%'/>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCreateAgreementType'
						Container='spnCreateAgreementType'
						Type='cDropDown'
						DataObjectDefinitionKey='SubmittedFile'
						StoredValue='SubmittedFileID'
						DisplayText='Select Agreement Type'
						DisplayValue='UploadTitle'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='QueryBaseTypeID' Value='2' />
							<Argument Type='' TypeKey='' PropertyKey='WordMergeTemplateTypeID' Value='1' />
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>			
		</DataObject>				
		
  
		
		<DataObject Key='SubmittedFileCreateAggrementList' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='ModuleUser'  TypeKey='GranteeProjectID' PropertyKey='EntityID' Value='' Bool=''/>
				<Argument PropertyKey='FileTypeID' Value='61' Bool='And'/>
				<Argument PropertyKey='EntityID' Value='0' Bool='And' Operator='NotEqual' />
			</Filters>			
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File/Document Name' Width='40%'>
							<Control ID='btnView' Type='cLink' >
								<Action PostBack='True' Object='DataPresenter' Method='DocumentList_ViewUploadedFile'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName' ColumnHeader='Uploaded By'  Width='20%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' Format='M/d/yyyy' ColumnHeader='Uploaded Date'  Width='20%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='3' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Properties'>
								<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CreateAgreementUploadsEditor'/>										
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
										<Argument Type='' TypeKey='Description' AttributeName='Description' BaseValue='Description=True'/>																			
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
								<Action PostBack='True' Object='DataPresenter' Method='DocumentList_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='ctlCreateGrantAgreement'
					    Container='spnCreateGrantAgreement'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateGrantAgreement'>
							<Parameters>								
								<Argument Type='Control' TypeKey = 'ctlCreateAgreementType' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='' TypeKey='' Value='8'/>
								<Argument Type='ModuleUser' TypeKey='PersonID' Value=''/>
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
						Type='cButton'
						Image='Save and Close'>
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
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

<!-- End Embedded XML -->