<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<p><b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /></p>
<table width='100%'>
	<tr>
		<td width='15%'>
			<b>Performance Area Number</b><font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnSortOrder' />
		</td>
	</tr>
	<tr>
		<td width='15%'>
			<b>Performance Area Name</b><font color='red'>*</font>
		</td>
		<td>
			<span runat='server' id='spnDescription' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat="server" id='spnSave' />&nbsp;
			<span runat="server" id='spnClose' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='TimePeriod' DataObjectDefinitionKey='TimePeriod' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr' >
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscReviewPerformanceArea' DataObjectDefinitionKey='LscReviewPerformanceArea' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PerformanceAreaID' PropertyKey='LscReviewPerformanceAreaID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='TimePeriodID' PropertyKey='TimePeriodID' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='txtSortOrder'
						Type='cMoneyTextBox'
						Container='spnSortOrder'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Sort Order must be a whole number.'
						Size='8'
						RequiredField='True'
						ErrorMessage='Sort Order is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='60'
						RequiredField='True'
						ErrorMessage='Description is required.' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='EvaluationTool' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewPerformanceArea' DataObjectPropertyKey='TimePeriodID' BaseValue='TimePeriodID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey' >	
							<Parameters>
								<Argument Value='EvaluationTool' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewPerformanceArea' DataObjectPropertyKey='TimePeriodID' BaseValue='TimePeriodID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
