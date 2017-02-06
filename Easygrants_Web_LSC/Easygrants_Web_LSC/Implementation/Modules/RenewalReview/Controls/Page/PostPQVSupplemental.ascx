<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<div style='width:600' >
	<table width='100%'>
		<tr>
			<td>
				<p>The <b>Supplemental Inquiries form</b> captures Applicant's three most significant accomplishments for clients and systems and procedures that ensure compliance with LSC regulations. <b>All inquiries are required</b>.</p>
				<b>Follow the steps below for assistance on this form</b>:
				<ul>
					<li>Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href='mailto:techsupport@lsc.gov'>techsupport@lsc.gov</a>.</li>
					<li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</li>
					<li>Contact Reginald Haley at <a href='mailto:haleyr@lsc.gov'>haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
				</ul>		
			</td>
			<td width="160" valign="top" >
				<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
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
	<div style='width:100%' class="SeparatorHdg">
		Supplemental Inquiries
	</div>
	<br />
	1.	Describe Applicant's three most significant accomplishments for clients achieved within the last twenty-four months.  Describe the issue(s), outcome(s) and benefit to other low-income people with a similar problem, or for the client population as a whole.<span style="color:red">*</span><br />
	<br />
	<b>Applicant's response </b><br />
		<span runat='server' id='spnApplicantSignifAccomp'/>
	<br /><br />
    <b>Staff's response </b><br />
        <span runat='server' id='spnStaffSignifAccomp'/>
	<br /><br />
	2.	Describe Applicant's systems and procedures that ensure compliance and enforcement of LSC’s policies and regulatory requirements, identify staff training provided and the frequency of Applicant’s internal compliance reviews.<span style="color:red">*</span><br />
	<br />
	<b>Applicant's response </b><br />
		<span runat='server' id='spnApplicantSystemsProcedures'/>
	<br /><br />
    <b>Staff's response </b><br />
        <span runat='server' id='spnStaffSystemsProcedures'/>
	<br /><br />
	<br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;
		<span runat='server' id='spnSaveClose'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='67' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject> 
		
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='True' CreateNew='True'>
           <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SignificantAccomplishments' >
					<Control ID='spnApplicantSignifAccomp'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SystemsProcedures' >
					<Control ID='spnApplicantSystemsProcedures'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	    
		<DataObject Key='LscWftaReviewPostPQVApp' DataObjectDefinitionKey='LscWftaReviewPostPQVApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SignificantAccomplishments'>
					<Control ID='txtSignificantAccomplishments'
						Type='cTextArea'
						Container='spnStaffSignifAccomp'
						Rows='5'
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SystemsProcedures'>
					<Control ID='txtSystemsProcedures'
						Type='cTextArea'
						Container='spnStaffSystemsProcedures'
						Rows='5'
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Caption='Save and Close'
						Container='spnSaveClose'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVForm' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
