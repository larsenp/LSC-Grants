<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />

<div style="width:600px">
	<h1>Post-Submission</h1>
	<p>
		Thank you for submitting your Acceptance of Grant Award (AGA). If you have any questions, please contact us using the support information at the bottom of the page.  
	</p>			
	<p>
		To view your submitted grant acceptance, click <b>View AGA</b> below.
	</p>
	
	<span runat='server' id='spnView'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
       <DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='50'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnView'
						Image='View AGA'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewConvertedUploadedFile'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID'/>
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
