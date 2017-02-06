<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cCopyTaskContent_Lsc" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />

<br />
<table id="Table1" cellpadding='2' cellspacing='0' runat='server' width='600'> 
<tr>
  <td colspan='2'><h1>Copy Task </h1></td>
</tr>
<tr>
  <td class='SeparatorHdg' colspan='2'>Instructions</td>
</tr>
<tr>
  <td colspan='2'>&nbsp;</td>
</tr>
<tr>
  <td colspan='2'><p>If you would like to complete a NIC for more than one service area (e.g., basic field and Native American) and wish to copy information from one NIC to the next, take the following steps:</p>
    <ol>
      <li>On the <strong>LSC Grants Home</strong> page, select the NIC whose information you wish to copy and click <strong>Copy</strong>.</li>
      <li>LSC Grants will then display the <strong>Copy Task</strong> page. In the <strong>Copy To</strong> section of the page, select Competition/Renewal from the <strong>Program</strong> pull-down menu.</li>
      <li>Select the the service area you would like to copy to from the <strong>Service Area</strong> pull-down menu.</li>
      <li>When you press <strong>Save</strong> the information is copied to the empty NIC you selected and your <strong>Home</strong> page is displayed again. When you select the NIC that you copied to, you will see that it now contains the copied information. You can make changes where the copied information is inappropriate.</li>
    </ol></td>
</tr>
	<tr>
		<td class='SeparatorHdg' colspan='2'>Copy From</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='15%'><b>Program</b></td>
		<td><span id='spnCopyFromProgram' runat="server"></span></td>
	</tr>
	<tr>
		<td><b>Service Area</b></td>
		<td><span id='spnCopyFromFO' runat="server"></span></td>
	</tr>
	<tr>
		<td><b>Grant Period</b></td>
		<td><span id='spnCopyFromFC' runat="server"></span></td>
	</tr>
	<tr>
		<td><b>Task</b></td>
		<td><span id='spnCopyFromTask' runat="server"></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td class='SeparatorHdg' colspan='2'>Copy To</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Program</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnCopyToProgram' runat="server"></span></td>
	</tr>
	<tr id='trCopyToFO' visible='false'>
		<td><b>Service Area</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<Core:cUserCtlLoader ID="CUserCtlLoader2" 
				CtlID='ctlCopyToFO' 
				Type='cDropDown'  
				runat='server' 
				Properties='ValidationText=Service Area is required.'/>
		</td>
	</tr>
	<!--<tr id='trCopyToFC' visible='false'>
		<td><b>Grant Period</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<Core:cUserCtlLoader ID="CUserCtlLoader3" 
				CtlID='ctlCopyToFC' 
				Type='cDropDown'  
				runat='server' 
				Properties='ValidationText=Grant Period is required.'/>
		</td>
	</tr>-->
	<tr id='trCopyToTask' visible='false'>
		<td><b>Task</b></td>
		<td><span id='spnCopyToTask' runat="server"></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="center" colspan='2'>
			<span id="spnSave" runat="server"></span>&nbsp;&nbsp;&nbsp;
			<span id="spnClose" runat="server"></span>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
			<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.WfProgram.ProgramName'>
					<Control ID='spnCopyFromProgram' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionName'>
					<Control ID='spnCopyFromFO' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfProjectName'>
					<Control ID='spnCopyFromFC' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTaskAbbr'>
					<Control ID='spnCopyFromTask' Type='HtmlGenericControl' />			
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCopyToProgram' Container='spnCopyToProgram' Type='cDropDown' DataObjectDefinitionKey='Program' StoredValue='ProgramID' PostBack='True' DisplayValue='ProgramDisplayName' DisplayText='Select' RequiredField='True' ErrorMessage='Program is required.'>
						<Action PostBack='True' AutoSave='False' Object='DataPresenter' Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Program' />
								<Argument Type='Control' TypeKey='ctlCopyToProgram' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>

		<!--The following DataObject element is used in the codebehind to this control.-->
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' GetData='False'>
			<Filters>
				<Argument PropertyKey='ProgramID' Value=''>
					<RelatedProperty PropertyKey='WfCompetition' />
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.WfProject.TimePeriodID' PropertyKey='TimePeriodID'  />
			</Filters>
			<Sort>
				<Argument PropertyKey='CompetitionDisplayName'>
					<RelatedProperty PropertyKey='WfCompetition' />
				</Argument>
			</Sort>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
						<Control ID='btnSave'
							Container='spnSave'
							Type='cButton'
							Image='Save'
							Confirmation='Are you sure you want to copy this task? The action cannot be undone.'>
							<Action
								AutoSave='True'
								PostBack='True'
								Object='DataPresenter'
								Method='CopyToNewTask'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
									<Argument Type='Control' TypeKey = 'ctlCopyToFO' ControlPropertyKey='SelectedValue' Value='' />
								</Parameters>							
							</Action>
							<Action PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home' />
								</Parameters>	
							</Action>
						</Control>	
		</DisplayProperty>
					<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Caption='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>		
		</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
