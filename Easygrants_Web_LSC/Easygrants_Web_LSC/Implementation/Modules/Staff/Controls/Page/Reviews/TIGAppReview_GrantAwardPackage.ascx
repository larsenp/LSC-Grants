<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br />
<div class='SeparatorHdg'>Review TIG Grant Award Package</div>
<br />
<span runat='server' id='spnHome' />
<br /><br />
<span runat='server' id='spnReviews' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListTigAppReviewORWI' DataObjectDefinitionKey='LscToDoListTigAppReviewORWI' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskID' Value='62' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewAssignmentTypeID' />
				<Argument PropertyKey='Tig' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviews'
						Type='cDataListCtl'
						Container='spnReviews'
						DataObjectDefinitionKey='LscToDoListTigAppReviewORWI'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current TIG Open/Replication/Website Improvement Application Review items.'>
						<DisplayProperty PropertyKey='Tig' ColumnHeader='TIG'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='Tig' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='Tig'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='Tig'>
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
							<Sortable>
								<Argument PropertyKey='Tig' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization'>
							<Sortable>
								<Argument PropertyKey='OrganizationName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' >
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='View'  Width='10%'>
							<Control ID='btnView'
								Type='cButton'
								Caption='View PDF'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
									<Parameters>
										<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataObjectRelated' 
											TypeKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' 
											AttributeName='DefinitionID'
											BaseValue='DefinitionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHome'
						Type='cLink'
						Container='spnHome'
						Caption='Return to Home Page'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>