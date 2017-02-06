<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Easygrants_Web.Modules.Home.Controls.Page.cHomeContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<br>
      <span id='spnPageContent' runat='server' />
<p>

<!-- USER MODIFIABLE CONTENT AREA -->
<br> 
<!-- Page Content - Top Of Page -->
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td>
			<p>Welcome to your Easygrants® Home page.
				<br>
				<br>
			</p>
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnStaffAdministration' visible='false' runat='server'>
				<Core:cUserCtlLoader CtlID='ctlStaffAdministration' Src='EasyGrants/Controls/PageSection/StaffAdministration.ascx'
					runat='server'/>
			</span>
		</td>
	</tr>
	<tr><td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='Home' LinkTitle='Home' runat='server'/></td></tr>
	<tr id='trProfileHdg' visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><b>Profile</b></td>
	</tr>
	<tr id='trProfileLink' visible='true' runat='server'>
		<td>
			<br>
			Profile is your personal information management tool. To ensure that your 
			profile reflects the most current information, be sure to update your profile 
			periodically.
			<br><br>
			<span id='spnProfile' visible='true' runat='server'></span>
			<br><br><br>
		</td>
	</tr>
	<tr id='trToDoHdg' visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><b>Apply for a New Grant</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trToDoSummary' visible='true' runat='server'>
		<td>
			<span id='spnApply' visible='true' runat='server'></span>
			<br><br>
		</td>
	</tr>
	<tr id="trToDoApp" visible='false' runat='server'>
		<td colspan="4" class="SeparatorHdg"><b>To Do - Application</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListApplicant' Src='EasyGrants/Controls/PageSection/ToDoList_Applicant.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListThirdParty' Src='EasyGrants/Controls/PageSection/ToDoList_Reference.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListDepartmentChair' Src='EasyGrants/Controls/PageSection/ToDoList_DepartmentChair.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReviewer' Src='EasyGrants/Controls/PageSection/ToDoList_Reviewer.ascx'
				runat='server'/>
		</td>
	</tr>
<span id='spnAwardee' runat='server' visible='true'>
	<tr id="Tr1" visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><b>To Do - Grants</b></td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListAwardees' Src='EasyGrants/Controls/PageSection/ToDoList_Awardees.ascx'
				runat='server' ID="Cuserctlloader6"  />
		</td>
	</tr>
</span>
</table>
<table id='tbInEligible' visible='true' runat='server'>
	<tr>
		<td>
			<b>Eligibility Outcome: Ineligible</b>
		</td>
	</tr>
	<tr>
		<td>
			For your reference, below are your answers to the eligibility questions 
			(Answers in red are incorrect). Click <span id='spnGuidelines' runat='server' />
			to view the guidelines for this Award Program. If 
			you have further questions, contact the .
		</td>
	</tr>
	<tr>
		<td>
			1) Full Tenure Track:&nbsp;<span id='spnIsTenure' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			2) Biomedical Engineering Primary Department:&nbsp;<span id='spnIsBiomedical' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			3) Doctoral Degree received:&nbsp;<span id='spnDegreeYear' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			4) Academic Rank:&nbsp;<span id='spnRankType' runat='server' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--
		<PageContent />-->
		<DataObject Key='ProfileOther' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='profile' Type='cLink' Container='spnProfile' Caption='View your profile'>
						<Action PostBack='True' Object='ModulePage' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Profile' />
								<Argument Type='' TypeKey='' Value='ProfileModuleConfig' />
								<Argument Type='' TypeKey='' Value='Contact' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGuidelines' Container='spnGuidelines' Type='cLink' Caption='here'>
						<Action PostBack='False' Target='_blank' URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Home/Help/EC_admin _application_guidelines.pdf' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ApplyGrant' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='apply' 
						Type='cLink' 
						Container='spnApply'
						Caption='Click here to start a new application.'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplyGrant' />
							</Parameters>
						</Action>
						
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		<DataObject Key='PersonEligibility' DataObjectDefinitionKey='PersonEligibility' Updatable='False'
			CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsTenure' Format='YesNo'>
					<Control ID='spnIsTenure' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsBiomedical' Format='YesNo'>
					<Control ID='spnIsBiomedical' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DegreeYear'>
					<Control ID='spnDegreeYear' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RankType.Abbr'>
					<Control ID='spnRankType' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
