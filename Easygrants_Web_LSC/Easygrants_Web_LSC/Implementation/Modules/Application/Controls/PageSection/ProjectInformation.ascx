<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<style>
	td {vertical-align:top}
</style>
<br>
      <span id='spnPageContent' runat='server' />

<div style='width:600px'>
	<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
		<tr>
		  <td colspan="4"><h1>Project and Subgrant Information </h1></td>
		</tr>
		  <tr>
			 <td colspan="4" class="SeparatorHdg">Instructions</td>
		  </tr>
		  <tr>
			 <td colspan="4" >&nbsp;</td>
		  </tr>
		  <tr>
			 <td valign="top" ><p>The <strong>Project and Subgrant Information</strong> page allows the applicant to review information about the project including Service Area and Estimated Grant Amount. It also captures information about subgrants used during the current year and planned for the upcoming grant year.</p>
				  <ul>
					 <li><strong><font color="#990000">All fields marked with an asterisk (*) are required</font></strong></li>
					 <li>To save the data, click <strong>Save</strong></li>
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
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
		Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
		runat='server'/>
	
	<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
		<tr>
			<td colspan="3" class="SeparatorHdg">Project Information</td>
		</tr>	
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td	width='30%'><b>Service Area</b></td>
			<td width='50px'>&nbsp;</td>
			<td ><span id='spnSAname' runat='server'/></td>
		</tr>
				
		<tr><td>&nbsp;</td></tr>
		
		<tr>		
			<td><b>Estimated Grant Amount</b></td>
			<td></td>
			<td><span id='spnAmount' runat='server'/></td>	
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
		<tr>
			<td class="SeparatorHdg"  colspan='3'>
				Subgrant Information
			</td>
		</tr>
		<tr>
			<td colspan='3'>
				<p>Respond to the questions below regarding subgrants used during the current year and planned for the upcoming grant year. <strong>For competition applicants only</strong>: LSC requires additional information about current or planned subgrants of LSC Basic Field funds, as well as current or planned subgrants of non-LSC funds if those subgrants are for PAI activities. See the Request for Proposals Narrative Instruction or the Post-PQV RFP Narrative Instruction for more information.</p>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='3' class="MinorSeparatorHdg">
				Subgrants of LSC Basic Field Grant Awards
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="width:30px; vertical-align:top">
				1.
			</td>
			<td>
				<p>During the current grant year (calendar year <span runat='server' id='spnCurrentYear1'/>), is any portion of the LSC Basic Field grant award being allocated to another entity by subgrant?<%=kDenoteRequiredField%></p>
				<p>If yes, respond to the questions below.</p>
			</td>
			<td>
				<span runat='server' id='spnHasCurrentLscSubgrants'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				How many subgrants in the current year are for PAI activities?
			</td>
			<td>
				<span runat='server' id='spnCurrentLscPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				How many subgrants in the current year are for non-PAI activities?
			</td>
			<td>
				<span runat='server' id='spnCurrentLscNonPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				Total number of subgrants of LSC Basic Field grant funds in the current year
			</td>
			<td style='font-weight:bold'>
				<span runat='server' id='spnCurrentLscSubgrantsCount'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="width:30px; vertical-align:top">
				2.
			</td>
			<td>
				<p>In the upcoming grant year (calendar year <span runat='server' id='spnUpcomingYear1'/>), does the applicant plan to allocate any portion of the LSC grant award to another entity as a subgrant?<%=kDenoteRequiredField%></p>
				<p>If yes, respond to the questions below.</p>
			</td>
			<td>
				<span runat='server' id='spnPlansUpcomingLscSubgrants'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				How many subgrants in the upcoming year will be for PAI activities?
			</td>
			<td>
				<span runat='server' id='spnUpcomingLscPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				How many subgrants in the upcoming year will be for non-PAI activities? 
			</td>
			<td>
				<span runat='server' id='spnUpcomingLscNonPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				Total number of subgrants of LSC Basic Field grant funds expected for the upcoming grant year:
			</td>
			<td style='font-weight:bold'>
				<span runat='server' id='spnUpcomingLscSubgrantsCount'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='3' class="MinorSeparatorHdg">
				Subgrants of Non-LSC funds for PAI Activities
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				3.
			</td>
			<td>
				<p>In the current year (calendar year <span runat='server' id='spnCurrentYear2'/>), does the applicant subgrant any of its non-LSC funds for PAI activities? <%=kDenoteRequiredField%></p>
			</td>
			<td>
				<span runat='server' id='spnHasCurrentNonLscPaiSubgrants'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<p>If yes, how many subgrants will be made with non-LSC funds for PAI activities?</p>
			</td>
			<td>
				<span runat='server' id='spnCurrentNonLscPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td style="vertical-align:top">
				4.
			</td>
			<td>
				<p>In the upcoming grant year (calendar year <span runat='server' id='spnUpcomingYear2'/>), does the applicant plan to subgrant any of its non-LSC funds for PAI activities?<%=kDenoteRequiredField%></p>
			</td>
			<td>
				<span runat='server' id='spnPlansUpcomingNonLscPaiSubgrants'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<p>If yes, how many subgrants will be made with non-LSC funds for PAI activities?</p>
			</td>
			<td>
				<span runat='server' id='spnUpcomingNonLscPaiSubgrantsCount'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
		<tr align='center'>
			<td>
				<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSave_and_Continue'/>
			</td>
		</tr>
	</table>
