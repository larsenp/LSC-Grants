<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cApplyGrantContent_lsc" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<table width="600" border='0' cellpadding='0' cellspacing='0'>
	<tr>
	  <td><h1>Service Areas in Competition for 2017 LSC Grants</h1></td>
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
          <td valign="top" ><ul>
            <li>To begin preparing your Notice of Intent to Compete (NIC) application, select one of the Service Areas from the drop down menu in the <strong><a href="#selectservicearea">Select Service Area</a></strong> section below, and then click <strong>Save and Continue</strong>. </li>
            <li>Applicants who apply for more than one service area should complete a separate NIC for each service area.</li>
            <li>Click <a href="http://grants.lsc.gov/about-grants/where-we-fund">here</a> to view LSC Grants Competition Service Areas Subject to Competition.</li>
          </ul>
            <p><strong>Please note:</strong> The following persons, groups, and entities are qualified applicants who may submit a notice of intent to compete and an application to participate in the competitive bidding process:</p>
            <ol>
              <li>Current recipients of LSC funds.</li>
              <li>Other non-profit organizations that have as a purpose the furnishing of legal assistance to eligible clients.</li>
              <li>Private attorneys, groups of attorneys or law firms (except that no private law firm that expends 50 percent or more of its resources and time litigating issues in the broad interests of a majority of the public may be awarded a grant or contract under the LSC Act).</li>
              <li>State or local governments.</li>
              <li>Substate regional planning and coordination agencies which are composed of substate areas and whose governing boards are controlled by locally elected officials.</li>
            </ol>
            <p> All successful applicants must have a governing or policy body consistent with the requirements of 45 C.F.R. Part 1607 of the LSC regulations. An applicant that is not in compliance at the time the grant is awarded will be required to be in compliance with 45 C.F.R. Part 1607 within sixty days from the date the grant award is made.</p>            
         
          </td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	
	<tr><td class="SeparatorHdg"><b><a name="selectservicearea"></a>Select Service Area</b>
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td colspan='3'>
			<span id='spnWfProject' runat='server' />
		</td>
		<td width='20'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlWfProject'
						Type='cDropDown'
						Container='spnWfProject'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectID'
						DisplayValue='WfProject.WfProjectName'
						DisplayNone='False'
						DisplayText='Select'>
							<Filters>
								<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='OpenDate' Operator='LessThanEqual' />
								<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CloseDate' Operator='GreaterThanEqual' />
								<Argument PropertyKey='WfTaskID' Value='1' />
							</Filters>
							<Sort>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='WfProject.TimePeriod' />
								</Argument>
								<Argument PropertyKey='WfProjectName'>
									<RelatedProperty PropertyKey='WfProject' />
								</Argument>
							</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>			
		</DataObject>
						
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>						
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Save_and_Continue' 
						Confirmation='Are you sure you want to apply for this service area?' >
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='Object' ObjectType = 'DataObject' ObjectKey='WfProject' />
								<Argument Type='' TypeKey = '' Value='Eligibility' />
								<Argument Type='' TypeKey = ''  Value='EligibilityModuleConfig' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='' />														
								
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home'/>
									<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID=' Value=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>	
</span>
<!-- End Embedded XML -->