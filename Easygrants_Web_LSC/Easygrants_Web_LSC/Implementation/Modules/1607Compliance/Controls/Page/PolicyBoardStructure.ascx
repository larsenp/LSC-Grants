<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
      <span id='spnPageContent' runat='server' />

<table  border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>

	<tr>
	  <td colspan="4"><h1>1607 Compliance Reporting</h1></td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" >
			<p>Use current, actual governing body data to update the list of the program's Board Members, vacancies and bylaw positions.</p>
            <ul>
              <li>Update Board Members and Board Chair</li>
              <li>Update vacancies</li>
              <li>Update bylaw positions</li>
            </ul>
			</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br />
  <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />

<div class="SeparatorHdg" >Policy Board Structure (Form F-1) </div>
<br />
<table id='tblBoardStructure' runat='server' border='0' cellspacing='0' cellpadding='0' width='700px' style="text-align:center">
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b>McCollum Attorneys</b>
		</td>
		<td>
			<b>Other Attorneys</b>
		</td>
		<td>
			<b>Client Members</b>
		</td>
		<td>
			<b>Other Members</b>
		</td>
		<td>
			<b>Options</b>
		</td>
	</tr>
	<tr>
		<td style="text-align:left">
			<b>Number of Bylaw Positions</b>
		</td>
		<td>
			<span runat='server' id='spnBylawTotal'/>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyBylaw'/>
		</td>
		<td>
			<span runat='server' id='spnOtherAttyBylaw'/>
		</td>
		<td>
			<span runat='server' id='spnClientMemberBylaw'/>
		</td>
		<td>
			<span runat='server' id='spnOtherMemberBylaw'/>
		</td>
		<td>
			<span runat='server' id='spnEditStructure1'/>
		</td>
	</tr>
	<tr>
		<td style="text-align:left">
			<b>Number of Filled Positions</b>
		</td>
		<td>
			<span runat='server' id='spnTotalMemberCount'/>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyCount'/>
		</td>
		<td>
			<span runat='server' id='spnOtherAttyCount'/>
		</td>
		<td>
			<span runat='server' id='spnClientMemberCount'/>
		</td>
		<td>
			<span runat='server' id='spnOtherMemberCount'/>
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td style="text-align:left">
			<b>Number of Vacancies</b>
		</td>
		<td>
			<span runat='server' id='spnTotalVacancies'/>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyVacancies'/>
		</td>
		<td>
			<span runat='server' id='spnOtherAttyVacancies'/>
		</td>
		<td>
			<span runat='server' id='spnClientMemberVacancies'/>
		</td>
		<td>
			<span runat='server' id='spnOtherMemberVacancies'/>
		</td>
		<td>
			<span runat='server' id='spnEditStructure2'/>
		</td>
	</tr>
</table>
<br />
<div style="width:100%" class="MinorSeparatorHdg">
	Verification
</div>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600px'>
	<tr>
		<td>
			The recipient's board consists of at least one-third eligible clients
		</td>
		<td>
			<span runat='server' id='spnClientMemberCompliant'/>
		</td>
	</tr>
	<tr>
		<td>
			The recipient's board consists of at least sixty percent attorneys.
		</td>
		<td>
			<span runat='server' id='spnTotalAttyCompliant'/>
		</td>
	</tr>
	<tr>
		<td>
			The majority (>50%) of the total governing body are McCollum attorneys
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyCompliant'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Recipient's board meets all requirements to be in compliance with 45 C.F.R. Part 1607</b>
		</td>
		<td>
			<b><span runat='server' id='spnOverallCompliant'/></b>
		</td>
	</tr>
</table>
<br />
<div style="width:100%" class="MinorSeparatorHdg">
	Grantees not in compliance
</div>
<br />
<div style="width:800px; border:solid 3px #dddddd; padding:10px">
	<p>
		The following questions apply only to those grantees whose governing/policy body structure is not in 
		compliance with 45 C.F.R. Part 1607, as indicated by the bold word <b>"No"</b> in the bottom row of the 
		<b>Verification</b> table above.
	</p>
	<p>
		Discuss the reasons the grantee is not yet in compliance with 1607.<br />
		<span runat='server' id='spnReasonsNotInCompliance'/>
	</p>
	<p>
		Discuss the efforts made to fill the vacancies.<br />
		<span runat='server' id='spnEffortsMade'/>
	</p>
	<p>
		Discuss how the grantee proposes to fill the vacancies to come into compliance.<br />
		<span runat='server' id='spnHowProposesToFill'/>
	</p>
	<p>
		Provide the expected dates for any forthcoming appointments.<br />
		<span runat='server' id='spnExpectedDates'/>
	</p>
</div>
<br /><br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg">Board Members (Form F-2)</td>
	</tr>	
