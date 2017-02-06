<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cPolicyBoardStructure" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
      <span id='spnPageContent' runat='server' />

<table  border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>

	<tr>
	  <td colspan="4"><h1>Current Year Governing/Policy Body Structure (Forms F-1 and F-2)</h1></td>
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
			<p>The <strong>Current Year Governing/Policy Body forms (i.e., Forms F-1 and F-2)</strong> capture information 
				on Applicant's governing/policy body members.</p>
			<p>Governing/Policy Body member information provided in the Notice of Intent to Compete (NIC) is automatically transferred 
				to Forms F-1 and F-2; however, some additional information is required.</p>
			<p>Access Forms F-1 and F-2 to complete the information required for each Governing/Policy Body member.</p>
            <ul>
              <li>To provide information for a new board member, click <strong>Add</strong></li>
              <li> To edit existing board member information, click <strong>Edit</strong></li>
              <li>To delete board member information, click <strong>Delete</strong></li>
              <li>To go to the next page, click <strong>Continue</strong></li>
            </ul>
            <p><strong><font color="#990000">Note:</font></strong></p>
            <p>All Applicants must have a governing or policy body consistent with the requirements of 45 C.F.R. Part 1607 within sixty days of receiving an LSC grant.</p>
			<p>This form will calculate whether the applicant is in compliance with 45 C.F.R. Part 1607.3 in the <b>Verification</b> section below. Compliance with 45 C.F.R. Part 1607.3 is determined based on <u>filled board positions</u>.  Applicants that currently do not have a board that complies with 45 C.F.R. Part 1607.3 are required to submit a plan by responding to the questions in the <b>Applicants not in compliance</b> section below. </p>
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
	Applicants not in compliance
</div>
<br />
<div style="width:800px; border:solid 3px #dddddd; padding:10px">
	<p>
		The following questions apply only to those applicants whose governing/policy body structure is not in 
		compliance with 45 C.F.R. Part 1607, as indicated by the bold word <b>"No"</b> in the bottom row of the 
		<b>Verification</b> table above.
	</p>
	<p>
		Successful applicants must have a governing or policy body consistent with the requirements of 45 CFR 
		Part 1607 of the LSC regulations. An applicant that is not compliance at the time the grant is awarded 
		will be required to be in compliance within sixty days from the date the grant award is made. 
	</p>
	<p>In consideration of applicant’s bylaws, identify the number of vacant: </p>
	<ul><li>Client board positions to be filled in order to be in compliance&nbsp;&nbsp;<span runat='server' id='spnBylawClientBoardVacancies'/></li></ul>
	<ul><li>Attorney board positions to be filled in order to be in compliance&nbsp;&nbsp;<span runat='server' id='spnBylawAttyBoardVacancies'/></li></ul>
	<ul><li>McCollum attorney board positions to be filled to be in compliance&nbsp;&nbsp;<span runat='server' id='spnBylawMcCollumAttyVacancies'/></li></ul><br />
	Identify the names of the appointing organizations the applicant is in contact with for filling the client and/or attorney board positions.<br />
	<span runat='server' id='spnComplianceApptOrgs'/><br /><br />
	Describe applicant’s strategy, including timeline, for coming into compliance with 45 C.F.R. Part 1607.3 .<br />
	<span runat='server' id='spnComplianceVacancies'/>
</div>
<br /><br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg">Board Members (Form F-2)</td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' id='tblNewApplicantNoBoard'>
	<tr>
		<td>
			<span runat='server' id='spnNewApplicantNoBoard' />&nbsp;
			I am a new applicant and do not have a board.
		</td>
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
				<Argument PropertyKey='LscBoardInfoSourceID' Value='1' />
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
						<DisplayProperty PropertyKey='BoardMemberStatus.Description' ColumnHeader='Status' Width='20%'/>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name'  Width='25%' />
						<DisplayProperty PropertyKey='RelevantExperience' ColumnHeader='Relevant Experience'  Width='30%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
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
			    <Argument PropertyKey='LscBoardInfoSourceID' Value='1' />
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
							<Argument PropertyKey='LscBoardInfoSourceID' Value='1'/>
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
					<Control ID='btnEditStructure1'
						Type='cButton'
						Image='Edit'
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


			    <DisplayProperty PropertyKey='NewApplicantNoBoard'>
					<Control ID='chkNewApplicantNoBoard'
						Type='cCheckBox'
						Container='spnNewApplicantNoBoard'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ComplianceApptOrgs'>
					<Control ID='txtComplianceApptOrgs'
						Type='cTextArea'
						Container='spnComplianceApptOrgs'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ComplianceVacancies'>
					<Control ID='txtComplianceVacancies'
						Type='cTextArea'
						Container='spnComplianceVacancies'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ByLawClientBoardVacancies'>
					<Control ID='ctlByLawClientBoardVacancies'
						Container='spnByLawClientBoardVacancies'
						Type='cTextBox'
						Size='10'
						MaxLength='8'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1000000'
							ErrorMessage='The field "client board positions to be filled in order to be in compliance" must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ByLawAttyBoardVacancies'>
					<Control ID='ctlBylawAttyBoardVacancies'
						Container='spnBylawAttyBoardVacancies'
						Type='cTextBox'
						Size='10'
						MaxLength='8'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1000000'
							ErrorMessage='The field "attorney board positions to be filled in order to be in compliance" must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ByLawMcCollumAttyVacancies'>
					<Control ID='ctlBylawMcCollumAttyVacancies'
						Container='spnBylawMcCollumAttyVacancies'
						Type='cTextBox'
						Size='10'
						MaxLength='8'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='1000000'
							ErrorMessage='The field "McCollum attorney board positions to be filled to be in compliance" must be a whole number zero or greater.'/>
					</Control>
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
				<Argument PropertyKey='LscBoardInfoSourceID' Value='1' />
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
					<Control ID='btnEditStructure2'
						Type='cButton'
						Image='Edit'
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