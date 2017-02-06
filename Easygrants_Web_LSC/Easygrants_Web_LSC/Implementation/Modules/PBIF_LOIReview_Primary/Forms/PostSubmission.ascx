<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
				Src='Implementation/Modules/PBIF_LOIReview_Primary/PageSection/LOIInfo.ascx'
				runat='server'/>
	<br />
	<div class='SeparatorHdg'>Review Submitted</div>
	<br />
	<p>Thank you for submitting your review.</b></p>
	<br />
	<span runat='server' id='spnReturn' />
	<br />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff' />
								<Argument Value='ModuleConfig' />
								<Argument Value='ProBonoReviewEligibility' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>