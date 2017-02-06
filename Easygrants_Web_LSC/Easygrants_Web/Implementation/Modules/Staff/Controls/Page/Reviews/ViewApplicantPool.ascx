<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cViewApplicantPool" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			This page lists all the participants that will be included in this Review Cycle.     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Review Cycle</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td width='200'><b><%=GetLabel("FundingOpportunity")%></b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnCompetition' visible='true'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnName' visible='true'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Participant Pool</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnDataList' runat='server'/></td>
	</tr>
</table>

<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleCompetitionList.Competitions'>
					<Control ID='spnCompetition' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ApplicantPoolList' DataObjectDefinitionKey='vApplicantPool'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName' />
				<Argument PropertyKey='FirstName' />
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='25'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GranteeProjectID'>
							<Control ID='ctlGrantID'
								ToolTipPropertyKey='WfTaskAssignment.GranteeProject.GrantTitle'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstNameMiddleName' ColumnHeader='Participant'>
							<Sortable>
								<Argument PropertyKey='LastName'/>
								<Argument PropertyKey='FirstName'/>
								<Argument PropertyKey='MiddleName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfProjectTask.Description' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfTaskAssignment.WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>			

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
