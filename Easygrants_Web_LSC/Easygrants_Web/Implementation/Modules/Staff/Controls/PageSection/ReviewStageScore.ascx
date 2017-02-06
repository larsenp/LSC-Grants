<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReviewStageScore.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cReviewStageScore" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='RevProcScore' LinkTitle='Requests/Conflicts, Scores, and Comments' runat='server'/>
<p>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table runat='server' width='100%' cellpadding='2' cellspacing='0' border='0'>
	<tr>
		<td class='SeparatorHdg'>View and Modify Conflicts/Preferences, Scores, and Comments</td>
	</tr>
	<tr>
		<td>
			To view the <i>external</i> conflicts/preferences, scores, and comments by reviewer 
			or participant select a name/value from the appropriate drop-down list and click 
			on the associated <b>Go</b> button. To edit manual or auto generated conflicts and preferences, go to <span runat='server' id='spnPreprocessing'/> 
			in the Review Cycle <b>Go To:</b> menu.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table runat='server' width='100%' cellpadding='2' cellspacing='0' border='0'>
	<tr>
		<td><b>By Reviewer</b></td>
		<td>
			<span runat='server' id="spnReviewers"/>&nbsp;&nbsp;
			<span runat='server' id='spnByReviewer'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>By Participant</b></td>
		<td>
			<span runat='server' id='spnApplicants'/>&nbsp;&nbsp;
			<span runat='server' id='spnByApplicant'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span id='spnViewHistory' runat='server' visible='false'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="SeparatorHdg" height="1" colspan='2'></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='2'>The variance report displays any divergence between reviewer entered scores.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Run Variance Report</b>&nbsp;&nbsp;</td>
		<td>
			<span runat='server' id='spnCmtee'/>&nbsp;&nbsp;
			<span runat='server' id='spnByCmtee'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td class='FieldLabel'>Select Committee</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPreprocessing'
						Container='spnPreprocessing'
						Type='cLink'
						Caption='Preprocessing'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PreReview'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewers'
						Container='spnReviewers'
						Type='cDropDown'
						DataObjectDefinitionKey='vCommitteePool'
						StoredValue='PersonID'
						DisplayNone='False'
						DisplayText='Select'
						DisplayTextValue='-1'
						DisplayValue='LastNameFirstName'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName' />
							<Argument PropertyKey='FirstName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByReviewer'
						Container='spnByReviewer'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RatingsByRev'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='Control' TypeKey='ctlReviewers' ControlPropertyKey='SelectedValue' BaseValue='ID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicants'
						Container='spnApplicants'
						Type='cDropDown'
						DataObjectDefinitionKey='vApplicantPool'
						StoredValue='PersonID'
						DisplayNone='False'
						DisplayText='Select'
						DisplayTextValue='-1'
						DisplayValue='LastNameFirstName'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName' />
							<Argument PropertyKey='FirstName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByApplicant'
						Container='spnByApplicant'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='RatingsByApp'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='Control' TypeKey='ctlApplicants' ControlPropertyKey='SelectedValue' BaseValue='ID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCmtee'
						Container='spnCmtee'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCycleCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayNone='False'
						DisplayText='Select'
						DisplayValue='ReviewCommittee.ReviewCommitteeDescription'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID'
								PropertyKey='ReviewCycleID' Value='' bool=''/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByCmtee'
						Container='spnByCmtee'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='VarianceReport'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlCmtee' ControlPropertyKey='SelectedValue' Value=''/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' Value=''/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlViewHistory'
						Container='spnViewHistory'
						Type='cLink'
						Caption='View History'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='ViewHistory'>
							<Parameters>
								<Argument Value='RatingsHistoryByApplicant'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' />
								<Argument Type='QueryString' TypeKey='ReviewCycleID' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
