<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.LOI.Controls.PageSection.cUploads" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Uploads.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx'
				runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Control Label (for Publication upload) -->
<%--<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td>&nbsp;</td></tr>
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
			<a name='aUploadPubs'></a>
			<span runat='server' id='spnUploadPubs'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadPubsCV'/>
		</td>
	</tr>
</table>--%>

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server' ID="Table2">	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
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
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUpload'
						Container='spnUploadPubs'
						Required='True'>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='42'
								Bool=''/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf'
								ErrorMessage='Error : Only files with extension .doc, .rtf and .pdf are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadCV'
						Type='cUpload'
						Container='spnUploadPubsCV'
						Required='True'>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='43'
								Bool=''/>
							<Argument Type='ModuleUser' 
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf'
								ErrorMessage='Error : Only files with extension .doc, .rtf and .pdf are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>--%>
				<!-- to be implemented once approval is made for cSaveContinueButton changes, kda 6/5/06 -->
				<!-- 
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='False'
						Type='cSaveContinueButton'>
					</Control>	
				</DisplayProperty>
				-->				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Caption='Continue'
						GoToNextPage='True'
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