<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cSendEmail" Codebehind=".SendEmail.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../Core/Controls/Base/CloseWindow.ascx' %>
<%@ register tagprefix='Core' tagname='cDropDown'  src='../../../Core/Controls/Base/DropDown.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br><br>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Relative' Key='AdditionalInformation' LinkTitle='Additional Information' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlApplicantInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Additional Information Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

Requests for additional information will be sent via e-mail to the applicant's primary 
e-mail address.  The applicant will be instructed to simply reply to the e-mail (i.e., 
the applicant's submission will not be automatically re-opened for modifications and 
re-submission).
<br><br>
The replies to your request will be sent directly to the return e-mail address (i.e., 
the From field) that you specify below.  Enter the Subject line for the e-mail into the 
Subject field, your return e-mail address into the From field (this is the default), and 
the information you are requesting in the Request Comments field.  Click the <b>Save</b> 
button to save your changes and the <b>Send</b> button to send the e-mail.  To close 
without sending your request, click the <b>Close</b> button.
<br><br>

<table id='tblMessage' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><b>Subject&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnSubject'></span></td>
	</tr>
	<tr>
		<td><b>From&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnFrom'></span></td>
	</tr>
	<tr>
		<td><b>CC</b></td>
		<td><span runat='server' id='spnCC'></span></td>
	</tr>
	<tr>
		<td><b>BCC</b></td>
		<td><span runat='server' id='spnBCC'></span></td>
	</tr>
	<tr>
		<td valign='top'><b>Request Comments&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnMessage'></span></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<table border='0' id='tblSubmit' cellspacing='0' cellpadding='2' runat='server' align='center' visible='true'>		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' visible='true'>		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		Click the <b>Send</b> button to send this request to for additional
		information to the selected applicant.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSubmit'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>								
		<DataObject Key='ReviewAdditionalInformation' DataObjectDefinitionKey='ReviewAdditionalInformation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewAdditionalInformationID'
					PropertyKey='ReviewAdditionalInformationID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='RevWfTaskAssignmentID' Update='True' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='RequestDate' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='ctlSubject'
						Container='spnSubject'
						Type='cTextBox'
						Size='64'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Subject is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailFrom'>
					<Control ID='ctlFrom'
						Container='spnFrom'
						Type='cEmailTextBox'
						Size='64'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='E-mail address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailCC'>
					<Control ID='ctlCC'
						Container='spnCC'
						Type='cEmailTextBox'
						Size='64'
						MaxLength='50'
						RequiredField='False'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailBCC'>
					<Control ID='ctlBCC'
						Container='spnBCC'
						Type='cEmailTextBox'
						Size='64'
						MaxLength='50'
						RequiredField='False'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestComment'>
					<Control ID='ctlMessage'
						Container='spnMessage'
						Type='cTextArea'
						MaxLength='200'
						TooLongMessage='The maximum length is 200 !'
						Rows='8'
						Cols='50'
						RequiredField='True'
						ErrorMessage='Request Comments is required.' />
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='SendEmail'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewAdditionalInformation' DataObjectPropertyKey='ReviewAdditionalInformationID' BaseValue='ReviewAdditionalInformationID='/>
								<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Send'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='SendEmail'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlSubject' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlMessage' ControlPropertyKey='Value' Value='' />
								<Argument Type='QueryString' TypeKey ='WfTaskAssignmentID'  Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
