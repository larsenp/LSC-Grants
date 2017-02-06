<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Accomplishments for Clients with Other Providers</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 3, Criterion 4 - <i>Participation in an integrated legal services delivery system</i></b> </td>
	</tr>
</table>
<br />
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" ><p>For applicants that provide limited services, describe the three most significant accomplishments for clients in cases or other services within the last twenty-four months provided in collaboration with other legal services providers.</p><p>Full service providers check the box below certifying that the program is a full service provider. </p>
                           <p><font color='red'>For those applying to multiple service areas, this form is “linked” across service areas. Any information entered here will be automatically entered into applications for other service areas.</font></p></td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
        <td class="SeparatorHdg" >Accomplishments for Clients with Other Providers</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><b><span runat='server' id='spnFullServiceProvider' /></b> Our program is a full service provider (i.e., provides limited and extended services across substantive law areas, across the entire service area) </td></tr>
     <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 1</b></p></td></tr>
    <tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample1Type' /></p></td></tr>
    <tr><td><p><span runat='server' id='spnExample1desc' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 2</b></p></td></tr>
	<tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample2Type' /></p></td></tr>
	<tr><td><p><span runat='server' id='spnExample2desc' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 3</b></p></td></tr>
	<tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample3Type' /></p></td></tr>
	<tr><td><p><span runat='server' id='spnExample3desc' /></p></td></tr>
</table>
<br />
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	     <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='LscSignificantAccomplishments' DataObjectDefinitionKey='LscSignificantAccomplishments' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='FullServiceProvider' Format='YesNo'>
					<Control ID='spnFullServiceProvider'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscExample1OtherProvidersType.Description'> 
					<Control ID='spnExample1Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1OtherProvidersDesc'> 
					<Control ID='spnExample1Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='LscExample2OtherProvidersType.Description'> 
					<Control ID='spnExample2Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2OtherProvidersDesc'> 
					<Control ID='spnExample2Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='LscExample3OtherProvidersType.Description'> 
					<Control ID='spnExample3Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3OtherProvidersDesc'> 
					<Control ID='spnExample3Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
	
			</DisplayProperties>
		</DataObject>
			
	</ModuleSection>
</span>