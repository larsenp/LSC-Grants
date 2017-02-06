<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->

<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
	<tr>
        <td colspan="4" class="SeparatorHdg">&nbsp;<b>Select Dean/Reference(s)</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnReference'/>&nbsp;
			<span runat='server' id='spnSelect'/>
		</td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnReferenceList'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='Person' DataObjectDefinitionKey='PersonRelationship' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RelatedPerson'>
					<Control ID='lstReference'
						Container='spnReference'
						Type='cListBox'
						Width='15'
						StoredValue='PersonRelationshipID'
						DisplayValue='DisplayLastNameFirstNameRole'
						SelectedValueKey='PersonID'
						DataObjectDefinitionKey='PersonRelationship'
						DisplayNone='False'>
						<Filters>
							<Argument PropertyKey='' Value='' Group='(' />
							<Argument PropertyKey='RelatedPersonRoleID' Value='3' Bool=' ' />
							<Argument PropertyKey='RelatedPersonRoleID' Value='4' Bool='or' />
							<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
							<Argument Type='ModuleUser' 
								TypeKey='GranteeProjectID'
								PropertyKey='GranteeProjectID'
								Value='' 
								Bool='and'>
								<RelatedProperty PropertyKey = 'GranteeProjects'>
									<JoinFilter>
										<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
									</JoinFilter>
								</RelatedProperty>
							</Argument>
							<Argument Type='' 
								TypeKey='' 
								PropertyKey='PersonID' 
								Value='null' >
								<RelatedProperty PropertyKey = 'RelatedWfTaskAssignments'>
									<JoinFilter>
										<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
									</JoinFilter>
								</RelatedProperty>
							</Argument>
						</Filters>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>			
									
		<!-- NOTIFY REFERENCES/MENTOR -->
		<DataObject Key='ReferenceList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument PropertyKey='' Value='' Group='(' />
				<Argument PropertyKey='WfTaskRoleID' Value='3' Bool=' ' />
				<Argument PropertyKey='WfTaskRoleID' Value='4' Bool='or' />
				<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool='and' />		
			</Filters>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReferenceList'
						Container='spnReferenceList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Notify Dean/Reference(s)
						</HeaderHtml>
						<InstructionHtml>
							Your designated dean and references are listed below. You MUST notify them by clicking on the <b>Notify</b> button next to their name. 
							When you click on the <b>Notify</b> button, an e-mail message will be sent to that 
							individual with the URL and login information he/she will need to enter 
							the system to submit information on your behalf. To re-notify the 
							dean or reference, click on the <b>Re-Notify</b> button.
						</InstructionHtml>
						<!-- <DisplayProperty PropertyKey='Person.RelatedPersonRelationships.DisplayLastNameFirstNameRole' ColumnHeader='Name'/> -->
						<DisplayProperty PropertyKey='WfTaskAssignmentPersonRelationship.PersonRelationship.DisplayLastNameFirstNameRole' ColumnHeader='Name'/>
						<DisplayProperty PropertyKey='WfTaskAssignmentPersonRelationship.PersonRelationship.RelatePersonDisplayEmail' ColumnHeader='E-mail Address'/>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Notified Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='WfTaskStatusID' ColumnHeader='Options'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='Completed'/>	
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='Control'>	
									<Control ID='btnNotify'
										Type='cButton'
										Image='Notify'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='NotifyThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'   Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>														
								<Argument Value='1' ValueKey='WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnReNotify'
										Type='cButton'
										Image='Re_Notify'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='NotifyThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'   Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>							
							</Parameters>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatusID' ColumnHeader=' '>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='DeleteThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'   Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>														
								<Argument Value='1' ValueKey='WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete2'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='DeleteThirdParty'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'   Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>							
							</Parameters>
						</DisplayProperty>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
