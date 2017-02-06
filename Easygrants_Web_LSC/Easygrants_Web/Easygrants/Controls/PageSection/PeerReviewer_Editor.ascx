<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPeerReviewer_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg" ><b>Instructions</b></td>
	</tr>	
</table>

<br>
      <span id='spnPageContent' runat='server' />
<br>
<br>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Reviewer Information</b></td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<td><b>Reviewer Type&nbsp;<%=kDenoteRequiredField%></b>
				<asp:CustomValidator id="CtlValType" runat="server"
				OnServerValidate="valType"
				Display="None"
				ErrorMessage="Other Reviewer Type is required."/>
		</td>
		<td  colspan='3'><span id='spnType' runat='server'/></td>
	</tr>	
	<tr>
		<td><b>Other Type</b></td>
		<td  colspan='3'><span id='spnOtherType' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3' class='FieldLabel'>Enter the other reviewer type here only if Other is selected for the Reviewer Type.</td>
	</tr>
	<tr>
		<td><b>Reviewer Name</b>&nbsp;</td>
		<td  colspan='3'><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'>Prefix</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='15%'><span id='spnFirst' runat='server'/></td>
		<td width='9%'><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td  colspan='3'><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td   colspan='3'>Suffix</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("Organization")%> Name&nbsp;<%=kDenoteRequiredField%></b></td>
		<td colspan='3' ><span id='spnOrgName' runat='server'/><!-- <span id='spnOrgSelectLauncher' runat='server'/> --></td>
	</tr>
	<tr>
		<td><b>&nbsp;</td>
		<td colspan='3' class='FieldLabel'>Enter the reviewer's <%=GetLabel("Organization")%> name.</td>
	</tr>
	<tr>
		<td><b>Position Title</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td colspan='3'><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3' class='FieldLabel'>Enter reviewer's position with the <%=GetLabel("Organization")%> named above.</td>
	</tr>
	<tr>
		<td><b>Reviewer Primary Address</b></td>	
		<td  colspan='3'><span id='spnAddress1' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td  colspan='3'>Street Address Line 1&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'><span id='spnAddress2' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td  colspan='3'>Street Address Line 2</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'><span id='spnAddress3' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td  colspan='3'>Street Address Line 3</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnCity' runat='server'/></td>
		<td>&nbsp;</td>
		<td><span id='spnState' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>City&nbsp;<%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td>State/Province/Territory&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><span id='spnRegion' runat='server'/></td>
		<td>&nbsp;</td>
		<td><span id='spnZipCode' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Region (International Applicants only.)</td>
		<td>&nbsp;</td>
		<td>Zip/Postal Code&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'><span id='spnCountry' runat='server'/></td>		
	</tr>
	<tr>
		<td>&nbsp;</td>		
		<td  colspan='3'>Country&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td><b>Reviewer Phone&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span id='spnPhoneNumber' runat='server'/></td>
		<td colspan='2'><span id='spnPhoneExt' runat='server'/></td>
	</tr>
	<tr>
		<td	align='right'>&nbsp;</td>
		<td class='FieldLabel'>Enter numbers only, e.g.,  3015557777.</td>
		<td colspan='2'>Extension</td>	
	</tr>
	<tr>
		<td><b>Reviewer E-mail&nbsp;<%=kDenoteRequiredField%></b></td>
		<td  colspan='3'><span id='spnTxtEmail' runat='server'/><span id='spnLblEmail' runat='server' />
			<asp:CustomValidator id="CtlvalUniqueEmail" runat="server"
				OnServerValidate="valUniqueEmail"
				Display="None"
				ErrorMessage="A reviewer has already been added with that e-mail address.  You must enter a unique e-mail address."/>
		</td>
	</tr>
	<tr runat='server' id='TrEmailInst'>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>Enter one e-mail address, e.g., test@test.org or test@test.org.uk.<br> Be sure this e-mail address is entered correctly as it is not editable once this page is saved.</td>
	</tr>	
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
				<br><br><br>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	<PageContent/>
		<DataObject Key='PREditorWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />		
			</Filters>
		</DataObject>	
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonRelationshipID' PropertyKey='PersonRelationshipID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />				
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />	
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonRoleID' Value='108' />			
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />	
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='TaskID' Value='' />	
				<Argument Type='DataObjectCollection' TypeKey='PREditorWfTaskAssignment' DataObjectPropertyKey='WfProjectTask.ChildProjectTasks.WfTaskID' PropertyKey='ThirdPartyTaskID'/>				
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonID' Value='-1' />
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='RelatedPersonID'/>
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonRoleID' Value='108'/>
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='RelatedPersonReferenceTypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='ReferenceType'
						StoredValue='ReferenceTypeID'
						DisplayValue='Abbr'
						RequiredField='True' DisplayText='Select'
						ErrorMessage='Reviewer type is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatedPersonOtherReference'>
					<Control ID='ctlOtherType'
						Container='spnOtherType'
						Type='cTextBox'
						Size='30'
						MaxLength='100'>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPrefixID'>
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
				
				<DisplayProperty PropertyKey='RelatePersonDisplayFirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='First name is required.'>
						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayMiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='RelatePersonDisplayLastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Last name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplaySuffixID'>
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
				<DisplayProperty PropertyKey='RelatePersonDisplayTitle'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='Position/Title is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayInstitutionName'>
					<Control ID='ctlOrgName'
						Container='spnOrgName'
						Type='cTextBox'
						Size='25'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='~~Organization~~ Name is required.'/>
				</DisplayProperty>
				
				<%-- 
				<DisplayProperty PropertyKey='RelatePersonDisplayOrganization.OrganizationName'>
					<Control ID='ctlOrgSelect' 
						Type='cOrgSelectLauncherNotInList'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='RelatePersonDisplayOrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='OrganizationName'
						RequiredField='True'
						ErrorMessage='Organization Name is required.'/>
				</DisplayProperty>
				--%>	
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress1' Type='cTextBox' Container='spnAddress1' Size='50' MaxLength='150' RequiredField='True'
						ErrorMessage='Street Address Line 1 is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='ctlAddress2' Type='cTextBox' Container='spnAddress2' Size='50' MaxLength='100'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address3'>
					<Control ID='ctlAddress3' Type='cTextBox' Container='spnAddress3' Size='50' MaxLength='100'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='ctlCity' Type='cTextBox' Container='spnCity' Size='20' MaxLength='50' RequiredField='True'
						ErrorMessage='City is required.'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StateID'>
					<Control ID='ctlState' Container='spnState' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayValue='Description' DisplayText='Select' RequiredField='True'
						ErrorMessage='State/Province/Territory is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Region'>
					<Control ID='ctlRegion'
						Container='spnRegion'
						Type='cTextBox'
						Size='20'
						MaxLength='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Zip'>
					<Control ID='ctlZipCode' Type='cTextBox' Container='spnZipCode' Size='12' MaxLength='30' RequiredField='True'
						ErrorMessage='Zip code is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CountryID'>
					<Control ID='ctlCountry' Container='spnCountry' Type='cDropDown' DataObjectDefinitionKey='Country'
						StoredValue='CountryID' DisplayValue='CountryDesc' DisplayNone='True'  DisplayText='Select' RequiredField='True'
						ErrorMessage='Country is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlLblEmail'
						Container='spnLblEmail'
						Type='cLabel'>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlTxtEmail'
						Container='spnTxtEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						RexErrorMessage='E-mail address is incorrectly formatted.  Use the following format to enter the e-mail address: test@test.org or test@test.org.uk.'
						ErrorMessage='E-mail Address is required.'>						
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='RelatePersonDisplayPhone'>
					<Control ID='ctlPhone'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone is required. Extension is not required.'>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPhoneExt'>
					<Control ID='ctlPhoneExt'
						Container='spnPhoneExt'
						Type='cTextBox'
						Size='5'
						MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
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
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='SaveUser_SelectThirdParty_PageReload'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlTxtEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='1' />	
								<Argument Type='' TypeKey = '' Value='PeerReviewersEditor' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'							
							Object='EventController'
							Method='SaveUser_SelectThirdParty_NavigateToURL'>
							<Parameters>								
								<Argument Type='Control' TypeKey = 'ctlTxtEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='1' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>											
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
</span>
<!-- End Embedded XML -->
