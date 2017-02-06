<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PersonOrgAffiliation.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPersonOrgAffiliationImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<span id='spnProfile' runat='server' visible='false'>
Provide information on the <%=GetLabel("Organization")%> with which the person is affiliated.
Click on the <b>    ...</b> button to locate the <%=GetLabel("Organization")%>'s name using the <%=GetLabel("Organization")%> Selection tool.
If you cannot locate the <%=GetLabel("Organization")%>, click on the link below to contact EasyGrants for assistance. To save your changes,
click on the <b>Save</b> button.
</span>
<span id='spnOrganization' runat='server' visible='false'>

</span>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<!-- Control Label (for Education information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=modulename%></b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr id='trPersonReadOnly'>
		<td colspan='2'>
			<b>Person:</b> <span runat='server' id='spnPersonReadOnly' />
		</td>
	</tr>
	<tr id='trOrgReadOnly'>
		<td colspan='2'>
			<b><%=GetLabel("Organization")%>:</b> <span runat='server' id='spnOrgReadOnly' />
		</td>
	</tr>
	<tr id='trOrgEditable'>
		<td><b>Affiliated <%=GetLabel("Organization")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><Core:cUserCtlLoader CtlID='ctlOrga' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' runat='server'
				id="CUserCtlLoader2" />
		</td>
	</tr>
	<tr id='trNewOrg'>
		<td></td>
		<td><span id='spnNewOrg' visible='true' runat='server' class='FieldLabel' />
			<span id='spnAncAdmin' visible='true' runat='server' />
		</td>
	</tr>
	<tr id='trPersonEditable'>
		<td width='25%'><b>Person</b>&nbsp;<font color='red'>*</font></td>
		<td ><Core:cUserCtlLoader CtlID='ctlPer' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server' id="CUserCtlLoader3" />
		</td>
	</tr>
	<tr id='trNewPerson'>
		<td></td>
		<td><span id='spnNewPerson' visible='true' runat='server' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Type of Affiliation</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnType' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Job Title</b></td>
		<td><span id='spnTitle' runat='server' /></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			This is the primary <%=GetLabel("Organization")%> for this contact
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnIsPrimary' runat='server' />
		</td>
	</tr>
	<tr>
		<td>This person is the primary contact for the <%=GetLabel("Organization")%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnIsPrimaryContact' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnSave' /><span runat='server' id='spnSaveAndClose' /><span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation'
			Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonOrganizationAffiliationID' PropertyKey='PersonOrganizationAffiliationID'
					Value='' Bool='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TypeID'>
					<Control ID='ctlType' Container='spnType' Type='cDropDown' DataObjectDefinitionKey='AffiliationType'
						StoredValue='AffiliationTypeID' DisplayValue='Description' RequiredField='True' ErrorMessage='Type of Affiliation is required.' DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary' Container='spnIsPrimary' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationID' PropertyValue='Organization.CommonOrganizationName' ReadOnly='QueryID'>
					<Control ID='ctlOrga' Type='cPopUpSelectorLauncher2' LabelText='Selected ~~Organization~~' RequiredField='True' ErrorMessage='Affiliated ~~Organization~~ is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPer' Type='cPopUpSelectorLauncher2' LabelText='Selected Person' RequiredField='True' ErrorMessage='Person is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle' Type='cTextBox' Container='spnTitle'
						Size='50' MaxLength='50' RequiredField='False'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimaryOrganizationContact'>
					<Control ID='ctlIsPrimaryContact' Container='spnIsPrimaryContact' Type='cCheckBox' StoredValue='1'
						DisplayValue='Primary'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPersonReadOnly' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrgReadOnly' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnAncAdmin' ID='ctlAncAdmin' Type='cLink' Caption='If you cannot find your ~~Organization~~, click here to contact EG ~~Organization~~.'>
						<Action PostBack='False' URL='/Easygrants_v4_EG_r1/Easygrants/Controls/Base/pgSupportForm.aspx?Type=Content'
							Target='Blank'></Action>
					</Control>
				</DisplayProperty>
				<!-- needed for matching functionality -->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewOrg' Container='spnNewOrg' Type='cLink' Caption='Add New ~~Organization~~' CausesValidation='False'>
						<Action PostBack='True' Object='DataPresenter' Method='AddOrganization'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AddOrganization' />
								<Argument Type='' TypeKey='' AttributeName='' Value='OrganizationID=0' />
								<Argument Type='' TypeKey='' AttributeName='' Value='Src=PersonOrgAffilEditor' />
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<!-- 
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewOrg' Container='spnNewOrg' Type='cLink' Caption='Add New Organization'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OrganizationEditor' />
								<Argument Type='' TypeKey='' AttributeName='' Value='OrganizationID=0' />
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				-->
				<!-- needed for matching functionality -->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewPerson' Container='spnNewPerson' Type='cLink' Caption='Add New Person Contact'>
						<Action PostBack='True' Object='DataPresenter' Method='AddPerson'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AddPerson' />
								<Argument Type='' TypeKey='' AttributeName='' Value='PersonID=0' />
								<Argument Type='' TypeKey='' AttributeName='' Value='Src=PersonOrgAffilEditor' />
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='PersonOrganizationAffiliation' DataObjectPropertyKey='PersonOrganizationAffiliationID' PropertyKey='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose' Container='spnSaveAndClose' Type='cButton' Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='DataPresenter' Method='Cancel'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='DataPresenter' Method='Cancel'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<!-- 
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				-->
			</DisplayProperties>
		</DataObject>
		<UserCtlLoader>
			<ctlOrga>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization' DisplayName='~~Organization~~ Name'>
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName' DisplayLabel='~~Organization~~ Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName' />
					</DisplayProperties>
				</DataObject>
			</ctlOrga>
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='PersonOrganization' DisplayName='Contact&amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst' />
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
