<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' ID="Table1">
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Search Results</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnTaskAssignmentList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument PropertyKey='' Value='' Group='(' />
				<Argument Type='' TypeKey='' PropertyKey='PersonID' Value='' Bool=' '/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool='or'/>
				<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson' Alias='NameSort'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson' Join='None' Alias='NameSort'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnTaskAssignmentList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						DataObjectDefinitionKey='WfTaskAssignmentList'
						MaxPerPage='10'>

						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='InternalReview'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>

						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant'/>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' ConfigurableHeader='True' />
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Owner' NullDisplay='None'/>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome' />																

					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
