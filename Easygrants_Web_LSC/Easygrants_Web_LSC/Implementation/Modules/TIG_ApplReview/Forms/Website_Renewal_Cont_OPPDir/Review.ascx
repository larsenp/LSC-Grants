<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<span id='spnPageContent' runat='server' />


<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/Website_Renewal_Cont/ReviewInfo.ascx'
	runat='server'/>
	
<br>

<Core:cUserCtlLoader ID="CUserCtlLoader" CtlID='ctlStaffReview' 
	Src='Implementation/Modules/TIG_ApplReview/PageSection/StaffReview_Website.ascx'
	runat='server'/>
	
<br>
<table id="Table8" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Funding Recommendation and Comments</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnReturn' /></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
        <td valign="top" width='15%'><b>Funding Recommendation</b><%=kDenoteRequiredField%></td>
        <td><span id='spnOutcome' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td valign="top" width='15%'><b>Comments</b></td>
        <td><span id='spnOutcomeComments' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top" width='15%'><b>&nbsp;</b></td>
        <td>Limit: 1000 characters</td>
    </tr>	
</table>
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave' />&nbsp;&nbsp;
	<span runat='server' id='spnContinue' />
</div>
<br>
	
<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlReportOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayText='Select'
						DisplayValue='WfTaskOutcome'>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>	
		</DataObject>
		
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlOutcomeComments'
						Container='spnOutcomeComments'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='1000'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
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
								<Argument Value='TIGAppReview_Website_OPPDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

<!-- End Embedded XML -->