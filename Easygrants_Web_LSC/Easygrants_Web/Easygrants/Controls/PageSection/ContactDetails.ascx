<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cContactDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  EnableViewState="false" %>


<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Person Information</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td>
			<span id="spnPersonName" runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<span id="spnOrgName" runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<span id="spnFullAddress" runat='server'/>
		</td>
	</tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table4">
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<b>Primary <%=GetLabel("Organization")%>:</b>
		</td>
		<td>
			<span runat='server' id='spnOrgLink'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Title:</b>
		</td>
		<td>
			<span runat='server' id='spnTitle'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>E-mail:</b>
		</td>
		<td>
			<span id="spnEmail" runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Primary Phone:</b>
		</td>
		<td>
			<span runat='server' id='spnPhone'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Web Address:</b>
		</td>
		<td>
			<span runat='server' id='spnWeb'/>
		</td>
	</tr>
</table>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Affiliated <%=GetLabel("Organization")%>s</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table5">
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br>
<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPersonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnOrgName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.AddressView.FullAddress' HtmlEncode='False'>
					<Control ID='spnFullAddress'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnOrgLink'
						Type='HtmlGenericControl'/>
					<!--
					<Control ID='lnkOrg'
						Type='cLink'
						Container='spnOrgLink'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationContact'/>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
					-->
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.Title'>
					<Control ID='spnTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1'>
					<Control ID='spnEmail'
						Type='HtmlGenericControl'/>
					<!--
					<Control ID='lnkEmail'
						Type='cLink'
						Container='spnEmail'>
						<Action PostBack='False'
							URL='Email'>
						</Action>
					</Control>
					-->
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1'>
					<Control ID='spnPhone'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryWebAddress.WebAddress'>
					<Control ID='spnWeb'
						Type='HtmlGenericControl'/>
					<!--
					<Control ID='lnkWeb'
						Type='cLink'
						Container='spnWeb'>
						<Action PostBack='False'
							URL='Web'>
						</Action>
					</Control>
					-->
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>							
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'/>
						<DisplayProperty PropertyKey='Type.Description' ColumnHeader='Type'/>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' ConfigurableHeader='True'>
							<!--
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							-->
						</DisplayProperty>
						<DisplayProperty PropertyKey='AffiliationDescription' ColumnHeader='Affiliation Description'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
									
	</ModuleSection>
<!-- End Embedded XML -->
</span>
