<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cCopyExistTaskContent_Lsc" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />

<br />
<table id="Table1" cellpadding='2' cellspacing='0' runat='server' width='600'>
  <tr>
    <td colspan='2'><h1>Copy Existing Task </h1></td>
  </tr>
  <tr>
    <td class='SeparatorHdg' colspan='2'>Instructions</td>
  </tr>
  <tr>
    <td colspan='2'>&nbsp;</td>
  </tr>
  <tr>
    <td colspan='2'><p>If you have applied for more than one service area (e.g., basic field and Native American) and wish to copy information from one application to the next, take the following steps:</p>
        <ol>
          <li>On the <strong>LSC Grants Home</strong> page, select the application whose information you wish to copy and click <strong>Copy</strong>.</li>
          <li>LSC Grants will then display the <strong>Copy Existing Task</strong> page. In the <strong>Copy To</strong> section of the page, select from the <strong>Task</strong> pull-down menu the service area application that you would like to fill with the information from the completed application.</li>
          <li>When you press <strong>Save</strong>  the information is copied to the empty application  you selected and your <strong>Home</strong> page is displayed again. When you select the application that you copied to, you will see that it now contains the copied information. You can make changes where the copied information is inappropriate.</li>
      </ol></td>
  </tr>
<tr><td class='SeparatorHdg' colspan='2'>Copy From</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td width='15%'><b>Program</b></td><td><span id='spnCopyFromProgram' runat="server"></span></td></tr>
<tr><td><b>Service Area</b></td><td><span id='spnCopyFromFO' runat="server"></span></td></tr>
<tr><td><b>Grant Period</b></td><td><span id='spnCopyFromFC' runat="server"></span></td></tr>
<tr><td><b>Task</b></td><td><span id='spnCopyFromTask' runat="server"></span></td></tr>
<tr><td>&nbsp;</td></tr>


<tr><td class='SeparatorHdg' colspan='2'>Copy To</td></tr>
<tr><td>&nbsp;</td></tr>
<tr id='trCopyToTask' visible='true'><td><b>Task</b>&nbsp;<%=kDenoteRequiredField%></td><td><span id='spnCopyToTask' runat="server"/></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align="center" colspan='2'><span id='spnSaveReview' runat='server' /><span id="spnSave" runat="server"></span>&nbsp;&nbsp;&nbsp;<span id="spnClose" runat="server"></span></td></tr>
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
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ExistingWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
			    <Argument Type='QueryString' TypeKey='ExistingWfTaskID' PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
		</DataObject>
		<DataObject Key='ExistingTasks' DataObjectDefinitionKey='ExistingTasks'>
			<Filters>
			    <Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
			    <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCopyToTask' 
					    Container='spnCopyToTask' 
					    Type='cDropDown' 
					    DataObjectDefinitionKey='ExistingTasks' 
					    StoredValue='WfTaskAssignmentID' 
					    PostBack='True' 
					    DisplayValue='TaskDescription' 
					    DisplayText='Select' 
					    RequiredField='True' 
					    ErrorMessage='Task is required.'>
					    <Filters>
							<Argument Type='DataObjectCollection' TypeKey='ExistingTasks' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
							<Argument Type='DataObjectCollection' TypeKey='ExistingTasks' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual' Value=''/>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.WfTAYear' PropertyKey='WfTAYear'>
								<RelatedProperty PropertyKey='WfTaskAssignment.WfTACompetitionYear' />
							</Argument>
						</Filters>
						<%--<Action PostBack='True' AutoSave='False' Object='DataPresenter' Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='ExistingWfTaskAssignment' />
								<Argument Type='Control' TypeKey='ctlCopyToTask' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>--%>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control ID='btnSaveReview'
					Type='cButton'
					Container='spnSaveReview'
					Caption='Save'
					Confirmation='Are you sure you want to copy this item? This action cannot be undone.'>
					<Action PostBack='True'
						Object='DataPresenter'
						Method='CopyReview'>
						<Parameters>
							<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'/>
							<Argument Type='Control' TypeKey='ctlCopyToTask' ControlPropertyKey='SelectedField' />
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
						<Control ID='btnSave'
							Container='spnSave'
							Type='cButton'
							Image='Save'
							Confirmation='Are you sure you want to copy this item? This action cannot be undone.'>
							<Action
								AutoSave='True'
								PostBack='True'
								Object='DataPresenter'
								Method='CopyToExistingTask'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
									<%--<Argument Type='QueryString' TypeKey='ExistingWfTaskAssignmentID' BaseValue='ExistingWfTaskAssignmentID='/>	--%>
									<Argument Type='Control' TypeKey='ctlCopyToTask' ControlPropertyKey='SelectedValue' Value='' />
									<Argument Type='' TypeKey='' AttributeName='' Value='Update' />
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
		<DataCommand Key='CopyReviewWfTA' DataCommandDefinitionKey='CopyReviewWfTA'>
			<Parameters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' />
				<Argument Type='Control' TypeKey='ctlCopyToTask' ControlPropertyKey='SelectedValue' Value='' />
			</Parameters>
		</DataCommand>
	</ModuleSection>
</span>
