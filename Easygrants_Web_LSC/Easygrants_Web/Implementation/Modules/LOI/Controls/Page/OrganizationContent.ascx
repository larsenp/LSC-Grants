<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.LOI.Controls.Page.cOrganizationContent" CodeBehind="OrganizationContent.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<span id='spnOldText' visible='false' runat='server'>
	<p>Please provide the following information about yourself.&nbsp;&nbsp;In the sections below, please ensure that you
	have provided your PRIMARY address, <%=GetLabel("Organization")%> affiliation, phone number, and
	e-mail address.&nbsp;&nbsp;Information you provided during registration appears in some fields, you
	may update the information as needed.&nbsp;&nbsp;</p>

	<p>All fields marked with an asterisk (<font color=red>*</font>) 
	are required.&nbsp;&nbsp;Click on the <b>Save</b> button when you are finished.&nbsp;&nbsp;Click on the <b>Save and Continue</b> button to save and navigate to the next section.</p>
</span>

<p>Enter your <b><i>primary</i></b> contact information.</p>

<p>Contact information for any letter of inquiry must be for the Principal Investigator or the Executive Director.</p>

<p>The system may have already filled in certain fields based on information previously entered.</p>

<p>Please update this information as needed.</p>


<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Contact</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table3" width="100%">
	<tr>
		<td	width='26%'><b>Name</b> <%=kDenoteRequiredField%></td>
		<td><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>Prefix&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td></td>
		<td><span id='spnFirst' runat='server'/></td>
		<td><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/></td> 	
	</tr>
	<tr>
		<td></td>	
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td>Suffix</td>	
	</tr>
	<tr>
		<td></td>
		<td><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>Title</td>	
	</tr>
	<tr visible='true' runat='server' ID="Tr1" NAME="Tr1">
		<td><b><%=GetLabel("Organization")%></b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table4">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		</td>
	</tr>
</table>
<Core:cUserCtlLoader CtlID='ctlContactAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Address.ascx'
	runat='server'/>	
<Core:cUserCtlLoader CtlID='ctlContactPhone' 
	Src='EasyGrants/Controls/PageSection/Contact_Phone.ascx'
	runat='server'/>	
<Core:cUserCtlLoader CtlID='ctlContactEmail' 
	Src='EasyGrants/Controls/PageSection/Contact_Email.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table10">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='PrimaryOrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>			
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
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
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>	
				<!--<DisplayProperty PropertyKey='NickName'>
					<Control ID='ctlNickName'
						Container='spnNickName'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='False'
						ErrorMessage='You must enter a Nick Name.'>
					</Control>
				</DisplayProperty>	-->												
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
                <DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='10'
						MaxLength='50'>
					</Control>
				</DisplayProperty>				
				<!--<DisplayProperty PropertyKey='Degrees'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='10'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AssistantName'>
					<Control ID='ctlAssistantName'
						Container='spnAssistantName'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='False'
						ErrorMessage='You must enter an Assistant Name.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SpouseName'>
					<Control ID='ctlSpouseName'
						Container='spnSpouseName'
						Type='cTextBox'
						Size='25'
						MaxLength='200'
						RequiredField='False'
						ErrorMessage='You must enter a Spouse Name.'>
					</Control>
				</DisplayProperty>-->	
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->

		<DataObject Key='Address' DataObjectDefinitionKey='Address' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<!--<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AddressTypeID'>
					<Control ID='ctlAddressType'
						Container='spnAddressType'
						Type='cDropDown'
						DataObjectDefinitionKey='AddressType'
						StoredValue='AddressTypeID'
						DisplayValue='AddressAbbr'
						RequiredField='True'
						ErrorMessage='You must select an Address Type.'>
						<Sort>
							<Argument PropertyKey='AddressAbbr' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlAddressTitle'
						Type='cTextBox'
						Container='spnAddressTitle'
						Size='60'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='You must enter a title.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Dept'>
					<Control ID='ctlAddressDept'
						Type='cTextBox'
						Container='spnAddressDept'
						Size='60'
						MaxLength='200'
						RequiredField='False'
						ErrorMessage='You must enter a title.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Type='cTextBox'
						Container='spnAddress1'
						Size='60'
						MaxLength='300'
						RequiredField='True'
						ErrorMessage='You must enter an Address 1.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Type='cTextBox'
						Container='spnAddress2'
						Size='60'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='You must enter a title.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3'
						Type='cTextBox'
						Container='spnAddress3'
						Size='60'
						MaxLength='100'
						RequiredField='False'
						ErrorMessage='You must enter a title.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Type='cTextBox'
						Container='spnCity'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='You must enter a City.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'	
						RequiredField='True'
						ErrorMessage='You must select a State.'>
						<Sort>
							<Argument PropertyKey='StateAbbr' Direction='Ascending'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Type='cTextBox'
						Container='spnZip'
						Size='12'
						MaxLength='30'
						RequiredField='True'
						ErrorMessage='You must enter a Zip.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'	
						RequiredField='True'
						DisplayNone='False'
						ErrorMessage='You must select a Country.'>
						<Sort>
							<Argument PropertyKey='CountryDesc'/>
						</Sort>
						<SelectedValue>
							<Argument PropertyKey='CountryID' Value='280' />
						</SelectedValue>
					</Control>
				</DisplayProperty>																					
			</DisplayProperties>-->	
		</DataObject>

		<!--<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='PhoneTypeID'>
					<Control ID='ctlPhoneType'
						Container='spnPhoneType'
						Type='cDropDown'
						DataObjectDefinitionKey='PhoneType'
						StoredValue='PhoneID'
						DisplayValue='TypeName'	
						RequiredField='True'
						ErrorMessage='You must select a Phone Type.'>
						<Sort>
							<Argument PropertyKey='TypeName' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='25'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='You must enter a Telephone Number.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Type='cTextBox'
						Container='spnPhoneExt'
						Size='10'
						MaxLength='10'
						RequiredField='False'
						ErrorMessage='You must enter an Ext.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>																			
			</DisplayProperties>
		</DataObject>-->

		<!--<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='EmailTypeID'>
					<Control ID='ctlEmailType'
						Container='spnEmailType'
						Type='cDropDown'
						DataObjectDefinitionKey='EmailType'
						StoredValue='EmailID'
						DisplayValue='TypeName'	
						RequiredField='True'
						ErrorMessage='You must select an E-mail Type.'>
						<Sort>
							<Argument PropertyKey='TypeName' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail'
						Type='cEmailTextBox'
						Container='spnEmail'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='You must enter an E-mail.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>-->

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='True'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
