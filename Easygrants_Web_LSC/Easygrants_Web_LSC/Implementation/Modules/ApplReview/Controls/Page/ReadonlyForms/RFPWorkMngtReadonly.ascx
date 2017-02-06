<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Legal Work Management</h1></td>
	</tr>
     <tr>
		<td ><b>Performance Area Three, Criterion 1 - <i>Legal representation: </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			 <p>Use the web form below to indicate how frequently the Applicant uses the methods and/or resources listed to ensure that cases and other services are effectively handled.  Complete this form by selecting the appropriate choice for each. If “other” is the appropriate choice, please explain. .  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative.</p>
             <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td class="SeparatorHdg" >Legal Work Management Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td width="45%"><b>1. Preparation of  opening and closing memoranda <%=kDenoteRequiredField%></b></td>
	   <td width="2%">&nbsp;</td>
	   <td width="53%"></td>
	</tr>
	<tr>
	   <td align="Right"><span runat="server" id='spnMethod1' /></td>
	   <td>&nbsp;</td>
	   <td align="left"><span runat="server" id='spnMethod1Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>2. Accompanying newer attorneys to hearings, trials, depositions, oral arguments, etc.<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod2' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod2Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>3. Review of written work (e.g., briefs, significant memoranda, and pleadings)<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod3' /></td>
	     <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod3Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>4. Case acceptance meetings<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod4' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod4Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>5. Case reviews with staff <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod5' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod5Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>6. Electronic case reviews <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod6' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod6Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>7. Mooting appellate arguments <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod7' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod7Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>8. Supervisor review of files at time of closing <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod8' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod8Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>9. Availability of a litigation fund (e.g., for depositions, expert witnesses, process servers, trial aids, interpreters, and translators) <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	    <td align="Right"><span runat="server" id='spnMethod9' /></td>
	    <td>&nbsp;</td>
	    <td align="left"><span runat="server" id='spnMethod9Period' /></td>
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
	    <DataObject Key='LSCRFPWORKMGT' DataObjectDefinitionKey='LSCRFPWORKMGT' >
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
				<DisplayProperty PropertyKey='WorkMgtDesc1.Description'>
					<Control ID='spnMethod1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method1TP'>
					<Control ID='spnMethod1Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc2.Description'>
					<Control ID='spnMethod2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method2TP'>
					<Control ID='spnMethod2Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc3.Description'>
					<Control ID='spnMethod3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method3TP'>
					<Control ID='spnMethod3Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc4.Description'>
					<Control ID='spnMethod4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method4TP'>
					<Control ID='spnMethod4Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc5.Description'>
					<Control ID='spnMethod5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method5TP'>
					<Control ID='spnMethod5Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc6.Description'>
					<Control ID='spnMethod6'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method6TP'>
					<Control ID='spnMethod6Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc7.Description'>
					<Control ID='spnMethod7'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method7TP'>
					<Control ID='spnMethod7Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc8.Description'>
					<Control ID='spnMethod8'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method8TP'>
					<Control ID='spnMethod8Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WorkMgtDesc9.Description'>
					<Control ID='spnMethod9'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method9TP'>
					<Control ID='spnMethod9Period'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            </DisplayProperties>
	</DataObject>
	
	
		
    </ModuleSection>
</span>