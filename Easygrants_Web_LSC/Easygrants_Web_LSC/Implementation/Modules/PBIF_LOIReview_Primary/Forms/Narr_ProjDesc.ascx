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
		Narrative - Project Design (60%)
	</div>
	<br />
	<p><strong>Instructions:</strong></p>
	<p><strong>Project Design</strong>:  This section should provide a brief description of the client need and problem in the pro bono delivery system that the project will address. It should also provide goals and objectives of the project and the activities that will be implemented to accomplish them, expected impact, and a brief description of planned monitoring and evaluation plan.  </p>
	
	<p><strong>Criteria:</strong></p>

	<ul>
	<li>Provides a clear description of client need and demonstrates a problem in the pro bono delivery system using statistical information and other data. </li>
	<li>Outlines clear, well-defined role for the volunteer and  provides strong indication that there is volunteer demand or interest for this project.</li>
	<li>Articulates the project’s goals, objectives and activities in clear, concrete, and measurable terms. Project design must logically link to the goals and objectives.</li>
	<li>Identifies outcomes that are aligned with the key goals of the Pro Bono Innovation Fund. </li>
	</ul>

	<Core:cUserCtlLoader ID="ldrCatScore" CtlID='ctlCatScore'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/CategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1'/>

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
