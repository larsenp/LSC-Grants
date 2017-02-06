<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Review.Controls.Page.cInternalReview_LSC" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

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

<br>
<table id="Table8" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Report Outcome</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table9" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
        <td valign="top" width='15%'><b>Outcome</b><%=kDenoteRequiredField%></td>
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

<br>
<table id="Table10" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Complete Review</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
        <td>You can go in and out of this review task as many times as desired until you are ready to submit. To save the changes, click <b>Save</b>. The task will be displayed in the Personal Tasks section of the Home page until submission. To re-access the review, click on the task name link.</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>To complete the review, click <b>Submit</b>.</td>
    </tr>	
</table>
<table id='tblButtons' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='True'>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSave" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnCancel" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSubmit" />
		</td>
	</tr>
</table>
	
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
						RequiredField='True'
						ErrorMessage='Outcome is required.'
						StoredValue='WfTaskOutcomeID'
						DisplayText='Select'
						DisplayValue='WfTaskOutcome'>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
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
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='URL' TypeKey='PathAndQuery'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Confirmation='Are you sure you want to submit this review?'
						Image='Submit'>
						<Action
							AutoSave='True'
							PostBack='True'
							Object='DataPresenter'
							Method='Submit' />
					</Control>						
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

<!-- End Embedded XML -->