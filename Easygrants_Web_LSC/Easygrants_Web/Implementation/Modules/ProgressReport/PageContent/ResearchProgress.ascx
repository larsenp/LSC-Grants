<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />

<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnUploadRefLtr'/>
		</td>
	</tr>					
</table>
<center>
<table>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
		<td>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>	
	
</table>
</center>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<!-- : UploadRefLtr -->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadRefLtr'
						Type='cUpload'
						Container='spnUploadRefLtr'>
						<InstructionHtml>
							<p>
							<b>Upload files must be not larger than 7 MB and <b>must not exceed 3 pages</b>. 
							Easygrants&reg; uses pop-up functionality. This functionality must be enabled. (i.e., turn off pop-up blockers.)</b>
							</p>
							<p>
								Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click Open.  Once the filename is in the field below, click the <b>Upload</b> button.</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, you must click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='62'
								Bool=''/>
							<Argument Type='ModuleUser' 
								TypeKey='GranteeProjectID'
								PropertyKey='EntityAssocID'
								Bool=''/>	
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,pdf,rtf,docx'
								ErrorMessage='Error : Only files with extension .doc, .pdf, .rtf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Save='True'
						Image='Save_and_Continue'
						GoToNextPage='True'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
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
</span>
