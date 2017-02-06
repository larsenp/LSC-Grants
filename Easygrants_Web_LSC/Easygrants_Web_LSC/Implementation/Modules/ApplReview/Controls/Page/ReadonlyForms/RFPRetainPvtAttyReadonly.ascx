<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Methods Used To Retain Private Attorneys Volunteers</h1></td>
	</tr>
     <tr>
		<td ><b>Performance Area Three, Criterion 2 - <i>Private attorney involvement : </i></b> </td>
	</tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			<p>Use the web form below to indicate how often the Applicant uses the methods listed to retain private attorney volunteers. Complete this form by selecting the appropriate choice for each specified retaining method.  Each inquiry in the form must be answered before the form can be submitted. Click the save button below once the form is completed and return to the proposal narrative.</p>
            <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Methods Used To Retain Private Attorneys Volunteers Chart</td>
    </tr>
</table>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
	   <td width='325'><b>1.  Recognition ceremonies<%=kDenoteRequiredField %>  </b></td>
	   <td width='275' align='center'><span runat="server" id='spnRetainMethod1' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>2.  Recognition in publications or on websites<%=kDenoteRequiredField %> </b></td>
	   <td align='center'><span runat="server" id='spnRetainMethod2' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>3.  Malpractice insurance<%=kDenoteRequiredField %></b></td>
	   <td align='center'><span runat="server" id='spnRetainMethod3' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>4.  Mentoring, co-counseling<%=kDenoteRequiredField %>  </b></td>
	  <td align='center'><span runat="server" id='spnRetainMethod4' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>5.  Free or low cost training<%=kDenoteRequiredField %>  </b></td>
	   <td align='center'><span runat="server" id='spnRetainMethod5' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>6. Inclusion in substantive law task forces<%=kDenoteRequiredField %></b></td>
	   <td align='center'><span runat="server" id='spnRetainMethod6' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>7. Access to specialized research materials<%=kDenoteRequiredField %></b></td>
	   <td align='center'><span runat="server" id='spnRetainMethod7' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>8. Other (please specify)<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr>
	   <td><span runat="server" id='spnOtherTxtbx' /></td>
	   <td align='center'><span runat="server" id='spnRetainMethod8' /></td>
	</tr>
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
		 
	    <DataObject Key='LSCRFPRETAINPVTATTY' DataObjectDefinitionKey='LSCRFPRETAINPVTATTY' >
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='RetainDesc1.Description'>
					<Control ID='spnRetainMethod1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainDesc2.Description'>
					<Control ID='spnRetainMethod2'
						Type='HtmlGenericControl' />
				   </DisplayProperty>
				    <DisplayProperty PropertyKey='RetainDesc3.Description'>
					<Control ID='spnRetainMethod3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				
				 <DisplayProperty PropertyKey='RetainDesc4.Description'>
					<Control ID='spnRetainMethod4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				
				 <DisplayProperty PropertyKey='RetainDesc5.Description'>
					<Control ID='spnRetainMethod5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainDesc6.Description'>
					<Control ID='spnRetainMethod6'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainDesc7.Description'>
					<Control ID='spnRetainMethod7'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod8Name'>
					<Control ID='spnOtherTxtbx'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainDesc8.Description'>
					<Control ID='spnRetainMethod8'
						Type='HtmlGenericControl' />
				  </DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>



