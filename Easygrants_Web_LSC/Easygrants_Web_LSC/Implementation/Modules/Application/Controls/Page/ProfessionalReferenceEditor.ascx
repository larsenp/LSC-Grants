<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<h1>List of References</h1>
<div style="width:600px">
	<div class="SeparatorHdg">
		Instructions
	</div>
	<table width='100%'>
		<tr>
			<td>
				<p style="color:red; font-weight:bold">Enter the following information for each professional reference:</p>
				<ul>
					<li>
						Name
					</li>
					<li>
						Title
					</li>
					<li>
						Organization
					</li>
					<li>
						Address Information
					</li>
					<li>
						Phone number
					</li>
					<li>
						Fax number
					</li>
					<li>
						Email address
					</li>
				</ul>
				<p>Please note the following:</p>
				<ul>
					<li>
						The system may have already filled in certain fields based on information previously entered
					</li>
					<li>
						Update this information as needed
					</li>
					<li>
						All fields marked with an asterisk (<font color='red'>*</font>) are required
					</li>
					<li>
						To save the data, click <b>Save</b>
					</li>
					<li>
						To return to the previous page, click <b>Close</b>
					</li>
				</ul>
			</td>
         <td width="160" valign="top" >
			 	<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
	</table>
	<div class="SeparatorHdg">
		Add or Edit Professional References
	</div>
	<table style="width:100%">
		<tr>
			<td style="width:100px; vertical-align:top">
				<b>Name<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnPrefixID'/><br />
				<span class="FieldLabel">Prefix</span>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">&nbsp;</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnFirstName'/><br />
				<span class="FieldLabel">First<font color='red'>*</font></span>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnMiddleName'/><br />
				<span class="FieldLabel">Middle</span>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnLastName'/><br />
				<span class="FieldLabel">Last<font color='red'>*</font></span>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan='3'>
				<span runat='server' id='spnSuffixID'/><br />
				<span class="FieldLabel">Suffix</span>
			</td>
		</tr>
		<tr>
			<td>
				<b>Title<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnTitle'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Organization<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnAppointingOrganization'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Address<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnAddress'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>City<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnCity'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>State<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnStateProvinceID'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Zip<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnZip'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Phone<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnPhone'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Fax<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnFax'/><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Email Address<font color='red'>*</font></b>
			</td>
			<td colspan='3'>
				<span runat='server' id='spnEmail'/><br />
			</td>
		</tr>
	</table>
	<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/><span runat='server' id='spnClose'/>
	</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
		<Filters>
			<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
		</Filters>
	</DataObject>
	<DataObject Key='LscWfTaskAssignmentAffiliations' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations' Updatable='True' CreateNew='True'>
		<Filters>
			<Argument Type='QueryString' TypeKey="LscWfTaskAssignmentAffiliationID" PropertyKey="LscWfTaskAssignmentAffiliationID"/>
		</Filters>
		<DefaultValues>
			<Argument PropertyKey='AffiliationTypeID' Value="4"/>
			<Argument Type="DataObjectCollection" TypeKey="vLSCCompWftaOrgServareaYear" DataObjectPropertyKey="OrganizationID" PropertyKey="OrganizationID"/>
			<Argument Type="DataObjectCollection" TypeKey="vLSCCompWftaOrgServareaYear" DataObjectPropertyKey="TimePeriodID" PropertyKey="TimePeriodID"/>
		</DefaultValues>
		<DisplayProperties>
			<DisplayProperty PropertyKey="PrefixID">
				<Control ID='ctlPrefixID'
					Type='cDropDown'
					Container='spnPrefixID'
					DataObjectDefinitionKey='Prefix'
					StoredValue='PrefixID'
					DisplayValue='Prefix'/>
			</DisplayProperty>
			<DisplayProperty PropertyKey='FirstName'> 
				<Control ID='ctlFirstName'
					Container='spnFirstName'
					Type='cTextBox'
					Size='25'
					MaxLength='75'
					RequiredField='True'
					ErrorMessage='First Name is required.'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='MiddleName'> 
				<Control ID='ctlMiddleName'
					Container='spnMiddleName'
					Type='cTextBox'
					Size='10'
					MaxLength='75'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='LastName'> 
				<Control ID='ctlLastName'
					Container='spnLastName'
					Type='cTextBox'
					Size='25'
					MaxLength='75'
					RequiredField='True'
					ErrorMessage='Last Name is required.'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='SuffixID'> 
				<Control ID='ctlSuffixID'
					Container='spnSuffixID'
					Type='cDropDown'
					DataObjectDefinitionKey='Suffix'
					StoredValue='SuffixID'
					DisplayValue='Suffix'> 
					<Sort> 
						<Argument PropertyKey='SortOrder'/> 
					</Sort> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='Title'> 
				<Control ID='txtTitle'
					Container='spnTitle'
					Type='cTextBox'
					Size='25'
					MaxLength='50'
					RequiredField='True'
					ErrorMessage='Title is required.'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='AppointingOrganization'> 
				<Control ID='ctlAppointingOrganization'
					Container='spnAppointingOrganization'
					Type='cTextBox'
					Size='25'
					MaxLength='50'
					RequiredField='True'
					ErrorMessage='Organization is required.'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='Address'> 
				<Control ID='txtAddress' 
					Type='cTextBox' 
					Container='spnAddress' 
					Size='60'
					MaxLength='100'
					RequiredField='True'
					ErrorMessage='Address is required.'> 
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='City'> 
				<Control ID='txtCity' 
					Type='cTextBox' 
					Container='spnCity' 
					Size='50'
					MaxLength='50'
					RequiredField='True'
					ErrorMessage='City is required.'> 
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
					MaxLength='20'
					RequiredField='True'
					ErrorMessage='Phone is required.'> 
					<Validation Type='RegularExpression' 
						ValidationExpression='^\s?[0-9]{0,20}\s?$' 
						ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='Fax'> 
				<Control ID='txtFax' 
					Type='cTextBox' 
					Container='spnFax' 
					Size='20'
					MaxLength='20'
					RequiredField='True'
					ErrorMessage='Fax is required.'> 
					<Validation Type='RegularExpression' 
						ValidationExpression='^\s?[0-9]{0,20}\s?$' 
						ErrorMessage='Fax Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
				</Control> 
			</DisplayProperty> 
			<DisplayProperty PropertyKey='Email'> 
				<Control ID='txtEmail' 
					Type='cTextBox' 
					Container='spnEmail' 
					Size='50'
					MaxLength='100'
					RequiredField='True'
					ErrorMessage='Email is required.'> 
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
							<Argument Value='ProfessionalReferences' />
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
							<Argument Value='ProfessionalReferences' />
						</Parameters>
					</Action>
				</Control>
			</DisplayProperty>
		</DisplayProperties>
	</DataObject>
	</ModuleSection>
</span>
