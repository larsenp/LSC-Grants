<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cHome_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Welcome to your LSC Grants Home </h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><ul>
      <li>To view and manage your <strong>Personal Tasks</strong>, click the task title</li>
      <li>For <strong>Workgroup Tasks</strong>, select an option in the Action drop-down list and click <b>Go</b></li>
    </ul></td>
  </tr>
</table>



<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg">Options</td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<span id='spnPassword' visible='true' runat='server'/>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='Easyview' LinkTitle='Home' runat='server'/>
<table width='100%' runat='server'>
	<!--
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListApplicant' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Applicant.ascx' 
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReference' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Reference.ascx' 
				runat='server'/>
		</td>
	</tr>
	-->
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListRenewalAppReviewer' 
			        Src='EasyGrants/Controls/PageSection/ToDoList_RenewalAppReviewer.ascx'
				    runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReviewer' 
				Src='EasyGrants/Controls/PageSection/ToDoList_Reviewer.ascx' 
				runat='server'/>
		</td>
	</tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader1607" CtlID='ctlToDoList1607Reviewer' 
	Src='EasyGrants/Controls/PageSection/ToDoList_1607Reviewer.ascx' 
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlToDoListTIGReviewer' 
	Src='EasyGrants/Controls/PageSection/ToDoList_TIGReviewer.ascx' 
	runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlToDoListReviewSubgrantRequest' 
	Src='EasyGrants/Controls/PageSection/ToDoList_ReviewSubgrantRequest.ascx' 
	runat='server'/>
<br /><br />
<Core:cUserCtlLoader CtlID='ctlToDoListSandyDisasterReview' 
	Src='EasyGrants/Controls/PageSection/ToDoList_SandyDisasterReview.ascx' 
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlToDoListProBonoReview' 
	Src='EasyGrants/Controls/PageSection/ToDoList_ProBonoReviewer.ascx' 
	runat='server'/>
	
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
		<DataObject Key='Password' DataObjectDefinitionKey='' Updatable='False'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='Password' 
						Type='cLink' 
						Container='spnPassword'
						Caption='Change my password'>
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
							
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>