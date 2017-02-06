<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->

<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			<p>
				Click <b>Guidelines</b> at left for instructions on preparing your uploads.
			</p>
			<p>
				All files must be in one of the following three formats. <i>Please make sure files are not password-protected.</i>
				<ul>
					<li>Microsoft Word for Windows, with a filename extension of .doc</li>
					<li>Rich Text Format, with a filename extension of .rtf.  Note that Macintosh, Linux, and other word processors
					will support this format</li>
					<li>Portable Document Format (Adobe), with a filename extension of .pdf</li>
				</ul>
			</p>
			<p>
				All upload files:
				<ul>
					<li>Must be no larger than 5MB <br>(approximately 200 pages without graphics; graphics will dramatically reduce the number of allowable pages)</li>
					<li>Must include all graphics, charts, and pictures as embedded elements</li>
				</ul>
			</P>
			<p>
				For each upload:
				<ul>
					<li>Click <b>Browse...</b> to find the file on your computer</li>
					<li>Double-click the filename in the dialog box that appears</li>
					<li>Click <b>Upload</b> when the filename is shown in the upload textbox</li> 
					<li>Click <b>View</b> to check that each file has been uploaded successfully</li>
				</ul>
			</P>			
		</td>
	</tr>
	<tr>
		<td>
			<a name='aUploadJust'></a>
			<span runat='server' id='spnUploadJust'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aUploadAbstract'></a>
			<span runat='server' id='spnUploadAbstract'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aUploadNarrative'></a>
			<span runat='server' id='spnUploadNarrative'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aUploadCV'></a>
			<span runat='server' id='spnUploadCV'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td>
			<a name='aUploadIRBApproval'></a>
			<span runat='server' id='spnUploadIRBApproval'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aUploadAddlMaterials'></a>
			<span runat='server' id='spnUploadAddlMaterials'/>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>	
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadJust'
						Type='cUpload'
						Container='spnUploadJust'
						Required='True'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='50'
								Bool=''
								Anchor='aUploadJust'/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>	
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadAbstract'
						Type='cUpload'
						Container='spnUploadAbstract'
						Required='True'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='51'
								Bool=''
								Anchor='aUploadAbstract'/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadNarrative'
						Type='cUpload'
						Container='spnUploadNarrative'
						Required='True'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='52'
								Bool=''
								Anchor='aUploadNarrative'/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadCV'
						Type='cUpload'
						Container='spnUploadCV'
						Required='True'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='53'
								Bool=''
								Anchor='aUploadCV'/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadIRBApproval'
						Type='cUpload'
						Container='spnUploadIRBApproval'
						Required='True'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='54'
								Bool=''
								Anchor='aUploadIRBApproval'/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AdditionalUploads'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>