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
		Narrative - Project Staff, Organizational Capacity and Project Partners (25%)
	</div>
	<br />
	<p><strong>Instructions:</strong></p>
	<p><strong>Project Staff, Organizational Capacity and Project Partners</strong>:  Applicant should describe Applicant’s capacity to set and implement goals and provide programmatic and financial oversight of this project.   The response should include relevant information about the key staff who will be responsible for the project and list any potential project partners.  </p>
	
	<p><strong>Criteria:</strong></p>

	<ul>
	<li>Describes experience operating and providing oversight to successful programs or projects comparable to the one being proposed, including specific examples of prior accomplishments and outcomes in these efforts.  </li>
	<li>Describes executive management's involvement and a staffing plan that engages staff members with sufficient capacity and experience to be effective and compliant with programmatic and fiscal requirements.</li>
	</ul>

	<Core:cUserCtlLoader ID="ldrCatScore" CtlID='ctlCatScore'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/CategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=2'/>

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
