<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br />
<div class='SeparatorHdg' width='100%'>
	Review Information
</div>
<br />
<table width='100%' cellpadding='1' cellspacing='0'>
	<tr>
		<td>
			<b>TIG</b> <span runat='server' id='spnTIG' />
		</td>
		<td>
			<b>Recipient ID</b> <span runat='server' id='spnRecipientID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Request Type</b> <span runat='server' id='spnLscTigGrantType' />
		</td>
		<td>
			<b>Requested Amount</b> <span runat='server' id='spnRequestedAmount' />
		</td>
	</tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	Applicant's LOI Responses
</div>
<b>Previous Web Site Grants</b><br />
<span runat='server' id='spnPrevWeb' /><br /><br />

<b>Non-Web Site TIG Grants</b><br />
<span id='spnNonWeb' runat='server'/><br /><br />

<b>Additional Information</b><br />
<span id='spnAddInfo' runat='server'/><br /><br />
<br />
<div class='SeparatorHdg' width='100%'>
	Review Checklist
</div>
<br />
<table width='600' style="padding-bottom:1px; padding-top:1px; padding-left:0px; padding-right:4px">
	<tr><td><b>ITEM 1</b></td></tr>
	<tr>
		<td style="width:60px">&nbsp;</td>
		<td valign='top'>
			The applicant is current with reporting on past TIG grants.
		</td>
		<td valign='top'>
			<span runat='server' id='spnTigReportingCurrent' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>ITEM 2</b></td></tr>
	<tr>
		<td valign='top'><b>Renewal</b></td>
		<td  valign='top'>
			The applicant was a recipient of a statewide website grant and has not previously received a renewal grant.
		</td>
		<td rowspan='2' valign='top'>
			<span runat='server' id='spnStatewideGrantRecipient' />
		</td>
	</tr>
	<tr>
		<td valign='top'><b>Continuation</b></td>
		<td valign='top'>
			The applicant was the recipient of a renewal website grant and has not previously received a continuation website grant.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>ITEM 3</b></td></tr>
	<tr>
		<td valign='top'><b>Renewal</b></td>
		<td  valign='top'>
			The applicant has completed or is expected to complete, report on and be approved by LSC for successful achievement of milestones through the 3rd payment period of its statewide website grant by April 3, 2010.
		</td>
		<td rowspan='2' valign='top'>
			<span runat='server' id='spnNextMilestoneExpected' />
		</td>
	</tr>
	<tr>
		<td valign='top'><b>Continuation</b></td>
		<td valign='top'>
			The applicant has completed or is expected to complete, report on and be approved by LSC for successful achievement of their website renewal grant's first payment period by April 3, 2010.
		</td>
	</tr>
</table>
<br />
<div style="width:100%; text-align: center">
	<span runat="server" id='spnSave' />
	<span runat="server" id='spnSaveAndClose' />
	<span runat="server" id='spnClose' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='ModuleUserWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppWftaID' PropertyKey='AppWftaID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='DataObjectCollection' TypeKey='ModuleUserWfTA' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LscGranteeProjectTig.LscTigGrantType.Description'>
					<Control ID='spnLscTigGrantType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscTigLoiReviewOpp' DataObjectDefinitionKey='LscTigLoiReviewOpp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TigReportingCurrent'>
					<Control ID='ctlTigReportingCurrent'
						Type='cRadioButtonList'
						Container='spnTigReportingCurrent'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StatewideGrantRecipient'>
					<Control ID='ctlStatewideGrantRecipient'
						Type='cRadioButtonList'
						Container='spnStatewideGrantRecipient'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NextMilestoneExpected'>
					<Control ID='ctlNextMilestoneExpected'
						Type='cRadioButtonList'
						Container='spnNextMilestoneExpected'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>												
							    <Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>							    
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close' 
						Confirmation='Click OK to close without saving data changes since last save.  Click Cancel to return to page and save data.'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LSCTIGLOIReadOnly' DataObjectDefinitionKey='LSCTIGLOIReadOnly' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppWftaID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestedAmount' Format='$0,#'>
					<Control ID='spnRequestedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
	            <DisplayProperty PropertyKey='PrevWeb' HtmlEncode='False'>
					<Control ID='spnPrevWeb'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
	            <DisplayProperty PropertyKey='NonWeb' HtmlEncode='False'>
					<Control ID='spnNonWeb'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
	            <DisplayProperty PropertyKey='AddInfo' HtmlEncode='False'>
					<Control ID='spnAddInfo'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
