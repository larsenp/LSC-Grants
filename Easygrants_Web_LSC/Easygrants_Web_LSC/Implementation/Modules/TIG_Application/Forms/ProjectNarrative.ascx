<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:800px;">
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<p>The Project Narrative should be clear and concise and address the following per the Review Criteria guidance provided in the <strong><a target="_blank" href="http://www.lsc.gov/grants-grantee-resources/our-grant-programs/tig">Legal Services Corporation Technology Initiative Grant Program's Application Instructions for 2016 Grant Funding</a>.</strong></p>
<p><strong>PLEASE NOTE:</strong>The input fields will only accept plain text formatting. <strong>Do not paste any formatted copy such as tables, bullets, and bold.</strong></p>
<div style="width:100%" class='SeparatorHdg'>
	Project Narrative
</div>  
<br />
<b>1. A full description of the project, including the specific technologies the project will develop or implement</b><font color='red'>*</font>
<br />
<span runat='server' id='spnDescription' />
<br /><br />

<b>2. Need for the project</b><font color='red'>*</font>
<p><i>Describe the nature and scope of the problem(s) the project will address, the limitations of the current operational systems, and how the technology proposed will address the identified need. For example, what are the current gaps in client services and how does the proposed project address them? What are the limitations of the current operational systems? Explain how and why current technology systems are insufficient. Identify what is unique about the proposed project. Discuss what client input was obtained to identify the need for the project. Identify if you have included the target audience (clients, staff, self-represented litigants, etc.) in the design phase of the project to ensure the proposed solution will meet their needs.</i></p>
<span runat='server' id='spnNeed' />
<br /><br />

<b>3. Project Goal, Objectives, Activities, and Evaluation</b>
<p><i>The information is this section of the narrative should be consistent with the contents of the draft project evaluation plan, which must be submitted with this grant application. Instructions and guidance for developing effective goals, objectives, activities, and data sets for a TIG project are available at: <a target="_blank" href='http://www.lsc.gov/grants-grantee-resources/grantee-guidance/reporting-requirements/tig-reporting/tig-evaluation-plans' >http://www.lsc.gov/grants-grantee-resources/grantee-guidance/reporting-requirements/tig-reporting/tig-evaluation-plans</a></i></p>

<p><b>a. Specify the project’s goal and the objectives to achieve the goal. Explain how this will increase the quality or quantity of client services and/or enhance the grantee’s operational effectiveness and efficiency</b><font color='red'>*</font></p>
<span runat='server' id='spnGoalsObjectives' />
<br /><br />

<b>b. Identify the strategies and activities that will be undertaken to achieve each of the project objectives.</b><font color='red'>*</font>
<br />
<span runat='server' id='spnActivities' />
<br /><br />

<b>c. Identify the evaluation methods and data sets that will be used to evaluate the project.</b><font color='red'>*</font>
<br />
<span runat='server' id='spnDataEvaluation' />
<br /><br />

<b>4. Justice community partnerships</b><font color='red'>*</font>
<p><i>Provide information on the participation and commitment of any justice community stakeholders in the development and implementation of the proposed project. Potential stakeholders include but are not limited to: court systems, bar associations, client groups, community organizations, government and other non-profit organizations, and non-LSC funded legal services providers. Letters of commitment from key partners should be uploaded in the appendices to the Project Narrative.</i></p>
<span runat='server' id='spnJusticePartnerships' />
<br /><br />

<b>5. Replication</b><font color='red'>*</font>
<p><i>Highlight the project’s potential for replication and/or improvement of the legal services delivery system, focusing on the following factors:
	<ol style="list-style-type:lower-alpha">
		<li>The degree to which the problem identified by the applicant is commonly found in the legal services community, thereby demonstrating that it would be of value to other LSC-funded programs;</li>
		<li>How the proposed project will promote replication by others in the legal services community, such as a plan to share information about the project at a conference or webinar, by providing a toolkit, and/or creating an online repository through Github or a similar service.</li>
		<li>The ease of replication and adaptation, based on considerations such as cost and complexity, including the applicant’s plans to build the innovation in such a way that it can be directly used in other jurisdictions, or can be modified at low cost for use in other jurisdictions; and</li>
		<li>Whether a proposed project is replicating a prior TIG project at a reduced cost because of the benefits of replications and/or whether the project will make improvements to the prior TIG project or is adding to it a new component, thereby increasing the likelihood of additional replications.</li>
        <p>Proposals in the Innovation and Improvement category should likely focus more on factors a), b) and c), while Replication and Adaptation proposals should likely emphasize factors a) and d). </p>
	</ol>
</i></p>
<span runat='server' id='spnProjectReplication' />
<br /><br />

<b>6. Program capacity and project staffing</b><font color='red'>*</font>
<p><i>Describe the program’s organizational capacities, including:
	<ul>
		<li>Organizational experience and track record in managing and overseeing projects comparable to the one being proposed. </li>
		<li>A staffing plan that identifies specific staff members with sufficient capacity, qualifications, and experience to be effective and compliant with programmatic and fiscal requirements. This includes the involvement of senior management and board members, where appropriate. Identify the proposed staffing for the project as well as who has been involved in planning the project.</li>
	</ul>
</i></p>
<span runat='server' id='spnCapacityStaffing' />
<br /><br />

<b>7. Past performance</b><font color='red'>*</font>
<p><i>Address how the grantee has performed on any prior TIG projects. If prior grants have not been completed on time, explain what factors caused the delays, what lessons were learned from these, and how what was learned will ensure timely performance on the proposed project.Indicate if the grantee has never received a prior TIG award.</i></p>
<span runat='server' id='spnPastPerformance' />
<br /><br />

<b>8. Sustainability</b><font color='red'>*</font>
<p><i>Provide your program’s strategy to sustain the project after the end of the grant as detailed in the Review Criteria section of the Application Instructions document (see link above). Applicants should address the potential long-term viability of the project in their narratives and include the following: 
	<ol style="list-style-type:lower-alpha">
		<li>An evaluation of the ongoing costs of the project projected two (2) years out from the completion of the grant, including but not limited to, projected staffing, equipment, and overhead costs in dollar values; and</li>
		<li>A description of the grantee's overall strategy to meet these costs, including a list of likely or potential future funders.</li>
	</ol>
</i></p>
<br />
<span runat='server' id='spnSustainability' />
<br />
<br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
</div>


  <!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigProjectNarrative' DataObjectDefinitionKey='LscTigProjectNarrative' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Need'>
					<Control ID='txtNeed'
						Type='cTextArea'
						Container='spnNeed'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsObjectives'>
					<Control ID='txtGoalsObjectives'
						Type='cTextArea'
						Container='spnGoalsObjectives'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Activities'>
					<Control ID='txtActivities'
						Type='cTextArea'
						Container='spnActivities'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataEvaluation'>
					<Control ID='txtDataEvaluation'
						Type='cTextArea'
						Container='spnDataEvaluation'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='JusticePartnerships'>
					<Control ID='txtJusticePartnerships'
						Type='cTextArea'
						Container='spnJusticePartnerships'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectReplication'>
					<Control ID='txtProjectReplication'
						Type='cTextArea'
						Container='spnProjectReplication'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapacityStaffing'>
					<Control ID='txtCapacityStaffing'
						Type='cTextArea'
						Container='spnCapacityStaffing'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PastPerformance'>
					<Control ID='txtPastPerformance'
						Type='cTextArea'
						Container='spnPastPerformance'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Sustainability'>
					<Control ID='txtSustainability'
						Type='cTextArea'
						Container='spnSustainability'
						Rows='10'
						Cols='80' />
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