</div>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnSAname' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.Fund.FundAmount' Format='$#,##0'>
					<Control ID='spnAmount' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGranteeProjectInfo' DataObjectDefinitionKey='LscGranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WFTAYearCurrent'>
					<Control ID='spnCurrentYear1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WFTAYear'>
					<Control ID='spnUpcomingYear1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WFTAYearCurrent'>
					<Control ID='spnCurrentYear2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WFTAYear'>
					<Control ID='spnUpcomingYear2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscCompRenewApplSubgrant' DataObjectDefinitionKey='LscCompRenewApplSubgrant' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='HasCurrentLscSubgrants'>
					<Control ID='rdoHasCurrentLscSubgrants'
						Type='cRadioButtonList'
						Container='spnHasCurrentLscSubgrants'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrentLscPaiSubgrantsCount'>
					<Control ID='txtCurrentLscPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnCurrentLscPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrentLscNonPaiSubgrantsCount'>
					<Control ID='txtCurrentLscNonPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnCurrentLscNonPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PlansUpcomingLscSubgrants'>
					<Control ID='rdoPlansUpcomingLscSubgrants'
						Type='cRadioButtonList'
						Container='spnPlansUpcomingLscSubgrants'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UpcomingLscPaiSubgrantsCount'>
					<Control ID='txtUpcomingLscPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnUpcomingLscPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UpcomingLscNonPaiSubgrantsCount'>
					<Control ID='txtUpcomingLscNonPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnUpcomingLscNonPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasCurrentNonLscPaiSubgrants'>
					<Control ID='rdoHasCurrentNonLscPaiSubgrants'
						Type='cRadioButtonList'
						Container='spnHasCurrentNonLscPaiSubgrants'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrentNonLscPaiSubgrantsCount'>
					<Control ID='txtCurrentNonLscPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnCurrentNonLscPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PlansUpcomingNonLscPaiSubgrants'>
					<Control ID='rdoPlansUpcomingNonLscPaiSubgrants'
						Type='cRadioButtonList'
						Container='spnPlansUpcomingNonLscPaiSubgrants'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UpcomingNonLscPaiSubgrantsCount'>
					<Control ID='txtUpcomingNonLscPaiSubgrantsCount'
						Type='cMoneyTextBox'
						Container='spnUpcomingNonLscPaiSubgrantsCount'
						DecimalErrorMessage='All subgrant counts must be whole numbers.'
						RegExErrorMessage='All subgrant counts must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscCompRenewApplSubgrantTotals' DataObjectDefinitionKey='LscCompRenewApplSubgrantTotals' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscCompRenewApplSubgrant' DataObjectPropertyKey='LscCompRenewApplSubgrantID' PropertyKey='LscCompRenewApplSubgrantID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CurrentLscSubgrantsCount'>
					<Control ID='spnCurrentLscSubgrantsCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UpcomingLscSubgrantsCount'>
					<Control ID='spnUpcomingLscSubgrantsCount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
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
<!-- End Embedded XML -->