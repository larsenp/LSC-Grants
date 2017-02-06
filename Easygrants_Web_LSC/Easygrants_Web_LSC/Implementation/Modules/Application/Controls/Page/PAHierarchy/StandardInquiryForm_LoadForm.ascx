<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.PAHierarchy.cStandardInquiryForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
Standard Inquiry Form - q <span runat='server' id='spnAbbr'/><br />
Comment: <span runat='server' id='spnComment'/><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataPresenter" TypeKey="InquiryID" PropertyKey="LscReviewInquiryID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnAbbr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
				<Argument Type="DataPresenter" TypeKey="InquiryID" PropertyKey="LscReviewInquiryID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
				<Argument Type="DataPresenter" TypeKey="InquiryID" PropertyKey="LscReviewInquiryID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextBox'
						Container='spnComment'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
