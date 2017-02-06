<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.LOI.Controls.Page.cBoardMembersList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
      <span id='spnPageContent' runat='server' />

<table  border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>

	<tr>
	  <td><h1>Board Members</h1></td>
  </tr>

</table>


<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan='4'>
			<Core:cUserCtlLoader CtlID='ctlAppInfo' 
				Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
				runat='server'/>
		</td>
	</tr>
  <tr>
    <td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="4" >&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" ><p>The <strong>Board Members</strong> page captures information about board members including name, position and relevant experience.</p>
        <ul>
          <li>To add information, click <strong>Add</strong></li>
          <li>To edit information, click <strong>Edit</strong></li>
          <li>To delete information, click <strong>Delete</strong></li>
          <li>To go to the next page, click <strong>Continue</strong></li>
        </ul></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
  </tr>
  <tr>
    <td valign="top" >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600'>
	<tr>
		<td class="SeparatorHdg"><b>Board Members</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600'>
	<tr>
		<td>
			<span runat='server' id='spnNewApplicantNoBoard' />&nbsp;
			I am a new applicant and do not have a board.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='MemberList' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='AffiliationTypeID' 
					Value='3' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName' />
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BoardMembersEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='LscWfTaskAssignmentAffiliationID=0'/>
									<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' AttributeName='' BaseValue='WfTaskAssignmentID='/>
									<Argument Type='' TypeKey='' AttributeName='' BaseValue='AffiliationTypeID=3'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name'  Width='15%'/>
						<DisplayProperty PropertyKey='BoardMemberStatus.Description' ColumnHeader='Status' Width='15%'/>
						<DisplayProperty PropertyKey='AppointingOrganization' ColumnHeader='Appointing Organization'  Width='25%'/>
						<DisplayProperty PropertyKey='RelevantExperience' ColumnHeader='Relevant Experience'  Width='25%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='BoardMembersEditor'/>
										<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID' BaseValue='LscWfTaskAssignmentAffiliationID='/>
										<Argument Type='' TypeKey='' AttributeName='' Value='AffiliationTypeID=3'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID'/>
										</Parameters>
							</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscBoardStructure' DataObjectDefinitionKey='LscBoardStructure' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='2' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='2' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NewApplicantNoBoard'>
					<Control ID='chkNewApplicantNoBoard'
						Type='cCheckBox'
						Container='spnNewApplicantNoBoard'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>