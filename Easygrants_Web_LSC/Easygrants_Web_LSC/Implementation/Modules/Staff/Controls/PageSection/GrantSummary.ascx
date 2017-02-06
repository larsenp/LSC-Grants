<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantSummary.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantSummary" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Summary</b></td>
	</tr>	
</table>
<br/>
<table id="Table2"  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
   
    <tr>
        <td valign="top" width='20%'><b>Grantee <%=GetLabel("Organization")%></b></td>
        <td width='25%'><span id='spnPrimaryOrganization' runat='server'/></td>
        <td width='20%'><b>Primary Contact/PI</b></td>
        <td width='35%'><span id='spnPrimaryPerson' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b>Status</b></td>
        <td><span id='SpnStatus' runat='server'/></td>
        <td><b><%=GetLabel("ProgramName")%></b></td>
        <td><span id='spnProgram' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b><%=GetLabel("FundingOpportunity")%></b></td>
        <td><span id='spnCompetition' runat='server'/></td>
        <td><b><%=GetLabel("FundingCycleName")%></b></td>
        <td><span id='spnProject' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b><%=GetLabel("LegacyGrantId")%></b></td>
        <td><span id='spnLegacyGrantID' runat='server'/></td>
        <td rowspan='6'>
			<a id="imgMapLink" href="" runat="server" target="_blank">
				<img alt="Address Map" id="imgMap" runat="server" src=""/>
			</a>
		</td>
    </tr>
    
    <tr>
        <td colspan='5'>&nbsp;</td>
    </tr>
     <tr>
        <td valign="top"><b>Created On</b>&nbsp;&nbsp;&nbsp;<span id='SpnCreatedDate' runat='server'/></td>
        <td ><b>Modified On</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnModifyDate' runat='server'/></td>
        <td colspan='2'><b>Modified By</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnModifyUser' runat='server'/></td>
        
    </tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnNumber'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
					<Control ID='ctlLink1' Container='spnPrimaryOrganization'
						Type='cLink'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
							    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' >
					<Control ID='ctlLink' Container='spnPrimaryPerson'
						Type='cLink'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							    <Argument AttributeName='PageKey' Value='PersonContact'/>
							    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PersonID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantStatus.Abbr'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='MM/dd/yyyy'>
					<Control ID='spnCreatedDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifyUser'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='MM/dd/yyyy'>
					<Control ID='spnModifyDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
