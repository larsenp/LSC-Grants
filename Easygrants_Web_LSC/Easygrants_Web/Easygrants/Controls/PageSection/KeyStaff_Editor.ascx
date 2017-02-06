<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Key Staff</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr>
		<td	valign="top" width="120"><b>Type</b></td>
		<td>
			<span id='spnType' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Name</b></td>
		<td><table border='0' cellspacing='0' cellpadding='0'>
		<tr>
		<td>
			<span id='spnFirst' runat='server'/>
		</td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td>
			<span id='spnLast' runat='server'/>
		</td> 	
		</tr>
		<tr>
		<td>
			First&nbsp;<%=kDenoteRequiredField%>
		</td>	
		<td>Middle</td>
		<td>
			Last&nbsp;<%=kDenoteRequiredField%>
		</td>
		</tr>
		</table></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
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
	<tr>
		<td	valign="top" width="120"></td>
		<td>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr>
		<td>
			<span id='spnCity' runat='server'/>
		</td>
		<td>
			<span id='spnState' runat='server'/>
		</td>
		<td>
			<span id='spnZip' runat='server'/>
		</td>
		</tr>
		<tr>		
		<td>City</td>	
		<td>State/Province</td>
		<td>Zip</td>
		</tr>
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
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Phone</b></td>
		<td>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr>
		<td>
			<span id='spnPhoneNumber' runat='server'/>
		</td>
		<td>
			<span id='spnPhoneExt' runat='server'/>
		</td>
		</tr>
		<tr>		
		<td>Number</td>	
		<td>Ext.</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Fax</b></td>
		<td>
			<span id='spnFaxNumber' runat='server'/>
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
		<td	valign="top" width="120"><b>Web Site:</b></td>
		<td colspan=3>
			<span id='spnWebSite' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>URL</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Fields of Expertise:</b></td>
		<td colspan=3>
			<span id='spnExpertise' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/> 
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
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
		<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectPIID'
					PropertyKey='GranteeProjectPIID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PITypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='OrganizationType'
						StoredValue='TypeID'
						DisplayValue='OrganizationAbbr'>
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
				<DisplayProperty PropertyKey='OrganizationDepartment'>
					<Control ID='ctlOrganizationDepartment'
						Container='spnOrganizationDepartment'
						Type='cTextBox'
						Size='35'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='ctlOrganizationName'
						Container='spnOrganizationName'
						Type='cTextBox'
						Size='35'
						MaxLength='75'
						RequiredField='False'
						ErrorMessage='~~Organization~~ Name is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1'
						Container='spnAddress1'
						Type='cTextBox'
						Size='35'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2'
						Container='spnAddress2'
						Type='cTextBox'
						Size='35'
						MaxLength='75'>
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
							<Argument PropertyKey='SortOrder' />
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
						DisplayValue='CountryDesc'
						DisplayNone='False'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhoneNumber'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PhoneExt'>
					<Control ID='ctlPhoneExt'
						Container='spnPhoneExt'
						Type='cTextBox'
						Size='10'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FaxNumber'>
					<Control ID='ctlFaxNumber'
						Container='spnFaxNumber'
						Type='cTextBox'
						Size='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WebSite'>
					<Control ID='ctlWebSite'
						Container='spnWebSite'
						Type='cTextBox'
						Size='30'
						MaxLength='100'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Expertise'>
					<Control ID='ctlExpertise'
						Container='spnExpertise'
						Type='cTextBox'
						Size='30'
						MaxLength='500'>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='People'/>
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
								<Argument AttributeName='PageKey' Value='People'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
