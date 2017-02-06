<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br/>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr><td><h1>Board Members (Form F-2)</h1></td>
	</tr>
	<tr>
	 <td colspan="4" class="SeparatorHdg">Instructions</td>
	</tr>
	<tr>
	 <td colspan="4" >&nbsp;</td>
	</tr>
	<tr>
	 <td valign="top" ><p>Applicants who currently have a governing/policy body that conforms to 45 C.F.R. Part 1607 must complete Board Members (Form F-2). </p>
		  <p><strong><font color="#990000">Enter the following information for each board member:</font></strong></p>
		  <ul>
			 <li>Name </li>
			 <li>Gender </li>
			 <li>Ethnicity </li>
			 <li>Contact information </li>
			 <li>Indicate whether the contact information entered refers to the board member's business or home address </li>
			 <li>Appointing organization </li>
			 <li>Board member type </li>
		  </ul>
		  <p>Please note the following: </p>
		  <ul>
			 <li>The system may have already filled in certain fields based on information previously entered</li>
			 <li>Update this information as needed</li>
			 <li>All fields marked with an asterisk (*) are required</li>
			 <li>To save the data, click <strong>Save</strong></li>
			 <li>To return to the previous page, click <strong>Close</strong></li>
		  </ul>
		  <p><strong> Follow the steps below for assistance on this form:</strong></p>
		  <ul>
			 <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
			 <li> Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>. </li>
			 <li> Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
		  </ul></td>
	 <td >&nbsp;</td>
	 <td >&nbsp;</td>
	 <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
	Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
	runat='server'/></td>
  </tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
<!-- Control Label (for Name information) -->

	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Board Members</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	
