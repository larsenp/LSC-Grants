<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantModification/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>Post-Submission Page</div>
<br />
<p>Thank you for submitting your subgrant modification request.</p> 

<p>Click <strong>View Modification Request</strong> to view a copy of your subgrant modification request.</p>

<p>Click <b>Home</b> in the left navigation bar to return to your LSC Grants home page.</p>

<span runat='server' id='spnView'/>

<span id='spnConfigXML' visible='false' runat='server'>
 <ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='27'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnView'
						Caption='View Modification Request'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewConvertedUploadedFile'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' Value=''/>
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

 </ModuleSection>
</span>