<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style="width:600px">
	<h1>RFP Inquiries and Charts</h1>
	<div class="SeparatorHdg" >Instructions</div>
	<p>Applicants will respond to all RFP Inquiries and Charts through this online application system. This screen shows all the RFP Inquiries and Charts that are associated with this criterion. </p>
	<em>Note:
		<ul>
			<li>Performance Area 3, Criterion 4 has no RFP Inquiries.</li>
			<li>The following criteria have no RFP Charts: Performance Area 3, Criterion 3 and Performance Area 4, Criteria 3, 4, 5, 6 and 7.</li>
		</ul>
	</em>
	<p>The full text of each RFP Inquiry is displayed. Enter the response into the text box that follows. Applicants can also draft the responses using their word processing application and copy the response into the text boxes.</p>
	<p>For the RFP Charts, a link is provided for each chart. To respond to the RFP Chart, click on the link and the chart page will open. When finished responding to the RFP Chart, click on the “Save and Return to Criterion” button at the bottom of the chart page and the system will redirect you back to this criterion page.</p>
	<div width='100%' class='SeparatorHdg'>
		References
	</div>
	<ul>
		<li>
			<a target='_blank' href='http://www.lsc.gov/about/laws-regulations/lsc-regulations-cfr-45-part-1600-et-seq'>LSC Regulations</a>
		</li>
		<li>
			<a target='_blank' href='http://www.lsc.gov/sites/default/files/Grants/civillegalaidstds2006.pdf'>ABA Standards</a>
		</li>
		<li>
			<a target='_blank' href='http://grants.lsc.gov/sites/default/files/Grants/EasyGrants_Web_LSC/PDFs/2012_Grant_Assurances_FINAL.pdf'>LSC Performance Criteria</a>
		</li>
		<li>
			<a target='_blank' href='http://www.lri.lsc.gov/'>LRI - LSC Resource Information</a>
		</li>
		<li>
			<a target='_blank' href='http://www.grants.lsc.gov/assistance/faqs'>Frequently Asked Questions (FAQs)</a>
		</li>
		<li>
			<a target='_blank' href='http://www.grants.lsc.gov/assistance/responding-rfp-inquiries'>Suggestions for Responding to RFP Inquiries</a>
		</li>
		<li>
			<a target='_blank' href='http://grants.lsc.gov/assistance/applicant-informational-session'>Applicant Informational Session</a> – a free Webinar conference that will take place May 21, 2013, 2 pm EST. Visit the AIS page to register or view archived videos.
		</li>
	</ul>
	<p>For additional help, send an email to the <a href='mailto:competition@lsc.gov'>LSC Competition Service Desk</a> (general inquiries) or the <a href='mailto:techsupport@lsc.gov'>Technical Assistance Service Desk</a> (technical support).</p>
	<div class="SeparatorHdg" >PA <span runat="server" id='spnPA' />, C <span runat='server' id='spnC'/>: <span runat='server' id='spnCriterion'/></div><br />
	
	<div class="MinorSeparatorHdg" >
		RFP Inquiries for this Criterion
	</div>
	<span runat='server' id='spnInquiries' /><br /><br />
	<div style='text-align:center'>
		<span runat='server' id='spnSave' style="text-align:center"/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveReturn' style="text-align:center"/>&nbsp;&nbsp;
		<span runat='server' id='spnReturn' style="text-align:center"/>
	</div><br />
	<div class="MinorSeparatorHdg" >
		RFP Charts for this Criterion
	</div>
	<br />
	<span runat='server' id='spnForms' /><br /><br />
	
	
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<StandardInquiryForm Location='/Easygrants_Web_LSC/Implementation/Modules/Application/Controls/Page/PAHierarchy/StandardInquiryForm.ascx'/>
		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewCriterionID' PropertyKey='LscReviewCriterionID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnC'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveReturn'
						Type='cButton'
						Container='spnSaveReturn'
						Caption='Save and Return to Criteria List'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PAHierarchy'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnReturn'
						Type='cButton'
						Container='spnReturn'
						Caption='Return without Saving'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PAHierarchy'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='InquiryStandard' DataObjectDefinitionKey='LscReviewInquiry' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewCriterionID' PropertyKey='LscReviewCriterionID' />
				<Argument PropertyKey='Abbr' Value='F' Operator='NotLike'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstInquiries'
						Type='cDataPresenterList'
						Container='spnInquiries'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/Page/PAHierarchy/StandardInquiryForm.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='InquiryForm' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewCriterionID' PropertyKey='LscReviewCriterionID' />
				<Argument PropertyKey='Abbr' Value='F' Operator='Like'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstForms'
						Type='cDataListCtl'
						Container='spnForms'
						NoRecordMessage='There are no RFP charts associated with this criterion.'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Form' >
							<Control ID='lnkForm'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='EventController_Save'/>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='FormPageKey' AttributeName='PageKey' />
										<Argument Type='DataObject' TypeKey='LscReviewCriterionID' AttributeName='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
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
