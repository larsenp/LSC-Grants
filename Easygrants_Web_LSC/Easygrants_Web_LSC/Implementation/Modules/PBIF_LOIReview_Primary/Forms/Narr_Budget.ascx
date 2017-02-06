<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<div style="width:600px;">
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
		Src='Implementation/Modules/PBIF_LOIReview_Primary/PageSection/LOIInfo.ascx'
		runat='server'/>
	<br />
	<div class='SeparatorHdg'>
		Narrative – Budget and Timeline (15%)
	</div>
	<br />
	<p><strong>Instructions:</strong></p>
	<p><strong>Budget and Timeline</strong>:  Applicant should provide a brief statement to supplement the <em>Estimated Budget</em> that describes how the project budget, including other sources of support, will advance the desired goals, objectives, and activities being proposed.</p>
	<p>In addition to the relevant section of the Narrative, reviewers should consider the Budget and Budget Narrative when scoring this section. </p>
	
	<p>Reviewers will assess the extent to which the Applicant:</p>

	<ul>
	<li>Proposes a reasonable timeframe for the project.  </li>
	<li>Presents a justifiable budget consistent with the proposed goals and objectives of the project and adequate to successfully support the project activities.</li>
	</ul>

	<Core:cUserCtlLoader ID="ldrCatScore" CtlID='ctlCatScore'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/CategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=3'/>

	<div style="width:100%; text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveContinue'/>
	</div>
			
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCatScore'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Save and Continue'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
