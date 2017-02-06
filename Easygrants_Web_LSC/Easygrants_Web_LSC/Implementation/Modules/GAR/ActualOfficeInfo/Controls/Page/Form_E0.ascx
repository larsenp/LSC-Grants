<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualOfficeInfo.Controls.Page.cForm_E0" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!--Core_Web.Controls.Base.cDataPresenterCtl-->
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	 AutoVDateType='Last' Key='Form_E0' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form E-0: Actual Office Information</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormE0' 
	Src='Implementation/Modules/GAR/ActualOfficeInfo/Controls/PageSection/FormE0_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlFormD1F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>

<table width='600' runat='server'>
	<tr>
		<td class='SeparatorHdg'>
			Form E-0(a): Main Office
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trAddMain'>
		<td>
			<span runat='server' id='spnAddMain' />
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnListMain' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Form E-0(b): Branch Office
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddBranch' />
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnListBranch' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Form E-0(c): Subrecipient Office
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddSub' />
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnListSub' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnContinue'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
		</DataObject>

		<DataObject Key='LscOfficeMain' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument PropertyKey='OffTypeID' Value='1' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOfficeMain'
						Type='cDataListCtl'
						Container='spnListMain'
						DataObjectDefinitionKey='LscOffice'>
						<DisplayProperty PropertyKey='OffID' ColumnHeader='Office Number' />
						<DisplayProperty PropertyKey='OffName' ColumnHeader='Office Name' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEditMain'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Form_E0a'/>
										<Argument Type='DataObject' TypeKey='LscOfficeID' AttributeName='LscOfficeID' BaseValue='LscOfficeID=' />
										<Argument Type='DataObject' TypeKey='OffTypeID' AttributeName='OffTypeID' BaseValue='OffTypeID=' />
										<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddMain'
						Type='cButton'
						Container='spnAddMain'
						Caption='Add Main Office'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Form_E0a'/>
								<Argument Value='LscOfficeID=0' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID' BaseValue='TimePeriodID='/>
								<Argument Value='OffTypeID=1' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscOfficeBranch' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument PropertyKey='OffTypeID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOfficeBranch'
						Type='cDataListCtl'
						Container='spnListBranch'
						DataObjectDefinitionKey='LscOffice'>
						<DisplayProperty PropertyKey='OffID' ColumnHeader='Office Number' />
						<DisplayProperty PropertyKey='OffName' ColumnHeader='Office Name' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' HeaderColspan='2' >
							<Control ID='btnEditBranch'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Form_E0b'/>
										<Argument Type='DataObject' TypeKey='LscOfficeID' AttributeName='LscOfficeID' BaseValue='LscOfficeID=' />
										<Argument Type='DataObject' TypeKey='OffTypeID' AttributeName='OffTypeID' BaseValue='OffTypeID=' />
										<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddBranch'
						Type='cButton'
						Container='spnAddBranch'
						Caption='Add Branch Office'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Form_E0b'/>
								<Argument Value='LscOfficeID=0' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID' BaseValue='TimePeriodID='/>
								<Argument Value='OffTypeID=2' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscOfficeSub' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument PropertyKey='OffTypeID' Value='3' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOfficeSub'
						Type='cDataListCtl'
						Container='spnListSub'
						DataObjectDefinitionKey='LscOffice'>
						<DisplayProperty PropertyKey='OffID' ColumnHeader='Office Number' />
						<DisplayProperty PropertyKey='OffName' ColumnHeader='Office Name' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' HeaderColspan='2' >
							<Control ID='btnEditSub'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Form_E0c'/>
										<Argument Type='DataObject' TypeKey='LscOfficeID' AttributeName='LscOfficeID' BaseValue='LscOfficeID=' />
										<Argument Type='DataObject' TypeKey='OffTypeID' AttributeName='OffTypeID' BaseValue='OffTypeID=' />
										<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddSub'
						Type='cButton'
						Container='spnAddSub'
						Caption='Add Subrecipient Office'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Form_E0c'/>
								<Argument Value='LscOfficeID=0' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID' BaseValue='TimePeriodID='/>
								<Argument Value='OffTypeID=3' />
								<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Submission' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>--%>
			<%--	<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>  --%>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
						 <Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
