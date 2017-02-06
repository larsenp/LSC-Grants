<%@ Control Language="vb" AutoEventWireup="True" Codebehind="ContentManagerCopy.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cContentManagerCopy" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
Select the Program, Funding Opportunity, Funding Cycle, and Task that you would like to Copy the content to.  
Click <b>Save</b> to copy the content and return to the Content Manager main page.  
Click <b>Close</b> to return to the Content Manager main page without copying content.
<br>
<br>
<!-- Page Content - Top Of Page -->
<table id="Table1" width='100%' runat="server">
    <tr>
        <td colspan='5'><span id='spnNoResultsMessage' runat='server' style='color:Red; font-weight:bold'  visible='False'>Copy from task does not match with the Copy to Task.</span></td>
    </tr>
	<tr>
		<td colspan='5' class="SeparatorHdg"><b>Copy From</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b></td>
		<td width='5'>&nbsp;</td>
		<td><span id="spnProgramCopyFrom" runat="server"/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td width='5'>&nbsp;</td>
		<td><span id="spnCmptCopyFrom" runat="server"></span></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td width='5'>&nbsp;</td>
		<td><span id="spnProjectCopyFrom" runat="server"/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Task</b></td>
		<td width='5'>&nbsp;</td>
		<td><span id="spnTaskCopyFrom" runat="server"/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=4>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='4' class="SeparatorHdg"><b>Copy To</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='5'>&nbsp;</td>
		<td colspan=2><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='5'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlCmpt' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='5'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProject' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='5'>&nbsp;</td>
		<td><Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
		<td></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span runat='server' id='spnSave' visible='true'></span></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClose' visible='true'></span></td>
	</tr>
</table>
<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='Base' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='ProgramName'>
					<Control ID='spnProgramCopyFrom'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>			
		<DataObject Key='Base2' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' />
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
				
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionName'>
					<Control ID='spnCmptCopyFrom'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>			   
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProjectCopyFrom'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTaskCopyFrom'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Image='Copy and Close'
						Confirmation='Are you sure you want to copy the content to the target project and task? This will overwrite any existing content for the target project and task.'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CopyContent'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='ModulePage_RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='ContentManager'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base3' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
					</Control>	
				</DisplayProperty>		
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
