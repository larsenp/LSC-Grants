<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.UploadCertification.cPostSubmitContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<p>
	Thank you for submitting your application. Because your application has been completed and submitted, the data entry pages 
	are no longer available to you. If you have any questions, please contact us using the support information at the bottom of the page.  
</p>			
<p>
	To view your Certification (Form I) file, click <b>View Certification</b> below.
</p>
<div style="text-align:center; width:100%">
	<span runat='server' id='spnView' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewRawFile'
						Type='cButton'
						Container='spnView'
						Image='View Certification'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewUploadedFile'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' />
								</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>