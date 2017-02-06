<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.PageSection.cProjectContactEditor" CodeBehind="ProjectContactEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other Grant Project Contact Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width='15%'><b>Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td colspan="3"><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">Prefix</td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnFirst' runat='server'/></td>
		<td><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/><b><span id='spnIsPrimary' runat='server' visible='false'/>&nbsp;</b></td> 	
	</tr>
	<tr>
		<td></td>	
		<td><b>First&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td><b>Last&nbsp;</b><%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan="3"><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan="3">Suffix</td>	
	</tr>
	<tr>
		<td><b>Project Role&nbsp;</b><%=kDenoteRequiredField%></td>
		<td colspan="3" ><span id='spnProjectRole' runat='server'/></td>
	</tr>
	<tr>
		<td	width='15%'><b>Phone&nbsp;</b><%=kDenoteRequiredField%></td>
		<td ><span id='spnPhone' runat='server'/></td>
		<td   colspan="2"><span id='spnExt' runat='server'/></td>
	</tr>
	<tr>
		<td	width='15%'></td>
		<td >Enter number only</td>
		<td   colspan="2">Extension</td>
	</tr>
    <tr>
		<td ><b>E-mail&nbsp;<%=kDenoteRequiredField%>&nbsp;(Business)</b></td>
		<td  colspan="3"><span id='spnEmail' runat='server' /></td>
	</tr>
	<tr><td  colspan="4">&nbsp;</td></tr>
	<tr>
		<td colspan="4" align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='2'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayText='Select'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='Prefix' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='100'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary'
						Container='spnIsPrimary'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayText='Select'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='Suffix' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GranteeAffiliationTypeID'>
					<Control ID='ctlProjectRole'
						Container='spnProjectRole'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantContactType'
						StoredValue='GrantContactTypeID'
						DisplayText='Select'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Project Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='25'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Telephone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Type='cTextBox'
						Container='spnExt'
						Size='10'
						MaxLength='10'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>							
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPI' DataObjectPropertyKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' BaseValue='GranteeProjectPIID='/>
							</Parameters>							    					
						</Action>			
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Type='cButton'
						Image='Save and Close'>
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
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='OtherContacts'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
