<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cManagementReviewList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<br />
<div class='SeparatorHdg'>Pro Bono Innovation Fund LOI Review - OPP Management</div>
<p>Enter review information and click the <b>Save</b> or <b>Save and Submit Checked Reviews</b> button. The red X will turn into a checkbox. If you still have a red X, hover over it for details about what is missing.</p>
<p>To submit reviews, check the checkboxes and click the <b>Save and Submit Checked Reviews</b> button. Note that saving and submitting a particular review requires two separate steps.</p>

<div class='SeparatorHdg'>Incomplete Reviews</div>
<br />
<table width='800'>
	<tr>
		<td width='25px'>&nbsp;</td>
	   <td width='75px' style="text-align:Left" ><b>Score</b></td>
	   <td width='75px' style="text-align:Left" ><b>PBIF Number</b></td>
	   <td width='625px' style="text-align:Left" ><b>Organization</b></td>
	</tr>
	<tr>
		<td colspan="4"class='MinorSeparatorHdg'>&nbsp;</td>
	</tr>
</table>
<span runat='server' id='spnReviews' />
<br />


<div class='SeparatorHdg'>Submitted Reviews</div>
<br />
<span runat='server' id='spnReviewsCompleted' />

<div class='SeparatorHdg'>Save/Submit</div>
<p>Note: the <b>Save and Submit Checked Reviews</b> button will only submit reviews that already have checkboxes; it won't submit reviews that have unsaved information. Saving and submitting a particular review requires two separate steps.</p>

<div style="text-align:center">
	<span runat='server' id='spnSave'/><br /><br />
	<span runat='server' id='spnSubmit'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	    <DataObject Key='LscToDoListProBonoAppReviewDetail' DataObjectDefinitionKey='LscToDoListProBonoAppReviewDetail' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='125' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GrantNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				   <Control ID='ctlDPL' 
						Container='spnReviews' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/PBIF_LOIReview_OPP_Mgmt/PageSection/ReviewListChild.ascx' />
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
		
	<DataObject Key='LscToDoListProBonoAppReviewDetailReadOnly' DataObjectDefinitionKey='LscToDoListProBonoAppReviewDetail' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument PropertyKey='WfTaskID' Value='125' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GrantNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPLReviewsCompleted'
						Type='cDataListCtl'
						Container='spnReviewsCompleted'
						DataObjectDefinitionKey='LscToDoListProBonoAppReviewDetail'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current OPP Management LOI Review items.'>
						<DisplayProperty PropertyKey='GrantNumber' ColumnHeader='Grant Number'>
							<Parameters>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GrantNumber'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GrantNumber'>
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
												<Argument Value='ReviewLOI' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' />
						<DisplayProperty PropertyKey='WfTaskAssignment.WfTaskOutcome.WfTaskOutcome' ColumnHeader='Recommendation' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscOA1.StaffReaderPerson.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.LscOA1.StaffReaderDate' ColumnHeader='Date' Format='MM/dd/yyyy' />
						<DisplayProperty PropertyKey='' ColumnHeader=' '>
							<Parameters>
								<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='Equal' DisplayValue=''  />
								<Argument Value='' ValueKey='WfTaskAssignment.WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' Operator='NotEqual' DisplayValue='Control' >
									<Control ID='btnView'
										Type='cButton'
										Container='spnViewApp'
										Caption='View PDF'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
											<Parameters>
												<Argument Value='../../../Core/Controls/Base/pgReportOutputReader.aspx' AttributeName='URL'/>
												<Argument Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskAssignmentID' BaseValue='EntityID=' AttributeName='WfTaskAssignmentID'/>
												<Argument Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID' BaseValue='DefinitionID=' AttributeName='DefinitionID'/>
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
</span>
