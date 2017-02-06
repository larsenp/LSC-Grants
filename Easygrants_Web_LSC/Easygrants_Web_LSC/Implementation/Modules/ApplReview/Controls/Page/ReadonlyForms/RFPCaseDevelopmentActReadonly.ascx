<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Case Development Activities</h1></td>
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
			<p>Use the web form below to indicate the extent to which the listed case development activities, litigation strategies, and courtroom or litigation activities have been used by the Applicant’s attorneys within the last twenty-four months.  Complete this form by selecting the appropriate choice.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative.</p>
            <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Case Development Activities Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>1.  Complex litigation in Federal or state court <%=kDenoteRequiredField%> </b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct1' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>2.  Written discovery in the course of litigation (interrogatories, requests for admission, etc.) <%=kDenoteRequiredField%> </b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct2' /></td>
	</tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>3.  Depositions <%=kDenoteRequiredField%></b></td>
	   <td align='40%'><span runat="server" id='spnCaseDevelopAct3' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>4.  Use of expert witnesses <%=kDenoteRequiredField%></b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct4' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>5.  Motions accompanied by written memoranda <%=kDenoteRequiredField%> </b></td>
	    <td width='40%'><span runat="server" id='spnCaseDevelopAct5' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>6.  Jury trials <%=kDenoteRequiredField%></b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct6' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>7.  Appeals to appellate courts <%=kDenoteRequiredField%> </b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct7' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>8.  Enforcement of judgments <%=kDenoteRequiredField%> </b></td>
	   <td width='40%'><span runat="server" id='spnCaseDevelopAct8' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr> 
	<tr><td>&nbsp;</td></tr>   
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
		
	    <DataObject Key='LSCRFPCASEDEVELOP' DataObjectDefinitionKey='LSCRFPCASEDEVELOP' >
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
				<DisplayProperty PropertyKey='CaseDevelopActDesc1.Description'>
					<Control ID='spnCaseDevelopAct1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc2.Description'>
					<Control ID='spnCaseDevelopAct2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc3.Description'>
					<Control ID='spnCaseDevelopAct3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc4.Description'>
					<Control ID='spnCaseDevelopAct4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc5.Description'>
					<Control ID='spnCaseDevelopAct5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc6.Description'>
					<Control ID='spnCaseDevelopAct6'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc7.Description'>
					<Control ID='spnCaseDevelopAct7'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopActDesc8.Description'>
					<Control ID='spnCaseDevelopAct8'
						Type='HtmlGenericControl' />
				</DisplayProperty>	 
			</DisplayProperties>
		</DataObject>
	
	   
		
	</ModuleSection>
</span>
