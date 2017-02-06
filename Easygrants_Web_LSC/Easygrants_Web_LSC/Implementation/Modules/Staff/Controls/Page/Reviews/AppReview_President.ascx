<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div class='SeparatorHdg'>Application Review - President</div>
<br />
<span runat='server' id='spnHome'/>
<br /><br />
<div class='SeparatorHdg'>Incompleted Reviews</div>
<br />

<table width='900'>
	<tr>
	   <td width='50' style="text-align:Left" ><b>Recipient ID</b></td>
	   <td width='200' style="text-align:Left" ><b>Organization</b></td>
	   <td width='25' style="text-align:Left" ><b>Service Area</b></td>
	   <td width='200' style="text-align:Left" ><b>Task</b></td>
	   <td width='100' style="text-align:Left" ><b>Funding Recommendation</b></td>
	   <td width='75' style="text-align:Left" ><b>Funding Term</b></td>
	   <td width='50' style="text-align:Left" ><b>SGC</b></td>
	</tr>
</table>
<table width='900'>
	<tr><td class='MinorSeparatorHdg'>&nbsp;</td></tr>
</table>
<span runat='server' id='spnReviews' />
<br />
<div class='SeparatorHdg'>Completed Reviews</div>
<br />
<%--<table width='900'>
	<tr>
	   <td width='50' style="text-align:Left" ><b>Recipient ID</b></td>
	   <td width='200' style="text-align:Left" ><b>Organization</b></td>
	   <td width='25' style="text-align:Left" ><b>Service Area</b></td>
	   <td width='200' style="text-align:Left" ><b>Task</b></td>
	   <td width='100' style="text-align:Left" ><b>Funding Recommendation</b></td>
	   <td width='75' style="text-align:Left" ><b>Funding Term</b></td>
	   <td width='50' style="text-align:Left" ><b>SGC</b></td>
	</tr>
</table>
<table width='900'>
	<tr><td class='MinorSeparatorHdg'>&nbsp;</td></tr>
</table>--%>
<span runat='server' id='spnReviewsCompleted' />
<br />

<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
</div>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   
	      <DataObject Key='LscToDoListRenewalAppReview' DataObjectDefinitionKey='LscToDoListRenewalAppReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='56' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='1' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				   <Control ID='ctlDPL' 
						Container='spnReviews' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Staff/Controls/Page/Reviews/AppReview_President_Child.ascx' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='LscToDoListRenewalAppReviewReadOnly' DataObjectDefinitionKey='LscToDoListRenewalAppReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='56' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				   <Control ID='ctlDPLReviewsCompleted' 
						Container='spnReviewsCompleted' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Staff/Controls/Page/Reviews/AppReview_President_Child_ReadOnly.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>


	<DataObject Key='LscToDoListRenewalAppReviewReadOnly' DataObjectDefinitionKey='LscToDoListRenewalAppReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='56' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPLReviewsCompleted'
						Type='cDataListCtl'
						Container='spnReviewsCompleted'
						DataObjectDefinitionKey='LscToDoListRenewalAppReviewReadOnly'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current President Application Review items.'>
						<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Recipient ID'>
							<Parameters>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='RecipientID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='RecipientID'>
									<Control ID='ctlLink2'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' />
						<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' />
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task' />
						<DisplayProperty PropertyKey='WfTaskAssignment.WfTaskOutcome.WfTaskOutcome' ColumnHeader='Funding Rec' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscReviewApplication.LscFundingTermDesc.Description' ColumnHeader='Funding Term' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscReviewApplication.SpecialGrant' ColumnHeader='SGC' Format='YesNo' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscOA1.StaffReaderPerson.FirstNameLastName' ColumnHeader='President' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscOA1.StaffReaderDate' ColumnHeader='Date' Format='MM/dd/yyyy' />

					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
				
				
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
			     <DisplayProperty PropertyKey=''>
					<Control ID='lnkHome'
						Type='cLink'
						Container='spnHome'
						Caption='Return to Home Page'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
				
				
	</ModuleSection>
</span>
