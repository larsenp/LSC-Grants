<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ReviewerInfo.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.PageSection.cReviewerInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Reviewer Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%'><b>Reviewer</b></td>
		<td><span runat='server' id='spnName'/></td>
	</tr>
	<tr>
		<td width='25%'><b>Reviewer <%=GetLabel("Organization")%></b></td>
		<td><span runat='server' id='spnInst'/></td>
	</tr>	
	<tr>
		<td width='25%'><b>Committee</b></td>
		<td><span runat='server' id='spnCmt'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='RevPersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CommitteeID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
					<Control ID='spnCmt' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
