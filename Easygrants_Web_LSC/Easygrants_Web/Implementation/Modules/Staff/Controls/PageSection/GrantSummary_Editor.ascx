<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Info Editor</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Name information) -->
	<tr>
		<td	valign='top'><b>Grantee Name</b></td>
		<td	valign='top'>
			<span id='spnFirst' runat='server'/>
		</td>
		<td	valign='top'>
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td	valign='top'>
			<span id='spnLast' runat='server'/>
		</td> 	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td	valign='top'>First</td>
		<td	valign='top'>Middle</td>	
		<td	valign='top'>Last</td> 	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top' width='140'><b>Grantee <%=GetLabel("Organization")%></b></td>
		<td valign='top' width='450' colspan=3>
			<span id='spnOrgSelectLauncher' runat='server'/>
		</td>	
	</tr>

	<tr>
		<td valign='top'><b><%=GetLabel("ProjectTitle")%></b></td>
		<td valign='top' width='400' colspan=3>
			<span id='spnTitle' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top"><b>Status&nbsp;&nbsp;</b></td>
		<td valign="top" colspan=3>
			<span id='spnStatus' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan=3>
			<span runat='server' id='spnSave'></span>&nbsp;<span runat='server' id='spnCancel'></span>
		</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey='PrimaryOrganizationID'>
					<Control ID='ctlPrimaryOrganization'
						Container='spnPrimaryOrganization'
						Type='cDropDown'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='OrganizationName'>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelect'
						Type='cOrgSelectLauncherEMF'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='PrimaryOrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='CommonOrganizationName'
						RequiredField='True'
						ErrorMessage='~~Organization~~ is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='72'
						MaxLength='255'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID'
						DisplayValue='Abbr'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>														
			</DisplayProperties>
		</DataObject><!-- Key=GranteeProject -->
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PrimaryPersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key=Person -->
		<!--
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PrimaryPersonID' 
					PropertyKey='PersonID' Value=''/>
				<Argument Type='QueryString' TypeKey='PrimaryOrganizationID' 
					PropertyKey='OrganizationID' Value=''/>
				<Argument Type='' TypeKey='' 
					PropertyKey='TypeID' Value='1'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OrganizationID'>
					<Control ID='ctlPrimaryOrganization'
						Container='spnPrimaryOrganization'
						Type='cDropDown'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='OrganizationName'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		-->
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
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
		</DataObject><!-- Key=Base -->	
	</ModuleSection>
<!-- End Embedded XML -->
</span>
