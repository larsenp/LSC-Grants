<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- Page Content - Controls -->

<!-- Control Label (for Name information) -->
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>References and Recommendations</b>
		</td>
	</tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='6'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
</table>



<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID'
					PropertyKey='PersonID' Value='' >
				</Argument>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='RelatedPersonReferenceTypeID'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonRelationship'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='RelatedPersonRole.WfTaskRole' ColumnHeader='Type'/>
						<DisplayProperty PropertyKey='RelatePersonDisplayFirstName' ColumnHeader='First Name'/>
						<DisplayProperty PropertyKey='RelatePersonDisplayLastName' ColumnHeader='Last Name'/>
						<DisplayProperty PropertyKey='RelatedWfTaskAssignments.OpenDate' ColumnHeader='Notified Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='RelatedWfTaskAssignments.WfTaskOutcome.WfTaskOutcome' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='RelatedWfTaskAssignments.WfTaskStatusID' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Parameters>
								<Argument Value='1' ValueKey='RelatedWfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnReNotify'
										Type='cButton'
										Image='Re_Notify'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='NotifyThirdParty'>
											<Parameters>
												<Argument Type='DataObjectRelated' TypeKey='RelatedWfTaskAssignments.WfTaskAssignmentID' AttributeName='RelatedWfTaskAssignments.WfTaskAssignmentID' Value=''/>
												<Argument Type='' TypeKey='' Value='True'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>							
								<Argument Value='2' ValueKey='RelatedWfTaskAssignments.WfTaskStatusID' DisplayValue='Completed'/>	
								<Argument Value='3' ValueKey='RelatedWfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnNotify'
										Type='cButton'
										Image='Notify'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='SelectAndNotifyThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID' Value=''/>
												<Argument Type='' TypeKey='' Value='True'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='RelatedWfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>	
									<Control ID='btnNotify1'
										Type='cButton'
										Image='Notify'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='SelectAndNotifyThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID' Value=''/>
												<Argument Type='' TypeKey='' Value='True'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>	
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Parameters>
								<Argument Value='1' ValueKey='RelatedWfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='DeleteThirdParty'>
											<Parameters>
												<Argument Type='DataObjectRelated' TypeKey='RelatedWfTaskAssignments.WfTaskAssignmentID' AttributeName='RelatedWfTaskAssignments.WfTaskAssignmentID' Value=''/>
												<Argument Type='' TypeKey='' Value='True'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				
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
									<Argument AttributeName='PageKey' Value='ReferencesEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PersonRelationshipID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
