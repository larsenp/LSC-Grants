<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cManagementReviewList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div class='SeparatorHdg'>Renewal Application Review - Vice President</div>
<p>Enter review information and click the <b>Save</b> or <b>Save and Submit Checked Reviews</b> button. The red X will turn into a checkbox. If you still have a red X, hover over it for details about what is missing.</p>
<p>To submit reviews, check the checkboxes and click the <b>Save and Submit Checked Reviews</b> button. Note that saving and submitting a particular review requires two separate steps.</p>
<div class='SeparatorHdg'>Incomplete Reviews</div>
<br />
<table width='900'>
	<tr>
		<td width='25'>&nbsp;</td>
	   <td width='75' style="text-align:Left" ><b>Recipient ID</b></td>
	   <td width='200' style="text-align:Left" ><b>Organization</b></td>
	   <td width='50' style="text-align:Left" ><b>Service Area</b></td>
	   <td width='250' style="text-align:Left" ><b>Funding Recommendation</b></td>
	   <td width='125' style="text-align:Left" ><b>SGC</b></td>
		<td width='175'>&nbsp;</td>
	</tr>
</table>
<table width='900'>
	<tr><td class='MinorSeparatorHdg'>&nbsp;</td></tr>
</table>
<span runat='server' id='spnReviews' />
<br />


<div class='SeparatorHdg'>Submitted Reviews</div>
<br />
<span runat='server' id='spnReviewsCompleted' />
<div class='SeparatorHdg'>Save/Submit</div>
<p>Note: the <b>Save and Submit Checked Reviews</b> button will only submit reviews that already have checkboxes; it won’t submit reviews that have unsaved information. Saving and submitting a particular review requires two separate steps.</p>
<div style="text-align:center">
	<span runat='server' id='spnSave'/><br /><br />
	<span runat='server' id='spnSubmit'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	    <DataObject Key='LscToDoListRenewalAppReview' DataObjectDefinitionKey='LscToDoListRenewalAppReview' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='88' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='RecipientID'/>
				<Argument PropertyKey="ServiceArea"/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				   <Control ID='ctlDPL' 
						Container='spnReviews' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/RenewalReview_VP/Controls/PageSection/ReviewListChild.ascx' />
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Type='cButton'
						Container='spnSubmit'
						Caption='Save and Submit Checked Reviews'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='DataPresenter'
							Method='Submit'/>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	

	<DataObject Key='LscToDoListRenewalAppReviewReadOnly' DataObjectDefinitionKey='LscToDoListRenewalAppReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='88' />
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
						NoRecordMessage='There are no current Vice President Renewal Application Review items.'>
						<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Recipient ID'>
							<Parameters>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='RecipientID'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='RecipientID'>
									<Control ID='ctlLink2'
										Type='cLink'>
										<Action PostBack='True'
											Object='DataPresenter'
											Method='SwitchWfTA'>
											<Parameters>
												<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
												<Argument AttributeName='GranteeProjectID' Type='DataObjectRelated' TypeKey='WfTaskAssignment.GranteeProjectID' />
											</Parameters>	
										</Action>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument Value='VPRenewReview' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' />
						<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscRenewalRec.LscRenewalRecommendation.Description' ColumnHeader='Funding Rec' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscRenewalRec.YesNoSpecialGrantCond' ColumnHeader='SGC' Format='YesNo' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscRenewalRec.PrimaryReaderPerson.FirstNameLastName' ColumnHeader='Vice President' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscRenewalRec.PrimaryReaderDate' ColumnHeader='Date' Format='MM/dd/yyyy' />

					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>
