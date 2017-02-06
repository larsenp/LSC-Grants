<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cBudgetUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<p>Use this page to upload a document containing your budget justification. Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf. For more information on this format, click <a href='../../../Implementation/Modules/Application/Help/Help_SS_Budget.aspx' target='_blank'>View Budget Justification Guidelines</a>.</p>

<p>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td colspan='2'>
			<a name='aPICVUpload'></a>
			<span runat='server' id='spnPICVUpload'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/> &nbsp;&nbsp;
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
			<DataObject Key='CVUpload' DataObjectDefinitionKey=''>
				<DisplayProperties>		
					 
	
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlPICVUpload'
							Type='cUpload'
							Container='spnPICVUpload'>
							<InstructionHtml>
								<b>IMPORTANT:</b> After you have uploaded the file, <b>you must</b> click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.
							</InstructionHtml>
				
						
						<Parameters>
								<Argument PropertyKey='FileTypeID' 
									Value='32'
									Bool='and'/>
								<Argument Type='ModuleUser'
									TypeKey='WfTaskAssignmentID'
									PropertyKey='EntityAssocID'
									Value=''
									Bool='and'/>
								<Argument PropertyKey='FileExtensionList' 
									Value='doc,pdf,rtf,docx'
									ErrorMessage='Error : Only files with extension .doc, .pdf, .rtf or .docx are allowed.'
									Bool='and'/>
							</Parameters>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>	
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose'
							Container='spnClose'
							Type='cButton'
							Image='Close'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>	
								<Parameters>
									<Argument AttributeName='PageKey' Value='Main'/>
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>						
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>