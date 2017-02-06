<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style="width:600px">
	<table width='100%'>
		<tr>
			<td style="vertical-align:top; width:60px">
				Inquiry&nbsp;<span runat='server' id='spnAbbr'/>:
			</td>
			<td>
				<span runat='server' id='spnDescription'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<span runat='server' id='spnSubtopics'/>
			</td>
		</tr>
	</table>
	<table style="width:600px">
		<tr>
			<td style="vertical-align:top">
				Response:
			</td>
			<td><span runat='server' id='spnComment'/></td>
		</tr>
		<td colspan="2" >&nbsp;</td>
	</table>
	<hr style="color:#ffffff; height:1px"/>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='InquiryStandard' Key='LscReviewInquiry' Updatable='False' CreateNew='False'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnAbbr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description' HtmlEncode='False'>
					<Control ID='spnDescription'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey="LscReviewInquiryID"/>
			</Filters>
			<Sort>
				<Argument PropertyKey="Abbr"/>
			</Sort>
			<DisplayProperties>
			<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
				<Control ID='lstSubtopics'
					Type='cDataListCtl'
					Container='spnSubtopics'
					ShowColumnHeaderRow='False'>
					<DisplayProperty PropertyKey='Abbr' />
					<DisplayProperty PropertyKey='Description' />
				</Control>
			</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
				<Argument Type="DataObjectCollection" TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey="LscReviewInquiryID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>	
				<Argument Type="DataObjectCollection" TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey="LscReviewInquiryID"/>				
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						Container='spnComment'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
