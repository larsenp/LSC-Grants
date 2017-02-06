<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cOrgDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<br>
<p>Following are the details for the Matching <%=GetLabel("Organization")%>.  To return to the Matching Organizations page, click the <b>Close</b> button at the bottom of the page or close this browser.</p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><%=GetLabel("Organization")%> Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td>
			<b><%=GetLabel("Organization")%> ID:</b>&nbsp;&nbsp;<span id="spnOrgID" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3">
	<tr>
		<td>
			<b>Legacy <%=GetLabel("Organization")%> ID:</b>&nbsp;&nbsp;<span id="spnLegacyOrgID" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="tblName" visible='true'>
	<tr>
		<td>
			<span id="spnName" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="tblAddr1" visible='true'>
	<tr>
		<td>
			<span id="spnAddr1" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="tblAddr2" visible='true'>
	<tr>
		<td>
			<span id="spnAddr2" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="tblAddr3" visible='true'>
	<tr>
		<td>
			<span id="spnAddr3" runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="tblCityStateZip" visible='true'>
	<tr>
		<td>
			<span id='spnCity' runat='server'/>,&nbsp;<span id='spnState' runat='server'/>&nbsp;<span id='spnZip' runat='server'/>
		</td>
	</tr>
</table>
<br>

<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table7">
<!-- Control Label (for Name information) -->
	<tr>
		<td><b>Legal <%=GetLabel("Organization")%> Name:&nbsp;&nbsp;</b><span id="spnLegalName" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Common <%=GetLabel("Organization")%> Name:&nbsp;&nbsp;</b><span id="spnCommonName" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Acronym:&nbsp;&nbsp;</b><span id="spnAcronym" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Employer Identification Number:&nbsp;&nbsp;</b><span id="spnEIN" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Primary Contact:&nbsp;&nbsp;</b><span id='spnPerson' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Title:&nbsp;&nbsp;</b><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td><b>E-mail:&nbsp;&nbsp;</b><span id='spnEmail' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Primary Phone:&nbsp;&nbsp;</b><span id="spnPhone" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Web Address:&nbsp;&nbsp;</b><span id="spnWeb" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Current Annual Operating Budget: &nbsp;&nbsp;</b><span id="spnAnnualBudget" runat='server'/></td>
	</tr>
	<tr>
		<td><b>Fiscal Year Begin Date: &nbsp;&nbsp;</b><span id='spnBeginDate' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Fiscal Year End Date: &nbsp;&nbsp;</b><span id="spnEndDate" runat='server'/></td>	
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table4">
	<tr>
		<td class="SeparatorHdg"><b><%=GetLabel("Organization")%> Contacts</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table5" Width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--	Key: index into cDataPresenter.mDataObjHash
				DataObjectDefinitionKey: index into DataDefinition.xml
		-->
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='OrganizationID' 
					PropertyKey='OrganizationID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OrganizationID'>
					<Control ID='spnOrgID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyOrganizationID'>
					<Control ID='spnLegacyOrgID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnName'
						Container='spnName'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='spnLegalName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnCommonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Acronym'>
					<Control ID='spnAcronym'
						Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='EIN'>
					<Control ID='spnEIN'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='AnnualOperatingBudget' Format='$#,0' MaxInputDecimalPlaces='0'>
					<Control ID='spnAnnualBudget'
						Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='FiscalYearBeginDate' Format='M/d/yyyy'>
					<Control ID='spnBeginDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FiscalYearEndDate' Format='M/d/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='PrimaryAddress.Address1'>
					<Control ID='spnAddr1'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.Address2'>
					<Control ID='spnAddr2'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.Address3'>
					<Control ID='spnAddr3'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.City'>
					<Control ID='spnCity'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr'>
					<Control ID='spnState'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryAddress.Zip'>
					<Control ID='spnZip'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPhone.ContactValue1'>
					<Control ID='spnPhone'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryWebAddress.WebAddress'>
					<Control ID='spnWeb'
						Type='HtmlGenericControl'/>
					<!--
					<Control ID='lnkWeb'
						Type='cLink'
						Container='spnWeb'>
						<Action PostBack='False'
							Target='_blank'
							URL='Web'/>
					</Control>
					-->
				</DisplayProperty>
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
			</DisplayProperties>
		</DataObject>
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='Organization' 
					DataObjectPropertyKey='OrganizationID'
					PropertyKey='OrganizationID' 
					Value='' 
					Bool=''/>
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='IsPrimaryOrganizationContact' 
					Value='True' 
					Bool='And'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
					<!--
					<Control ID='ctlPerson'
						Container='spnPerson'
						Type='cLink'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PersonContact'/>
								<Argument Type='DataObjectCollection' TypeKey='PersonOrganizationAffiliation' DataObjectPropertyKey='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
								<Argument Type='DataObjectCollection' TypeKey='PersonOrganizationAffiliation' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
							</Parameters>
						</Action>
					</Control>
					-->
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.PrimaryAddress.Title'>
					<Control ID='spnTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.PersonPrimaryEMail.ContactValue1'>
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
			</DisplayProperties>	
		</DataObject>

		<DataObject Key='OrgDetailsList' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' 
					PropertyKey='OrganizationID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>							
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimaryOrganizationContact' Format='YesNo' ColumnHeader='Primary'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'>
							<!--
							<Control ID='lnkPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control-->
						</DisplayProperty>
						<!-- <DisplayProperty PropertyKey='Person.PrimaryAddress.Title' ColumnHeader='Title'/> -->
						<DisplayProperty PropertyKey='Person.PersonPrimaryEMail.ContactValue1' ColumnHeader='E-mail'>
							<!--
							<Control ID='lnkEmail'
								Type='cLink'>
								<Action
									PostBack='False'
									URL='Email'>
								</Action>
							</Control>
							-->
						</DisplayProperty>
						<DisplayProperty PropertyKey='Type.Description' ColumnHeader='Type'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		
	</ModuleSection>
<!-- End Embedded XML -->
</span>