<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Methods Used To Recruit Private Attorneys</h1></td>
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
			<p>Use the web form below to indicate how often the Applicant uses the methods listed to recruit private attorneys.  Complete this form by selecting the appropriate choice for each recruitment method.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative.</p>
            <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Methods Used To Recruit Private Attorneys Chart</td>
    </tr>
</table>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
	   <td width='325'><b>1.  Personal and Written Contacts<%=kDenoteRequiredField%>  </b></td>
	   <td width='275' align="center"><span runat="server" id='spnRecruitMethod1' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>2. Solicitations from organized bar<%=kDenoteRequiredField%>  </b></td>
	   <td align="center"><span runat="server" id='spnRecruitMethod2' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>3. Solicitations by judges<%=kDenoteRequiredField%> </b></td>
	   <td align="center"><span runat="server" id='spnRecruitMethod3' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>4.  Public service announcements<%=kDenoteRequiredField%> </b></td>
	   <td align="center"><span runat="server" id='spnRecruitMethod4' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>5. Web announcements<%=kDenoteRequiredField%> </b></td>
	   <td align="center"><span runat="server" id='spnRecruitMethod5' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>6. Targeted recruitment of lawyers with special skills<%=kDenoteRequiredField%> </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod6' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>7. Recruiting retired, inactive attorneys<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod7' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>8. Recruiting government attorneys<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod8' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>9. Recruiting corporate attorneys<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod9' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>10. Recruiting law students<%=kDenoteRequiredField%>  </b></td>
	    <td align='center'><span runat="server" id='spnRecruitMethod10' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>11. Offers of co-counseling on cases<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod11' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>12. Soliciting distant law firms in rural areas<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod12' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>13. Encouraging law firms to adopt big issues<%=kDenoteRequiredField%> </b></td>
	  <td align='center'><span runat="server" id='spnRecruitMethod13' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>14. Newly admitted attorneys<%=kDenoteRequiredField%>  </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod14' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>15. CLE Credit<%=kDenoteRequiredField%> </b></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod15' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	   <td><b>16. Other (please specify)<%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr>
	   <td align='left'><span runat="server" id='spnOtherTxtbx' /></td>
	   <td align='center'><span runat="server" id='spnRecruitMethod16' /></td>
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
		
	     <DataObject Key='LSCRFPRECRUITPVTATTY' DataObjectDefinitionKey='LSCRFPRECRUITPVTATTY' >
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
	             <DisplayProperty PropertyKey='RecruitDesc1.Description'>
					<Control ID='spnRecruitMethod1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc2.Description'>
					<Control ID='spnRecruitMethod2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc3.Description'>
					<Control ID='spnRecruitMethod3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc4.Description'>
					<Control ID='spnRecruitMethod4'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc5.Description'>
					<Control ID='spnRecruitMethod5'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc6.Description'>
					<Control ID='spnRecruitMethod6'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc7.Description'>
					<Control ID='spnRecruitMethod7'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc8.Description'>
					<Control ID='spnRecruitMethod8'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc9.Description'>
					<Control ID='spnRecruitMethod9'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc10.Description'>
					<Control ID='spnRecruitMethod10'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc11.Description'>
					<Control ID='spnRecruitMethod11'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc12.Description'>
					<Control ID='spnRecruitMethod12'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc13.Description'>
					<Control ID='spnRecruitMethod13'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc14.Description'>
					<Control ID='spnRecruitMethod14'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc15.Description'>
					<Control ID='spnRecruitMethod15'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecruitMethod16Name'>
					<Control ID='spnOtherTxtbx'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				<DisplayProperty PropertyKey='RecruitDesc16.Description'>
					<Control ID='spnRecruitMethod16'
						Type='HtmlGenericControl' />
				</DisplayProperty>
	        </DisplayProperties>
	    </DataObject> 
	    
	    
	</ModuleSection>
</span>



