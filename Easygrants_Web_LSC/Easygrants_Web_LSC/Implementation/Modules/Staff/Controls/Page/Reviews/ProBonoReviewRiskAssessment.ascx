<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>Pro Bono Innovation Fund Due Diligence Review</div>
<br />
<span runat='server' id='spnReviews' />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListProBonoAppReviewDetail' DataObjectDefinitionKey='LscToDoListProBonoAppReviewDetail' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskID' Value='110' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GrantNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviews'
						Type='cDataListCtl'
						Container='spnReviews'
						DataObjectDefinitionKey='LscToDoListProBonoAppReviewEligibility'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current Pro Bono Innovation Fund Due Diligence Review items.'>
						<DisplayProperty PropertyKey='GrantNumber' ColumnHeader='Grant Number'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='GrantNumber' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='GrantNumber'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='GrantNumber'>
									<Control ID='ctlLink2'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObject' TypeKey='ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' >
							<Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' >
							<Sortable>
								<Argument PropertyKey='WfTaskStatus' />
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>