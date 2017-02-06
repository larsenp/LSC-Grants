<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cTaskEditor_content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' tagname='cPDFReportContent' src='PDFReport_Content.ascx' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Edit Task</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%>:</b>&nbsp;
		<span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%>:</b>&nbsp;
		<span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%>:</b>&nbsp;
		<span id='spnProject' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
		
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnWfTasksList' visible='true'></span>
		</td>
	</tr>

</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>

	<tr>
		<td><b>Task</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTask' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDescription' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnStartDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Open Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOpenDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Due Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDueDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Close Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCloseDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEndDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Order</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOrder' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
</table>

<table border='1' width='750px' cellspacing='0' cellpadding='2' runat='server' ID="Table1">
	
	<tr>
		<td width='10%'>
			Start Date: 
		</td>
		<td>
			Date the task assignment first appears on a user's home page but is
			not an active link.
		</td>
	</tr>
	<tr>
		<td>
			Open Date: 
		</td>
		<td>
			Date the task assignment link becomes active.
		</td>
	</tr>
	<tr>
		<td>
			Due Date: 
		</td>
		<td>
			Due date displayed to the user assigned the task.
		</td>
	</tr>
	<tr>
		<td>
			Close Date: 
		</td>
		<td>
			Date the task assignment link is disabled is but remains visible
			on a user's home page.
		</td>
	</tr>
	<tr>
		<td>
			End Date: 
		</td>
		<td>
			Date the task assignment is removed from a user's home page.
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<br>
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b><EasyGrants:cPDFReportContent id='ctlPDFReportContent' visible='true' runat='server'/></td>
	</tr>
</table>	
<br>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='lblProgram'
						Container='spnProgram'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='lblCompetition'
						Container='spnCompetition'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='lblProject'
						Container='spnProject'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='TaskEditor' DataObjectDefinitionKey='WfProjectTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskID'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Task is required.'>
						<Sort>
							<Argument PropertyKey='WfTask'/>
						</Sort>
					</Control>	
				</DisplayProperty>

				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Description is required.'/>
				</DisplayProperty>

 				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Open Date is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Due Date is required.'/>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Close Date is required.'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Start Date is required.'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='End Date is required.'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlOrder'
						Container='spnOrder'
						Type='cTextBox'
						Size='5'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Order is required.'>
					<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Task Order must be a number.' />
					</Control>					
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
						Image='Save'>
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
</span>
<!-- End Embedded XML -->
