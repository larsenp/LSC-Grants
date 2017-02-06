<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cPanelReviewComments_ReadOnly" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			View comments and prior avg score and critiques regarding this application.  
			When you are finished, you can click Close to return to the Review list page.    
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Previous Peer Review Average Score and Critiques for this Applicant</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Peer Review Quality Group Average:</b>&nbsp;&nbsp;<span id='spnPeerAverage' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Critiques:</b>&nbsp;&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id='spnPrimaryCritique' runat='server' visible='true'/></td></tr>
	<tr><td><span id='spnSecondaryCritique' runat='server' visible='true'/></td></tr>
	<tr><td><span id='spnReaderCritique' runat='server' visible='true'/></td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Panel Review Comment</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><span id='spnPanelComments' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<!-- Page Content - Controls -->


<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	 
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentReviewID' PropertyKey='WfTaskAssignmentReviewID' Value='' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PanelComments'>
					<Control ID='ctlPanelComments'
						Container='spnPanelComments'
						Type='cLabel'>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPeerAverage'
						Container='spnPeerAverage'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPrimaryCritique'
						Container='spnPrimaryCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSecondaryCritique'
						Container='spnSecondaryCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReaderCritique'
						Container='spnReaderCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>
	
	
	</ModuleSection>
</span>


