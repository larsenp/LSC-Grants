<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGrant_Attachment" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx' Properties='HeaderText= '
	runat='server'/>

<br />
<br />

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='GrantsVirtualFile' LinkTitle='Grant Documents' runat='server'/>
	<a name='View'></a>

<br />
<br />

<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<br />	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Summary Documents</b>
		</td>
	</tr>	
</table>

<table id="Table1" width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td height='6px' /></tr>
	<tr><td colspan='2'>To view a document in .pdf format, click the corresponding <b>View</b> button.</td></tr>
	<tr>
		<td><span runat='server' id='spnSummaryDocuments'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3">
	<tr>
		<td class="SeparatorHdg">
			<b>Submitted Documents</b>
		</td>
	</tr>	
</table>

<table width='100%'>
	<tr><td height='6px' /></tr>
	<tr><td colspan='2'>To view a document in its original file format, click the corresponding <b>File Name</b>.</td></tr>
	<tr>
		<td><span runat='server' id='spnSubmittedFiles'/></td>
	</tr>
</table>

<Core:cUserCtlLoader ID="CUserCtlLoader4" CtlID='ctlWordMergeDocList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantWordMergeDocuments.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader5" CtlID='ctlDocumentList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantUploads.ascx'
	Properties='FileTypeID=27&Title=Attachments'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader6" CtlID='ctlPublicationDocsList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPublicDocumentList.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader7" CtlID='ctlPublications' 
	Src='EasyGrants/Controls/PageSection/PublicationsList.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='SubmittedFiles' DataObjectDefinitionKey='SubmittedFiles'>
			<!--Changed filtering to allow for milestone report uploads to appear in list. -->
			<Filters>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Bool=''/>
			    <Argument Group='(' Bool='And' />
			    <Argument PropertyKey='EntityDataobjectKey' Operator='Equal' Value='WfTaskAssignment' Bool='' />
			    <Argument PropertyKey='EntityDataobjectKey' Operator='Equal' Value='LscMilestone' Bool='Or' />
			    <Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SubmitDate'>	
					<RelatedProperty PropertyKey='SubmittedFile'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubmittedFiles'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFiles'
						NoRecordMessage='No Submitted Documents for this Grant'
						Container='spnSubmittedFiles'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='UploadName' ColumnHeader='Description' NullDisplay='' Width='34%'>
							<Sortable>
								<Argument PropertyKey='UploadName'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.SubmitDate' ColumnHeader='Submitted Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='20%'>
							<Sortable>
								<Argument PropertyKey='SubmitDate'>	
									<RelatedProperty PropertyKey='SubmittedFile'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.UploadedBy.LastNameFirstName' ColumnHeader='Submitted By' NullDisplay='Not Applicable' Width='15%'>
							<Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='SubmittedFile.UploadedBy'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='SubmittedFile.UploadedBy'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.SourceFileName' ColumnHeader='File Name' NullDisplay='Not Applicable' Width='31%'>
							<Control ID='btnViewRawFile'
								Type='cLink'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
								</Action>	
							</Control>
							<Sortable>
								<Argument PropertyKey='SourceFileName'>
									<RelatedProperty PropertyKey='SubmittedFile'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<!-- <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='13    %'> -->
							<%-- <Control ID='btnViewRawFile'
								Type='cLink'
								Caption='View'>
								<Action ID='View' Target='_blank' URL='../../../Core/Controls/Base/pgUploadSrcReader.aspx' >
								</Action>	
							</Control> --%>
							
						<!--	<Control ID='btnViewRawFile'
								Type='cButton'
								Image='View'>
								<Action PostBack='True'
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
					
			</DisplayProperties>			
				
		</DataObject>
		
		<DataObject Key='SubmittedFilesPDF' DataObjectDefinitionKey='LscSummaryDocuments'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Bool=''/>
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
						<DisplayProperty PropertyKey='DocumentTitle' ColumnHeader='Document Type' Width='34%'>
							<Sortable>
								<Argument PropertyKey='DocumentTitle'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Document Generation Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='15%'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Task Assigned To' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='38%'>
							<Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='13%' >
							<Control ID='btnViewPDF'
								Type='cLink'
								Caption='View'>
								<Action ID='View' Target='_blank' URL='../../../Core/Controls/Base/pgReportOutputReader.aspx' >
								</Action>
							</Control>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>	
					
			</DisplayProperties>			
				
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
	