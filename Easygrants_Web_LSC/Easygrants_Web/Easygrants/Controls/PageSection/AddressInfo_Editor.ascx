<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cAddressInfo_EditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddressEditorb.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br><br>
	Please fill in your address information below.  Check <b>Primary</b> if this is your primary address.  
	You may leave the end date blank if  you can be contacted at this address for the foreseeable future.  
	All fields marked with an asterisk (<font size='2' color='red'>*</font>) are required.	
	<ul>
		<li>Click <b>Save</b> to save the information and return to the main Address Information page.</li>
		<li>Click <b>Close</b> to close the Address Information Editor without saving your entry.</li>
	</ul>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td width='100%' colspan="3" class="SeparatorHdg"><b>Address Info Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td width='15%'><b>Address</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td>&nbsp;</td>
		<td><span id='spnAddress1' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnIsPrimary' runat='server'/>&nbsp;&nbsp;Primary</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Address Line 1&nbsp;<font size='2' color='red'>*</font></td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAddress2' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>Address Line 2</td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAddress3' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>Address Line 3</td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0' width='90%'>
				<tr>
					<td nowrap='true'><span id='spnCity' runat='server'/>&nbsp;</td>
					<td nowrap='true'><span id='spnState' runat='server'/>&nbsp;</td>
					<td nowrap='true'><span id='spnZip' runat='server'/>&nbsp;</td>
					<td nowrap='true' width='5%'>&nbsp;</td>
					<td nowrap='true'><span id='spnRegion' runat='server'/>&nbsp;</td>
				</tr>

				<tr>
					<td class='FieldLabel' nowrap='true'>City&nbsp;<font size='2' color='red'>*</font></td>
					<td class='FieldLabel' nowrap='true'>State/Province</td>
					<td class='FieldLabel' nowrap='true'>Zip/Postal Code</td>
					<td nowrap='true'>&nbsp;</td>
					<td class='FieldLabel' nowrap='true'>Region</td>
				</tr>
			</table>
		</td>
		

	</tr>


	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCountry' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>Country&nbsp;<font size='2' color='red'>*</font></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Phone</b></td>
		<td>&nbsp;</td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnPhone' runat='server'/></td>
					<td width='15%'>&nbsp;</td>
					<td>Extension&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><span id='spnPhoneExt' runat='server'/></td>
				</tr>
				<tr>
					<td class='FieldLabel'>1234567890</td>
					<td colspan='2'>&nbsp;</td> 
					<td class='FieldLabel'>55555</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Fax</b></td>
		<td>&nbsp;</td>
		<td><span id='spnFaxNumber' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>1234567890</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap='true'><b>Effective Dates</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td>&nbsp;</td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnEffectiveStartDate' runat='server'/></td>
					<td width='15%'>&nbsp;</td>
					<td><span id='spnEffectiveEndDate' runat='server'/></td>
				</tr>
				<tr>
					<td class='FieldLabel'>Start Date&nbsp;<font size='2' color='red'>*</font></td>
					<td width='15%'>&nbsp;</td>
					<td class='FieldLabel'>End Date</td>
				</tr>

			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='AddressID'
					PropertyKey='AddressID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' />
				<Argument PropertyKey='AddressTypeID' Value='3' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<!-- <DisplayProperty PropertyKey='AddressTypeID'>
					<Control ID='ctlAddressType'
						Container='spnAddressType'
						Type='cDropDown'
						DataObjectDefinitionKey='AddressType'
						StoredValue='AddressTypeID'
						DisplayValue='AddressAbbr'	
						RequiredField='True'
						ErrorMessage='You must select a type.'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty> -->
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary'
						Container='spnIsPrimary'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty>
				
				<!-- <DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Type='cTextBox'
						Container='spnTitle'
						Size='50'
						MaxLength='150'
						RequiredField='False'
						ErrorMessage='You must enter a title.'>
					</Control>
				</DisplayProperty> -->
				
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Type='cTextBox'
						Container='spnAddress1'
						Size='50'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Address Line 1 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Type='cTextBox'
						Container='spnAddress2'
						Size='50'
						MaxLength='100'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3'
						Type='cTextBox'
						Container='spnAddress3'
						Size='50'
						MaxLength='100'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Type='cTextBox'
						Container='spnCity'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='City is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='Description'>
						<Filters>
							<Argument PropertyKey='SortOrder' Operator='NotEqual' Value='0'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Type='cTextBox'
						Container='spnZip'
						Size='12'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Country is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateCountry' ErrorMessage='If you select "United States" or "Canada" you must select a State/Province.' />
						<!--
						<Filters>
							<Argument PropertyKey='SortOrder' Operator='NotEqual' Value='249'/>
							<Argument PropertyKey='SortOrder' Operator='NotEqual' Value='-1'/>
						</Filters>-->
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Region'>
					<Control ID='ctlRegion'
						Type='cTextBox'
						Container='spnRegion'
						Size='20'
						MaxLength='50'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='EffectiveStartDate'>
					<Control ID='ctlEffectiveStartDate'
						Container='spnEffectiveStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The Start Date entered is invalid or not formatted properly.'
						Size='25'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Effective Start Date is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateEffectiveDates' ErrorMessage='The Start Date must be earlier than End Date.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EffectiveEndDate'>
					<Control ID='ctlEffectiveEndDate'
						Container='spnEffectiveEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The End Date entered is invalid or not formatted properly.'
						Size='25'
						MaxLength='10'
						RequiredField='False'
						ErrorMessage='Effective End Date is required.'>
					</Control>
				</DisplayProperty>																					
																					
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
						TypeKey='EntityID'
						PropertyKey='EntityID'
						Value='' 
						bool=''/>
				<Argument Type='Data' 
						TypeKey='PhoneTypeID'
						PropertyKey='PhoneTypeID'
						Value='1' 
						bool=''/>
				<Argument Type='QueryString' 
					TypeKey='AddressID'
					PropertyKey='AddressID'
					Value='' 
					bool=''/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument PropertyKey='PhoneTypeID' Value='1'/>
				<Argument Type='DataObjectCollection' TypeKey='Address' PropertyKey='AddressID' DataObjectPropertyKey='AddressID' Value='' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='25'
						MaxLength='20'
						RequiredField='False'
						ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Type='cTextBox'
						Container='spnPhoneExt'
						Size='10'
						MaxLength='10'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>																																		
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Fax' DataObjectDefinitionKey='Phone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
						TypeKey='EntityID'
						PropertyKey='EntityID'
						Value='' 
						bool=''/>
				<Argument Type='Data' 
						TypeKey='PhoneTypeID'
						PropertyKey='PhoneTypeID'
						Value='4' 
						bool=''/>
				<Argument Type='QueryString' 
					TypeKey='AddressID'
					PropertyKey='AddressID'
					Value='' 
					bool=''/>												
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument PropertyKey='PhoneTypeID' Value='4'/>
				<Argument Type='DataObjectCollection' TypeKey='Address' PropertyKey='AddressID' DataObjectPropertyKey='AddressID' Value='' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlFaxNumber'
						Type='cTextBox'
						Container='spnFaxNumber'
						Size='25'
						MaxLength='20'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Fax Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>					
<!-- Save and Cancel buttons -->
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
							Object='DataPresenter'
							Method='Save'/>
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
<!-- End Embedded XML -->
</span>

