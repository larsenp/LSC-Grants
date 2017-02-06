<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br /><br />
<div width='100%' class='SeparatorHdg'>
	Categories
</div>
<br /><span runat='server' id='spnAdd' />
<br /><span runat='server' id='spnCategories' />
<br />
<span runat='server' id='spnUp' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewPerformanceArea' DataObjectDefinitionKey='LscReviewPerformanceArea' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PerformanceAreaID' PropertyKey='LscReviewPerformanceAreaID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUp'
						Type='cButton'
						Container='spnUp'
						Caption='Up to Performance Areas'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='EvaluationTool' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewPerformanceArea' DataObjectPropertyKey='TimePeriodID' BaseValue='TimePeriodID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewCategory' DataObjectDefinitionKey='LscReviewCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PerformanceAreaID' PropertyKey='LscReviewPerformanceAreaID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='CategoryEditor'/>
								<Argument Type='QueryString' TypeKey='PerformanceAreaID' BaseValue='PerformanceAreaID=' />
								<Argument Value='CategoryID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategories'
						Type='cDataListCtl'
						Container='spnCategories'
						DataObjectDefinitionKey='LscReviewCategory'>
						<DisplayProperty PropertyKey='Description' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action	
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CategoryEditor'/>
										<Argument Type='DataObject' TypeKey='LscReviewPerformanceAreaID' AttributeName='PerformanceAreaID' BaseValue='PerformanceAreaID=' />
										<Argument Type='DataObject' TypeKey='LscReviewCategoryID' AttributeName='CategoryID' BaseValue='CategoryID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnCriteria'
								Type='cButton'
								Caption='View Criteria'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Criteria' />
										<Argument Type='DataObject' TypeKey='LscReviewCategoryID' AttributeName='CategoryID' BaseValue='CategoryID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

