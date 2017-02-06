<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantInformation.ascx.vb" Inherits="Implementation.Modules.Review.Controls.PageSection.cGrantInformation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td  class="SeparatorHdg"><b>Grant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
    <tr>
        <td valign="top" width='15%'><b><%=GetLabel("GrantId")%></b></td>
        <td width='35%'><span id='spnGrantNumber' runat='server'/></td>
        <td width='15%'><b>Grant Status</b></td>
        <td width='35%'><span id='spnGrantStatus' runat='server'/></td>
    </tr>
    <tr>
		<td valign="top"><b>Primary Contact/PI</b></td>
        <td><span id='spnPrimaryPerson' runat='server'/></td>
        <td><b><%=GetLabel("Organization")%> Name</b></td>
        <td><span id='spnPrimaryOrganization' runat='server'/></td>
    </tr>
    <tr>
		<td valign="top"><b>Award Amount</b></td>
        <td><span id='spnAwardAmount' runat='server'/></td>
        <td><b>Award Date</b></td>
        <td><span id='spnAwardDate' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"><b>Primary Staff Contact</b></td>
        <td><span id='SpnPrimaryStaff' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"><b><%=GetLabel("ProjectTitle")%></b></td>
        <td><span id='SpnTitle' runat='server'/></td>
    </tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='ctlLinkGrantID' Container='spnGrantNumber' Type='cLink' >
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Staff' />
								<Argument Type='' TypeKey = '' Value='ModuleConfig' />
								<Argument AttributeName='PageKey' Value='GrantsEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
								<Argument Type='' TypeKey = '' Value='' />	
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantStatus.Abbr'>
					<Control ID='spnGrantStatus'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' >
					<Control ID='ctlLink' Container='spnPrimaryPerson' Type='cLink' >
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Staff' />
								<Argument Type='' TypeKey = '' Value='ModuleConfig' />
								<Argument AttributeName='PageKey' Value='PersonContact'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PersonID='/>
								<Argument Type='' TypeKey = '' Value='' />	
							</Parameters>
						</Action>
					</Control>							
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlLinkOrg' Container='spnPrimaryOrganization' Type='cLink' >
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Staff' />
								<Argument Type='' TypeKey = '' Value='ModuleConfig' />
								<Argument AttributeName='PageKey' Value='OrganizationContact'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='' TypeKey = '' Value='' />	
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='SpnTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantAwardDate' Format='MM/dd/yyyy'>
					<Control ID='spnAwardDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GranteeProjectStaffAffiliations.StaffPersonContact.LastNameFirstName'>
					<Control ID='ctlLinkstaff' Container='SpnPrimaryStaff' Type='cLink' >
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Staff' />
								<Argument Type='' TypeKey = '' Value='ModuleConfig' />
								<Argument AttributeName='PageKey' Value='PersonContact'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectStaffAffiliations.StaffPersonID' BaseValue='PersonID='/>
								<Argument Type='' TypeKey = '' Value='' />	
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>									
		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AwardAmount' Format='$#,##0.00'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->

	</ModuleSection></span>

<!-- End Embedded XML -->