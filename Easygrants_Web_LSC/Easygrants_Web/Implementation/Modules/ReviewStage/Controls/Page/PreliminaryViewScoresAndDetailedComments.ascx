<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cPreliminaryViewScoresAndDetailedComments" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->


<!-- Control Label (for Publication upload) -->

<!-- Page Content - Controls -->
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td><span id='spnPageContent' runat='server' /></td>
</tr>
</table>
<br />

<table id="Table2" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Reviewer Assignment Information</b></td>
	</tr>
	
</table>
<br />
<table id="Table3" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>

	<tr>
		<td width='10%'><B>Name</B></td>
		<td width='25%'><span id='spnApplicantName' runat='server'/></td>
		<td width='10%'><B><%=GetLabel("GrantId")%></B></td>
		<td><span id='SpnGrantID' runat='server'/></td>
	</tr>
	<tr>
		<td><B><%=GetLabel("Organization")%></B></td>
		<td><span id='spnOrganization' runat='server'/></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><B><%=GetLabel("ProjectTitle")%></B></td>
		<td><span id='spnProjectTitle' runat='server'/></td>	
		<td colspan='2'><span id='spnViewApp' runat='server'/></td>	
	</tr>
</table>
<br />
<table id="Table4" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Your Review Scores and Comments</b></td>
	</tr>	
</table>
<br />
<table id="Table5" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td></td>				
	</tr>
	<tr>		
		<td><B>Your Reviewer Role:</B>&nbsp;<span id='spnReviewerRole' runat='server'/></td>						
	</tr>
	<tr>		
		<td><B>Review Stage:</B>&nbsp;<span id='spnReviewStage' runat='server'/></td>						
	</tr>
	<tr>		
		<td><B>Rating:</B>&nbsp;<span id='spnRating' runat='server'/></td>
	</tr>
	<%--<tr>		
		<td><B>Overall Assessment:</B>&nbsp;<span id='spnViewCritique' runat='server'/></td>			
	</tr>--%>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblReviewerDetailedComments'>
	
</table>
<br />
<table id="Table6" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Other Reviewers' Critique</b></td>
	</tr>	
</table>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblOtherReviewer'>
	
</table>
<br />
<table id="Table7" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
      <DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ExternalReviewApplicationsListWithoutComments' DataObjectDefinitionKey='ExternalReviewApplicationsListWithoutComments'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppWftaID' PropertyKey='AppWftaID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ApplicantName'>
					<Control ID='spnApplicantName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.GranteeProjectID'>
					<Control ID='SpnGrantID' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.GrantTitle'>
					<Control ID='spnProjectTitle' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnViewApp'
						Caption='View PDF'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewPDF'>
							<Parameters>
								<Argument Type='Object' ObjectType='DataObject' ObjectKey='ExternalReviewApplicationsListWithoutComments' />							
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description'>
					<Control ID='spnReviewerRole' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevWfta.Rating.Name'>
					<Control ID='spnRating' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevWfta.ReviewCycleStage.Name'>
					<Control ID='spnReviewStage' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='RevWfta.WfTaskAssignmentReview.Comments'>
					<Control ID='spnViewCritique' Type='HtmlGenericControl'/>
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='OtherExternalReviewApplicationsListWithoutComments' DataObjectDefinitionKey='ExternalReviewApplicationsListWithoutComments'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppWftaID' PropertyKey='AppWftaID' />	
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Operator='NotEqual'/>			
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
		</DataObject>	
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close' >
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
