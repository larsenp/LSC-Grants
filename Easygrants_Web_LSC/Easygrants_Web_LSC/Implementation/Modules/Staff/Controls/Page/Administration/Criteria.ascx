<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Category</b>: <span runat='server' id='spnCategory' /><br /><br />
<div width='100%' class='SeparatorHdg'>
	Criteria
</div>
<br /><span runat='server' id='spnAdd' />
<br /><span runat='server' id='spnCriteria' />
<br />
<span runat='server' id='spnUp' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewCategory' DataObjectDefinitionKey='LscReviewCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewPerformanceArea.TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUp'
						Type='cButton'
						Container='spnUp'
						Caption='Up to Categories'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RFPCategories' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory' DataObjectPropertyKey='LscReviewPerformanceAreaID' BaseValue='PerformanceAreaID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Abbr'/>
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
								<Argument Value='CriterionEditor'/>
								<Argument Type='QueryString' TypeKey='CategoryID' BaseValue='CategoryID=' />
								<Argument Value='CriterionID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCriteria'
						Type='cDataListCtl'
						Container='spnCriteria'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='Description' />
						<DisplayProperty PropertyKey='Weighting' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action	
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CriterionEditor'/>
										<Argument Type='DataObject' TypeKey='LscReviewCategoryID' AttributeName='CategoryID' BaseValue='CategoryID=' />
										<Argument Type='DataObject' TypeKey='LscReviewCriterionID' AttributeName='CriterionID' BaseValue='CriterionID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnCriteria'
								Type='cButton'
								Caption='View Inquiries'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Inquiries' />
										<Argument Type='DataObject' TypeKey='LscReviewCriterionID' AttributeName='CriterionID' BaseValue='CriterionID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
