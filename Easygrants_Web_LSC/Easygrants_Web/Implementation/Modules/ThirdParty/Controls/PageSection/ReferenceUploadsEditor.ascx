<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ThirdParty.Controls.PageSection.cReferenceUploadsEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnUpload'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td align="center"></td></tr>
</table>
<table id="Table2" align='center' cellspacing='0' border='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnContinue'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='UploadedByID' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUploadNew'
						Container='spnUpload'>
						<Parameters>
							<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityAssocID' Bool=''/>
							<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
							<Argument Type='QueryString' TypeKey='Description' PropertyKey='Description' Bool=''/>
							<Argument PropertyKey='Description' Value='True'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
			   <DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action PostBack='True' AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='LetterSubmission'/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
</ModuleSection>
</span>