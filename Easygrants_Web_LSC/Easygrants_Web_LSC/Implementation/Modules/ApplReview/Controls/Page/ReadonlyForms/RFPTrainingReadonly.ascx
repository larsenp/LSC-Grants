<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Training</h1></td>
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
			 <p>Use the web form below to indicate what proportion of the staff received each type of training in the last twenty-four months.  Complete the form by making a choice from the drop down menu (“all (100%),” “many (50% or more),” “some (less than 50%),” or “none”).  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative. </p>
             <p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		</td>
    </tr>
</table>
<br />
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td  colspan='11' class="SeparatorHdg" >Training Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr style="background-color:#DDDDDD" >
        <td width='26%' align="center"><b>Type of Training</b></td>
        <td width='74%' align="center"><b>Position Category</b></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr >
        <td width='25%'><b></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'><b>Attorneys</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'><b>Paralegals</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'><b>Managers/Supervisors</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'><b>Adminstrators</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'><b>Support Staff</b></td>
    </tr>
</table>
<br />
<br />
<table width='100%'>
	<tr>
		<td width='25%'><b>1. Advocacy Skills <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>
			<span runat='server' id='spnType1Attorneys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>
			<span runat='server' id='spnType1Paralegals' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>
			<span runat='server' id='spnType1Managers' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>
			<span runat='server' id='spnType1Admins' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>
			<span runat='server' id='spnType1Staff' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>2. Substantive Law <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType2Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType2Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType2Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType2Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType2Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>3. Technology <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType3Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType3Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType3Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType3Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType3Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>4. Management <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType4Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType4Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType4Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType4Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType4Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>5. Leadership <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType5Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType5Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType5Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType5Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType5Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>6. Cultural Competency <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType6Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType6Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType6Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType6Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType6Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>7. Foreign Language <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType7Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType7Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType7Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType7Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType7Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>8. Other (Specify)<%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		
		
	</tr>
	<tr>
	    <td><span runat='server' id='spnOtherTxtbx' /></td>
	    <td>&nbsp;</td>
	    <td><span runat='server' id='spnType8Attorneys' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType8Paralegals' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType8Managers' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType8Admins' /></td>
		<td>&nbsp;</td>
		<td><span runat='server' id='spnType8Staff' /></td>
	</tr>
	
</table>
<br />
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
	    <DataObject Key='LSCRFPTRAINING' DataObjectDefinitionKey='LSCRFPTRAINING' Updatable='True' CreateNew='True'>
	        <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
            <%--<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>--%>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='Type1AttDesc.Description'> 
					<Control ID='spnType1Attorneys'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1ParaDesc.Description'> 
					<Control ID='spnType1Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1ManagersDesc.Description'> 
					<Control ID='spnType1Managers'
						Container='spnType1Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1AdminsDesc.Description'> 
					<Control ID='spnType1Admins'
						Container='spnType1Admins'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1StaffDesc.Description'> 
					<Control ID='spnType1Staff'
						Container='spnType1Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='Type2AttDesc.Description'> 
					<Control ID='spnType2Attorneys'
						Container='spnType2Attorneys'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2ParaDesc.Description'> 
					<Control ID='spnType2Paralegals'
						Container='spnType2Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2ManagersDesc.Description'> 
					<Control ID='spnType2Managers'
						Container='spnType2Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2AdminsDesc.Description'> 
					<Control ID='spnType2Admins'
						Container='spnType2Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2StaffDesc.Description'> 
					<Control ID='spnType2Staff'
						Container='spnType2Staff'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
	        
	            <DisplayProperty PropertyKey='Type3AttDesc.Description'> 
					<Control ID='spnType3Attorneys'
						Container='spnType3Attorneys'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3ParaDesc.Description'> 
					<Control ID='spnType3Paralegals'
						Container='spnType3Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3ManagersDesc.Description'> 
					<Control ID='spnType3Managers'
						Container='spnType3Managers'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3AdminsDesc.Description'> 
					<Control ID='spnType3Admins'
						Container='spnType3Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3StaffDesc.Description'> 
					<Control ID='spnType3Staff'
						Container='spnType3Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    
			    <DisplayProperty PropertyKey='Type4AttDesc.Description'> 
					<Control ID='spnType4Attorneys'
						Container='spnType4Attorneys'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4ParaDesc.Description'> 
					<Control ID='spnType4Paralegals'
						Container='spnType4Paralegals'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4ManagersDesc.Description'> 
					<Control ID='spnType4Managers'
						Container='spnType4Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4AdminsDesc.Description'> 
					<Control ID='spnType4Admins'
						Container='spnType4Admins'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4StaffDesc.Description'> 
					<Control ID='spnType4Staff'
						Container='spnType4Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    
			      <DisplayProperty PropertyKey='Type5AttDesc.Description'> 
					<Control ID='spnType5Attorneys'
						Container='spnType5Attorneys'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5ParaDesc.Description'> 
					<Control ID='spnType5Paralegals'
						Container='spnType5Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5ManagersDesc.Description'> 
					<Control ID='spnType5Managers'
						Container='spnType5Managers'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5AdminsDesc.Description'> 
					<Control ID='spnType5Admins'
						Container='spnType5Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5StaffDesc.Description'> 
					<Control ID='spnType5Staff'
						Container='spnType5Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    
			      <DisplayProperty PropertyKey='Type6AttDesc.Description'> 
					<Control ID='spnType6Attorneys'
						Container='spnType6Attorneys'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6ParaDesc.Description'> 
					<Control ID='spnType6Paralegals'
						Container='spnType6Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6ManagersDesc.Description'> 
					<Control ID='spnType6Managers'
						Container='spnType6Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6AdminsDesc.Description'> 
					<Control ID='spnType6Admins'
						Container='spnType6Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6StaffDesc.Description'> 
					<Control ID='spnType6Staff'
						Container='spnType6Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
	        
	            <DisplayProperty PropertyKey='Type7AttDesc.Description'> 
					<Control ID='spnType7Attorneys'
						Container='spnType7Attorneys'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7ParaDesc.Description'> 
					<Control ID='spnType7Paralegals'
						Container='spnType7Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7ManagersDesc.Description'> 
					<Control ID='spnType7Managers'
						Container='spnType7Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7AdminsDesc.Description'> 
					<Control ID='spnType7Admins'
						Container='spnType7Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7StaffDesc.Description'> 
					<Control ID='spnType7Staff'
						Container='spnType7Staff'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    
	            <DisplayProperty PropertyKey='Type8Name'>
					<Control ID='spnOtherTxtbx'
						Container='spnOtherTxtbx'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
			     <DisplayProperty PropertyKey='Type8AttDesc.Description'> 
					<Control ID='spnType8Attorneys'
						Container='spnType8Attorneys'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8ParaDesc.Description'> 
					<Control ID='spnType8Paralegals'
						Container='spnType8Paralegals'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8ManagersDesc.Description'> 
					<Control ID='spnType8Managers'
						Container='spnType8Managers'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8AdminsDesc.Description'> 
					<Control ID='spnType8Admins'
						Container='spnType8Admins'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8StaffDesc.Description'> 
					<Control ID='spnType8Staff'
						Type='HtmlGenericControl' /> 
			    </DisplayProperty>
	        </DisplayProperties>
	     </DataObject>
	     
	     
		
	</ModuleSection>
</span>

