<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProjectEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Technical Support E-mail Address</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnSupportEmail' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Program Support E-mail Address</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnContentEmail' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Time Period/Award Cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTimePeriod' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Fund Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnFundName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Award Term (Years)</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTerm' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Start Date</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStartDate' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>End Date</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEndDate' runat='server'/></td>	
	</tr>	
	<tr>
		<td><b>Total Budget Limit</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTotalBudgetLimit' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Indirect Cost Limit</b></td>
		<td width='10'>&nbsp;</td>
		<td>%<span id='spnIndirectCostLimit' runat='server'/></td>	
	</tr>	
	<tr>
		<td><b>Automatically generate Payments</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAutoGeneratePayment' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td nowrap='true'><b>Use the default Payments set up for this funding cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDefaultPaymentSetup' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Use the custom payment process for this funding cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPaymentProcess' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Automatically generate Grantee Reports</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAutoGenerateReport' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td nowrap='true'><b>Use the default Grantee Reports set up for this funding cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDefaultReportSetup' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Use the custom process for this funding cycle</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnReportProcess' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td width='10'>&nbsp;</td>
		<td colspan='4'>
			<span runat='server' id='spnEdit'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	
	<tr><td>&nbsp;</td></tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
			
	
</table>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Default Payment Parameters for Funding Cycle</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Default Grantee Reports Parameters for Funding Cycle</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd1' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList1'></span>	
		</td>
	</tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SupportEmailAddress'>
					<Control ID='spnSupportEmail'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ContentEmailAddress'>
					<Control ID='spnContentEmail'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TimePeriod.Description'>
					<Control ID='spnTimePeriod'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Fund.FundName'>
					<Control ID='spnFundName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AwardTerm'>
					<Control ID='spnTerm'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate' Format='M/dd/yyyy'>
					<Control ID='spnStartDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate' Format='M/dd/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalBudgetLimit' Format='$#,#.##'>
					<Control ID='spnTotalBudgetLimit'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IndirectCostLimit' Format='###0.##' >
					<Control ID='spnIndirectCostLimit'
						Type='HtmlGenericControl'/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='AutoGeneratePayment' Format='YesNo'>
					<Control ID='spnAutoGeneratePayment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DefaultPaymentSetup' Format='YesNo'>
					<Control ID='spnDefaultPaymentSetup'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PaymentProcess.Description'>
					<Control ID='spnPaymentProcess'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AutoGenerateReport' Format='YesNo'>
					<Control ID='spnAutoGenerateReport'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DefaultReportSetup' Format='YesNo'>
					<Control ID='spnDefaultReportSetup'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ReportProcess.Description'>
					<Control ID='spnReportProcess'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit1' 
						Type='cButton' 
						Image='Edit'
						Container='spnEdit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ProjectEditor'/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ProjectPayment' DataObjectDefinitionKey='ProjectPayment'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfProjectID' 
					PropertyKey='ProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='RequestDate' />	
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
									<Argument AttributeName='PageKey' Value='ProjectPaymentEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='ProjectPaymentID=0'/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='RequestDate' ColumnHeader='Request Date' Format='M/d/yyyy' DataAlign='Left'/>
						<DisplayProperty PropertyKey='RequestAmount' ColumnHeader='Request Amount' DataAlign='Left' Format='$#,##0.##'/>
						<DisplayProperty PropertyKey='PaymentMethod.Description' ColumnHeader='Payment Method'/>
						<DisplayProperty PropertyKey='Account.Description' ColumnHeader='Account'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProjectPaymentEditor'/>
										<Argument Type='DataObject' TypeKey='ProjectPaymentID' AttributeName='ProjectPaymentID' BaseValue='ProjectPaymentID='/>
										<Argument Type='DataObject' TypeKey='ProjectID' AttributeName='ProjectID' BaseValue='WfProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='ProjectPaymentID' AttributeName='ProjectPaymentID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='List1' DataObjectDefinitionKey='ProjectReport'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfProjectID' 
					PropertyKey='ProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='OpenDate' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd1' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd1'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ProjectReportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='ProjectReportID=0'/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList1'
						Container='spnDataList1'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Task.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Open Date' Format='M/d/yyyy' DataAlign='Left'/>
						<DisplayProperty PropertyKey='CloseDate' ColumnHeader='Close Date' Format='M/d/yyyy' DataAlign='Left'/>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' DataAlign='Left'/>
						<DisplayProperty PropertyKey='AwardTerm.Description' ColumnHeader='Award Term'/>
						<DisplayProperty PropertyKey='Status.Description' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='Outcome.Description' ColumnHeader='Outcome'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProjectReportEditor'/>
										<Argument Type='DataObject' TypeKey='ProjectReportID' AttributeName='ProjectReportID' BaseValue='ProjectReportID='/>
										<Argument Type='DataObject' TypeKey='ProjectID' AttributeName='ProjectID' BaseValue='WfProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='ProjectReportID' AttributeName='ProjectReportID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
