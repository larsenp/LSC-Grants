<%@ Control Language="vb" AutoEventWireup="false" Codebehind="DepartmentChair_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Application.Controls.Page.cDepartmentChair_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<br>
<!-- Page Content - Top Of Page -->
	Please complete all required information for the Biomedical Engineering Department or
	 Program Chair contact information.  All fields marked with an asterisk 
	(<font color='red'>*</font>) are required.
	<ul>
		<li>Click on the <b>Save and Continue</b> button to save the information.</li>
		<li>Click on the <b>Close</b> button to close the <b>Department Chair Contact Information</b> page 
		and return to the <b>Main</b> page.</li>
	</ul>
	<b>NOTE:</b> Before your application can be considered by the Foundation, your BME Department Chair must
	approve the application.<br><br>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>BME Department or Program Chair Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Name</b></td>
		<td><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td>Prefix</td>	
	</tr>
	<tr>
		<td></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnFirst' runat='server'/></td>
					<td><span id='spnMiddle' runat='server'/></td>	
					<td><span id='spnLast' runat='server'/></td> 	
				</tr>
				<tr>
					<td>First&nbsp;<font color='red'>*</font></td>	
					<td>Middle</td>
					<td>Last&nbsp;<font color='red'>*</font></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td>Suffix</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Title</b>&nbsp;<font color='red'>*</font></td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Degree(s)</b></td>
		<td><span id='spnDegree' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Address</b></td>
		<td>
			<span id='spnAddress1' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Address 1&nbsp;<font color='red'>*</font></td>	
	</tr>
	<tr>
		<td	valign="top" width="120"></td>
		<td>
			<span id='spnAddress2' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Address 2</td>	
	</tr>
	<tr>
		<td	valign="top" width="120"></td>
		<td>
			<span id='spnAddress3' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Address 3</td>	
	</tr>
	<tr>
		<td	valign="top" width="120"></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnCity' runat='server'/></td>
					<td><span id='spnState' runat='server'/></td>
					<td><span id='spnZip' runat='server'/></td>
				</tr>
				<tr>		
					<td>City&nbsp;<font color='red'>*</font></td>	
					<td>State/Province&nbsp;<font color='red'>*</font></td>
					<td>Zip/Postal Code&nbsp;<font color='red'>*</font></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnCountry' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td>Country&nbsp;<font color='red'>*</font></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Phone</b>&nbsp;<font color='red'>*</font></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr>
					<td><span id='spnPhoneNumber' runat='server'/></td>
				</tr>
				<tr>
					<td>(Enter your area code and number - with no extra characters, i.e., 1234567890)</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>E-mail</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnEmail' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Confirm E-mail</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnConfirmEmail' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<center>
	<table>	
		<tr>
			<td>
				<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
				<span runat='server' id='spnClose'/> 
			</td>
		</tr>
	</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectDepartmentChair' DataObjectDefinitionKey='GranteeProjectDepartmentChair' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='15'
						MaxLength='50'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Last Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='35'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Title is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Degree'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='35'
						MaxLength='50'
						RequiredField='False'
						ErrorMessage='Degree is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Container='spnAddress1'
						Type='cTextBox'
						Size='35'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Address 1 is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Container='spnAddress2'
						Type='cTextBox'
						Size='35'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3'
						Container='spnAddress3'
						Type='cTextBox'
						Size='35'
						MaxLength='100'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Container='spnCity'
						Type='cTextBox'
						Size='10'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='City is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'
						RequiredField='True'
						ErrorMessage='State/province is required.'>
						<!--
						<Filters>
							<Argument PropertyKey='StateID' Operator='LessThanEqual' Value='51'/>
						</Filters>-->
						<Sort>
							<Argument PropertyKey='StateAbbr'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Container='spnZip'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Zip is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Country is required.'>
						<Filters>
							<Argument PropertyKey='CountryID' Value='1'/>
							<Argument PropertyKey='CountryID' Value='41' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'>
						<!--
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The e-mail address you entered already exists in the system.' />
						-->
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlConfirmEmail'
						Container='spnConfirmEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Confirm E-mail is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlEmail' 
							Operator='Equal' 
							ErrorMessage='Text in the Confirm E-mail text box does not match text in the E-mail text box' />						
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhoneNumber'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone Number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AdditionalInstitutionContacts'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'
						Image='Close'>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
