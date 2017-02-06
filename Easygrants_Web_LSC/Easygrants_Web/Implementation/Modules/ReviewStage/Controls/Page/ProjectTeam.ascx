<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.Controls.Page.cProjectTeam" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ProjectTeam.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><b>PROJECT TEAM MEMBERS</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b><%=GetLabel("Organization")%>:</b>
			<span id='spnInstitution' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Applicant:</b>
			<span id='spnApplicant' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>The following people have been named in this proposal:</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnCVContact1Name' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact1Title' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact1Institution' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnCVContact2Name' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact2Title' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact2Institution' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnCVContact3Name' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact3Title' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact3Institution' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnCVContact4Name' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact4Title' runat='server'/></td>
	</tr>
	<tr>
		<td><span id='spnCVContact4Institution' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInstitution' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.FirstNameMiddleNameLastName'>
					<Control ID='spnApplicant' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectPersonContactInfo' DataObjectDefinitionKey='GranteeProjectPersonContactInfo'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='('/>
				<Argument Type='' PropertyKey='WfTaskRoleID' Value='17' Bool=''/>
				<Argument Type='' PropertyKey='WfTaskRoleID' Value='18' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='WfTaskRoleID'/>
				<Argument PropertyKey='LastName'/>
				<Argument PropertyKey='FirstName'/>
				<Argument PropertyKey='MiddleName'/>
			</Sort>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
