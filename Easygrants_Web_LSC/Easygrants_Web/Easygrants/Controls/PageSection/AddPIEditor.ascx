<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<br>
Please complete all required information for the co-investigator's contact information.   
All fields marked with an asterisk (<font color='red'>*</font>) are required. 
	<ul>
		<li>Click on the <b>Save</b> button to save the information.</li>
		<li>Click on the <b>Close</b> button to close the <b>Co-Investigator Editor</b> page.</li>
	</ul>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Additional Co-Investigator Editor</b></td>
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
		<td	valign="top" width="120"><b><%=GetLabel("Organization")%></b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnOrganizationName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td	valign="top" width="120"><font color='red'>*</font>&nbsp;<b>Phone</b></td>
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

	<tr id='trSaveAndCancel' visible='true'>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPIID' PropertyKey='GranteeProjectPIID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='PITypeID' Value='3'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='3'/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='1'/>
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
	                            <Argument PropertyKey='Prefix'/>
                            </Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						    <Sort>
	                            <Argument PropertyKey='Suffix'/>
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
						MaxLength='50'>
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
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='70'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Title is required.'>
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrganizationName'
						Container='spnOrganizationName'
						Type='cTextBox'
						Size='70'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='~~Organization~~ is required.'>
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhoneNumber'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='25'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone number is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='70'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='E-mail is required.'>
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
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'
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
</span>
<!-- End Embedded XML -->
