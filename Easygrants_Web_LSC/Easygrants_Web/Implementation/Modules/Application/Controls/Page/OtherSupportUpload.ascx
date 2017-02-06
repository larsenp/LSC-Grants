<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cOtherSupportUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="OtherSupportUpload.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- USER MODIFIABLE CONTENT AREA -->
<P>
Use this page to upload the following extracted pages from each active, 
approved or pending award listed on the Other Support List: summary/abstract, 
specific project aims, budget, and budget justification.
<p>
	<!-- Dashed list changed to a bulleted list by Basil Eliopoulos June 23, 2005 8:28 p.m. per QA task. -->
	<ul>
		<li>
			Click <b>Save and Continue</b>
		to save the information and proceed to the next page.
		<li>
			Click <b>Close</b> to return to the main Other Support page.</li>
	</ul>
<p>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Other Support</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellpadding='0' cellspacing='0' width='100%'>
		<tr>
			<td><b>Project Number or Award Name</b></td>
			<td><span runat='server' id='spnProjectNumber' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b>Source/Agency</b></td>
			<td><span runat='server' id='spnSource' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b>Principal Investigator</b></td>
			<td><span runat='server' id='spnInvestigator' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b>Applicant's Role in Project</b></td>
			<td><span runat='server' id='spnApplicantRole' /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>Status</b></td>
			<td><span runat='server' id='spnStatus'/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>Title of Project</b></td>
			<td><span runat='server' id='spnProjectTitle' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b>Dates of Award</b></td>
			<td><span runat='server' id='spnStartDate' />&nbsp;&nbsp;to&nbsp;&nbsp;<span runat='server' id='spnEndDate' /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>Average Annual Amount</b></td>
			<td><span runat='server' id='spnAnnualAmount'/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>Annual Direct Costs</b></td>
			<td><span runat='server' id='spnDirectCost'/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>Total Amount of Award</b></td>
			<td><span runat='server' id='spnTotal' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b>Amount Available to Applicant</b></td>
			<td><span runat='server' id='spnAmountAvailable'/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<a name='aPICVUpload'></a><span runat='server' id='spnPICVUpload' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align='center'>
				<span runat='server' id='spnSave_and_Continue'/> &nbsp;&nbsp;
				<span runat='server' id='spnCancel' />
			</td>
		</tr>
	</table>
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
			<DataObject Key='GranteeProjectOtherSupport' DataObjectDefinitionKey='GranteeProjectOtherSupport'>
				<Filters>
					<Argument Type='QueryString' TypeKey='GranteeProjectOtherSupportID' PropertyKey='GranteeProjectOtherSupportID'
						Value='' Bool='' />
				</Filters>
				<DisplayProperties>
					<DisplayProperty PropertyKey='ProjectNumber'>
						<Control ID='spnProjectNumber' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='Source'>
						<Control ID='spnSource' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='Investigator'>
						<Control ID='spnInvestigator' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='ProjectTitle'>
						<Control ID='spnProjectTitle' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='StartDate' Format='M/d/yyyy'>
						<Control ID='spnStartDate' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='EndDate' Format='M/d/yyyy'>
						<Control ID='spnEndDate' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='Total' Format='$#,##0.##'>
						<Control ID='spnTotal' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='ApplicantRole'>
						<Control ID='spnApplicantRole' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='OtherSupportStatus.Description'>
						<Control ID='spnStatus' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='AnnualAmount' Format='$#,##0.##'>
						<Control ID='spnAnnualAmount' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='DirectCost' Format='$#,##0.##'>
						<Control ID='spnDirectCost' Type='HtmlGenericControl' />
					</DisplayProperty>
					<DisplayProperty PropertyKey='AmountAvailable' Format='$#,##0.##'>
						<Control ID='spnAmountAvailable' Type='HtmlGenericControl' />
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
			<DataObject Key='CVUpload' DataObjectDefinitionKey=''>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlPICVUpload' Type='cUpload' Container='spnPICVUpload'>
							<InstructionHtml>
								<p>
									Upload your summary/abstract, specific aims, budget and budget
									justification pages.  Uploaded files should be no larger than 5 MB
									and have the following file extensions: .doc, .rtf. or .docx</p>
								<p>
									<b>IMPORTANT:</b> After you have uploaded
									the file, <b>you must</b> click the <b>View</b> button to view the
									document as it has been converted.  If there were any conversion
									errors, you will see a screen with details.</p>
							</InstructionHtml>
							<Parameters>
								<Argument PropertyKey='FileTypeID' Value='31' Bool='and' Anchor='aProjectDescription' />
								<Argument Type='QueryString' TypeKey='GranteeProjectOtherSupportID' PropertyKey='EntityAssocID'
									Value='' Bool='and' />
								<Argument PropertyKey='FileExtensionList' Value='doc,rtf,docx' ErrorMessage='Error : Only files with extension .doc, .rtf or .docx are allowed.'
									Bool='and' />
							</Parameters>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_continue'
							Container='spnSave_and_Continue'
							Type='cButton'
							Image='Save_and_Continue'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								</Parameters>							
							</Action>
						</Control>	
					</DisplayProperty>			
					<DisplayProperty PropertyKey=''>
						<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
		</ModuleSection>
		<!-- End Embedded XML -->
	</span>
