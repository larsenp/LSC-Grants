<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.PageSection.cParticipantAdminContactEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
	<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Participating <%=GetLabel("Organization")%></b></td>
	</tr>	
	<tr><td  colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='9%'><%=GetLabel("Organization")%>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>	
</table>
<br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='4'><b>Other Key Personnel Information</b></td>
	</tr>	
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>Name</b></td>
		<td colspan='3'><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td  colspan='3'>Prefix</td>	
	</tr>	
	<tr>
		<td width='10%'></td>
		<td width='15%'><span id='spnFirst' runat='server'/></td>
		<td width='10%'><span id='spnMiddle' runat='server'/></td>
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
		<td  colspan='3'><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan='3'>Suffix</td>	
	</tr>
	<tr>
		<td	width='10%'><b>Project Role&nbsp;<%=kDenoteRequiredField%></b></td>
		<td colspan='3'><span id='spnProjectRole' runat='server'/></td>
	</tr>
	<tr>
		<td	width='10%'><b>Position Title</b></td>
		<td colspan='3'><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>Position Title (e.g. Provost, Department Head, Vice President)</td>
	</tr>

	<tr>
		<td	width='10%'><b>Academic Rank</b></td>
		<td colspan='3'><span id='spnAcademicRank' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>(e.g. Full Professor, Associate Professor, Postdoctoral Student)</td>
	</tr>
	<tr>
		<td	width='10%'>&nbsp;</td>
		<td colspan='3'><span id='spnDivision' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan='3'>Division</td>	
	</tr>	
	<tr>
		<td	width='10%'>&nbsp;</td>
		<td><span id='spnDepartment' runat='server'/></td>
		<td><span id='spnSubDepartment' runat='server'/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>Department</td>	
		<td>Sub-Department</td>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td	width='10%'><b>Address</b></td>
		<td><span id='spnAddress1' runat='server'/></td>
		<td><span id='spnAddress2' runat='server'/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>Street Line 1<%=kDenoteRequiredField%></td>	
		<td>Street Line 2</td>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td	width='10%'>&nbsp;</td>
		<td colspan='3'><span id='spnAddress3' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan='3'>Street Line 3</td>	
	</tr>
	<tr>
		<td width='10%'></td>
		<td width='15%'><span id='spnCity' runat='server'/></td>
		<td width='10%'><span id='spnState' runat='server'/></td>
		<td><span id='spnZip' runat='server'/></td> 	
	</tr>
	<tr>
		<td></td>	
		<td>City&nbsp;<%=kDenoteRequiredField%></td>
		<td>State&nbsp;<%=kDenoteRequiredField%></td>
		<td>Zip/Postal Code&nbsp;<%=kDenoteRequiredField%></td>
	</tr>	
		<tr>
		<td	width='10%'>&nbsp;</td>
		<td colspan='3'><span id='spnCountry' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan='3'>Country &nbsp;<%=kDenoteRequiredField%></td>	
	</tr>	
	<tr>
		<td	width='10%'><b>Phone &nbsp;<%=kDenoteRequiredField%> &nbsp;(Business)</b></td>
		<td><span id='SpnPhone' runat='server'/></td>		
		<td colspan='2'><span id='SpnExtension' runat='server'/></td>
	</tr>
	<tr>
		<td	width='10%'></td>
		<td class='FieldLabel'>(Enter numbers only)</td>		
		<td colspan='2'>Extension</td>
	</tr>
	<tr>
		<td	width='10%'><b>Fax</b></td>
		<td colspan='3'><span id='SpnFax' runat='server'/></td>				
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>(Enter numbers only)</td>
	</tr>	
	<tr>
		<td	width='10%'><b>E-mail &nbsp;<%=kDenoteRequiredField%> &nbsp; (Business)</b></td>
		<td colspan='3'><span id='spnEmail' runat='server'/><span id='spnLblEmail' runat='server' /></td>
	</tr>
	<tr runat='server' id='TrEmailInst'>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>(Every individual entered must have a unique e-mail.)</td>
	</tr>	
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table10">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/><span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

	
	<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ParticipantAdminContactsEditorGranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectAdditionalContactID' PropertyKey='GranteeProjectAdditionalContactID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='And'/>
				<Argument Type='' TypeKey='' PropertyKey='GrantContactCategoryID' Value='2' Bool='And'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='StaffPersonID'/>
				<Argument Type='' TypeKey='' PropertyKey='GrantContactCategoryID' Value='2'/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='OrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True' ErrorMessage='~~Organization~~ is required.'	/>
				</DisplayProperty>	
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
						MaxLength='100'
						RequiredField='True' ErrorMessage='First name is required.'>
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
						Size='30'
						MaxLength='100'
						RequiredField='True' ErrorMessage='Last name is required.'>
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
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactTypeID'>
					<Control ID='ctlProjectRole'
						Container='spnProjectRole'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantContactType'
						StoredValue='GrantContactTypeID'
						DisplayValue='Description'
						RequiredField='True' ErrorMessage='Project Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Container='SpnPhone'
						Type='cTextBox'
						Size='15'
						MaxLength='50'
						RequiredField='True' ErrorMessage='Phone is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Extension'>
					<Control ID='ctlExtension'
						Container='SpnExtension'
						Type='cTextBox'
						Size='8'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlLblEmail'
						Container='spnLblEmail'
						Type='cLabel'>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail' Type='cEmailTextBox' Container='spnEmail' Size='45' MaxLength='100'
						RequiredField='True' ErrorMessage='E-mail Address is required.'
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'>						
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='AcademicRank'>
					<Control ID='ctlAcademicRank'
						Container='spnAcademicRank'
						Type='cTextBox'
						Size='40'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Division'>
					<Control ID='ctlDivision'
						Container='spnDivision'
						Type='cTextBox'
						Size='40'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Department'>
					<Control ID='ctlDepartment'
						Container='spnDepartment'
						Type='cTextBox'
						Size='40'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubDepartment'>
					<Control ID='ctlSubDepartment'
						Container='spnSubDepartment'
						Type='cTextBox'
						Size='40'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FaxNumber'>
					<Control ID='ctlFax'
						Container='SpnFax'
						Type='cTextBox'
						Size='15'
						MaxLength='50'
						RequiredField='True' ErrorMessage='Phone is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1' Type='cTextBox' Container='spnAddress1' Size='40' MaxLength='100' RequiredField='True' ErrorMessage='Street Line 1 is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2' Type='cTextBox' Container='spnAddress2' Size='40' MaxLength='100'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3' Type='cTextBox' Container='spnAddress3' Size='40' MaxLength='100'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity' Type='cTextBox' Container='spnCity' Size='20' MaxLength='100' RequiredField='True' ErrorMessage='City is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState' Container='spnState' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayValue='Description' DisplayText='Select'  RequiredField='True' ErrorMessage='State is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='ZipPostalCode'>
					<Control ID='ctlZip' Type='cTextBox' Container='spnZip' Size='12' MaxLength='30'   RequiredField='True' ErrorMessage='Zip/Postal Code is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry' Container='spnCountry' Type='cDropDown' DataObjectDefinitionKey='Country'
						StoredValue='CountryID' DisplayValue='CountryDesc' DisplayNone='True'  DisplayText='Select'  RequiredField='True' ErrorMessage='Country is required.' >
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='False'							
							Object='DataPresenter'
                            Method='SaveUser_PageReload'>
                            <Parameters>								
								<Argument Type='Control' TypeKey = 'ctlEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlMiddle' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlPrefix' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlSuffix' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlPhone' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlExtension' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='1' />	
								<Argument Type='' TypeKey = '' Value='ParticipantAdministrativeContactsEditor' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>	
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton' Caption='Cancel'
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