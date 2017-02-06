<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td colspan="4" >&nbsp;</td>
 </tr>
 <tr>
	<td><p>Complete this form by responding to the questions below. Each section in the form must be answered before the form can be submitted. Click the save button below once the form is completed.
Email questions pertaining to this form to the competition service desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a></p></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />

<div style='width:600' class='SeparatorHdg'>
	Conflicts, Complaints &amp; Performance Evaluations</div>	
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td>&nbsp;</td>
 </tr>
 <tr>
		<td><p>LSC requires Applicants to disclose any potential significant conflicts (e.g., Applicant has been retained by a housing authority or financial institution). <font color='red'>If there are no potential significant conflicts, indicate this by checking the box below.*</font></p></td>
 </tr>
 <tr><td><span runat='server' id='spnConflictsOfInterest' /></td></tr>
</table>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
     <td width="10"><span runat='server' id='spnNoConflicts' /></td>
     <td width="500" align="left">Check here if there are no potential significant conflicts.</td>
  </tr>
</table>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
      <td><p>Describe the Applicant’s capacity to protect against any such conflicts that may arise during the term of the grant or contract.<Font color='red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnCapacityToProtect' /></td></tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	List of Disciplinary Complaints and Malpractice Lawsuits
</div>	
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
      <td><p>List all professional disciplinary complaints, criminal convictions, civil contempt, and malpractice lawsuits and/or claims made against the Applicant or any of its attorneys during the past thirty-six months.  List all pending lawsuits and/or claims against the Applicant, regardless of the date of the lawsuit or the date the claim was initiated.  <font color='red'>If the Applicant has not had any, indicate this by checking the box below.* </font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnComplaints'/></td></tr>
</table>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
     <td width="10"><span runat='server' id='spnNoComplaints' /></td>
     <td width="500">Check here if there have been no disciplinary complaints, criminal convictions, civil contempt, and malpractice lawsuits and/or claims made against the Applicant or any of its current attorneys during the past thirty-six months, and there are no pending lawsuits and/or claims against the Applicant.</td>
  </tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	List of Performance Evaluation and Monitoring Reports
</div>	
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
      <td><p>List all performance evaluation and monitoring reports (PEM) by non-LSC funders, regulatory agencies, or evaluators the Applicant has received within the past thirty-six months. For each report, state the agency issuing the report and the date the report was issued. <font color='red'>If the Applicant has not received any program evaluation and monitoring reports, indicate this by checking the box below.*  </font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnPEMReports'/></td></tr>
</table>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr> 
     <td width="10"><span runat='server' id='spnNoPEMReports' /></td>
     <td width="500">Check here if the Applicant has not received any program evaluation and monitoring reports during the past thirty-six months. </td>
  </tr>
</table>
<br />

<p align="center">
  <span id='spnSave' runat='server' />&nbsp;&nbsp;&nbsp;&nbsp;
  <span id='spnContinue' runat='server' />
</p>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	     <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	
	
	    <DataObject Key='LscConflictsComplaints' DataObjectDefinitionKey='LscConflictsComplaints' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='Conflicts'>
					<Control ID='txtConflictsOfInterest' 
						Type='cTextArea' 
						Container='spnConflictsOfInterest' 
						Rows='2' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoConflicts'>
					<Control ID='chkNoConflicts'
						Type='cCheckBox'
						Container='spnNoConflicts' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapacityToFight'>
					<Control ID='txtCapacityToProtect' 
						Type='cTextArea' 
						Container='spnCapacityToProtect' 
						Rows='2' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Complaints'>
					<Control ID='txtComplaints' 
						Type='cTextArea' 
						Container='spnComplaints' 
						Rows='2' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoComplaints'>
					<Control ID='chkNoComplaints'
						Type='cCheckBox'
						Container='spnNoComplaints' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PEMReports'>
					<Control ID='txtPEMReports' 
						Type='cTextArea' 
						Container='spnPEMReports' 
						Rows='2' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoPEMReports'>
					<Control ID='chkNoPEMReports'
						Type='cCheckBox'
						Container='spnNoPEMReports' />
				</DisplayProperty>
			</DisplayProperties>
         </DataObject>
	  
	    <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>