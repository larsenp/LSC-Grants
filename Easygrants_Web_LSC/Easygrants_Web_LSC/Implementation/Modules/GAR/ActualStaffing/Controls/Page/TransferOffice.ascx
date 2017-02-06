<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form E-1: Transfer Office</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormE1' 
	Src='Implementation/Modules/GAR/ActualStaffing/Controls/PageSection/FormE1_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<table width='800' cellpadding='5' cellspacing='0' >
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			Select New Office
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			Staff Member
		</td>
		<td>
			<span runat='server' id='spnFirstName' />&nbsp;<span runat='server' id='spnLastName' />
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			Office Name&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnLscOfficeID' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='3'>
			<span runat='server' id='spnContinue' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscStaffDetail' DataObjectDefinitionKey='LscStaffDetail' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscStaffDetailID' PropertyKey='LscStaffDetailID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='spnFirstName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='spnLastName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOfficeID'>
					<Control ID='ctlLscOfficeID'
						Type='cDropDown'
						Container='spnLscOfficeID'
						DataObjectDefinitionKey='LscOffice'
						StoredValue='LscOfficeID'
						DisplayValue='OffName'
						DisplayText='Select' 
						RequiredField='True'
						ErrorMessage='You must select an office.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscOffice.Organization.OrganizationID' PropertyKey='OrganizationID'/>
							<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscOffice.TimePeriodID' PropertyKey='TimePeriodID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='OffName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='StaffMemberEditor' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='StaffMemberEditor' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
								<Argument Type='DataObjectCollection' TypeKey='LscStaffDetail' DataObjectPropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
