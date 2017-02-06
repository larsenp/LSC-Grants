<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cHome_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<br>
Welcome to your Easygrants home page.
<p>
To view and manage your Personal Tasks, click the task title. For Workgroup Tasks, select an option in the Action drop-down list and click <b>Go</b>.  
</p> <br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Options</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<span id='spnPortfolio' visible='true' runat='server'/>
<br><br>
<span id='spnPassword' visible='true' runat='server'/>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='Easyview' LinkTitle='Home' runat='server'/>
<table width='100%' runat='server'>
	
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListApplicant' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Applicant.ascx' 
				runat='server'/>
		</td>
	</tr>
	<!--<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReference' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Reference.ascx' 
				runat='server'/>
		</td>
	</tr>
	-->
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReviewer' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Reviewer.ascx' 
				runat='server'/>
		</td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlPersonalTaskList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/PersonalTaskListStaff.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlPersonWfTaskList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/PersonWfTaskList.ascx'
	runat='server'/>
<br>
<!--
<ASP:Label id='lblName' runat='server'/>
-->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
			</Filters>
	    </DataObject>
		<DataObject Key='Password' DataObjectDefinitionKey='' Updatable='False'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='Password' 
						Type='cLink' 
						Container='spnPassword'
						Caption='Change My Password'>
						<Action
							PostBack='True'
							Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ChangePassword'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='Portfolio' 
						Type='cLink' 
						Container='spnPortfolio'
						Caption='Go To My Grants Portfolio'>
						<Action
							PostBack='True'
							Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantsPortfolio'/>
									<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='QueryString' TypeKey='' PropertyKey=''  BaseValue='Find=True'/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
							
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>