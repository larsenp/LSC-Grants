<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPrincipals_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Principal Investigator</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table2">
<!-- Control Label (for Organization information) -->
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	width='18%' valign="top"><b>Name</b></td>
		<td>
			<table border='0' cellspacing='0' cellpadding='0'>
				<tr valign='top'>
					<td>
						<span id='spnFirst' runat='server'/>
					</td>
					<td width='25'>&nbsp;</td>
					<td>
						<span id='spnMiddle' runat='server'/>
					</td>
					<td width='25'>&nbsp;</td>	
					<td>
						<span id='spnLast' runat='server'/>&nbsp;&nbsp;
					</td>
					<td width='25'>&nbsp;</td> 	
					<td><b><span id='spnIsPrimary' runat='server'/>&nbsp;Primary</b>
					</td>
				</tr>
				<tr>
					<td>
						First Name <%=kDenoteRequiredField%>
					</td>	
					<td width='25'>&nbsp;</td>
					<td>Middle</td>
					<td width='25'>&nbsp;</td>
					<td>
						Last <%=kDenoteRequiredField%>
					</td>	
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
		</td>
	</tr>
		<tr><td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Title</b></td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td	valign="top" width="120"><b>Degree</b></td>
		<td>
			<span id='spnDegree' runat='server'/>
		</td>
	</tr>
	<tr>
		<td height='25'>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b><%=GetLabel("Organization")%></b></td>
		<td>
			<span id='spnOrganizationDepartment' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Department</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td>
			<span id='spnOrganizationName' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Formal Name of <%=GetLabel("Organization")%></td>	
	</tr>
	<tr><td height='25'>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"><b>Address</b></td>
		<td>
			<span id='spnAddress1' runat='server'/>
		</td>
	</tr>
	
	<tr>		
		<td></td>
		<td>Address Line 1</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"></td>
		<td>
			<span id='spnAddress2' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Address Line 2</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width="120"></td>
		<td>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr>
		<td>
			<span id='spnCity' runat='server'/>
		</td>
		<td width='30'>&nbsp;</td>
		<td>
			<span id='spnState' runat='server'/>
		</td>
		<td width='30'>&nbsp;</td>
		<td>
			<span id='spnZip' runat='server'/>
		</td>
		</tr>
		<tr>		
		<td>City</td>
		<td width='30'>&nbsp;</td>	
		<td>State</td>
		<td width='30'>&nbsp;</td>
		<td>Zip</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnCountry' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Country</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td nowrap='true'>
			<b>E-mail Address</b> <%=kDenoteRequiredField%> 
		</td>
		<td>
			<span id='spnEmail' runat='server' />
		</td>
	</tr>
	<tr><td height='25'>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Phone</b></td>
		<td>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr>
		<td>
			<span id='spnPhoneNumber' runat='server'/>
		</td>
		
		<td width='30'>&nbsp;</td>
		<td>
			<span id='spnPhoneExt' runat='server'/>
		</td>
		<td width='30'>&nbsp;</td>
		<td><font size='1'>(Enter numbers only. Do not enter hyphens, parentheses, or periods.)</font></td>

		</tr>
		<tr>		
		<td>Number</td>
		<td width='30'>&nbsp;</td>	
		<td>Extension</td>
		</tr>
		<td width='30'>&nbsp;</td>
		</table>
		</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Fax</b></td>
		<td>
			<span id='spnFaxNumber' runat='server'/>&nbsp;&nbsp;
			<font size='1'>(Enter numbers only. Do not enter hyphens, parentheses, or periods.)</font>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Number</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Web Site</b></td>
		<td colspan=3>
			<span id='spnWebSite' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>URL</td>	
	</tr>
	<tr>
		<td></td>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue'/>&nbsp;&nbsp; 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectPIID'
					PropertyKey='GranteeProjectPIID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
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
						MaxLength='75'
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
				<DisplayProperty PropertyKey='Degree'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='25'
						MaxLength='100'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='25'
						MaxLength='50'>
					</Control>	
				</DisplayProperty>															
				<DisplayProperty PropertyKey='OrganizationDepartment'>
					<Control ID='ctlOrganizationDepartment'
						Container='spnOrganizationDepartment'
						Type='cTextBox'
						Size='50'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrganizationName'
						Container='spnOrganizationName'
						Type='cTextBox'
						Size='50'
						MaxLength='75'
						RequiredField='False'
						ErrorMessage='~~Organization~~ Name is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Container='spnAddress1'
						Type='cTextBox'
						Size='50'
						MaxLength='225'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Container='spnAddress2'
						Type='cTextBox'
						Size='50'
						MaxLength='225'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity'
						Container='spnCity'
						Type='cTextBox'
						Size='10'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState'
						Container='spnState'
						Type='cDropDown'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'>
						<Sort>
							<Argument PropertyKey='StateAbbr' Direction='Ascending'/>
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZip'
						Container='spnZip'
						Type='cTextBox'
						Size='10'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cDropDown'
						DataObjectDefinitionKey='Country'
						StoredValue='CountryID'
						DisplayValue='CountryDesc'>
						<SelectedValue>
							<Argument Type='' TypeKey='' PropertyKey='CountryID' Value='280' />
						</SelectedValue>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhoneNumber'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='25'
						MaxLength='20'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.'
 />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Container='spnPhoneExt'
						Type='cTextBox'
						Size='10'
						MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FaxNumber'>
					<Control ID='ctlFaxNumber'
						Container='spnFaxNumber'
						Type='cTextBox'
						Size='25'
						MaxLength='20'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Fax Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.'
 />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WebSite'>
					<Control ID='ctlWebSite'
						Container='spnWebSite'
						Type='cTextBox'
						Size='30'
						MaxLength='50'>
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
							AutoSave='False'
							Object='DataPresenter'
							Method='Save'/>					
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PrincipalInvestigators'/>
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
