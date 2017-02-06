<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Accomplishments for Clients (Excluding PAI)</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 3, Criterion 1c - <i>Legal Representation - Legal representation and resources</i></b> </td>
	</tr>
</table>
<br />
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" ><p>Describe applicant’s three most significant accomplishments for clients in cases or other services within the last twenty-four months.</p><p>Describe the issue(s), outcome(s) and benefit to other low-income people with a similar problem, or for the client population as a whole.</p><p><font color='red'>For those applying to multiple service areas, this form is <i>not</i> “linked” across service areas. Applicants should enter information into this form that is specific to this service area. </font></p></td>
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
        <td class="SeparatorHdg" >Accomplishments for Clients</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 1</b></p></td></tr>
    <tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample1Type' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Problems</b><br /><span runat='server' id='spnExample1Problems' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Actions</b><br /><span runat='server' id='spnExample1Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Outcomes</b><br /><span runat='server' id='spnExample1Outcomes' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 2</b></p></td></tr>
	<tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample2Type' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Problems</b><br /><span runat='server' id='spnExample2Problems' /></p></td>
	 </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Actions</b><br /><span runat='server' id='spnExample2Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Outcomes</b><br /><span runat='server' id='spnExample2Outcomes' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Example 3</b></p></td></tr>
	<tr><td><p><b>Example Type:  &nbsp;&nbsp;&nbsp;</b><span runat='server' id='spnExample3Type' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Problems</b><br /><span runat='server' id='spnExample3Problems' /></p></td>
	 </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Actions</b><br /><span runat='server' id='spnExample3Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p><b>Outcomes</b><br /><span runat='server' id='spnExample3Outcomes' /></p></td></tr>
</table>
<br />
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	  <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject> 
	
	     <DataObject Key='LscSignificantAccomplishments' DataObjectDefinitionKey='LscSignificantAccomplishments' >
	        <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='LscExample1ClientsType.Description'> 
					<Control ID='spnExample1Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1ClientsProblems'> 
					<Control ID='spnExample1Problems'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1ClientsActions'> 
					<Control ID='spnExample1Actions'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1ClientsOutcomes'> 
					<Control ID='spnExample1Outcomes'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			      <DisplayProperty PropertyKey='LscExample2ClientsType.Description'> 
					<Control ID='spnExample2Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2ClientsProblems'> 
					<Control ID='spnExample2Problems'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2ClientsActions'> 
					<Control ID='spnExample2Actions'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2ClientsOutcomes'> 
					<Control ID='spnExample2Outcomes'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			      <DisplayProperty PropertyKey='LscExample3ClientsType.Description'> 
					<Control ID='spnExample3Type'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3ClientsProblems'> 
					<Control ID='spnExample3Problems'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3ClientsActions'> 
					<Control ID='spnExample3Actions'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3ClientsOutcomes'> 
					<Control ID='spnExample3Outcomes'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			
			</DisplayProperties>
		</DataObject>
	
	    
		
				
				
	</ModuleSection>
</span>