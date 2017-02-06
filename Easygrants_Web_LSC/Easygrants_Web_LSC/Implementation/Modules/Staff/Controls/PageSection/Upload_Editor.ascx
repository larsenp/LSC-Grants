<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="Upload_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cUpload_Editor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />

<br />
<br />

<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Upload Add or Editor</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>
	<tr>
		<td width='25%'><b>Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnUploadName' runat='server'></span></td>
	</tr>
	<tr><td>&nbsp;</td><td class='FieldLabel'>Limit: 50 characters</td></tr>
	<tr>
		<td valign=top><b>File Types Allowed</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<asp:ListBox id='ctlListBox' runat='server' SelectionMode='Multiple' Width='100' Height = '200'>
</asp:ListBox>
		
		</td>
		
	</tr>
	<tr>
		<td valign=top><b>Invalid File Extension Error Message</b></td>
		<td>
			<span id='spnInvalidFileMsg' runat='server'></span>
		
		</td>
		
	</tr>
	<tr>
		<td><b>Maximum Pages Allowed</b></td>
		<td><span id='spnMaxPages' runat='server'></span></td>
	</tr>
	<tr><td>&nbsp;</td><td class='FieldLabel'>Whole Numbers</td></tr>
	<tr>
		<td><b>Maximum Words Allowed</b></td>
		<td><span id='spnMaxWords' runat='server'></span></td>
	</tr>
	<tr><td>&nbsp;</td><td class='FieldLabel'>Whole Numbers</td></tr>
	<tr>
		<td><b>Maximum Characters Allowed</b></td>
		<td><span id='spnMaxChars' runat='server'></span></td>
	</tr
	<tr><td class='FieldLabel'>Note:  One page equals approximately 2200 characters</td><td class='FieldLabel'>Whole Numbers</td></tr>
	<tr>
		<td><b>Template</b></td>
		<td><span id='spnTemplate' runat='server'></span></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<asp:Panel runat="server" ID="DMSysIntegrationPanel" visible='false'>
				<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblDMSystemIntegration'>
					<tr>
						<td  class="SeparatorHdg" colspan='2'><b>Document Management System Integration</b></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td width='25%'><b>File Name Prefix</b>&nbsp;<%=kDenoteRequiredField%></td>
						<td>
							<span id='spnFileNamePrefix' runat='server'></span>
							<asp:CustomValidator 
								id='valUploadFileNamePrefix'
								runat='server'
								ErrorMessage='File Name Prefix must be unique.'
								OnServerValidate='ValidatePDFFileNamePrefix'
								Display='none' visible='false'/>	
						</td>
					</tr>
					<tr>
						<td width='25%'>&nbsp</td>
						<td class='FieldLabel'>Limit: 50 Characters</td>
					</tr>
				</table>
			</asp:Panel>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align='center' colspan='2'>
			<span id='spnSave' runat='server'></span>&nbsp;&nbsp;
			<span id='spnSaveClose' runat='server'></span>&nbsp;&nbsp;
			<span id='spnClose' runat='server'></span>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
<DataObject Key='Upload' DataObjectDefinitionKey='Upload' Updatable='True' CreateNew='True'>
	<Filters>
		<Argument Type='QueryString' TypeKey='UploadID' PropertyKey='UploadID' Value=''	Bool='' />
	</Filters>
	<DefaultValues>
		<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
		<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
		<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
		<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
	</DefaultValues>
	<DisplayProperties>
		<DisplayProperty PropertyKey='UploadName'>
			<Control ID='ctlUploadName' Type='cTextBox' Container='spnUploadName' Size='30' MaxLength='100'
				RequiredField='True' ErrorMessage='Upload name is required.'></Control>
		</DisplayProperty>
		<DisplayProperty PropertyKey='InvalidFileExtensionErrorMessage'>
			<Control ID='ctlInvalidFileMsg' Type='cTextBox' Container='spnInvalidFileMsg' Size='30' MaxLength='250'></Control>
		</DisplayProperty>
		<DisplayProperty PropertyKey='PageCount'>
			<Control ID='ctlMaxPages' Type='cTextBox' Container='spnMaxPages' Size='10' MaxLength='10'></Control>
		</DisplayProperty>	
		<DisplayProperty PropertyKey='WordCount'>
			<Control ID='ctlMaxWords' Type='cTextBox' Container='spnMaxWords' Size='10' MaxLength='10'></Control>
		</DisplayProperty>	
		<DisplayProperty PropertyKey='CharacterCountWithSpaces'>
			<Control ID='ctlMaxChars' Type='cTextBox' Container='spnMaxChars' Size='10' MaxLength='10'></Control>
		</DisplayProperty>
		<DisplayProperty PropertyKey='UploadTemplateID'>
			<Control ID='ctlTemplate' Type='cDropDown' Container='spnTemplate' DataObjectDefinitionKey='UploadTemplate'
				StoredValue='UploadTemplateID' DisplayValue='TemplateName'>
			<Sort>
				<Argument PropertyKey='TemplateName' Direction='Ascending' />
			</Sort>
			</Control>
		</DisplayProperty>
		<DisplayProperty PropertyKey='FileNamePrefix'>
			<Control ID='ctlFileNamePrefix' Type='cTextBox' Container='spnFileNamePrefix' Size='30' MaxLength='50'
				RequiredField='True' ErrorMessage='File Name Prefix is required.'></Control>
		</DisplayProperty>
	</DisplayProperties>
</DataObject>

<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<!--The following two DisplayProperty nodes will be active when an existing organization is edited -->
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
					<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='UploadEditor'/>
							     <Argument Type='DataObjectCollection' TypeKey='Upload' DataObjectPropertyKey='UploadID'
									BaseValue='UploadID=' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>
					</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose' Container='spnSaveClose' Type='cButton' Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	<DataObject Key='FileExtensions' DataObjectDefinitionKey='FileExtensions' Updatable='' CreateNew=''>
	<Filters>
		
	</Filters>
	<DisplayProperties>
	</DisplayProperties>
	</DataObject>
	
	<DataObject Key='UploadTemplate' DataObjectDefinitionKey='UploadTemplate' Updatable='' CreateNew=''>
	<Filters>
		
	</Filters>
	<DisplayProperties>
	</DisplayProperties>
	</DataObject>

</ModuleSection>
</span>