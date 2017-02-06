<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ScoresAndCommentsUploadEditor.ascx.vb" Inherits="Easygrants_Web.Modules.ReviewStage.Controls.Page.cScoresAndCommentsUploadEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploadEditorContent.ascx'
				runat='server' />


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	</ModuleSection>
</span>