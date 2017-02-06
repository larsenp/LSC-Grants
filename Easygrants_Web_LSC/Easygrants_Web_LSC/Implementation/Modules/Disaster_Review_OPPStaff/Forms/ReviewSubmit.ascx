<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<table width='600' border="0" cellpadding='0' cellspacing='0' >
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Review and Submit </h1></td>
  </tr>
	<tr>
	  <td colspan="2" class="SeparatorHdg">Instructions</td>
	</tr>
	<tr>
	  <td colspan="2" >&nbsp;</td>
	</tr>
	<tr>
	  <td valign="top" >
	  	<p>The <strong>Submission</strong> section below indicates whether you are able to submit your review. If your review document has been completed and uploaded, click <strong>Submit</strong>. </p>
			<p>The <strong>Validation Status</strong> section below displays the status of your submission, indicating whether each section is validated (complete).</p>
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnViewApp'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td colspan='2'>
		<Core:cUserCtlLoader CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
	</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td >&nbsp;</td>
  </tr>
  <tr>
  	<td colspan="2">
		  <Core:cUserCtlLoader ID="CUserCtlLoader2" 
			CtlID='ctlSubmissionButton' 
			Src='Easygrants/Controls/Base/Submission_Button.ascx' 
			Properties='ForceGen=False' 
			runat='server' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID'/>
				<Argument PropertyKey="UploadId" Value="46">
					<RelatedProperty PropertyKey='TaskUploadType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewApp'
						Type='cButton'
						Container='spnViewApp'
						Caption = 'View Application'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
							<Parameters>
								<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgUploadSrcReader.aspx' />
								<Argument Type="DataObjectCollection" TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' BaseValue='SubmittedFileID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='SubmittedFileID' Value='0' Operator='GreaterThan' NullDataObject='False' />
						</Visible>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
