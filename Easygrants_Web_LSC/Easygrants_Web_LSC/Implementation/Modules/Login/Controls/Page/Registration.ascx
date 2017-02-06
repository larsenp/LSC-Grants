<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Login.Controls.Page.cRegistration_Lsc" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' ID="Cuserctlloader1"/>

<table width='600' border="0" cellpadding="0" cellspacing="0" ID="Table1" runat='server'>
	<tr>
	  <td >&nbsp;</td>
  </tr>
	<tr>
	  <td ><h1>LSC Grants Registration </h1></td>
  </tr>
	<tr>
	  <td class="SeparatorHdg"><b>Instructions</b></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td colspan='2'>
		  <ul>
		    <li>Only applicants who are not current recipients of LSC funding should complete this page. </li>
		    <li>Enter all requested information in the fields provided below. </li>
		    <li>You will have the opportunity 
		          to edit the information after you have registered. </li>
	        <li>Fields marked with an asterisk (<font color='red'>*</font>) are required. </li>
	        <li>Click <b>Submit</b> to submit your registration and create your Home page.</li>
	        <li>To return to the Login page, click <b>Close</b>.</li>
        </ul></td>
  </tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellpadding='0' cellspacing='0' runat='server' width='600' ID="Table2">
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Register</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td width='17%'><b>First Name</b><font color='red'>*</font>&nbsp;</td>
		<td width="83%">
			<span id='spnFirst' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Middle Name</b>&nbsp;</td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Last Name</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnLast' runat='server' />
		</td>
	</tr>
	<tr>
		<td><b>Organization</b> <%=kDenoteRequiredField%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td colspan='3'>
	
		<span id='spnOrgSelectLauncher' runat='server'/></td>
	
	</tr>
	
	<tr>
		<td><b>Primary Phone&nbsp;</b></td>
		<td>
			<span id="spnPrimaryPhone" runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Enter numbers only. Do not use hyphens, parentheses, or periods. Take care in selecting the primary phone number. This will be the only number LSC uses to contact applicants by phone regarding the grants process. </td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Login Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Primary Email Address<font color='red'>*</font>&nbsp;</b></td>
		<td>
			<span id='spnEmail' runat='server'/>
		</td>
	</tr>
	
	<tr>
		<td><b>Confirm Primary Email Address<font color='red'>*</font>&nbsp;</b></td>
		<td>
			<span id='spnEmailConfirm' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>After you complete registration, you will use your primary email address as your Login ID.</td>
	</tr>
	
	
	<tr>
		<td width='17%'><b>Password</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnPassword' runat='server'/>
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>Password must be comprised of only numbers and letters, contain at least one upper-case letter, at least one lower-case letter, and at least one digit, no spaces, and must be from 8 to 16 characters in length.</td>
  </tr>
	<tr>
		<td><b>Confirm Password</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnConfirm' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Security Question</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnSecurityQuestion' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Answer</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnSecurityAnswer' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellpadding='0' cellspacing='0' runat='server' width='100%' ID="Table4">		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSubmit'/>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='PersonID' Value='-2'/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='CreateUser' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='First Name is Required.'>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Last Name is Required.'>
					</Control>
				</DisplayProperty>	
			
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='30'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		

		<DataObject Key='PrimaryPhone' DataObjectDefinitionKey='Phone' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='PhoneID' Value='-2'/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlPrimaryPhone'
						Type='cTextBox'
						Container='spnPrimaryPhone'
						Size='25'
						MaxLength='20'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='User' DataObjectDefinitionKey='User' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='UserID' Value='-2'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='CreateUser' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='UserTypeID' Value='1'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='UserName'>
					<Control ID='ctlUserName'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Primary Email Address is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The email address you entered already exists in the system.  Please contact the Foundation for your Log in information.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UserName'>
					<Control ID='ctlEmailConfirm'
						Container='spnEmailConfirm'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Primary Email Address confirmation is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlUserName' 
							Operator='Equal' 
							ErrorMessage='Text in the Confirm Email field does not match text in the E-mail field.' />						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Password'>
					<Control ID='ctlPassword'
						Container='spnPassword'
						Type='cPasswordTextBox'
						Size='30'
						MaxLength='15'
						RequiredField='True'    
						ErrorMessage='Password is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\w*(?=\w{8,16})(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$' ErrorMessage='Password must contain at least one upper-case letter, at least one lower-case letter, and at least one digit, no spaces, and must be from 8 to 16 characters in length.' />
					</Control>
				</DisplayProperty>					
				<DisplayProperty PropertyKey='Password'>
					<Control ID='ctlConfirm'
						Container='spnConfirm'
						Type='cPasswordTextBox'
						Size='30'
						MaxLength='15'
						RequiredField='True'
						ErrorMessage='Password confirmation is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlPassword' 
							Operator='Equal' 
							ErrorMessage='Text in the Confirm Password text box does not match text in the Password text box' />						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PasswordQuestionID'>
					<Control ID='ctlSecurityQuestion'
						Container='spnSecurityQuestion'
						Type='cDropDown'
						DataObjectDefinitionKey='PasswordQuestion'
						StoredValue='PasswordQuestionID'
						DisplayValue='PasswordQuestion'
						RequiredField='True'
						ErrorMessage='Security Question is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PasswordAnswer'>
					<Control ID='ctlSecurityAnswer'
						Container='spnSecurityAnswer'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='An Answer for Security Question is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Email' DataObjectDefinitionKey='Email' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='EmailID' Value='-2'/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='EmailTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserName' PropertyKey='ContactValue1' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
		</DataObject>			
		
					

		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='PersonOrganizationAffiliationID' Value='-2'/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='TypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimaryOrganizationContact' Value='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.OrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
						Type='cOrgSelectLauncherNotInList'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='OrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='OrganizationName'	
						RequiredField='True'
						ErrorMessage='Organization is required.'>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject> 
		
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False'>
			<Filters>
				<Argument PropertyKey='CorrespondenceKey' Value='RegSubmitStaff' />
			</Filters>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to register?'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Register'>
						</Action>
					</Control>	
				</DisplayProperty>		

				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Home'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
