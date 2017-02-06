<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br /><br />
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Category
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
</table>

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
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='RFPCategories' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewPerformanceArea' DataObjectPropertyKey='LscReviewPerformanceAreaID' BaseValue='PerformanceAreaID=' />
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
								<Argument Value='RFPCategories' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewPerformanceArea' DataObjectPropertyKey='LscReviewPerformanceAreaID' BaseValue='PerformanceAreaID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscReviewCategory' DataObjectDefinitionKey='LscReviewCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PerformanceAreaID' PropertyKey='LscReviewPerformanceAreaID' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='2'
						Cols='50'
						MaxLength='100'
						TooLongMessage='Description must not exceed 100 characters'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
