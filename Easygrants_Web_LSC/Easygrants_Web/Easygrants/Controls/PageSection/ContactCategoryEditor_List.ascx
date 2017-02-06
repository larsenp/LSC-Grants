<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cContactCategoryEditor_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Add or Edit Contact Category</b></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td width='5%'><b>Category&nbsp;</b><%=kDenoteRequiredField%>
		</td>	
		<td>&nbsp;</td>
		<td><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td width='5%'><b>Description</b>
		</td>  
		<td>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			To add members to a category, first enter a partial last name or <%=GetLabel("Organization")%> and click <b>Find</b>.  
			Matching names will appear in the Available list.  Select the desired name(s) and click <b>Add</b>.  

		</td>
	</tr>
</table>
<br>
<table border='0' cellpadding='0' cellspacing='0'>
	<tr>
		<td>
			<b>Name (Last or <%=GetLabel("Organization")%>)</b>&nbsp;&nbsp;
		</td>
		<td>
			<input type='text' id='txtLastName' size='20' maxlength='100' runat='server' /> <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
		</td>
		<td>
			<span runat='server' id='spnFind'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			<span runat='server' id='spnContactCategoryMember'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>	
	</td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ContactCategory' DataObjectDefinitionKey='ContactCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ContactCategoryID'
					PropertyKey='ContactCategoryID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Type='cTextBox'
						Container='spnTitle'
						Size='40'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Category is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='40'
						MaxLength='255'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Container='spnFind'
						Type='cButton'
						Image='Find'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Find'>				
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactCategoryMembers'>
					<Control ID='ctlContactCategoryMember'
						Container='spnContactCategoryMember'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='Person'
						DisplayValue='LastNameFirstNamePrimInst'
						StoredValue='EntityID'
						StoredSourceValue='PersonID'
						StoredDisplayValue='Person.LastNameFirstNamePrimInst' 
						Height='9'
						Sort='True'
						DisplayNone='False'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ContactCategoryID' PropertyKey='ContactCategoryID' Value=''/>
							<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='LastName'/>
							<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='OrganizationName' Bool='Or'>
								<RelatedProperty PropertyKey='PersonOrganizationAffiliations.Organization' />
							</Argument>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>			
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Categories'/>
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
							Method='Cancel'>					
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
