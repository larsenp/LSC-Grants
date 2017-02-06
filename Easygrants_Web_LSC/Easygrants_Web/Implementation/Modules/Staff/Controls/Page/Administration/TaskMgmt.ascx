<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ register Tagprefix='EasyGrants' tagname='cWfTaskAssignListing' src='../../Base/TaskAssignListing.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="True" Codebehind="TaskMgmt.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cTaskMgmt" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true' AutoVDateType='Root' Key='Tasks'
	LinkTitle='Tasks' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Select Program</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>	
	
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProgram' runat='server' /></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server' id="CUserCtlLoader1" /></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server' id="CUserCtlLoader3" /></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server' id="CUserCtlLoader5" /></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<EasyGrants:cWfTaskAssignListing id='ctlWfTaskAssignListing' visible='true' runat='server' />
<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram' Container='spnProgram' Type='cDropDown' DataObjectDefinitionKey='Program'
						StoredValue='ProgramID' PostBack='True' DisplayValue='ProgramDisplayName'>
						<Action PostBack='True' AutoSave='False' Object='DataPresenter' Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Program' />
								<Argument Type='Control' TypeKey='ctlProgram' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
