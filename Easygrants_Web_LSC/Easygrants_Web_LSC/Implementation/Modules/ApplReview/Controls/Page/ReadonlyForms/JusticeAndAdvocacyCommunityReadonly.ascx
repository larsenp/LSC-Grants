<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Involvement with Justice and Advocacy Community</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 3, Criterion 4 - <i>Other program activities on behalf of the eligible client population</i></b> </td>
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
          <td colspan="3" ><p>Describe applicant’s three most significant efforts or examples of active involvement with the judiciary, organized bar, government agencies, social service agencies, academic and research centers, state and national legal advocacy organizations and other organizations that work with or have an impact on the eligible client population.</p>
                           <p><font color='red'>For those applying to multiple service areas, this form is “linked” across service areas. Any information entered here will be automatically entered into applications for other service areas. </font></p></td>
          
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
        <td class="SeparatorHdg" >Involvement with Justice and Advocacy Community</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><b>Example 1</b></td></tr>
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
				 <DisplayProperty PropertyKey='LscExample1JusticeType.Description'> 
					<Control ID='spnExample1Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1JusticeDesc'> 
					<Control ID='spnExample1Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='LscExample2JusticeType.Description'> 
					<Control ID='spnExample2Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2JusticeDesc'> 
					<Control ID='spnExample2Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='LscExample3JusticeType.Description'> 
					<Control ID='spnExample3Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3JusticeDesc'> 
					<Control ID='spnExample3Desc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			</DisplayProperties>
		</DataObject>
	
	
				
	</ModuleSection>
</span>