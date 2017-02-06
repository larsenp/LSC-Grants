<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Private Attorney Involvement</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 3, Criterion 2 - <i>Private attorney involvement : </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
   <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>  
			<p>Use the web form below to address the Applicant’s PAI participation.  Complete this form by entering the applicable numbers pertaining to PAI for each inquiry.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative. </p>
            <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='800px' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Private Attorney Involvement Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr style="background-color:#DDDDDD">
        <td width='40px'>&nbsp;</td>
        <td width='600px'><b></b></td>
		<td width='160px' style='text-align:right'><b>Number</b></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>1. The number of attorneys eligible to participate in the PAI project in the service area <%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement1' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>2. The number of attorneys who actively  participated in the PAI project  as pro bono attorneys in the last year <%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement2' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>3. The number of attorneys who actively participated in the PAI project as contract attorneys in the last year<%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement3' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>4. Enter the number of attorneys who made a monetary donation to applicant in lieu of participating in the PAI project in the last twelve months.<%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement9' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>5. The number of partnerships established with law schools since last year.<%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement10' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>6. The number of partnerships established with business leaders since last year.<%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement11' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr> <td>&nbsp;</td></tr>
    <tr>
	    <td>&nbsp;</td>
	    <td><b>7. The number of law students, law graduates, and paralegals, and other professionals who provided pro bono legal assistance or legal information by taking cases, participating in clinics, on hotlines, with intake or with other services.<%=kDenoteRequiredField%></b></td>
	    <td style='text-align:right'><span runat='server' id='spnAttyInvolvement8' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	
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
		
	    <DataObject Key='LSCRFPATTYINVOLVEMENT' DataObjectDefinitionKey='LSCRFPATTYINVOLVEMENT' >
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='AttyInvolvement1'>
					<Control ID='spnAttyInvolvement1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement2'>
					<Control ID='spnAttyInvolvement2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement3'>
					<Control ID='spnAttyInvolvement3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement9'>
					<Control ID='spnAttyInvolvement9'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement10'>
					<Control ID='spnAttyInvolvement10'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement11'>
					<Control ID='spnAttyInvolvement11'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement8'>
					<Control ID='spnAttyInvolvement8'
						Type='HtmlGenericControl' />
				</DisplayProperty>
	        </DisplayProperties>
	    </DataObject>
	    
	   
	</ModuleSection>
</span>


