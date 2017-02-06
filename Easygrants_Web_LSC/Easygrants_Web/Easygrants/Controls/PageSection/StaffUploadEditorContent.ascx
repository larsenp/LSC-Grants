<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.Page.cStaffUploadEditorContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
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
	<DataObject Key='ParticipantUploadGranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact' >
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectAdditionalContactID' PropertyKey='GranteeProjectAdditionalContactID' Value='' 	Bool=''/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='And'/>
				<Argument Type='QueryString' TypeKey='GeneralUploadCategoryID' PropertyKey='GrantContactCategoryID' Value='' 	Bool='And'/>				
			</Filters>
	</DataObject>		
	<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ParticipantUploadGranteeProjectAdditionalContact' DataObjectPropertyKey='GranteeProjectAdditionalContactID' PropertyKey='GeneralUploadDataObjectPrimarykeyID' />
				<Argument Type='QueryString' TypeKey='GeneralUploadCategoryID' PropertyKey='GeneralUploadCategoryID' Value='' />
				<Argument Type='QueryString' TypeKey='GeneralUploadCategoryTypeID' PropertyKey='GeneralUploadCategoryTypeID' Value='' />
				<Argument Type='QueryString' TypeKey='UploadID' PropertyKey='UploadID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='ParticipantUploadGranteeProjectAdditionalContact' DataObjectPropertyKey='GranteeProjectAdditionalContactID' PropertyKey='GeneralUploadDataObjectPrimarykeyID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='UploadedByID' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUploadNew'
						Container='spnUpload'>
						<Parameters>
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
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
</ModuleSection>
</span>
