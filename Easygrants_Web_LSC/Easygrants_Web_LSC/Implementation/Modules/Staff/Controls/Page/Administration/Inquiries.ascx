<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Category</b>: <span runat='server' id='spnCategory' /><br />
<b>Criterion</b>: <span runat='server' id='spnCriterion' /><br /><br />
<div width='100%' class='SeparatorHdg'>
	Inquiries
</div>
<br /><span runat='server' id='spnAdd' />
<br /><span runat='server' id='spnInquiries' />
<br />
<span runat='server' id='spnUp' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CriterionID' PropertyKey='LscReviewCriterionID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea.TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCategory.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUp'
						Type='cButton'
						Container='spnUp'
						Caption='Up to Criteria'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Criteria' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCriterion' DataObjectPropertyKey='LscReviewCategoryID' BaseValue='CategoryID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CriterionID' PropertyKey='LscReviewCriterionID' />
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
								<Argument Value='InquiryEditor'/>
								<Argument Type='QueryString' TypeKey='CriterionID' BaseValue='CriterionID=' />
								<Argument Value='InquiryID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlInquiries'
						Type='cDataListCtl'
						Container='spnInquiries'
						DataObjectDefinitionKey='LscReviewInquiry'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='Description' Width='50%' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action	
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='InquiryEditor'/>
										<Argument Type='DataObject' TypeKey='LscReviewCriterionID' AttributeName='CriterionID' BaseValue='CriterionID=' />
										<Argument Type='DataObject' TypeKey='LscReviewInquiryID' AttributeName='InquiryID' BaseValue='InquiryID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnSubtopics'
								Type='cButton'
								Caption='View&nbsp;Subtopics'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Subtopics' />
										<Argument Type='DataObject' TypeKey='LscReviewInquiryID' AttributeName='InquiryID' BaseValue='InquiryID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnElements'
								Type='cButton'
								Caption='View&nbsp;Elements'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ElementsByInquiry' />
										<Argument Type='DataObject' TypeKey='LscReviewInquiryID' AttributeName='InquiryID' BaseValue='InquiryID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnProof'
								Type='cButton'
								Caption='View&nbsp;Proof'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='InquiryProof' />
										<Argument Type='DataObject' TypeKey='LscReviewInquiryID' AttributeName='InquiryID' BaseValue='InquiryID=' />
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
