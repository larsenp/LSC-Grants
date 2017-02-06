<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cThirdPartyMainContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
	
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblComplete'>
	<tr>
		<td class="SeparatorHdg"><b>Third-Party Submission - Reviewers</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span runat='server' id='spnAdd'></span></td>
	</tr>
	<tr>
		<td><span runat='server' id='spnThirdPartySubmissionReviewersList'/></td>
	</tr>
</table>
<br><!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>		
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />	
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonRoleID' Value='108' />				
			</Filters>
			<Sort>
				<Argument PropertyKey='RelatedPersonReferenceTypeID'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlhirdPartySubmissionReviewersList'
						Container='spnThirdPartySubmissionReviewersList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonRelationship'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty  ColumnHeader='Reviewer Type' PropertyKey='RelatedPersonRole.WfTaskRole' Width='20%'/>
						<!--	<Parameters>
								<Argument Value='6' ValueKey='RelatedPersonReferenceTypeID'  DisplayValue='' PropertyKey='RelatedPersonOtherReference' Operator='Equal'/>
								<Argument Value='6' ValueKey='RelatedPersonReferenceTypeID'  DisplayValue='' PropertyKey='RelatedPersonReferenceType.Abbr' Operator='NotEqual'/>
							</Parameters>	
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='LastNameFirstNameMiddleName' ColumnHeader='Reviewer Name' Width='20%'/>
						<DisplayProperty PropertyKey='RelatePersonDisplayEmail' ColumnHeader='E-mail Address' Width='20%'/>
						<DisplayProperty PropertyKey='RelatePersonFormattedDisplayPhone.PhoneNumber' ColumnHeader='Phone' Width='10%'/>						
						<DisplayProperty PropertyKey='RelatedWFTA.WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Width='10%'/>																		
						<DisplayProperty PropertyKey='' HeaderColspan='3'  HeaderAlign='Right' DataAlign='Center' ColumnHeader='Options'>
							<Parameters>
								<Argument Value='2' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control' Operator='NotEqual'>
									<Control ID='btnEdit'
										Type='cButton'
										Image='Edit'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='PeerReviewersEditor'/>
												<Argument Type='DataObject' TypeKey='PersonRelationshipID' AttributeName='PersonRelationshipID' BaseValue='PersonRelationshipID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>		
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left'  >
							<Parameters>
								<Argument Value='2' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control' Operator='NotEqual'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='ModulePage'
											Method='DeleteThirdParty'>
											<Parameters>
												<Argument Type='DataObjectRelated' TypeKey='RelatedWFTA.WfTaskAssignmentID' AttributeName='RelatedWFTA.WfTaskAssignmentID' Value=''/>
												<Argument Type='' TypeKey='' Value='True'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left' ColumnHeader=' '>
							<Parameters>
								<Argument Value='1' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnReNotify'
										Type='cButton'
										Caption='Re-Notify'
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
								<Argument Value='2' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Control' Operator='NotEqual'>	
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
									<Argument AttributeName='PageKey' Value='PeerReviewersEditor'/>
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
