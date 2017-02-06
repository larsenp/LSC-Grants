<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
</br>
<table width='600' border="0" cellpadding='0' cellspacing='0'>
  <tr>
    <td><h1>Review and Submit </h1></td>
  </tr>
  <span id='spnSubmitButton' runat='server'/>
</table>
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan='4'>
			<Core:cUserCtlLoader CtlID='ctlAppInfo' 
				Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
				runat='server'/>
		</td>
	</tr>
  <tr>
    <td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="4" >&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" ><p>The <strong>Submission</strong> section below indicates whether you are able to submit your Notice of Intent to Compete application. If all pages in the application have been completed, click <strong>Submit</strong>. </p>
        <p>In the <strong>View Full Submission</strong> section below, click <strong>View PDF</strong> to view a PDF of your Notice of Intent to Compete application.</p>
        <p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of the application.</p></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
  </tr>
  <tr>
    <td valign="top" >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<table width='600'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmission' Src='Implementation/Modules/LOI/Controls/PageSection/LOI_SubmissionContent.ascx'	runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />

		</td>
	</tr>

	
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGeneratePDF' Src='Easygrants/Controls/PageSection/GeneratePDF.ascx'
				runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
</table>
<!--
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
-->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Continue'>
						<Action 
							PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplicantInformation' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

		<!--

		<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplicantInformation'/>
							</Parameters>
						</Action>>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		-->



