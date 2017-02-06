<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server' />

<div class='SeparatorHdg'>
	Letter of Intent to Apply for Funding
</div>
<br />

<p><b>Letter of Intent to Apply for Funding</b>&nbsp;<%=kDenoteRequiredField%></p>

	<p>
		Pro Bono Innovation Fund applicants should submit the Letter of Intent to Apply through the text boxes below.
	</p>
	<p>
		The total page limit for the narrative portion of the Letter of Intent to Apply is approximately three pages or 8,400 characters  in a standard word processing document. The LSC Grants online application system will not enforce character limits; however, the limits will be enforced during review of your application.
	</p>
	<p>LSC asks that applicants provide a brief summary of their Pro Bono Innovation Fund project idea in their Letter of Intent to Apply. To assist with LSC’s assessment of each project concept, we ask that that applicants respond to the questions outlined below in the Letter of Intent to Apply.</p>
	
	
		<strong>1. Project Description.</strong> Please provide a brief description of the proposed project which includes:
			<ul>
				<li>
					The specific client need and challenge or opportunity in the pro bono delivery system that the project will address.
				</li>
				<li>
					The goals and objectives of the project, the activities that make up the project, and how those activities will link to and achieve the stated goals and objectives.
				</li>
				<li>
					Strong indication of volunteer demand or interest in supporting the project.
				</li>
				<li>
					The expected impact of the project. This should include a brief explanation of the changes and outcomes that will be created as a result of the project.
				</li>
			</ul>
			<span runat="server" id='spnProjectDescription' />
			<br /><br />
		<strong>2. Project Staff, Organizational Capacity and Project Partners.</strong> Please briefly identify and describe the project team and project partners including:
			<ul>
				<li>
					The qualifications and relevant experience of the proposed project team, any proposed partner organizations, and your organization.
				</li>
				<li>
					The role of your organization’s executive management in the design and implementation of the project.
				</li>
			</ul>
			<span runat="server" id='spnProjectStaffPartners' />
			<br /><br />
			<strong>3. Budget and Timeline.</strong> Please provide the following information about the estimated project costs and the proposed implementation timeframe:
			<ul>
				<li>
					Whether the proposed project will be implemented in an 18- or 24- month timeframe.
				</li>
				<li>
					Estimated total project cost. This includes the estimate for the Pro Bono Innovation Fund requested amount and other in-kind or cash contributions to support the project.
				</li>
				<li>
					List, if any, of anticipated contributions, both in-kind and monetary, of all partners involved in the project.
				</li>
				<li>
					List of key partners who will receive Pro Bono Innovation Fund funding, including their roles, and the estimated dollar amount or percent of budget assigned to each partner.
				</li>
			</ul>
			<p>
		        The Estimated Budget for the Pro Bono Innovation Fund share is requested in a separate form.
            </p>
			<span runat="server" id='spnBudgetTimeline' />
		</li>
	
	
	
	<%--<ul>
		<li>
			<strong>Organizational Capacity (25% of total score) </strong>
		</li>
		<ol>
			<li>
				<strong>Track Record on Pro Bono and Collaborative Efforts(10%):</strong> Please provide an overview of Applicant&rsquo;s success in collaborative and pro bono efforts, including specific and recent examples indicating the dates/years the partnerships and collaborations were in effect.
			</li>
			<li>
				<strong>Ability to Provide Project Support, Oversight, and Capable Leadership(15%):</strong> Please describe Applicant&rsquo;s capacity to set and implement goals and provide programmatic and financial oversight of this project. The response should include relevant information about the key staff who will be responsible for the project.
			</li>
		</ol>
	</ul>

	<ul>
		<li>
			<strong>Cost-Effectiveness and Budget Adequacy (15% of total score) </strong>
		</li>
		<ol>
			<li>
				<strong>Budget Justification (15%): </strong>Please provide a brief statement to supplement the Budget and Budget Narrative that describes how the project budget, including other sources of support, will advance the desired goals, objectives, and activities being proposed.
			</li>
		</ol>
	</ul>

	<p>
		For more information on the criteria reviewers will use to assess the responses to each required element, please see the <a href="http://lsc.gov/sites/lsc.gov/files/LSCProBonoInnovationFund2014NOFA.pdf">Notice of Funds Availability</a>.
</p>--%>



	<div style="width:600px">
	<%--<table cellpadding='1' width='600px'>
		<tr>
			<td colspan='2'> 
				<span runat="server" id='spnNarrative' />
			</td>
		</tr>
	</table>
	<br />	--%>
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>	
</div>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectDescription'>
					<Control ID='txtProjectDescription'
						Type='cTextArea'
						Container='spnProjectDescription'
						Rows='10' 
						Cols='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectStaffPartners'>
					<Control ID='txtProjectStaffPartners'
						Type='cTextArea'
						Container='spnProjectStaffPartners'
						Rows='10' 
						Cols='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BudgetTimeline'>
					<Control ID='txtBudgetTimeline'
						Type='cTextArea'
						Container='spnBudgetTimeline'
						Rows='10' 
						Cols='150' />
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
