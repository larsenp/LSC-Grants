<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.Controls.Page.cRegistration" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' ID="Cuserctlloader1"/>

<table runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan='2'>
			Enter all requested information in the spaces provided below. You will have the opportunity
			to edit the information after you have registered. Fields marked with an asterisk (<font color='red'>*</font>) are required. 				
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			Your password must meet the following requirements: <br>
			<li>At least 8 characters and no more than 16</li>
			<li>At least one upper-case letter</li>
			<li>At least one lower-case letter</li>
			<li>At least one digit (0-9)</li>
			<li>No spaces</li>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<li>Click <b>Submit</b> to submit your registration and create your Home page.</li>
			<li>To return to the Log In page, click <b>Close</b>.</li>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span id='spnEventID' runat='server'  visible='False'>15</span>
<table border='0' cellpadding='0' cellspacing='0' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Register</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td width='15%'><b>First Name</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td>
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
		<td><b>Last Name</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnLast' runat='server' />
		</td>
	</tr>


	
	<tr>
		<td><b>Primary Phone&nbsp;</b></td>
		<td>
			<span id="spnPrimaryPhone" runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class="FieldLabel">Format: 1234567890</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Login Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>E-mail&nbsp;</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnEmail' runat='server'/>
		</td>
	</tr>
	
	<tr>
		<td><b>Confirm E-mail&nbsp;</b><font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnEmailConfirm' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class="FieldLabel">After you complete registration, you will use your e-mail address as your Login ID.</td>
	</tr>
	
	
	<tr>
		<td width='15%'><b>Password</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnPassword' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Confirm Password</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnConfirm' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Security Question</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td>
			<span id='spnSecurityQuestion' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Answer</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
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
				<Argument Type='' TypeKey='' PropertyKey='PhoneTypeID' Value='2'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use the following format: 10 digits for the US and 20 digits for all others, including area code and phone number with no formatting (e.g., 1234567890).'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='User' DataObjectDefinitionKey='User' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='UserID' Value='-2'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserID' PropertyKey='CreateUser' Value=''/>
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
						ErrorMessage='E-mail Address is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The e-mail address you entered already exists in the system. Please contact the Granting ~~Organization~~ for your login information.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UserName'>
					<Control ID='ctlEmailConfirm'
						Container='spnEmailConfirm'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address confirmation is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlUserName' 
							Operator='Equal' 
							ErrorMessage='Text in the Confirm E-mail field does not match text in the E-mail field.' />						
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
						<Validation Type='RegularExpression' ValidationExpression='^\w*(?=\w{8,16})(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$' ErrorMessage='Enter a password between 8 and 16 characters. Use at least one upper-case letter, at least one lower-case letter, one digit (0-9), and no spaces.' />
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
							ErrorMessage='Text in the Confirm Password text box does not match text in the Password text box.' />						
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
						ErrorMessage='An Answer for the security question is required.'>
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
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserName' PropertyKey='ContactValue1' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
		</DataObject>			


		
		<!-- <DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='PersonOrganizationAffiliationID' Value='-2'/>						
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='Address' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='TypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</DefaultValues>
		</DataObject> -->			
		
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
							Object='WebSession'
							Method='LoginUserFromCredentials'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlUserName' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlConfirm' ControlPropertyKey='Value' Value='' />
							</Parameters>						
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
