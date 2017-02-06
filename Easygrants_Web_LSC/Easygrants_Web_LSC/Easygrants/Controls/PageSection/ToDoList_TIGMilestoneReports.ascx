<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<div class='SeparatorHdg'>
	TIG Milestone Reporting/Final Budgets
</div>
<br />
<div class='MinorSeparatorHdg'>
	Milestone Reporting
</div>
<p><b>Instructions for Milestone Reporting</b></p>
<p>Milestone reports are due within 30 days of the end of the Payment Period.</p>
<ol>
	<li>
		To begin a Milestone Report, click on the TIG number link beside the Payment Number for which you are reporting.
	</li>
	<li>
		Complete the <b>Grantee Response</b> box for each Milestone in the report.  <b>PLEASE NOTE</b>: 
		This is an HTML box and will only accept Plain Text formatting.  <b>Do not paste any formatted copy 
		from a Word or Excel document, such as tables, bullets, bold, etc</b>.  If you need to add formatted 
		copy, you can include that as an attachment to any Milestone by using the File Upload button.  
	</li>
	<li>
		Click the <b>Save</b> button after entering or editing text in the Grantee Response box. 
	</li>
	<li>
		Upload any attachments and supporting documents for each Milestone using the <b>File Upload</b> button. 
		(Be sure to first click <b>Save</b> before uploading files, or you will lose the information you provided.)
	</li>
	<li>
		After completing all the Milestones, click the <b>Save and Continue</b> button.
	</li>
	<li>
		On the Review and Submit page, click the <b>View PDF</b> button to review the completed Milestone report PRIOR to submitting.
	</li>
	<li>
		After reviewing the PDF, click the <b>Submit</b> button to submit the Milestone Report.  This will also 
		generate your <b>Payment Request</b> for the payment period.
	</li>
</ol>
<br />
<span runat='server' id='spnToDo' />
<br />
<div class='MinorSeparatorHdg'>
	Final Budgets
</div>
<p><b>Instructions for Final Budgets</b></p>
<p>
	As part of a final payment for a TIG, grantees must submit a budget reconciliation showing actual LSC TIG 
	fund expenditures on a grant, as well as a budget narrative explaining any variances from the approved budget.
</p>
<p>
	Click on the appropriate TIG number below to submit a final budget.
</p>
<span runat='server' id='spnToDoListTigFinalBudget'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ToDoListTigMilestoneReport' DataObjectDefinitionKey='ToDoListTigMilestoneReport'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Group='(' Bool='And'/>
					<Argument PropertyKey='GrantStatusID' Value='1' Bool=''/>
					<Argument PropertyKey='GrantStatusID' Value='7' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Tig'/>
				<Argument PropertyKey='PaymentNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDo'
						Type='cDataListCtl'
						Container='spnToDo'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Tig' ColumnHeader='TIG' >
							<Control ID='ctlLink2' 
								Type='cLink'>
								<Action
									PostBack='True'
									Object='WebSession'
									Method='RedirectToModule'>
									<Parameters>
										<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='ModuleName' />
										<Argument AttributeName='PageKey2' Type='DataObject' TypeKey='ModuleConfigFilename' />
										<Argument AttributeName='PageKey3' Value='' />
										<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PaymentNumber' ColumnHeader='Payment Number'>
							<Sortable>
								<Argument PropertyKey='PaymentNumber' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PeriodStart' ColumnHeader='Period Start' Format='M/yyyy'>
							<Sortable>
								<Argument PropertyKey='PeriodStart' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestedDate' ColumnHeader='Period End' Format='M/yyyy'>
							<Sortable>
								<Argument PropertyKey='RequestedDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Status' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ToDoListTigFinalBudget' DataObjectDefinitionKey='ToDoListTigFinalBudget'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument PropertyKey='GrantStatusID' Value='1' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Tig'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListTigFinalBudget'
						Type='cDataListCtl'
						Container='spnToDoListTigFinalBudget'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Tig' ColumnHeader='TIG' >
							<Control ID='ctlLink3' 
								Type='cLink'>
								<Action
									PostBack='True'
									Object='WebSession'
									Method='RedirectToModule'>
									<Parameters>
										<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='ModuleName' />
										<Argument AttributeName='PageKey2' Type='DataObject' TypeKey='ModuleConfigFilename' />
										<Argument AttributeName='PageKey3' Value='' />
										<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='DueDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Status' ColumnHeader='Status'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
</ModuleSection>
</span>