</table>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='2'>
			Board Chair
		</td>
	</tr>
	<tr>
		<td width='600px'>
			<p>Select the Board Chair (or Interim Board Chair) from the drop-down selector below.  Note:  an email address and a phone number are required for the board chair.</p>
            <p>Use the <b>Add</b> button in the <b>Board Members</b> section below to add new board member information, including new Board Chair (or Interim Board Chair) information.</p>
            <p>Use the <b>Edit</b> button below to access the Board Member Editor page to edit any of the existing board member information.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<b>Board Chair</b>&nbsp;
			<span runat='server' id='spnBoardChairContactID' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='2'>
			<span runat='server' id='spnSave' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg' colspan='2'>
			Board Members
		</td>
	</tr>
	<tr id='trAddMember'>
		<td  colspan='2'>
			<span runat='server' id='spnAddMember'></span>
		</td>
	</tr>
	<tr id='trMemberList'>
		<td  colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscCopyBoardStructureInfo' DataObjectDefinitionKey='LscCopyBoardStructureInfo'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='wf_task_assignment_id' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscCopyBoardMemberInfo' DataObjectDefinitionKey='LscCopyBoardMemberInfo'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='wf_task_assignment_id' />
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
				<Argument PropertyKey='AffiliationTypeID' Value='3' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='3' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAddMember'>
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
						<DisplayProperty PropertyKey='BoardMemberStatus.Description' ColumnHeader='Status' Width='10%'/>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name'  Width='20%' />
						<DisplayProperty PropertyKey='BoardMemberType.Description' ColumnHeader='Member Type' Width='20%'/>
						<DisplayProperty PropertyKey='RelevantExperience' ColumnHeader='Relevant Experience'  Width='30%'/>
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
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscBoardStructure' DataObjectDefinitionKey='LscBoardStructure' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
  				<Argument PropertyKey='LscBoardInfoSourceID' Value='3' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BoardChairContactID'>
					<Control ID='ctlBoardChairContactID'
						Type='cDropDown'
						Container='spnBoardChairContactID'
						DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'
						StoredValue='LscWfTaskAssignmentAffiliationID'
						DisplayValue='FirstNameLastNameEmailPhone'>
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
							<Argument PropertyKey='LscBoardInfoSourceID' Value='3'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName' />
							<Argument PropertyKey='FirstName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyBylaw'>
					<Control ID='spnMcCollumAttyBylaw'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyBylaw'>
					<Control ID='spnOtherAttyBylaw'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberBylaw'>
					<Control ID='spnClientMemberBylaw'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberBylaw'>
					<Control ID='spnOtherMemberBylaw'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkEditStructure1'
						Type='cLink'
						Caption='Edit number of bylaw positions'
						Container='spnEditStructure1'>
					  <Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructureEditor' />
							</Parameters>		
					  </Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReasonsNotInCompliance'>
					<Control ID='txtReasonsNotInCompliance'
						Type='cTextArea'
						Container='spnReasonsNotInCompliance'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EffortsMade'>
					<Control ID='txtEffortsMade'
						Type='cTextArea'
						Container='spnEffortsMade'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HowProposesToFill'>
					<Control ID='txtHowProposesToFill'
						Type='cTextArea'
						Container='spnHowProposesToFill'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExpectedDates'>
					<Control ID='txtExpectedDates'
						Type='cTextArea'
						Container='spnExpectedDates'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
		    </DisplayProperties>
	    </DataObject>
		
		<DataObject Key='LscBoardStructureTotals' DataObjectDefinitionKey='LscBoardStructureTotals' Updatable='False' CreateNew='False'>		
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='LscBoardStructure' 
					PropertyKey='LscBoardStructureID' 
					DataObjectPropertyKey='LscBoardStructureID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BylawTotal'>
					<Control ID='spnBylawTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscBoardVacanciesCalc' DataObjectDefinitionKey='LscBoardVacanciesCalc' Updatable='False' CreateNew='False'>		
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='LscBoardStructure' 
					PropertyKey='LscBoardStructureID' 
					DataObjectPropertyKey='LscBoardStructureID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalVacancies'>
					<Control ID='spnTotalVacancies'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyVacancies'>
					<Control ID='spnMcCollumAttyVacancies'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyVacancies'>
					<Control ID='spnOtherAttyVacancies'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberVacancies'>
					<Control ID='spnClientMemberVacancies'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberVacancies'>
					<Control ID='spnOtherMemberVacancies'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscBoardCounts' DataObjectDefinitionKey='LscBoardCounts' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='3'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalMemberCount'>
					<Control ID='spnTotalMemberCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyCount'>
					<Control ID='spnMcCollumAttyCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyCount'>
					<Control ID='spnOtherAttyCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberCount'>
					<Control ID='spnClientMemberCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberCount'>
					<Control ID='spnOtherMemberCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkEditStructure2'
						Type='cLink'
						Caption='Provide details about length of vacancies'
						Container='spnEditStructure2'>
					  <Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructureEditor' />
							</Parameters>		
					  </Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscBoardCompliance' DataObjectDefinitionKey='LscBoardCompliance' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey='LscBoardCounts' DataObjectPropertyKey='LscBoardCountsID' PropertyKey='LscBoardCountsID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ClientMemberCompliant' Format='YesNo'>
					<Control ID='spnClientMemberCompliant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalAttyCompliant' Format='YesNo'>
					<Control ID='spnTotalAttyCompliant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyCompliant' Format='YesNo'>
					<Control ID='spnMcCollumAttyCompliant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallCompliant' Format='YesNo'>
					<Control ID='spnOverallCompliant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscWfTaskAssignment' DataObjectDefinitionKey='LscWfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
