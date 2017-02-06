<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Grants.cGrantProjectActivity" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!--The Grant Project Activity page lists the application, review, and progress report tasks for
the selected grant project.  Select links from the <b>Go To:</b> menu below to go to other
Grant Information pages.  The links on the <b>History:</b> menu act as a "crumb trail" as
you navigate through the grant information pages, allowing you to easily navigate or click
back to a previously accessed page.-->
<br>
<br>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server' />
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='GrantsVirtualFile' LinkTitle='Grant Activity' runat='server'/>
<br/><br/>
<Core:cUserCtlLoader CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server' />
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg" colspan="4"><b>Grant Tasks</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Create Task </B></td>
		<td colspan="3" align="left"><span id="spnGrantTasks" runat="server"></span>&nbsp;&nbsp;<span id="spnCreateGrantTask" runat="server"></span></td>
	</tr>
</table>
<br>
<Core:cUserCtlLoader CtlID='ctlGrantTaskAssignHistory' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantTaskAssignHistory.ascx'
	runat='server' />
<Core:cUserCtlLoader CtlID='ctlGrantProjectTimeline' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantProjectTimeline.ascx'
	runat='server' />

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>				
			</Filters>
		</DataObject>
		<DataObject Key='GrantTasks' DataObjectDefinitionKey='' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantTasks'
						Container='spnGrantTasks'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='WfTask.WfTask'
						RequiredField='False'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
								PropertyKey='WfProjectID' DataObjectPropertyKey='WfProjectID' Value=''/>
							<Argument Type='' TypeKey=''
								PropertyKey='GrantFileAvailabilityID' Value='1'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCreateGrantTask'
						Container='spnCreateGrantTask'
						Type='cButton'
						Image='Create'
						Confirmation='Are you sure you want to create this task?'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateGrantTask'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlGrantTasks' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
