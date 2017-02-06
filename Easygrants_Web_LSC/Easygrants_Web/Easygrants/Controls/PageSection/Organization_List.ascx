<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cOrganization_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<!-- Page Content - Controls -->
<span id='spnWinOpen' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.open("<%=URL%>")
	</SCRIPT>
</span><span id='spnWinRedirect' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.opener.location = "<%=URL%>"
		window.close();
	</SCRIPT>
</span><span id='spnWinClose' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.close();
	</SCRIPT>
</span>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<!-- Control Label (for Name information) -->
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">
			<p>
				Possible matches were found for the contact being added. Listed below are the potential matches. Click on the <%=GetLabel("Organization")%> common name to view additional contact information for each potential match in a new window.
			</p>
			<p>	
			
			    To continue adding the new contact, click <b>Create a New Contact.</b> 
			    If a match was found on the Employer Identification Number, you cannot complete the creation of the <%=GetLabel("Organization")%>.
			    Click <b>Close</b> to cancel adding a new contact record and return to the Add <%=GetLabel("Organization")%> page. 
			</p>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><hr>
		</td>
	</tr>
	<tr visible='false' id='spnEINTable' runat='server'>
		<td valign="top" colspan="2"><b>Existing Employer Identification Numbers Matching:</b>
			<%=EIN%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			Checking for exact matches on the Employer Identification Number (EIN.)</td>
	</tr>
	<tr visible='false' id='spnOrgNameTable' runat='server'>
		<td valign="top" colspan="2"><b>Existing Names Like:</b>
			<%=OrganizationName%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			Checking for exact matches on the Common Name of the <%=GetLabel("Organization")%> and the City and State of the Organization.</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="10">&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<span runat='server' id='spnCancel' visible='true' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnNewOrganization' runat='server' visible='True' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EIN' PropertyKey='EIN' />
				<Argument Group='(' Bool='Or' />
				<Argument Group='(' Bool=''/>
				<Argument Type='QueryString' TypeKey='CommonOrgName' PropertyKey='CommonOrganizationName'
					Operator='Like' Value='' Bool='' />
				<Argument Type='QueryString' TypeKey='OrgName' PropertyKey='OrganizationName'
					Operator='Like' Value='' Bool='Or' />	
				<Argument Group=')' Bool='' />	
				<Argument Type='QueryString' TypeKey='City' PropertyKey='City' Bool='And'>
					<RelatedProperty PropertyKey='PrimaryAddress' />
				</Argument>
				<Argument Type='QueryString' TypeKey='StateID' PropertyKey='StateID' Bool='And'>
					<RelatedProperty PropertyKey='PrimaryAddress' />
				</Argument>
				<Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='OrganizationID' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewOrganization' Container='spnNewOrganization' Type='cButton' Image='Create a New Contact'>
						<Action PostBack='True' Object='DataPresenter' Method='CreateNewOrganization'></Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='DataPresenter' Method='Cancel'></Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList' Container='spnDataList' Type='cDataListCtl' DataObjectDefinitionKey='Organization'
						NoRecordMessage='No ~~Organization~~ were found' MaxPerPage='10'>
						<DisplayProperty PropertyKey='OrganizationID' ColumnHeader='Organization ID' />
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Legal Name' />
						
						<!--
						<DisplayProperty PropertyKey='CommonOrganizationName' ColumnHeader='Common Name'>
							<Control ID='ctlLink' Type='cLink'>
								<Action PostBack='True' Object='DataPresenter' Method='Redirect'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' Value='' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						-->
						
						<!-- need to set postback = false, kda 3/20/06 -->
						<DisplayProperty PropertyKey='OrgDetailsDisplayURL' ColumnHeader='Common Name'>
							<Control ID='ctlLink'
								Type='cLink'
								CaptionKey='CommonOrganizationName'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
						
						
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City' />
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State/Province' />
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Creation Date' Format='M/d/yyyy' />
						<DisplayProperty PropertyKey='ModifyDate' ColumnHeader='Modified Date' Format='M/d/yyyy' />
						<DisplayProperty PropertyKey='ModifiedByUser.Person.FirstNameLastName' ColumnHeader='Modified By' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
