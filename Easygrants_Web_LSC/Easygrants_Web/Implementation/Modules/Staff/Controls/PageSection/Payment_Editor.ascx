<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cPayment_EditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

	
<!-- Page Content - Controls -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantInfo' 
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantFinancialSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantFinancialSummary.ascx'
	runat='server'/>
<br />
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<!-- Control Label (for Education information) -->
	<tr>
		<td class="SeparatorHdg"><b>Request</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'>
			<b>Payment ID</b>
		</td>
		<td>
			<span id='spnPaymentID' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Payment Status&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>
			<span id='spnRequestStatus' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
		    <b>Payee&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>
			<span id='spnPayee' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Payment Method&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>
			<span id='spnPaymentMethod' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<b><%=GetLabel("FundNumber")%></b>
		</td>
		<td>
			<span id='spnGeneralFund' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("PaymentRequestedDate")%>&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td><span id='spnRequestedDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("PaymentRequestedAmount")%>&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnRequestedAmount' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Payment</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Check/Payment Number</b></td>
		<td><span id='spnCheckPaymentNumber' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Payment Amount</b></td>
		<td><span id='spnPaymentAmount' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Payment Date</b></td>
		<td><span id='spnPaymentDate' runat='server'/></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>Payment Notes</b>
		</td>
		<td><span id='spnNotes' runat='server'/></td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td  class='FieldLabel'>Limit: 200 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Add or Edit Contingency</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'><a name='Contingency'><b>Workflow Task</b></a>
		</td>
		<td><span id='spnWorkflowTask' runat="server"></span></td>
	</tr>
	<tr>
		<td valign='top'><b>Required Outcome</b>
		</td>
		<td><span id='spnRequiredOutcome' runat="server"></span></td>
	</tr>
	<tr>
		<td valign='top'><b>Current Outcome</b>
		</td>
		<td><span id='spnCurrentOutcome' runat="server"></span></td>
	</tr>
	
	<tr>
		<td valign='top'><b>Current Status</b>
		</td>
		<td><span id='spnCurrentStatus' runat="server"></span></td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=Payment&QueryStringKey=PaymentID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Payment' DataObjectDefinitionKey='Payment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PaymentID'
					PropertyKey='PaymentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='PaymentID'>
					<Control ID='spnPaymentID' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestStatusID'>
					<Control ID='ctlRequestStatus'
						Container='spnRequestStatus'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='RequestStatus'
						StoredValue='RequestStatusID'
						DisplayValue='RequestStatus'
						Required='True'
						ErrorMessage='Payment Status is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PayeeName'>
					<Control ID='ctlPayee'
						Type='cTextBox'
						Container='spnPayee'
						Size='45'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Payee is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentMethodID'>
					<Control ID='ctlPaymentMethod'
						Container='spnPaymentMethod'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='PaymentMethod'
						StoredValue='PaymentMethodID'
						DisplayValue='abbr'
						Required='True'
						ErrorMessage='Payment Method is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAccountFundID'>
					<Control ID='ctlGeneralFund'
						Container='spnGeneralFund'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='Fund'
						StoredValue='FundID'
						DisplayValue='FundAccountNumber'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedDate'>
					<Control ID='ctlRequestedDate'
						Container='spnRequestedDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='~~PaymentRequestedDate~~ must be in MM/DD/YYYY format.'
						Size='25'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='~~PaymentRequestedDate~~ is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedAmount'>
					<Control ID='ctlRequestedAmount'
						Container='spnRequestedAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='20'
						RequiredField='True'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='The ~~PaymentRequestedAmount~~ requires a valid currency format (Example: 100,000.00).'
						DecimalErrorMessage='The ~~PaymentRequestedAmount~~ requires a valid currency format (Example: 100,000.00).'
						CommaErrorMessage='The ~~PaymentRequestedAmount~~ requires a valid currency format (Example: 100,000.00).'
						ErrorMessage='~~PaymentRequestedAmount~~ is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='CheckPaymentNumber'>
					<Control ID='ctlCheckPaymentNumber'
						Type='cTextBox'
						Container='spnCheckPaymentNumber'
						Size='20'
						MaxLength='255'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentAmount'>
					<Control ID='ctlPaymentAmount'
						Container='spnPaymentAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='25'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						DecimalErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						CommaErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						ErrorMessage='Payment Amount is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='PaymentDate'>
					<Control ID='ctlPaymentDate'
						Container='spnPaymentDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='Payment Date must be in MM/DD/YYYY format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='ctlNotes'
						Container='spnNotes'
						Type='cTextArea'
						Rows='5'
						MaxLength='200'
						Cols='60'>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='WfTaskAssignmentReadOnly' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='QueryString' TypeKey='WfTaskID' 
					PropertyKey='WfTaskID' Value='' Bool='AND'/>
			</Filters>
			<DisplayProperties>
						
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' CreateNew = 'True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='QueryString' TypeKey='PaymentID' 
					PropertyKey='PaymentID' Value='' Bool='AND' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='PersonID' PropertyValue='Person.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPer'
					Type='cPopUpSelectorLauncher'
					/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskID'>
					<Control ID='ctlWorkflowTask'
						Container='spnWorkflowTask'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfTaskID'
						AutoPostBack='True'
						DisplayValue='WfTask.WfTaskAbbr'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' PropertyKey='WfProjectID' DataObjectPropertyKey='WfProjectID' Value='' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome_Abbr'>
					<Control ID='spnCurrentOutcome' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr'>
					<Control ID='spnCurrentStatus' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequiredOutcomeID'>
					<Control ID='ctlRequiredOutcome'
						Container='spnRequiredOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome_Abbr'>
						<Filters>
							<Argument Type='DataObjectCollection' 
								TypeKey='WfTaskAssignment' 
								DataObjectPropertyKey='WfTaskOutcomeID'
								PropertyKey='WfTaskOutcomeID' 
								Value='' Bool=''/>
						</Filters>
					</Control>
				</DisplayProperty>
			 </DisplayProperties>	
		</DataObject>--%>
		
		<DataObject Key='PaymentContingencyTasks' DataObjectDefinitionKey='PaymentContingencyTasks' CreateNew = 'True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PaymentID' 
					PropertyKey='PaymentID' Value='' Bool='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Payment' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='ContingencyTaskAssignmentID'>
					<Control ID='ctlWorkflowTask'
						Container='spnWorkflowTask'
						Type='cDropDown'
						DisplayText='Select'
						DataObjectDefinitionKey='WfTaskAssignment'
						StoredValue='WfTaskAssignmentID'
						AutoPostBack='True'
						DisplayValue='ReportTaskDueDate'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' PropertyKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID' Value='' />
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3'>
								<RelatedProperty PropertyKey='WfTask'/>
							</Argument>	
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContingencyRequiredOutcomeID'>
					<Control ID='ctlRequiredOutcome'
						Container='spnRequiredOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument Type='DataObjectCollection' 
								TypeKey='PaymentContingencyTasks' 
								DataObjectPropertyKey='ContingencyTaskAssignment.WfTaskID'
								PropertyKey='WfTaskID' 
								Value='' Bool=''/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContingencyTaskAssignment.WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnCurrentOutcome' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContingencyTaskAssignment.WfTaskStatus.WfTaskStatusAbbr'>
					<Control ID='spnCurrentStatus' Type='HtmlGenericControl'/>
				</DisplayProperty>
			 </DisplayProperties>	
		</DataObject>
		
		
		
		<DataObject Key='PaymentHistory' DataObjectDefinitionKey='PaymentHistory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PaymentID' 
					PropertyKey='PaymentID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ModifyDate' Direction='Descending'>
				</Argument>
			</Sort>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' CreateNew = '' Updatable=''>
		    <Filters>
		        <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'/>
		        <Argument Type='QueryString' TypeKey='TaskID' 
					PropertyKey='WfTaskID' Value='' Bool='AND' />
		    </Filters>
		    <DisplayProperties>
		            <DisplayProperty PropertyKey='StartDate' Format='MM/dd/yyyy hh:mm'>
					    <Control ID='spnTaskStart' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='OpenDate' Format='MM/dd/yyyy  hh:mm'>
					    <Control ID='spnTaskOpen' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='DueDate' Format='MM/dd/yyyy  hh:mm'>
					    <Control ID='spnTaskDue' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='CloseDate' Format='MM/dd/yyyy  hh:mm'>
					    <Control ID='spnTaskClose' Type='HtmlGenericControl'/>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='EndDate' Format='MM/dd/yyyy  hh:mm'>
					    <Control ID='spnTaskEnd' Type='HtmlGenericControl'/>
				    </DisplayProperty>
			   </DisplayProperties>
		</DataObject>--%>
		
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Payment' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID' BaseValue='PaymentID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
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
													
	</ModuleSection>
<!-- End Embedded XML -->
</span>
