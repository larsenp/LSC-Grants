<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GranteeProjectPersonAffiliation.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGranteeProjectPersonAffiliation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<p>
<br>
From this page you can add an affiliation with a person record for the selected grantee project. 
First, select the person’s role. To locate the individual’s name, click on the <b>Select...</b> button. 
If you cannot locate the name using the Person Selection tool, 
click on the Contacts left navigational link to add the individual to the contacts database.
To save your changes, click on the <b>Save</b> button. To return to the Grant Contacts page without saving
the changes, click on the <b>Close</b> button.
<p>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Contacts Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td><b>Contact Name&nbsp;</b><font color='red'>*</font></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlPer'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
				Properties='RefreshParentPage=True&TextQueryString=Text&ValueQueryString=Value'
				runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Contact Role<font color='red'>*</font></b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnRole' runat='server'/></td>
		<td></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr id='trInst' visible='true'>
		<td><b><%=GetLabel("Organization")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnInst' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Department</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDept' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>E-mail</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEmail' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td colspan='2'></td>
		<td class='FieldLabel'>You may enter up to 250 characters for the e-mail address.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Phone</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnPhone' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td colspan='2'></td>
		<td class='FieldLabel'>Enter area code and number with no extra characters, i.e., 123457890.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Project Title</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProjectTitle' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Award Year</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAwardYear' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td>
		</td>
		<td width='10'>&nbsp;</td>
		<td>(YYYY)</td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Active</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnActive' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Affiliation Description</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td colspan='2'></td>
		<td class='FieldLabel'>You may enter up to 750 characters for the description.</td>
	</tr>
	
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnReset'/>	
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPersonAffiliation' DataObjectDefinitionKey='GranteeProjectPersonAffiliation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectPersonAffiliationID' 
					PropertyKey='GranteeProjectPersonAffiliationID' 
					Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='GranteeMemberRole'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Contact Role is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPer'
					Type='cPopUpSelectorLauncher2'
					LabelText='Selected Name'
					RequiredField='True'
					ErrorMessage='Contact Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationID'>
					<Control ID='ctlInst'
						Container='spnInst'
						Type='cDropDown'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						StoredValue='OrganizationID'
						DisplayValue='Organization.CommonOrganizationName'>
						<Filters>
							<Argument Type='DataObjectCollection' 
								TypeKey='GranteeProjectPersonAffiliation' 
								DataObjectPropertyKey='PersonID'
								PropertyKey='PersonID' 
								Value='' Bool=''/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Department'>
					<Control ID='ctlDept'
						Container='spnDept'
						Type='cTextBox'
						Size='30'
						MaxLength='50'
						RequiredField='False'
						ErrorMessage='Department is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail'
						Container='spnEmail'
						Type='cEmailTextBox'
						Size='30'
						MaxLength='250'
						RequiredField='False'
						ErrorMessage='E-mail address is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Phone'>
					<Control ID='ctlPhone'
						Container='spnPhone'
						Type='cTextBox'
						Size='30'
						MaxLength='20'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.'/>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='ctlProjectTitle'
						Container='spnProjectTitle'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
						RequiredField='False'
						ErrorMessage='Role is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AwardYear'>
					<Control ID='ctlAwardYear'
						Container='spnAwardYear'
						Type='cTextBox'
						Size='4'
						MaxLength='4'
						RequiredField='False'
						ErrorMessage='Compare Date for Eligibility is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Active'>
					<Control ID='ctlActive'
						Container='spnActive'
						Type='cCheckBox'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						Rows='5'
						Cols='50'
						MaxLength='750'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,750}$' ErrorMessage='Limit your Description to 750 characters or less.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<!-- Save Reset and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='Save'>
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
		<UserCtlLoader>
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>							
	</ModuleSection>
</span>
<!-- End Embedded XML -->
