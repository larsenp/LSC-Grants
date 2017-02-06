<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cSharePointIntegration" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx' 
	runat='server' 	id="CUserCtlLoader1" />
<br>
<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>SharePoint Integration</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td width="20%"><b>Username</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnUserName' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>Password</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnPassword' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td width="20%"><b>Confirm Password</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnConfirm' /></td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>SharePoint URL</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td>
			<span runat='server' id='spnSharePointURL' />
			<asp:CustomValidator
				runat='server'
				id='valSharepointUrlField'
				Display='None'
				OnServerValidate='ValidateURL'
				ErrorMessage="SharePoint URL is incorrectly formatted. The address must be preceded by http:// or https:// ."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>Easygrants Site Name</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnSiteName' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>Active</b></td>
		<td><span runat='server' id='spnActive' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>Delete Documents Permanently</b></td>
		<td><span runat='server' id='spnDeleteDocumentPermanently' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>System Administrator E-mail Address</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnSystemAdminEmail' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>SharePoint Unreachable Message</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnSharepointUnreachableMessage' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b>Special Character Removal Validation</b>&nbsp;&nbsp;<font color='red'>*</font></td>
		<td><span runat='server' id='spnSpecialCharacterRemovalValid' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%">&nbsp;</td>
		<td><span runat='server' id='spnTestConnection' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%">&nbsp;</td>
		<td>
			<span runat='server' id='spnSuccess' visible='true' ><b><Font color='Green'>Connection was successful!</Font></b></span>
			<span runat='server' id='spnFailed' visible='true' ><b><Font color='Red'>Connection failed! Changes are not saved.</Font></b></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="Center" Colspan='3'><span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSaveandClose'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<br>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SharePointIntegration' DataObjectDefinitionKey='SharePointIntegration' Updatable='True' CreateNew='True'>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='UserName'>
					<Control ID='ctlUserName'
						Container='spnUserName'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Username is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Password'>
					<Control ID='ctlPassword'
						Container='spnPassword'
						Type='cTextBox'
						Size='30'
						MaxLength='30'
						RequiredField='True'    
						ErrorMessage='Password is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Password'>
					<Control ID='ctlConfirm'
						Container='spnConfirm'
						Type='cTextBox'
						Size='30'
						MaxLength='30'
						RequiredField='True'
						ErrorMessage='Confirm Password is required.'>						
							<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlPassword' 
							Operator='Equal' 
							ErrorMessage='Confirm Password and Password must match.' /> 
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SharePointURL'>
					<Control ID='ctlSharePointURL'
						Container='spnSharePointURL'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='SharePoint URL is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SiteName'>
					<Control ID='ctlSiteName'
						Container='spnSiteName'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Easygrants Site Name is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Active'>
					<Control ID='ctlActive' 
						Container='spnActive'
						Type='cCheckBox'
						StoredValue='1' 
						DisplayValue='Active'>
					</Control>
				</DisplayProperty>
					<DisplayProperty PropertyKey='DeleteDocumentPermanently'>
					<Control ID='ctlDeleteDocumentPermanently' 
						Container='spnDeleteDocumentPermanently'
						Type='cCheckBox'
						StoredValue='1' 
						DisplayValue='DeleteDocumentPermanently'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SystemAdminEmail'>
					<Control ID='ctlSystemAdminEmail'
						Container='spnSystemAdminEmail'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						RexErrorMessage='System Administrator E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.org or test@test.org.uk.'
						ErrorMessage='System Administrator E-mail Address is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SharepointUnreachableMessage'>
					<Control ID='ctlSharepointUnreachableMessage'
						Container='spnSharepointUnreachableMessage'
						Type='cTextBox'
						Size='100'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='SharePoint Unreachable Message is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='InvalidCharacterRegex'>
					<Control ID='ctlSpecialCharacterRemovalValid'
						Container='spnSpecialCharacterRemovalValid'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Special Character Removal Validation is required.' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnTestConnection'
						Container='spnTestConnection'
						Type='cButton'
						Image='Test Connection'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='TestConnection'/>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' 
						Type='cButton' 
						Image='Save'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='SharePointIntegration'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveandClose' Container='spnSaveandClose' 
						Type='cButton' 
						Image='Save and Close'>
						<Action PostBack='True'
							Object='EventController' 
							Method='DataPresenter_Save_And_NavigateToModulePageKey'>
							<Parameters>
					   			<Argument AttributeName='PageKey' Value='SystemSettings'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							   	<Argument AttributeName='PageKey' Value='SystemSettings'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>