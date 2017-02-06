<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Administration.cEvaluationToolStructure" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<p>This tool allows you to create and edit the structure of the evaluation tool, which drives the content of the 
pages in the Application Review module. Use the <b>Competition Year</b> drop-down to select a year. You can then add or
edit performance areas or drill down through existing performance areas to review inquiries, subtopics, and review elements.</p>

<b>Competition Year</b> <span runat='server' id='spnCompetitionYear' />
<div width='100%' id='divPerformanceAreas' runat='server' visible='true'>
	<div class='SeparatorHdg' width='100%'>
			Performance Areas
	</div><br /><br />
	<span runat='server' id='spnAdd' /><br /><br />
	<span runat='server' id='spnPerformanceAreas' />
</div>

<span id='spnConfigXML' visible='true' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewPerformanceArea' DataObjectDefinitionKey='LscReviewPerformanceArea' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
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
								<Argument Value='PerformanceAreaEditor'/>
								<Argument Type='QueryString' TypeKey='TimePeriodID' BaseValue='TimePeriodID=' />
								<Argument Value='PerformanceAreaID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPerformanceAreas'
						Type='cDataListCtl'
						Container='spnPerformanceAreas'
						DataObjectDefinitionKey='LscReviewPerformanceArea'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' Width='2' />
						<DisplayProperty PropertyKey='Description' ColumnHeader='Name' Width='150' Align='Left'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action	
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PerformanceAreaEditor'/>
										<Argument Type='DataObject' TypeKey='LscReviewPerformanceAreaID' AttributeName='PerformanceAreaID' BaseValue='PerformanceAreaID=' />
										<Argument Type='DataObject' TypeKey='TimePeriodID' AttributeName='TimePeriodID' BaseValue='TimePeriodID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnCategories'
								Type='cButton'
								Caption='View Categories'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='RFPCategories' />
										<Argument Type='DataObject' TypeKey='LscReviewPerformanceAreaID' AttributeName='PerformanceAreaID' BaseValue='PerformanceAreaID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetitionYear'
						Container='spnCompetitionYear'
						Type='cDropDown'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Abbr'>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Descending' />
						</Sort>	
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='EvaluationTool' />
								<Argument Type='Control' TypeKey='ctlCompetitionYear' ControlPropertyKey='SelectedValue' BaseValue='TimePeriodID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>