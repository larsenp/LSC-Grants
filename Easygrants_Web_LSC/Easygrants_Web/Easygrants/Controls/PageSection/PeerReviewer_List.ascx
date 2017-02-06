<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>

<br>
      <span id='spnPageContent' runat='server' />
<br>
<br>
<!-- Control Label (for Name information) -->
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Reviewers</b>
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
<br><br>
<table id="Table5" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<PageContent/>
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
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonRelationship'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty  ColumnHeader='Reviewer Type' PropertyKey='ReferenceTypeDesc' Width='20%'/>
						<!--	<Parameters>
								<Argument Value='6' ValueKey='RelatedPersonReferenceTypeID'  DisplayValue='' PropertyKey='RelatedPersonOtherReference' Operator='Equal'/>
								<Argument Value='6' ValueKey='RelatedPersonReferenceTypeID'  DisplayValue='' PropertyKey='RelatedPersonReferenceType.Abbr' Operator='NotEqual'/>
							</Parameters>	
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='LastNameFirstNameMiddleName' ColumnHeader='Reviewer Name' Width='20%'/>
						<DisplayProperty PropertyKey='RelatePersonDisplayEmail' ColumnHeader='E-mail Address' Width='20%'/>
						<DisplayProperty PropertyKey='RelatePersonFormattedDisplayPhone.PhoneNumber' ColumnHeader='Phone' Width='15%'/>						
						<DisplayProperty PropertyKey='RelatedWFTA.WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Width='10%'>
							<Parameters>
								<Argument Value='3' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Not Notified'/>
								<Argument Value='1' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='Notified'/>
								<Argument Value='2' ValueKey='RelatedWFTA.WfTaskStatusID' DisplayValue='' PropertyKey='RelatedWFTA.WfTaskStatus.WfTaskStatus'/>	
							</Parameters>	
						</DisplayProperty>						
						<DisplayProperty PropertyKey='' HeaderColspan='2' Width='5%' HeaderAlign='Right' DataAlign='Center'>
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
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left' Width='5%'>
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
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
								
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Save and Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>
					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
