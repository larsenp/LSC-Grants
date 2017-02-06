<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Category</b>: <span runat='server' id='spnCategory' /><br /><br />
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Criterion
		</td>
	</tr>
	<tr>
		<td>
			<b>Criterion Number</b>
		</td>
		<td>
			<span runat='server' id='spnCriterionNumber' />
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
			<b>Weighting</b>
		</td>
		<td>
			<span runat='server' id='spnWeighting' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align="center">
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>


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
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='Criteria' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory' DataObjectPropertyKey='LscReviewCategoryID' BaseValue='CategoryID=' />
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
								<Argument Value='Criteria' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory' DataObjectPropertyKey='LscReviewCategoryID' BaseValue='CategoryID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CriterionID' PropertyKey='LscReviewCriterionID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='txtCriterionNumber'
						Type='cTextBox'
						Container='spnCriterionNumber'
						Size='5'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Criterion number is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='2'
						Cols='50'
						MaxLength='100'
						TooLongMessage='Description must not exceed 100 characters'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Weighting'>
					<Control ID='txtWeighting'
						Type='cMoneyTextBox'
						Container='spnWeighting'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Weighting must be a whole number.'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Weighting must be a whole number between 0 and 100.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
