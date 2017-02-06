<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.Page.cUploadAppEditorContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="TblInstructions">
		<tr>
			<td class="SeparatorHdg"><b>Instructions</b></td>
		</tr>		
	</table>  
	<span id='spnPageContent' runat='server' />   
<br>
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
<br</br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td visible='true'>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<PageContent/>
	<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
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
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Save='False'
						Image='Save_and_Continue'>
						<Action PostBack='True' AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='Uploads'/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
</ModuleSection>
</span>
