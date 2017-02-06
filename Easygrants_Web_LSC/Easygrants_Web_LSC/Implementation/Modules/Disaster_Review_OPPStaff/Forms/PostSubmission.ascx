<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<div style="width:600px">
	<h1>Post-Submission</h1>
	<p>
		Thank you for submitting your review. Because your reviewhas been completed and submitted, the data entry pages 
		are no longer available to you. 
	</p>			
	<p>
		To view your review document, click <b>View Review</b> below.
	</p>
	
	<span runat='server' id='spnViewReview'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID'/>
				<Argument PropertyKey="UploadId" Value="47">
					<RelatedProperty PropertyKey='TaskUploadType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewReview'
						Type='cButton'
						Container='spnViewReview'
						Caption = 'View Review'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
							<Parameters>
								<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgUploadSrcReader.aspx' />
								<Argument Type="DataObjectCollection" TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' BaseValue='SubmittedFileID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='SubmittedFileID' Value='0' Operator='GreaterThan' NullDataObject='False' />
						</Visible>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
