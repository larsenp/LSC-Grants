<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Criterion</b>: <span runat="server" id='spnCriterion' /><br /><br />
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Inquiry
		</td>
	</tr>
	<tr>
		<td>
			<b>Inquiry Number (can include letters and other characters)</b>
		</td>
		<td>
			<span runat='server' id='spnInquiryNumber' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Sort Order (must be a number)</b>
		</td>
		<td>
			<span runat='server' id='spnSortOrder' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Outline</b>
		</td>
		<td>
			<span runat='server' id='spnOutline' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Description</b>
		</td>
		<td>
			<span runat='server' id='spnDescription' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Applies to new applicants only?</b>
		</td>
		<td>
			<span runat='server' id='spnNewApplicantsOnly' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Applies to existing grantees only?</b>
		</td>
		<td>
			<span runat='server' id='spnExistingApplicantsOnly' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align="center">
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align="center">
			<span runat='server' id='spnDelete' />
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CriterionID' PropertyKey='LscReviewCriterionID' />
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
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='Inquiries' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCriterion' DataObjectPropertyKey='LscReviewCriterionID' BaseValue='CriterionID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='Inquiries' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCriterion' DataObjectPropertyKey='LscReviewCriterionID' BaseValue='CriterionID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CriterionID' PropertyKey='LscReviewCriterionID' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='txtInquiryNumber'
						Type='cTextBox'
						Container='spnInquiryNumber'
						Size='5'
						RequiredField='True'
						ErrorMessage='Inquiry Number is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='txtSortOrder'
						Type='cMoneyTextBox'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Sort Order must be a whole number.'
						RegExErrorMessage='Sort Order must be a whole number.'
						Container='spnSortOrder'
						Size='5'
						RequiredField='True'
						ErrorMessage='Sort Order is required.' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Outline'>
					<Control ID='txtOutline'
						Type='cTextArea'
						Container='spnOutline'
						Rows='6'
						Cols='50'
						MaxLength='1000'
						TooLongMessage='Outline must not exceed 1000 characters'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='6'
						Cols='50'
						MaxLength='2500'
						TooLongMessage='Description must not exceed 1500 characters'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NewApplicantsOnly'>
					<Control ID='rdoNewApplicantsOnly'
						Type='cRadioButtonList'
						Container='spnNewApplicantsOnly'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExistingApplicantsOnly'>
					<Control ID='rdoExistingApplicantsOnly'
						Type='cRadioButtonList'
						Container='spnExistingApplicantsOnly'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Container='spnDelete'
						Caption='Delete'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_Delete' >	
							<Parameters>
								<Argument Value='LscReviewInquiry' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' />
								<Argument Value='False' />
							</Parameters>
						</Action>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='Inquiries' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCriterion' DataObjectPropertyKey='LscReviewCriterionID' BaseValue='CriterionID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
