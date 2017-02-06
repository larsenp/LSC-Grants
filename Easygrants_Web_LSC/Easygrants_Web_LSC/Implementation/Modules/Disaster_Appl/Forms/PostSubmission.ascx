<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<div style="width:600px">
	<h1>Post-Submission</h1>
	<p>
		Thank you for submitting your application. Because your application has been completed and submitted, the data entry pages 
		are no longer available to you. If you have any questions, please contact us using the support information at the bottom of the page.  
	</p>			
	<p>
		To view your application document, click <b>View Application</b> below.
	</p>
	
	<span runat='server' id='spnViewApp'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID'/>
				<Argument PropertyKey="UploadId" Value="39">
					<RelatedProperty PropertyKey='TaskUploadType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewApp'
						Type='cButton'
						Container='spnViewApp'
						Caption = 'View Application'>
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
