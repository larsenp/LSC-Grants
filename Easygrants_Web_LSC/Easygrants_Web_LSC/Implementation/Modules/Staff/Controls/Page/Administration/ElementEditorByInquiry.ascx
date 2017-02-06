<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Criterion</b>: <span runat="server" id='spnCriterion' /><br />
<b>Inquiry</b>: <span runat='server' id='spnInquiry' /><br /><br />
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Element
		</td>
	</tr>
	<tr>
		<td>
			<b>Element Type</b>
		</td>
		<td>
			<span runat='server' id='spnElementType' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Element Number</b>
		</td>
		<td>
			<span runat='server' id='spnElementNumber' />
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
				<DisplayProperty PropertyKey='LscReviewCriterion.Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnInquiry'
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
								<Argument Value='ElementsByInquiry' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' BaseValue='InquiryID=' />
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
								<Argument Value='ElementsByInquiry' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' BaseValue='InquiryID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewElement' DataObjectDefinitionKey='LscReviewElement' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ElementID' PropertyKey='LscReviewElementID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='InquiryID' PropertyKey='LscReviewInquiryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='txtElementNumber'
						Type='cMoneyTextBox'
						Container='spnElementNumber'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Element Number must be a whole number.'
						MaxLength='2'
						Size='5'
						RequiredField='True'
						ErrorMessage='Element Number is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='4'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewElementTypeID'>
					<Control ID='rdoElementType'
						Container='spnElementType'
						Type='cRadioButtonList'
						DataObjectDefinitionKey='LscReviewElementType'
						StoredValue='LscReviewElementTypeID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Element Type is required.'
						RepeatDirection='Horizontal' />
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
								<Argument Value='LscReviewElement' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewElement' DataObjectPropertyKey='LscReviewElementID' />
								<Argument Value='False' />
							</Parameters>
						</Action>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='ElementsByInquiry' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' BaseValue='InquiryID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
