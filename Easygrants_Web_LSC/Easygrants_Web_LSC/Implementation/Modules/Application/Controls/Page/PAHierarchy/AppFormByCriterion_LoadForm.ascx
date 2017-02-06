<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.PAHierarchy.cAppFormByCriterion" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

Application Form by Criterion  <br />
Year: <span runat="server" id='spnYear' /><br />
PA <span runat="server" id='spnPA' />, C <span runat='server' id='spnC'/>: <span runat='server' id='spnCriterion'/><br /><br />

<span runat='server' id='spnInquiries' /><br /><br />

<span runat='server' id='spnSave'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<StandardInquiryForm Location='/Easygrants_Web_LSC/Implementation/Modules/Application/Controls/Page/PAHierarchy/StandardInquiryForm.ascx'/>
		<DataObject Key='LscReviewCriterion' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewCriterionID' PropertyKey='LscReviewCriterionID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea.TimePeriod.SortOrder'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
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
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewCriterionID' PropertyKey='LscReviewCriterionID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
	</ModuleSection>
</span>
