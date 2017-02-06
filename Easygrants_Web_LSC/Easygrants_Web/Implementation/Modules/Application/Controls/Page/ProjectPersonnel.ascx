<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.ProgramReport.PageContent.cProjectPersonnel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ProjectPersonnel.ascx.vb" %>

<!-- Page Content - Controls -->
<br>
<span id='spnPageContent' runat='server'/>
<p>

<!-- Control Label (for Name information) -->
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Project Personnel</b>
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
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='PersonRelationshipList' DataObjectDefinitionKey='PersonRelationship' Updatable='True'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='PersonID'
						PropertyKey='PersonID' Value='' />
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID'
						PropertyKey='GranteeProjectID' Value='' />
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
							MaxPerPage='10'>
							<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name'/>
							<DisplayProperty PropertyKey='AdditionalContactRole.Description' ColumnHeader='Role'/>
							<DisplayProperty PropertyKey='RelatedWFTA.WfTaskStatus.WfTaskStatusAbbr' ColumnHeader='Status'>
								<Parameters>
									<Argument Value = 'Completed' ValueKey='RelatedWFTA.WfTaskStatus.WfTaskStatusAbbr' DisplayValue='Completed'/>
									<Argument Value = 'Incomplete' ValueKey='RelatedWFTA.WfTaskStatus.WfTaskStatusAbbr' DisplayValue='Incomplete'/>
									<Argument Value = '' ValueKey='RelatedWFTA.WfTaskStatus.WfTaskStatusAbbr' DisplayValue='Incomplete'/>
								</Parameters>
							</DisplayProperty>
							<DisplayProperty PropertyKey='RelatePersonDisplayEmail' ColumnHeader='E-mail Address' NoWrap='True'/>
							<DisplayProperty PropertyKey='RelatePersonDisplayOrganization.CommonOrganizationName' ColumnHeader='Institution'/>
							<DisplayProperty PropertyKey='RelatedWFTA.WfTaskStatusID' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' Width='10%'>
								<Parameters>
									<Argument Value='1' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control'>
										<Control ID='btnReNotify'
											Type='cButton'
											Image='Re_Notify'>
											<Action
												PostBack='True'
												Object='ModulePage'
												Method='NotifyThirdParty'>
												<Parameters>
													<Argument Type='DataObjectRelated' TypeKey='RelatedWFTA.WfTaskAssignmentID' AttributeName='RelatedWFTA.WfTaskAssignmentID' Value=''/>
												</Parameters>
											</Action>
										</Control>
									</Argument>							
									<Argument Value='103' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='104' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='106' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='110' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='112' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='113' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='114' ValueKey='RelatedPersonRoleID' DisplayValue=' '/>	
									<Argument Value='2' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Completed'/>
									<Argument Value='' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control'>	
										<Control ID='btnNotify'
											Type='cButton'
											Image='Notify'>
											<Action
												PostBack='True'
												Object='ModulePage'
												Method='SelectAndNotifyThirdParty'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID' Value=''/>
													<Argument Type='DataObject' TypeKey='TaskID' AttributeName='TaskID' Value=''/>
													<Argument Type='' TypeKey='' Value='True'/>
												</Parameters>
											</Action>
										</Control>
									</Argument>
								</Parameters>	
							</DisplayProperty>

							<DisplayProperty PropertyKey='RelatedWFTA.WfTaskStatusID' ColumnHeader=' ' HeaderColspan='3' HeaderAlign='Center' Width='10%'>
								<Parameters>
									<Argument Value='' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control'>	
										<Control ID='btnEdit'
											Type='cButton'
											Image='Edit'>
											<Action
												PostBack='True'
												Object='EventController'
												Method='EventController_NavigateToModulePageKey'>
												<Parameters>
													<Argument AttributeName='PageKey' Value='ProjectPersonnelEditor'/>
													<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID' BaseValue='PersonRelationshipID='/>
													<Argument Type='DataObject' TypeKey='RelatedPersonRoleID' AttributeName='RelatedPersonRoleID' BaseValue='RelatedPersonRoleID='/>
												</Parameters>
											</Action>
										</Control>
									</Argument>
								</Parameters>	
							</DisplayProperty>
							<DisplayProperty PropertyKey=''>
								<Parameters>
									<Argument Value='' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control'>
										<Control ID='btnDelete'
											Type='cButton'
											Image='Delete'
											Confirmation='Are you sure you want to delete this item?'>
											<Action
												PostBack='True'
												Object='EventController'
												Method='EventController_Delete'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID'/>
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='RelatedPersonID' childProperty='PersonID' />
																<RelationshipProperty parentProperty='GranteeProjectID' childProperty='GranteeProjectID' />
																<RelationshipProperty parentProperty='TaskID' childProperty='WfTaskID' />
															</RelationshipProperties>
														</RelatedDataObject>
													</RelatedDataObjects>
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
										<Argument AttributeName='PageKey' Value='ProjectPersonnelEditor'/>
										<Argument Type='' TypeKey='' AttributeName='' Value='PersonRelationshipID=0'/>
									</Parameters>
								</Action>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>	
					</DisplayProperty>
												
				</DisplayProperties>
			</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
