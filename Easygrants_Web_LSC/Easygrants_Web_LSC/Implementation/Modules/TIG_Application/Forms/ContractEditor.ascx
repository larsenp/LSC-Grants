<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<style type="text/css">
	#tblQuestions {
		width:100%;
	}
	#tblQuestions td {
		vertical-align:top;
	}
</style>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<div style="width:600px;">
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:600px" class="SeparatorHdg" id='divInstr' onclick='javascript:showPageWidth("divInstr")'>
		Instructions
	</div>
    <p>LSC requires additional information about proposed contracts that will use TIG funds. Using the form below, please outline any such contracts that your program plans to enter into during the proposed project.</p>
    <ul>
	 	<li>Provide as much information as possible about the planned contracts, including the expected contract amount, planned oversight activities, and the contractor's anticipated role and responsibilities.</li>
    	<li>Either identify a specific third-party entity that your program intends to contract with or, if that entity is not yet known, indicate that the contractor will be decided later.</li>
        <li>For approved contracts over $3,500, please note that recipients will be subject to special provisions when they expend more than $3,500 of TIG funds on a single contract for goods provided or services to be performed by a third party.</li>
        <li>Indicate whether the contractor's responsibilities will include the development of substantive legal content or involve the type of project decision-making activities typically handled by a LSC grant recipient. PLEASE NOTE: Conducting these types of activities could require the contractor to accept an LSC subgrant. Grantees should review all third-party contracting requirements, including the guidance in Program Letter 10-03, on the TIG Compliance Resources page at <a target="_blank" href="http://tig.lsc.gov/grants/compliance">http://tig.lsc.gov/grants/compliance</a></li>
    </ul>
    <div style="width:100%" class="SeparatorHdg">
		Contracts
	</div>
    <br />
	<table id='tblQuestions' onclick='javascript:showPageWidth("tblQuestions");'>
		<tr>
			<td><b>1.</b></td>
			<td>
				<b>Contract Amount from TIG Funds</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnContractAmountTig' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>2.</b></td>
			<td colspan="2">
				<b>Describe the contractor's project role, including specific tasks and responsibilities. Additionally, justify the use of third parties to accomplish these tasks and responsibilities.</b><font color='red'>*</font>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2">
				<span runat='server' id='spnTigFundedTasks' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>3.</b></td>
			<td>
				<b>Contractor Selection</b>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2">
				<i>Please note that although a specific contractor may be proposed in this application this does not imply LSC approval of any specific contractor for the project.  All procurement transactions must be conducted in a manner to provide, to the maximum extent practical, open and free competition; and all third-party expenditures, regardless of cost, must be appropriately documented. Please refer to <a href='http://www.gpo.gov/fdsys/pkg/CFR-2011-title45-vol4/pdf/CFR-2011-title45-vol4-part1630.pdf' target="_blank">45 CFR Part 1630</a> and the <a href='http://grants.lsc.gov/sites/default/files/Grants/accounting_guide_for_lsc_recipients_2010_edition.pdf' target="_blank">LSC Accounting Guide</a> for additional guidance.</i>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>a. Are you proposing a specific third-party contractor?</b><font color='red'>*</font>
			</td>
			<td><span runat='server' id='spnSpecificContractor'/></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><b>If yes, please indicate the proposed contractor.</b></td>
			<td>
				<span runat='server' id='spnContractingEntity' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>b. If you are proposing a specific third-party contractor, provide an explanation of how and why the proposed contractor was identified, including the competition process. If you are not proposing a specific third-party contractor, provide your plan for selecting the contractor, including the competition process.</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnContractorSelectionProcess'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>4.</b></td>
			<td>
				<b>Please identify your proposed methods of overseeing performance by the third parties. This includes information on what skills your program possesses to fully monitor contract performance.</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnOversightMethods'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>5.</b></td>
			<td>
				<b>Any legal content development activities?</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnLegalContentActivities' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>If yes, please describe these activities and the content to be developed.</b>
			</td>
			<td>
				<span runat='server' id='spnLegalContentActivityComment' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>6.</b></td>
			<td>
				<b>Any project decision-making activities?</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnLegalDecisionActivities' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>If yes, please describe these activities.</b>
			</td>
			<td>
				<span runat='server' id='spnLegalDecisionActivityComment' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>7.</b></td>
			<td>
				<b>Based on LSC’s rules and regulations (see <a href='http://www.gpo.gov/fdsys/pkg/CFR-2011-title45-vol4/pdf/CFR-2011-title45-vol4-part1627.pdf' target="_blank">45 CFR Part 1627</a>), will this be a subgrant?</b><font color='red'>*</font>
			</td>
			<td>
				<span runat='server' id='spnIsSubgrant' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='3' align='center' >
				<span runat='server' id='spnSave' />&nbsp;
				<span runat='server' id='spnSaveClose' />&nbsp;
				<span runat='server' id='spnClose' />
			</td>
		</tr>
	</table>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigContract' DataObjectDefinitionKey='LscTigContract' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscTigContractID' PropertyKey='LscTigContractID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContractAmountTig'>
					<Control ID='txtContractAmountTig'
						Type='cMoneyTextBox'
						Container='spnContractAmountTig'
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The field "Contract Amount from TIG Funds" must be a whole number.'
					    RegExErrorMessage='The field "Contract Amount from TIG Funds" is required.'
					    Size='10'
					    MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TigFundedTasks'>
					<Control ID='txtTigFundedTasks'
						Type='cTextArea'
						Container='spnTigFundedTasks'
						Rows='5'
						Cols='50'
						MaxLength='1000' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='SpecificContractor'>
					<Control ID='ctlSpecificContractor'
						Container='spnSpecificContractor'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractingEntity'>
					<Control ID='txtContractingEntity'
						Type='cTextBox'
						Container='spnContractingEntity'
						Size='60'
						MaxLength='200' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContractorSelectionProcess'>
					<Control ID='txtContractorSelectionProcess'
						Type='cTextArea'
						Container='spnContractorSelectionProcess'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OversightMethods'>
					<Control ID='txtOversightMethods'
						Type='cTextArea'
						Container='spnOversightMethods'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalContentActivities'>
					<Control ID='ctlLegalContentActivities'
						Container='spnLegalContentActivities'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalContentActivityComment'>
					<Control ID='txtLegalContentActivityComment'
						Type='cTextArea'
						Container='spnLegalContentActivityComment'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalDecisionActivities'>
					<Control ID='ctlLegalDecisionActivities'
						Container='spnLegalDecisionActivities'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalDecisionActivityComment'>
					<Control ID='txtLegalDecisionActivityComment'
						Type='cTextArea'
						Container='spnLegalDecisionActivityComment'
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsSubgrant'>
					<Control ID='ctlIsSubgrant'
						Container='spnIsSubgrant'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ContractEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='LscTigContract' DataObjectPropertyKey='LscTigContractID' BaseValue='LscTigContractID='/>
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Container='spnSaveClose'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='Contracts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='Contracts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