<table width="600" border='0' cellpadding='0' cellspacing='0' runat='server'>
	
	<tr>
		<td	valign="top" width="139"><b>Name</b><%=kDenoteRequiredField%></td>
		<td width="184">
			<span id='spnPrefix' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>Prefix</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnFirst' runat='server'/>
		</td>
		<td width="93">
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td width="171">
			<span id='spnLast' runat='server'/>
		</td> 	
		<td width="13">
			
		</td>
	</tr>
	<tr>
		<td></td>	
		<td>
			First<%=kDenoteRequiredField%>
		</td>	
		<td>Middle</td>
		<td>
			Last<%=kDenoteRequiredField%>
		</td>
		<td>&nbsp;</td>	

	</tr>
	<tr>
	  <td></td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td></td>
	  <td><span id='spnSuffix' runat='server'/></td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td></td>
	  <td>Suffix</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	
	<tr>
		<td>&nbsp;</td>
	</tr>
    <tr>
		<td	valign="top" width="139"><b>Status</b><%=kDenoteRequiredField%></td>
		<td>
			<span id='spnStatus' runat='server'/>
		</td>
	</tr>
		<tr>
		<td>&nbsp;<br /></td>
	</tr>
	<tr>
		<td valign="top"><b>Appointing Organization</b><%=kDenoteRequiredField%></td>
		<td colspan='5'>
			<span id='spnAppointingOrganization' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top"><b>Relevant Experience</b><%=kDenoteRequiredField%></td>
		<td colspan='5'>
			<span id='spnExperience' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
		<tr>
		<td></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<b>Gender<%=kDenoteRequiredField%></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnGenderID' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<b>Ethnicity<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnEthnicityID' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="600" border='0' cellpadding='0' cellspacing='0' runat='server'>
  <tr>
    <td	valign="top" width="126"><b>Address<%=kDenoteRequiredField%></b></td>
    <td width="442"><span id='spnAddress' runat='server'/> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><b>City<%=kDenoteRequiredField%></b> </td>
    <td><span runat='server' id='spnCity' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </td>
    <td width="32">&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><b>State<%=kDenoteRequiredField%></b></td>
    <td><span runat='server' id='spnStateProvinceID' /> </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><b>Zip<%=kDenoteRequiredField%></b></td>
    <td><span runat='server' id='spnZip' /> </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><b>Phone</b></td>
    <td><span runat='server' id='spnPhone' /> </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;<br /></td>
  </tr>
  <tr>
    <td><b>Address/Phone<%=kDenoteRequiredField%></b> </td>
    <td><span runat='server' id='spnAddressPhoneTypeID' /> </td>
  </tr>
  <tr>
    <td><b>Type of Member<%=kDenoteRequiredField%></b> </td>
    <td colspan='5'><span runat='server' id='spnBoardMemberTypeID' /> </td>
  </tr>
  <tr>
    <td>&nbsp;<br /></td>
  </tr>
  <tr>
    <td><b>Email Address</b> </td>
    <td><span runat='server' id='spnEmail' /> </td>
  </tr>
  <tr>
    <td>&nbsp;<br /></td>
  </tr>
  <tr>
    <td></td>
    <td><!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
        <span runat='server' id='spnSave'/><span runat='server' id='spnClose'/> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='BoardMember' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations' Updatable='True' CreateNew='True'> 
			<Filters> 
				<Argument Type='QueryString' TypeKey='LscWfTaskAssignmentAffiliationID' PropertyKey='LscWfTaskAssignmentAffiliationID' Value=''/> 
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='3' /> 
			</Filters> 
			<DefaultValues> 
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='3' /> 
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' /> 
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' /> 
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' /> 
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' /> 
				<Argument PropertyKey='LscBoardInfoSourceID' Value='3' Update='False' Create='True' /> 
			</DefaultValues> 
			<DisplayProperties> 
				<DisplayProperty PropertyKey='StatusID'> 
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='BoardMemberStatus'
						StoredValue='BoardMemberStatusID'
						DisplayText='Select'
						DisplayValue='Description'
						Required='True'
						ErrorMessage='Status is required'>
						<Sort> 
							<Argument PropertyKey='SortOrder'/> 
						</Sort>
					</Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='PrefixID'> 
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'> 
						<Sort> 
							<Argument PropertyKey='SortOrder'/> 
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
				<DisplayProperty PropertyKey='SuffixID'> 
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'> 
						<Sort> 
							<Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AppointingOrganization'> 
					<Control ID='ctlAppointingOrganization'
						Container='spnAppointingOrganization'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Appointing Organization is required.'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='RelevantExperience'> 
					<Control ID='ctlExperience' 
						Type='cTextArea' 
						Container='spnExperience' 
						Rows='10' 
						Cols='55'
						RequiredField='True' 
						ErrorMessage='Relevant Experience is required.'
						RexErrorMessage='Relevant Experience is incorrectly formatted.'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='GenderID'> 
					<Control ID='ctlGenderID'
						Container='spnGenderID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Gender is required.'
						DataObjectDefinitionKey='Gender'
						StoredValue='GenderID'
						DisplayValue='Gender'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='StateProvinceID'> 
					<Control ID='ctlStateProvinceID'
						Type='cDropDown'
						Container='spnStateProvinceID'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr' 
						RequiredField='True'
						ErrorMessage='State is required.'> 
						<Filters>
							<Argument PropertyKey='CountryID' Value='280'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='StateAbbr'/>
						</Sort>
					</Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='EthnicityID'> 
					<Control ID='ctlEthnicityID'
						Type='cDropDown'
						Container='spnEthnicityID'
						DataObjectDefinitionKey='Ethnicity'
						StoredValue='EthnicityID'
						RequiredField='True'
						ErrorMessage='Ethnicity is required.'
						DisplayValue='EthnicityDesc' > 
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='EndDate' Operator='GreaterThan' />
							<Argument PropertyKey='EndDate' Value='' Bool='Or' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Address'> 
					<Control ID='txtAddress' 
						Type='cTextBox' 
						Container='spnAddress' 
						Size='60'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Address is required.'> </Control> </DisplayProperty> <DisplayProperty PropertyKey='City'> <Control ID='txtCity' 
						Type='cTextBox' 
						Container='spnCity' 
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='City is required.'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Zip'> 
					<Control ID='txtZip' 
						Type='cTextBox' 
						Container='spnZip' 
						Size='20'
						MaxLength='30'
						RequiredField='True'
						 ErrorMessage='Zip is required.'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Phone'> 
					<Control ID='txtPhone' 
						Type='cTextBox' 
						Container='spnPhone' 
						Size='20'
						MaxLength='20'> 
						<Validation Type='RegularExpression' 
							ValidationExpression='^\s?[0-9]{0,20}\s?$' 
							ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='AddressPhoneTypeID'> 
					<Control ID='ctlAddressPhoneTypeID'
						Container='spnAddressPhoneTypeID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Address/Phone is required.'
						DataObjectDefinitionKey='LscBoardMemberAddressType'
						StoredValue='LscBoardMemberAddressTypeID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='BoardMemberTypeID'> 
					<Control ID='ctlBoardMemberTypeID'
						Container='spnBoardMemberTypeID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Type of Member is required.'
						DataObjectDefinitionKey='LscBoardMemberType'
						StoredValue='LscBoardMemberTypeID'
						DisplayValue='Description'> 
					</Control> 
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Email'> 
					<Control ID='txtEmail' 
						Type='cTextBox' 
						Container='spnEmail' 
						Size='50'
						MaxLength='100'> 
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
							EnterKey='True'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='1607ComplianceReport' />
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
							EnterKey='True'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='1607ComplianceReport' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>