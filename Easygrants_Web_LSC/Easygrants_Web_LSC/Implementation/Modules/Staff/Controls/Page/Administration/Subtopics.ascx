<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Category</b>: <span runat='server' id='spnCategory' /><br />
<b>Criterion</b>: <span runat='server' id='spnCriterion' /><br />
<b>Inquiry</b>: <span runat='server' id='spnInquiry' /><br /><br />
<div width='100%' class='SeparatorHdg'>
	Subtopics
</div>
<br /><span runat='server' id='spnAdd' />
<br /><span runat='server' id='spnSubtopics' />
<br />
<span runat='server' id='spnUp' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewCategory.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnInquiry'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUp'
						Type='cButton'
						Container='spnUp'
						Caption='Up to Inquiries'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Inquiries' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewCriterionID' BaseValue='CriterionID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
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
								<Argument Value='SubtopicEditor'/>
								<Argument Type='QueryString' TypeKey='InquiryID' BaseValue='InquiryID=' />
								<Argument Value='SubtopicID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubtopics'
						Type='cDataListCtl'
						Container='spnSubtopics'
						DataObjectDefinitionKey='LscReviewSubtopic'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Alpha' />
						<DisplayProperty PropertyKey='Description' Width='50%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action	
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='SubtopicEditor'/>
										<Argument Type='DataObject' TypeKey='LscReviewSubtopicID' AttributeName='SubtopicID' BaseValue='SubtopicID=' />
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
										<Argument AttributeName='PageKey' Value='ElementsBySubtopic' />
										<Argument Type='DataObject' TypeKey='LscReviewSubtopicID' AttributeName='SubtopicID' BaseValue='SubtopicID=' />
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
