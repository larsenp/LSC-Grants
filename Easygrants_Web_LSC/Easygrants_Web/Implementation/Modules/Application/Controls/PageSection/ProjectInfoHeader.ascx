<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Project Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
     <tr>
        <td width='25%'><b><%=GetLabel("ProgramName")%>:</b></td>
        <td><span id='spnProgram' runat='server'/></td>
    </tr>
     <tr>
        <td  width='25%'><b><%=GetLabel("FundingOpportunity")%>:</b></td>
        <td><span id='spnCompetition' runat='server'/></td>
     </tr>
     <tr>
       <td width='25%'><b><%=GetLabel("FundingCycleName")%>:</b></td>
        <td><span id='spnProject' runat='server'/></td>
    </tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram' Type='HtmlGenericControl'> </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition' Type='HtmlGenericControl'> </Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProject' Type='HtmlGenericControl'> </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->
	</ModuleSection>
</span>
<!-- End Embedded XML -->
